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


export default function SecurityCryptoFwAgreementDHTestUnit() {
  describe('SecurityCryptoFwAgreementDHTestUnit', () => {
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
     * @tc.number Security_CryptoFramework_Agreement_DH_Func_0100
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0200
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp2048
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp2048";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0300
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp3072
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0300";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp3072";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0400
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp4096
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0400";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp4096";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0500
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp6144
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0500";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp6144";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0600
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp8192
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0600";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp8192";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0700
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe2048
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0700";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe2048";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0800
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe3072
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0800";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe3072";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0900
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe4096
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0900";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe4096";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1000
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe6144
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1000";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe6144";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1100
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe8192
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1100";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe8192";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1200
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGeneratorBySpec with algName DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1300";
      console.log(testNumber + ": started.");
      let param: string = "DH";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, spec);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1300
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGeneratorByCommonSpec with algName DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1300";
      console.log(testNumber + ": started.");
      let param: string = "DH";
      let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(512, 128);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, spec);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1400
     * @tc.name Test agreement with dh, Callback style, process success
     * @tc.desc AsyKeyGeneratorBySpec with algName DH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1400";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1500
     * @tc.name Test Agreement algName with dh. Process success
     * @tc.desc create Agreement by DH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1500";
      console.log(testNumber + ": started");
      let agreementAlg: string = "DH_modp1536";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(agreement.algName == agreementAlg).assertTrue();
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

  })
}