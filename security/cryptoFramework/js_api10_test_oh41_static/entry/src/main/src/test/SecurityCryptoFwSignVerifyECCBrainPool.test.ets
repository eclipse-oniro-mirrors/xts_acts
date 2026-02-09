/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
import * as specUtil from './utils/common/keyGenSpecUtil.test';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc.test';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc.test';
import { stringToUint8Array } from './utils/common/commonUtils.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSignVerifyECCBrainPoolTestUnit() {
  describe("SecurityCryptoFwSignVerifyECCBrainPoolTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0100
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0100
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0100: started.");
      let algName: string = "ECC_BrainPoolP160r1";
      let signVerifyAlg: string = "ECC_BrainPoolP160r1|SHA1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0100: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0100: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0200
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0200
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0200: started.");
      let algName: string = "ECC_BrainPoolP192t1";
      let signVerifyAlg: string = "ECC_BrainPoolP192t1|SHA224";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0200: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0200: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0300
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0300
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0300: started.");
      let algName: string = "ECC_BrainPoolP224r1";
      let signVerifyAlg: string = "ECC_BrainPoolP224r1|SHA256";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0300: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0300: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0400
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0400
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0400: started.");
      let algName: string = "ECC_BrainPoolP256t1";
      let signVerifyAlg: string = "ECC_BrainPoolP256t1|SHA256";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0400: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0400: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0500
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0500
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0500: started.");
      let algName: string = "ECC_BrainPoolP320r1";
      let signVerifyAlg: string = "ECC_BrainPoolP320r1|SHA384";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0500: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0500: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0600
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0600
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0600: started.");
      let algName: string = "ECC_BrainPoolP384t1";
      let signVerifyAlg: string = "ECC_BrainPoolP384t1|SHA512";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0600: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0600: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0700
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0700
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0700: started.");
      let algName: string = "ECC_BrainPoolP512r1";
      let signVerifyAlg: string = "ECC_BrainPoolP512r1|MD5";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0700: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0700: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0800
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0800
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0800: started.");
      let algName: string = "ECC_BrainPoolP160t1";
      let signVerifyAlg: string = "ECC_BrainPoolP160t1|SHA1";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0800: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0800: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_0900
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_0900
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0900: started.");
      let algName: string = "ECC_BrainPoolP192r1";
      let signVerifyAlg: string = "ECC_BrainPoolP192r1|SHA224";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_0900: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_0900: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1000
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1000
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1000: started.");
      let algName: string = "ECC_BrainPoolP224t1";
      let signVerifyAlg: string = "ECC_BrainPoolP224t1|SHA256";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1000: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1000: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1100
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1100
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1100: started.");
      let algName: string = "ECC_BrainPoolP256r1";
      let signVerifyAlg: string = "ECC_BrainPoolP256r1|SHA256";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1100: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1100: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1200
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1200
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1200: started.");
      let algName: string = "ECC_BrainPoolP320t1";
      let signVerifyAlg: string = "ECC_BrainPoolP320t1|SHA384";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1200: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1200: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1300
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1300
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1300: started.");
      let algName: string = "ECC_BrainPoolP384r1";
      let signVerifyAlg: string = "ECC_BrainPoolP384r1|SHA512";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1300: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1300: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1400
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1400
     * @tc.desc   3. Test interface with Callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1400: started.");
      let algName: string = "ECC_BrainPoolP512t1";
      let signVerifyAlg: string = "ECC_BrainPoolP512t1|MD5";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlg, false, spec, algName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1400: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1400: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1500
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1500
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1500: started.");
      let spec: cryptoFramework.AsyKeySpec = specUtil.genP512t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      let signVerifyAlg: string = "ECC_BrainPoolP512t1|MD5";
      try {
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, true, spec, "ECC");
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1500: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1500: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1600
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1600
     * @tc.desc   2. Test interface with Callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlg, true, spec, "ECC");
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1600: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1600: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1700
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1700
     * @tc.desc   1. AsyKeyGenerator with algName ECC_BrainPoolP160r1|NoHash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1700: started.");
      let signVerifyAlg: string[] = ["ECC_BrainPoolP160r1|NoHash", "ECC_BrainPoolP160r1|SM3"];
      for (let i = 0; i < signVerifyAlg.length; i++) {
        try {
          cryptoFramework.createSign(signVerifyAlg[i]);
          console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1700: createSign succeed`);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
          console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1700 catch error: “${err}“, error code: ${err.code}`);
        }
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1700: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignVerify_BrainPool_Func_1800
     * @tc.number Security_CryptoFramework_SignVerify_BrainPool_Func_1800
     * @tc.desc   1. AsyKeyGenerator with algName ECC_BrainPoolP160r1|NoHash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_SignVerify_BrainPool_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1800: started.");
      let signVerifyAlg: string[] = ["ECC_BrainPoolP160r1|NoHash", "ECC_BrainPoolP160r1|SM3"];
      for (let i = 0; i < signVerifyAlg.length; i++) {
        try {
          cryptoFramework.createVerify(signVerifyAlg[i]);
          console.log(`Security_CryptoFramework_SignVerify_BrainPool_Func_1800: createVerify succeed`);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
          console.error(`Security_CryptoFramework_SignVerify_BrainPool_Func_1800 catch error: “${err}“, error code: ${err.code}`);
        }
      }
      console.log("Security_CryptoFramework_SignVerify_BrainPool_Func_1800: success.");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100
     * @tc.number SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100
     * @tc.desc   create Sign/Verify with ECC_BrainPoolP224t1|SHA256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_BrainPool_Func_3100";
      console.log(testNumber + ": started");
      let signVerifyAlg: string = "ECC_BrainPoolP224t1|SHA256";
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        expect(sign.algName == signVerifyAlg).assertTrue();
        expect(verify.algName == signVerifyAlg).assertTrue();
      } catch (err: BusinessError) {
        console.error(testNumber + `: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

  })
}