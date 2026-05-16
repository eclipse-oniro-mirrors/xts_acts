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
import * as specUtil from './utils/common/keyGenSpecUtil';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';


export default function SecurityCryptoFwSignVerifySM2TestUnit() {
  describe('SecurityCryptoFwSignVerifySM2TestUnit', () => {
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
     * @tc.name   Security_CryptoFramework_SignVerify_SM2_Func_0100
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0100
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0100: started.");
      let signVerifyAlg: string = "SM2|SM3";
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0100: getSpec succeed`);
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, spec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0100: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0100: success`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_SM2_Func_0200
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0200
     * @tc.desc   2. Test interface with Callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0200: started.");
      let signVerifyAlg: string = "SM2_256|SM3";
      let curveName: string = "NID_sm2";
      try {
        let spec: cryptoFramework.ECCKeyPairSpec = {
          algName: "SM2",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName),
          sk: specUtil.SM2Sk(),
          pk: specUtil.SM2Pk(),
        };
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0200: getSpec succeed`);
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlg, spec);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0200: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0200: success`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_SM2_Func_0300
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0300
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2_256|SM3";
        let userid: string = "1234567812345678";
        let res: boolean = await signVerifyPromiseFunc.setUseridProcess(signVerifyAlg, spec, userid, null);
        expect(res).assertEqual(true);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0300: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0300: success`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_SM2_Func_0400
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0400
     * @tc.desc   3. Test interface with Callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2|SM3";
        let userid: string = "1234567812345678";
        let res: boolean = await signVerifyCallbackFunc.setUseridProcess(signVerifyAlg, spec, userid, userid);
        expect(res).assertEqual(true);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0400: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0400: success`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_SM2_Func_0500
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0500
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2_256|SM3";
        let userid: string = "12345678";
        let res: boolean = await signVerifyPromiseFunc.setUseridProcess(signVerifyAlg, spec, userid, null);
        expect(res).assertEqual(false);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0500: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0500: success`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_SM2_Func_0600
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0600
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0600: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2_256|SM3";
        let userid: string = "";
        let res: boolean = await signVerifyPromiseFunc.setUseridProcess(signVerifyAlg, spec, userid, null);
        expect(res).assertEqual(false);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0600: signVerify succeed`);
      } catch (err) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0600: success`);
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_SM2_Func_0800
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0800
     * @tc.desc   digest is SM3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_SM2_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "Security_CryptoFramework_SignVerify_SM2_Func_0800";
      console.log(testNumber + ": started");
      let signVerifyAlg: string = "SM2_256|SM3";
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