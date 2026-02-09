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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import cpFw from '@ohos.security.cryptoFramework';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import * as agreementAsyCallbackFunc from './utils/agreement/agreementAsyCallbackFunc.test';
import * as agreementAsyPromiseFunc from './utils/agreement/agreementAsyPromiseFunc.test';
import * as specUtil from './utils/common/keyGenSpecUtil.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwAgreementECCBrainPoolTestUnit() {
  describe("SecurityCryptoFwAgreementECCBrainPoolTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0100
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0100
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0100: started.");
      let param: string = "ECC_BrainPoolP160r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0100: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0200
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0200
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0200: started.");
      let param: string = "ECC_BrainPoolP192t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0200: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0300
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0300
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0300: started.");
      let param: string = "ECC_BrainPoolP224r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0300: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0400
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0400
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0400: started.");
      let param: string = "ECC_BrainPoolP256t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0400: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0500
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0500
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0500: started.");
      let param: string = "ECC_BrainPoolP320r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0500: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0600
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0600
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0600: started.");
      let param: string = "ECC_BrainPoolP384t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0600: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0700
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0700
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0700: started.");
      let param: string = "ECC_BrainPoolP512r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0700: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0800
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0800
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0800: started.");
      let param: string = "ECC_BrainPoolP160t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0800: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_0900
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_0900
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0900: started.");
      let param: string = "ECC_BrainPoolP192r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_0900: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1000
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1000
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1000: started.");
      let param: string = "ECC_BrainPoolP224t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1000: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1100
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1100
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1100: started.");
      let param: string = "ECC_BrainPoolP256r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1100: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1200
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1200
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1200: started.");
      let param: string = "ECC_BrainPoolP320t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1200: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1300
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1300
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1300: started.");
      let param: string = "ECC_BrainPoolP384r1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1300: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1400
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1400
     * @tc.desc   2. Test interface with Callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1400: started.");
      let param: string = "ECC_BrainPoolP512t1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1400: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1500
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1500
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1500: started.");
      let param: string = "ECC_BrainPoolP512t1";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genP512t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, true, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1500: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Agreement_BrainPool_Func_1600
     * @tc.number Security_CryptoFramework_Agreement_BrainPool_Func_1600
     * @tc.desc   2. Test interface with Callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Agreement_BrainPool_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, true, spec, param);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_Agreement_BrainPool_Func_1600: agreement succeed");
      } catch (err) {
        console.error(`Security_CryptoFramework_Agreement_BrainPool_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Agreement_BrainPool_Func_1900
     * @tc.number SUB_Security_CryptoFramework_Agreement_BrainPool_Func_1900
     * @tc.desc   create Agreement with ECC_BrainPoolP512t1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_BrainPool_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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