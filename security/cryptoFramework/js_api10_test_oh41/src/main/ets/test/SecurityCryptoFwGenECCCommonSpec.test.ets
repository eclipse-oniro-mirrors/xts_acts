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
import cryptoFramework from '@ohos.security.cryptoFramework';
import { BusinessError } from '@ohos.base';
import { compareECCParams, comparePairParams, } from './utils/keyGenerate/genECCSpecFunc';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';
import * as cipherCallbackFunc from './utils/cipher/cipherAsyCallbackFunc';
import * as cipherPromiseFunc from './utils/cipher/cipherAsyPromiseFunc';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc';
import * as agreementAsyCallbackFunc from './utils/agreement/agreementAsyCallbackFunc';
import * as agreementAsyPromiseFunc from './utils/agreement/agreementAsyPromiseFunc';


export default function SecurityCryptoFwGenECCCommonSpecTestUnit() {
  describe('SecurityCryptoFwGenECCCommonSpecTestUnit', () => {
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
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0100
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP160r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0100", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0100: started.`);
      let curveName: string = "NID_brainpoolP160r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0100: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0100: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0100: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0200
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP160t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0200", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0200: started.`);
      let curveName: string = "NID_brainpoolP160t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0200: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0200: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0200: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0300
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP192r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0300", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0300: started.`);
      let curveName: string = "NID_brainpoolP192r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0300: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0300: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0300: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0400
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP192t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0400", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0400: started.`);
      let curveName: string = "NID_brainpoolP192t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0400: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0400: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0400: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0500
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP224r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0500", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0500: started.`);
      let curveName: string = "NID_brainpoolP224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0500: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0500: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0500: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0600
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP224t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0600", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0600: started.`);
      let curveName: string = "NID_brainpoolP224t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0600: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0600: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0600: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0700
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP256r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0700", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0700: started.`);
      let curveName: string = "NID_brainpoolP256r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0700: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0700: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0700: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0800
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP256t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0800", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0800: started.`);
      let curveName: string = "NID_brainpoolP256t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0800: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0800: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0800: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0900
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP320r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0900", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0900: started.`);
      let curveName: string = "NID_brainpoolP320r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0900: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0900: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0900: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1000
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP320t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1000", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1000: started.`);
      let curveName: string = "NID_brainpoolP320t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1000: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1000: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1000: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1100
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP384r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1100", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1100: started.`);
      let curveName: string = "NID_brainpoolP384r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1100: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1100: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1100: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1200
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP384t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1200", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1200: started.`);
      let curveName: string = "NID_brainpoolP384t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1200: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1200: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1200: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1300
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP512r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1300", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1300: started.`);
      let curveName: string = "NID_brainpoolP512r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1300: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1300: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1300: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1400
     * @tc.name Test genECCCommonParamSpec with brainpool, sm2, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP512t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1400", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1400: started.`);
      let curveName: string = "NID_brainpoolP512t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1400: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1400: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1400: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1500
     * @tc.name Test genECCCommonParamSpec with ecc, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_secp224r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1500", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1500: started.`);
      let curveName: string = "NID_secp224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1500: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1500: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1500: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1600
     * @tc.name Test genECCCommonParamSpec with ecc, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_secp384r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1600", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1600: started.`);
      let curveName: string = "NID_secp384r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1600: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1600: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1600: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1700
     * @tc.name Test genECCCommonParamSpec with ecc, process is successful
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_secp521r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1700", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1700 started.`);
      let curveName: string = "NID_secp521r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1700: ` + curveName + ` generate keyPair succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1700: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1700: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1800
     * @tc.name Test genECCCommonParamSpec with rsa, process is failed
     * @tc.desc 1. genECCCommonParamSpec with error curveName 'RSA512'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1800", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1800 started.`);
      let curveName: string = "RSA512";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(commonSpec);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1800: ` + curveName + ` generate keyPair succeed.`);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1800: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1800: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2000
     * @tc.name Test cipher with 'SM2_256', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2000", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2000 started.`);
      let curveName: string = "NID_sm2";
      let cipherAlgName: string = "SM2_256|SHA224";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await cipherCallbackFunc.normalProcess(cipherAlgName, commonSpec, null);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2000: cipher succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2000: catch error: “${err}“`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2000: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2100
     * @tc.name Test signVerify with 'SM2_256', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2100", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2100 started.`);
      let curveName: string = "NID_sm2";
      let signVerifyAlgName: string = "SM2_256|SM3";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlgName, commonSpec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2100: signVerify succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2100: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2100: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2200
     * @tc.name Test signVerify with 'ECC_brainpoolP256t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP256t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2200", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2200: started.`);
      let curveName: string = "NID_brainpoolP256t1";
      let signVerifyAlgName: string = "ECC_BrainPoolP256t1|SHA224";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlgName, commonSpec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2200: signVerify succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2200: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2200: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2300
     * @tc.name Test agreement with 'ECC_brainpoolP512t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP512t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2300", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2300 started.`);
      let curveName: string = "NID_brainpoolP512t1";
      let agreementAlgName: string = "ECC_BrainPoolP512t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(agreementAlgName, commonSpec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2300: agreement succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2300: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2300: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2400
     * @tc.name Test agreement with 'ECC256', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_X9_62_prime256v1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2400", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2400 started.`);
      let curveName: string = "NID_X9_62_prime256v1";
      let agreementAlgName: string = "ECC256";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(agreementAlgName, commonSpec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2400: agreement succeed.`);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2400: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2400: succeed.`);
      done();
    });


    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2500
     * @tc.name Test params diff with 'SM2256', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2500", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2500 started.`);
      let curveName: string = "NID_sm2";
      let agreementAlgName: string = "SM2_256";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2500: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2500: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2500: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2600
     * @tc.name Test params diff with 'ECC384', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_secp384r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2600", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2600 started.`);
      let curveName: string = "NID_secp384r1";
      let agreementAlgName: string = "ECC384";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2600: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2600: succeed.`);
      done();
    });


    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2700
     * @tc.name Test params diff with 'ECC_BrainPoolP160r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP160r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2700", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2700 started.`);
      let curveName: string = "NID_brainpoolP160r1";
      let agreementAlgName: string = "ECC_BrainPoolP160r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2700: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2700: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2700: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2800
     * @tc.name Test params diff with 'ECC_BrainPoolP192t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP192t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2800", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2800 started.`);
      let curveName: string = "NID_brainpoolP192t1";
      let agreementAlgName: string = "ECC_BrainPoolP192t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2800: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2800: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2800: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2900
     * @tc.name Test params diff with 'ECC_BrainPoolP224r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP224r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2900", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2900 started.`);
      let curveName: string = "NID_brainpoolP224r1";
      let agreementAlgName: string = "ECC_BrainPoolP224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2900: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2900: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2900: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3000
     * @tc.name Test params diff with 'ECC_BrainPoolP256t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP256t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3000", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3000 started.`);
      let curveName: string = "NID_brainpoolP256t1";
      let agreementAlgName: string = "ECC_BrainPoolP256t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3000: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3000: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3000: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3100
     * @tc.name Test params diff with 'ECC_BrainPoolP320r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP320r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3100", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3100 started.`);
      let curveName: string = "NID_brainpoolP320r1";
      let agreementAlgName: string = "ECC_BrainPoolP320r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3100: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3100: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3100: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3200
     * @tc.name Test params diff with 'ECC_BrainPoolP384t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP384t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3200", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3200 started.`);
      let curveName: string = "NID_brainpoolP384t1";
      let agreementAlgName: string = "ECC_BrainPoolP384t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3200: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3200: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3200: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3300
     * @tc.name Test params diff with 'ECC_BrainPoolP512r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP512r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3300", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3300 started.`);
      let curveName: string = "NID_brainpoolP512r1";
      let agreementAlgName: string = "ECC_BrainPoolP512r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3300: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3300: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3300: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3400
     * @tc.name Test params diff with 'ECC_BrainPoolP160t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP160t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3400", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3400 started.`);
      let curveName: string = "NID_brainpoolP160t1";
      let agreementAlgName: string = "ECC_BrainPoolP160t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3400: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3400: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3400: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3500
     * @tc.name Test params diff with 'ECC_BrainPoolP192r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP192r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3500", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3500 started.`);
      let curveName: string = "NID_brainpoolP192r1";
      let agreementAlgName: string = "ECC_BrainPoolP192r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3500: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3500: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3500: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3600
     * @tc.name Test params diff with 'ECC_BrainPoolP224t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP224t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3600", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3600 started.`);
      let curveName: string = "NID_brainpoolP224t1";
      let agreementAlgName: string = "ECC_BrainPoolP224t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3600: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3600: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3600: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3700
     * @tc.name Test params diff with 'ECC_BrainPoolP256r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP256r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3700", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3700 started.`);
      let curveName: string = "NID_brainpoolP256r1";
      let agreementAlgName: string = "ECC_BrainPoolP256r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3700: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3700: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3700: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3800
     * @tc.name Test params diff with 'ECC_BrainPoolP320t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP320t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3800", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3800 started.`);
      let curveName: string = "NID_brainpoolP320t1";
      let agreementAlgName: string = "ECC_BrainPoolP320t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3800: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3800: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3800: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3900
     * @tc.name Test params diff with 'ECC_BrainPoolP384r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP384r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3900", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3900 started.`);
      let curveName: string = "NID_brainpoolP384r1";
      let agreementAlgName: string = "ECC_BrainPoolP384r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3900: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3900: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3900: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4000
     * @tc.name Test params diff with 'ECC_BrainPoolP512t1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP512t1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4000", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4000 started.`);
      let curveName: string = "NID_brainpoolP512t1";
      let agreementAlgName: string = "ECC_BrainPoolP512t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4000: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4000: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4000: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4100
     * @tc.name Test params diff with 'ECC_BrainPoolP160r1', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_brainpoolP160r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4100", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4100 started.`);
      let curveName: string = "NID_brainpoolP160r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(commonSpec);
        let res: boolean = comparePairParams(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4100: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4100: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4100: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4200
     * @tc.name Test keyPair params diff with 'ECC', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_secp224r1'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4200", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4200 started.`);
      let curveName: string = "NID_secp224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(commonSpec);
        let res: boolean = comparePairParams(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4200: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4200: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4200: succeed.`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4300
     * @tc.name Test keyPair params diff with 'SM256', process is success
     * @tc.desc 1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4300", 0, async (done: Function) => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4300 started.`);
      let curveName: string = "NID_sm2";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(commonSpec);
        let res: boolean = comparePairParams(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4300: params compare success");
      } catch (err) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4300: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4300: succeed.`);
      done();
    });
  })
}