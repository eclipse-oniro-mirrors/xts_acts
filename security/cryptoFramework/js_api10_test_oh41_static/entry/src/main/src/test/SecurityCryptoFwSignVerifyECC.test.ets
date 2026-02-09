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
import * as specUtil from './utils/common/keyGenSpecUtil.test';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc.test';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc.test';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSignVerifyECCTestUnit() {
  describe("SecurityCryptoFwSignVerifyECCTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0100
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0100
     * @tc.desc   AsyKeyGenerator with algName Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      let signVerifyAlg: string = "Ed25519";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.ECCCurveProcess(signVerifyAlg, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ":signVerify succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0200
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0200
     * @tc.desc   AsyKeyGenerator with algName Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      let signVerifyAlg: string = "Ed25519";
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let res: boolean = await signVerifyPromiseFunc.ECCCurveProcess(signVerifyAlg, true, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ":signVerify succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0300
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0300
     * @tc.desc   AsyKeyGenerator with algName Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0300";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      let signVerifyAlg: string = "Ed25519";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyCallbackFunc.ECCCurveProcess(signVerifyAlg, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ":signVerify succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0400
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0400
     * @tc.desc   AsyKeyGenerator with algName Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0400";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      let signVerifyAlg: string = "Ed25519";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyPromiseFunc.ECCCurveErrProcess(signVerifyAlg, false, spec, param);
        expect(!res).assertTrue();
        console.log(testNumber + ":signVerify succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0500
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0500
     * @tc.desc   AsyKeyGenerator with algName Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0500";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      let signVerifyAlg: string = "Ed25519";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await signVerifyCallbackFunc.ECCCurveErrProcess(signVerifyAlg, false, spec, param);
        expect(!res).assertTrue();
        console.log(testNumber + ":signVerify succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0600
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0600
     * @tc.desc   create Sign/Verify with Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0600";
      console.log(testNumber + ": started.");
      let signVerifyAlg: string = "Ed25519";
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        expect(sign.algName == signVerifyAlg).assertTrue();
        expect(verify.algName == signVerifyAlg).assertTrue();
      } catch (err: BusinessError) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0700
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0700
     * @tc.desc   create Sign/Verify with error algName ED25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0700";
      console.log(testNumber + ": started.");
      let signVerifyAlg: string = "ED25519";
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code == 401).assertTrue();
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
      }
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code == 401).assertTrue();
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0800
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0800
     * @tc.desc   create Sign/Verify with unavailable algName X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0800";
      console.log(testNumber + ": started.");
      let signVerifyAlg: string = "X25519";
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.log(testNumber + ": " + err.code);
        expect(err.code).assertEqual(801);
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
      }
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(801);
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerify_ECC_Func_0900
     * @tc.number SUB_Security_CryptoFramework_SignVerify_ECC_Func_0900
     * @tc.desc   init Sign/Verify with unavailable algName X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerify_ECC_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_SignVerify_ECC_Func_0900";
      console.log(testNumber + ": started");
      let signVerifyAlg: string = "Ed25519";
      let keyAlg: string = "X25519";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(false, spec, keyAlg);
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        await sign.init(keyPair.priKey);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.log(testNumber + ": " + err.code);
        expect(err.code == 17630001).assertTrue();
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
      }
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        await verify.init(keyPair.pubKey);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code == 17630001).assertTrue();
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

  })
}