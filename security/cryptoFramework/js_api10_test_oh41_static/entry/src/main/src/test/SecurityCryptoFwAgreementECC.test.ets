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
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwAgreementECCTestUnit() {

    describe("SecurityCryptoFwAgreementECCTestUnit", (): void => {
      hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0100
     * @tc.desc   AsyKeyGenerator with algName X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0200
     * @tc.desc   AsyKeyGenerator with X25519Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, true, spec, param);
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0300
     * @tc.desc   AsyKeyGenerator with algName X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
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
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0400
     * @tc.desc   createKeyAgreement with algName X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0400";
      console.log(testNumber + ": started");
      let agreementAlg: string = "X25519";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(agreement.algName == agreementAlg).assertTrue();
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0500
     * @tc.desc   AsyKeyGenerator with error algName Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0500";
      console.log(testNumber + ": started");
      let agreementAlg: string = "Ed25519";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code == 801).assertTrue();
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0600
     * @tc.desc   createKeyAgreement with error algName x25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0600";
      console.log(testNumber + ": started");
      let agreementAlg: string = "x25519";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code == 401).assertTrue();
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Agreement_ECC_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0700
     * @tc.desc   generateSecret with unavailable algName x25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0700";
      console.log(testNumber + ": started");
      let agreementAlg: string = "X25519";
      let keyAlg: string = "Ed25519";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(false, spec, keyAlg);
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        await agreement.generateSecret(keyPair.priKey, keyPair.pubKey);
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code == 17630001).assertTrue();
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

  })
}