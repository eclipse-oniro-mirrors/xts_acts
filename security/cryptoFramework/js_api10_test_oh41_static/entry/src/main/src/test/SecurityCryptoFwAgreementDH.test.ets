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

export default function SecurityCryptoFwAgreementDHTestUnit() {

  describe("SecurityCryptoFwAgreementDHTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0100
     * @tc.number Security_CryptoFramework_Agreement_DH_Func_0100
     * @tc.desc   AsyKeyGenerator with algName DH_modp1536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0200
     * @tc.desc   AsyKeyGenerator with algName DH_modp2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp2048";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0300
     * @tc.desc   AsyKeyGenerator with algName DH_modp3072
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0300";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp3072";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0400
     * @tc.desc   AsyKeyGenerator with algName DH_modp4096
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0400";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp4096";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0500
     * @tc.desc   AsyKeyGenerator with algName DH_modp6144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0500";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp6144";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0600
     * @tc.desc   AsyKeyGenerator with algName DH_modp8192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0600";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp8192";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0700
     * @tc.desc   AsyKeyGenerator with algName DH_ffdhe2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0700";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe2048";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0800
     * @tc.desc   AsyKeyGenerator with algName DH_ffdhe3072
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0800";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe3072";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_0900
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0900
     * @tc.desc   AsyKeyGenerator with algName DH_ffdhe4096
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0900";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe4096";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_1000
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1000
     * @tc.desc   AsyKeyGenerator with algName DH_ffdhe6144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1000";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe6144";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_1100
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1100
     * @tc.desc   AsyKeyGenerator with algName DH_ffdhe8192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1100";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe8192";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_1200
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1200
     * @tc.desc   AsyKeyGeneratorBySpec with algName DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1300";
      console.log(testNumber + ": started.");
      let param: string = "DH";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, true, spec, "DH");
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_1300
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1300
     * @tc.desc   AsyKeyGeneratorByCommonSpec with algName DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1300";
      console.log(testNumber + ": started.");
      let param: string = "DH";
      let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(512, 128);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, true, spec, "DH");
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_1400
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1400
     * @tc.desc   AsyKeyGeneratorBySpec with algName DH_modp1536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1400";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, false, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_DH_Func_1500
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1500
     * @tc.desc   create Agreement by DH_modp1536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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