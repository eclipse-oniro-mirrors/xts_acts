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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { compareECCParams, comparePairParams, } from './utils/keyGenerate/genECCSpecFunc.test';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
import * as cipherCallbackFunc from './utils/cipher/cipherAsyCallbackFunc.test';
import * as cipherPromiseFunc from './utils/cipher/cipherAsyPromiseFunc.test';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc.test';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc.test';
import * as agreementAsyCallbackFunc from './utils/agreement/agreementAsyCallbackFunc.test';
import * as agreementAsyPromiseFunc from './utils/agreement/agreementAsyPromiseFunc.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function SecurityCryptoFwGenECCCommonSpecTestUnit() {

  describe("SecurityCryptoFwGenECCCommonSpecTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0100
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0100
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP160r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0100: started.`);
      let curveName: string = "NID_brainpoolP160r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0100: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0100: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0100: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0200
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0200
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP160t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0200: started.`);
      let curveName: string = "NID_brainpoolP160t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0200: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0200: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0200: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0300
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0300
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP192r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0300: started.`);
      let curveName: string = "NID_brainpoolP192r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0300: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0300: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0300: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0400
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0400
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP192t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0400: started.`);
      let curveName: string = "NID_brainpoolP192t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0400: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0400: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0400: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0500
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0500
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP224r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0500: started.`);
      let curveName: string = "NID_brainpoolP224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0500: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0500: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0500: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0600
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0600
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP224t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0600: started.`);
      let curveName: string = "NID_brainpoolP224t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0600: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0600: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0600: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0700
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0700
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP256r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0700: started.`);
      let curveName: string = "NID_brainpoolP256r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0700: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0700: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0700: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0800
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0800
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP256t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0800: started.`);
      let curveName: string = "NID_brainpoolP256t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0800: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0800: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0800: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_0900
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_0900
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP320r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_0900: started.`);
      let curveName: string = "NID_brainpoolP320r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0900: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_0900: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_0900: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1000
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1000
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP320t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1000: started.`);
      let curveName: string = "NID_brainpoolP320t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1000: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1000: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1000: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1100
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1100
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP384r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1100: started.`);
      let curveName: string = "NID_brainpoolP384r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1100: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1100: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1100: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1200
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1200
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP384t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1200: started.`);
      let curveName: string = "NID_brainpoolP384t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1200: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1200: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1200: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1300
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1300
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP512r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1300: started.`);
      let curveName: string = "NID_brainpoolP512r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1300: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1300: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1300: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1400
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1400
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP512t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1400: started.`);
      let curveName: string = "NID_brainpoolP512t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1400: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1400: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1400: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1500
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1500
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_secp224r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1500: started.`);
      let curveName: string = "NID_secp224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1500: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1500: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1500: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1600
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1600
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_secp384r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1600: started.`);
      let curveName: string = "NID_secp384r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1600: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1600: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1600: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1700
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1700
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_secp521r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1700 started.`);
      let curveName: string = "NID_secp521r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1700: ` + curveName + ` generate keyPair succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1700: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1700: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_1800
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_1800
     * @tc.desc   1. genECCCommonParamSpec with error curveName 'RSA512'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_1800 started.`);
      let curveName: string = "RSA512";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        await asyKeyGenPromiseFunc.genKeyPair(true, commonSpec, curveName);
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1800: ` + curveName + ` generate keyPair succeed.`);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_1800: ` + curveName + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_1800: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2000
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2000
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2000 started.`);
      let curveName: string = "NID_sm2";
      let cipherAlgName: string = "SM2_256|SHA224";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await cipherCallbackFunc.normalProcess(cipherAlgName, commonSpec, null);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2000: cipher succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2000: catch error: “${err}“`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2000: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2100
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2100
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2100 started.`);
      let curveName: string = "NID_sm2";
      let signVerifyAlgName: string = "SM2_256|SM3";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlgName, true, commonSpec, curveName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2100: signVerify succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2100: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2100: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2200
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2200
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP256t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2200: started.`);
      let curveName: string = "NID_brainpoolP256t1";
      let signVerifyAlgName: string = "ECC_BrainPoolP256t1|SHA224";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlgName, true, commonSpec, curveName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2200: signVerify succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2200: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2200: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2300
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2300
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP512t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2300 started.`);
      let curveName: string = "NID_brainpoolP512t1";
      let agreementAlgName: string = "ECC_BrainPoolP512t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(agreementAlgName, true, commonSpec, curveName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2300: agreement succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2300: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2300: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2400
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2400
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_X9_62_prime256v1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2400 started.`);
      let curveName: string = "NID_X9_62_prime256v1";
      let agreementAlgName: string = "ECC256";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(agreementAlgName, true, commonSpec, curveName);
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2400: agreement succeed.`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2400: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2400: succeed.`);
      done();
    });


    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2500
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2500
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2500 started.`);
      let curveName: string = "NID_sm2";
      let agreementAlgName: string = "SM2_256";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2500: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2500: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2500: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2600
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2600
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_secp384r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2600 started.`);
      let curveName: string = "NID_secp384r1";
      let agreementAlgName: string = "ECC384";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2600: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2600: succeed.`);
      done();
    });


    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2700
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2700
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP160r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2700 started.`);
      let curveName: string = "NID_brainpoolP160r1";
      let agreementAlgName: string = "ECC_BrainPoolP160r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2700: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2700: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2700: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2800
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2800
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP192t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2800 started.`);
      let curveName: string = "NID_brainpoolP192t1";
      let agreementAlgName: string = "ECC_BrainPoolP192t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2800: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2800: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2800: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_2900
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_2900
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP224r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_2900 started.`);
      let curveName: string = "NID_brainpoolP224r1";
      let agreementAlgName: string = "ECC_BrainPoolP224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_2900: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_2900: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_2900: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3000
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3000
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP256t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3000 started.`);
      let curveName: string = "NID_brainpoolP256t1";
      let agreementAlgName: string = "ECC_BrainPoolP256t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3000: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3000: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3000: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3100
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3100
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP320r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3100 started.`);
      let curveName: string = "NID_brainpoolP320r1";
      let agreementAlgName: string = "ECC_BrainPoolP320r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3100: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3100: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3100: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3200
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3200
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP384t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3200 started.`);
      let curveName: string = "NID_brainpoolP384t1";
      let agreementAlgName: string = "ECC_BrainPoolP384t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3200: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3200: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3200: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3300
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3300
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP512r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3300 started.`);
      let curveName: string = "NID_brainpoolP512r1";
      let agreementAlgName: string = "ECC_BrainPoolP512r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3300: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3300: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3300: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3400
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3400
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP160t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3400 started.`);
      let curveName: string = "NID_brainpoolP160t1";
      let agreementAlgName: string = "ECC_BrainPoolP160t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3400: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3400: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3400: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3500
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3500
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP192r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3500 started.`);
      let curveName: string = "NID_brainpoolP192r1";
      let agreementAlgName: string = "ECC_BrainPoolP192r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3500: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3500: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3500: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3600
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3600
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP224t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3600 started.`);
      let curveName: string = "NID_brainpoolP224t1";
      let agreementAlgName: string = "ECC_BrainPoolP224t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3600: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3600: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3600: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3700
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3700
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP256r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3700 started.`);
      let curveName: string = "NID_brainpoolP256r1";
      let agreementAlgName: string = "ECC_BrainPoolP256r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3700: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3700: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3700: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3800
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3800
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP320t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3800 started.`);
      let curveName: string = "NID_brainpoolP320t1";
      let agreementAlgName: string = "ECC_BrainPoolP320t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3800: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3800: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3800: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_3900
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_3900
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP384r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_3900 started.`);
      let curveName: string = "NID_brainpoolP384r1";
      let agreementAlgName: string = "ECC_BrainPoolP384r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_3900: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_3900: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_3900: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_4000
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4000
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP512t1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4000 started.`);
      let curveName: string = "NID_brainpoolP512t1";
      let agreementAlgName: string = "ECC_BrainPoolP512t1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, commonSpec, agreementAlgName);
        let res: boolean = compareECCParams(commonSpec, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4000: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4000: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4000: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_4100
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4100
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_brainpoolP160r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4100 started.`);
      let curveName: string = "NID_brainpoolP160r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(true, commonSpec, curveName);
        let res: boolean = comparePairParams(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4100: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4100: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4100: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_4200
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4200
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_secp224r1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4200 started.`);
      let curveName: string = "NID_secp224r1";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(true, commonSpec, curveName);
        let res: boolean = comparePairParams(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4200: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4200: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4200: succeed.`);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_genECCCommonSpec_Func_4300
     * @tc.number Security_CryptoFramework_genECCCommonSpec_Func_4300
     * @tc.desc   1. genECCCommonParamSpec with curveName 'NID_sm2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it("Security_CryptoFramework_genECCCommonSpec_Func_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      console.log(`>>Security_CryptoFramework_genECCCommonSpec_Func_4300 started.`);
      let curveName: string = "NID_sm2";
      try {
        let commonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(true, commonSpec, curveName);
        let res: boolean = comparePairParams(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log("Security_CryptoFramework_genECCCommonSpec_Func_4300: params compare success");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_genECCCommonSpec_Func_4300: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_genECCCommonSpec_Func_4300: succeed.`);
      done();
    });


  })

}