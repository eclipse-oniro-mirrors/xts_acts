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
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as agreementAsyCallbackFunc from './utils/agreement/agreementAsyCallbackFunc';
import * as agreementAsyPromiseFunc from './utils/agreement/agreementAsyPromiseFunc';
import * as specUtil from './utils/common/keyGenSpecUtil';


export default function SecurityCryptoFwAgreementECCBrainPoolTestUnit() {
  describe('SecurityCryptoFwAgreementECCBrainPoolTestUnit', () => {
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
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0100
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0100: started.");
      let param: string = "ECC_BrainPoolP160r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0100: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0200
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0200: started.");
      let param: string = "ECC_BrainPoolP192t1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0200: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0300
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0300: started.");
      let param: string = "ECC_BrainPoolP224r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0300: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0400
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0400: started.");
      let param: string = "ECC_BrainPoolP256t1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0400: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0500
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0500: started.");
      let param: string = "ECC_BrainPoolP320r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0500: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0600
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0600: started.");
      let param: string = "ECC_BrainPoolP384t1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0600: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0700
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0700: started.");
      let param: string = "ECC_BrainPoolP512r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0700: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0800
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0800: started.");
      let param: string = "ECC_BrainPoolP160t1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0800: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0900
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0900: started.");
      let param: string = "ECC_BrainPoolP192r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0900: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1000
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1000: started.");
      let param: string = "ECC_BrainPoolP224t1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1000: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1100
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1100: started.");
      let param: string = "ECC_BrainPoolP256r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1100: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1200
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1200: started.");
      let param: string = "ECC_BrainPoolP320t1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1200: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1300
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384r1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1300: started.");
      let param: string = "ECC_BrainPoolP384r1";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1300: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1400
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 2. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1400: started.");
      let param: string = "ECC_BrainPoolP512t1";
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1400: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1500
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1500: started.");
      let param: string = "ECC_BrainPoolP512t1";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genP512t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, spec);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1500: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1600
     * @tc.name Test agreement with brainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 2. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1600: started.");
      let param: string = "ECC_BrainPoolP512t1";
      let curveName: string = "NID_brainpoolP512t1";
      let spec: cryptoFramework.ECCKeyPairSpec = {
        algName: "ECC",
        specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
        params: cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName),
        sk: specUtil.p512t1Sk(),
        pk: specUtil.p512t1Pk(),
      };
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, spec);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1600: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_BrainPool_Func_1900
     * @tc.name Test Agreement algName with brainPool, process is successful
     * @tc.desc create Agreement with ECC_BrainPoolP512t1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_BrainPool_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_BrainPool_Func_1900";
      console.log(testNumber + ": started");
      let agreementAlg: string = "ECC_BrainPoolP512t1";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(agreement.algName == agreementAlg).assertTrue();
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });
  }
  )
}