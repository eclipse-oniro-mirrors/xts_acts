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
import * as specUtil from './utils/common/keyGenSpecUtil.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as compareSpecFunc from './utils/keyGenerate/compareSpecFunc.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function SecurityCryptoFwKeyGenerateDHTestUnit() {

  describe("SecurityCryptoFwKeyGenerateDHTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0100
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_DH_Func_0100
     * @tc.desc   AsyKeyGenerator with algName DH_modp1536, getEncoded by keyPair, then convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      try {
        let res: boolean = await asyKeyGenPromiseFunc.convertDHKey(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0200
     * @tc.desc   AsyKeyGenerator with algName DH_modp1536, getEncoded by keyPair, then convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      try {
        let res: boolean = await asyKeyGenCallbackFunc.convertDHKey(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0300
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec, generatePubKey by DHCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0300";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(512, 128);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(true, spec, "DH");
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.DHKeyPair(keyPair.priKey, keyPair.pubKey)
          && keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.DH_L_NUM) == 128;
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0400
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec, generatePubKey by DHCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0400";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(512, 128);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(true, spec, "DH");
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.DHKeyPair(keyPair.priKey, keyPair.pubKey)
          && keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.DH_L_NUM) == 128;
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0500
     * @tc.desc   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0500";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(2048, 224);
        expect(spec != null).assertTrue();
        console.log(testNumber + ": genDHCommonParamsSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0600
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(2048, 0);
        expect(spec != null).assertTrue();
        console.log(testNumber + ": genDHCommonParamsSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0700
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0700";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(2048, 223);
        console.log(testNumber + ": genDHCommonParamsSpec succeed");
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(401);
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0800
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0800
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0800";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(10001, 1024);
        console.log(testNumber + ": genDHCommonParamsSpec succeed");
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(401);
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0900
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0900
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_0900";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(511, 256);
        console.log(testNumber + ": genDHCommonParamsSpec succeed");
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(401);
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1000
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1000
     * @tc.desc   AsyKeyGeneratorBySpec with CommonSpec, generateKeyPair by DH_ffdhe2048, compare Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1000";
      console.log(testNumber + ": started.");
      try {
        let param: string = "DH_ffdhe2048";
        let spec: cryptoFramework.DHCommonParamsSpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(2048, 512);
        let keyPairBySpec: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(true, spec, "DH");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(false, spec, param);
        console.log(testNumber + ": genKeyPair succeed");
        expect(keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.DH_P_BN) == spec.p).assertTrue();
        expect(keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.DH_G_BN) == spec.g).assertTrue();
        expect(keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.DH_L_NUM) == 0).assertTrue();
        expect(keyPairBySpec.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.DH_L_NUM) == 512).assertTrue();
        expect(spec.l == 512).assertTrue();
        let res: boolean = compareSpecFunc.DHKey(keyPair, keyPairBySpec);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1100
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1100
     * @tc.desc   generatePubKey by spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1100";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genDHKeySpec succeed");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenPromiseFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1200
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1200
     * @tc.desc   generatePubKey by spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1200";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genDHKeySpec succeed");
        let priKey: cryptoFramework.PriKey = await asyKeyGenPromiseFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1300
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1300
     * @tc.desc   generatePriKey by spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1300";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genDHKeySpec succeed");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenCallbackFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1400
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1400
     * @tc.desc   generatePriKey by spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1400";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genDHKeySpec succeed");
        let priKey: cryptoFramework.PriKey = await asyKeyGenCallbackFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1500
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1500
     * @tc.desc   getAsyKeySpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1500";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genDHKeySpec succeed");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(true, spec, "DH");
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.DHKeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1600
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1600
     * @tc.desc   generateKeyPair by spec, getAsyKeySpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genDHKeySpec succeed");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(true, spec, "DH");
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.DHKeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1700
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1700
     * @tc.desc   generateKeyPair by DH_modp1536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_DH_Func_1700";
      console.log(testNumber + ": started");
      let keyAlg: string = "DH_modp1536";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(false, spec, keyAlg);
        expect(keyPair.pubKey.format == "X.509").assertTrue();
        expect(keyPair.pubKey.algName == "DH").assertTrue();
        expect(keyPair.priKey.format == "PKCS#8").assertTrue();
        expect(keyPair.priKey.algName == "DH").assertTrue();
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });


  })

}