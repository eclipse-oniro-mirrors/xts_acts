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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import { cryptoFramework } from '@kit.CryptoArchitectureKit'
import * as asyKeySyncUtils from './utils/syncAsyKey/syncAsyKeyUtils';
import * as commonUtils from './utils/common/commonUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwAsyKeyGeneratorTestUnit() {
  describe("SecurityCryptoFwAsyKeyGeneratorTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0100
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0100
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_RSA_KEY_SPEC) {
          let algName: string = asyKeySpecs[0][0];
          let primes: string[] = asyKeySpecs[1];
          for (let prime of primes) {
            let keyAlgName: string = algName + "|" + prime;
            let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(keyAlgName);
            let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
            let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
            let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(keyAlgName, pubKeyBlob, priKeyBlob);
            let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
            let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
            let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
            ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0200
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0201
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0201
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_ECC_KEY_SPEC_2) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0202
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0202
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_ECC_KEY_SPEC_3) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0300
     * @tc.desc   algorithm is DSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DSA_KEY_SPEC_1) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0301
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0301
     * @tc.desc   algorithm is DSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DSA_KEY_SPEC_2) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0400
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_SM2_KEY_SPEC) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0500
     * @tc.desc   algorithm is 25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_25519_KEY_SPEC) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0600
     * @tc.desc   algorithm is DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_1) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0601
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0601
     * @tc.desc   algorithm is DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_2) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0602
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0602
     * @tc.desc   algorithm is DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0602", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_3) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0700
     * @tc.desc   algorithm is SM2 Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let sm2KeyPairSpec = asyKeySyncUtils.genSM2KeyPairSpec();
      let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(sm2KeyPairSpec);
      try {
        let keyPair = generatorBySpec.generateKeyPairSync();
        if (keyPair != null) {
          let sm2CurveName: string | int | bigint = keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
          expect(sm2CurveName).assertEqual("NID_sm2");
        } else {
          expect(null).assertFail();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0800
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0800
     * @tc.desc   algorithm is RSA Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let rsaPubKeySpec = asyKeySyncUtils.genRsa2048PubKeySpec();
        let rsaGeneratorSpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaPubKeySpec);
        let pubKey = rsaGeneratorSpec.generatePubKeySync();
        if (pubKey != null) {
          let nBN = pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.RSA_N_BN);
          let eBN = pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.RSA_PK_BN);
          if (asyKeySyncUtils.compareRsaPubKeyBySpec(rsaPubKeySpec, nBN, eBN) != true) {
            expect(null).assertFail();
          } else {
            expect(null).assertNull();
          }
        } else {
          expect(null).assertFail();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0900
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0900
     * @tc.desc   algorithm is ECC Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
          let commKeySpec = asyKeySyncUtils.genEccCommonSpec();
          let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(commKeySpec);
          let keyPair: cryptoFramework.KeyPair = generatorBySpec.generateKeyPairSync();
          asyKeySyncUtils.showEccSpecDetailInfo(keyPair.priKey, "priKey");
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1000
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1000
     * @tc.desc   algorithm is ECC Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "ECC256";
        let a: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298878');
        let b: bigint = BigInt('18958286285566608000408668544493926415504680968679321075787234672564');
        let p: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298881');
        let gX: bigint = BigInt('19277929113566293071110308034699488026831934219452440156649784352033');
        let gY: bigint = BigInt('19926808758034470970197974370888749184205991990603949537637343198772');
        let n: bigint = BigInt('26959946667150639794667015087019625940457807714424391721682722368061');
        let h: int = 1;
        let sk: bigint = BigInt('5958211279885070464920675858557961186290168537951857871398143937432');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        let priKey: cryptoFramework.PriKey = generatorBySpec.generatePriKeySync();
        let priKeyBlob: cryptoFramework.DataBlob = priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, null, priKeyBlob);
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let ret = commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1100
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1100
     * @tc.desc   algorithm is ECC Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let a: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298878');
        let b: bigint = BigInt('18958286285566608000408668544493926415504680968679321075787234672564');
        let p: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298881');
        let gX: bigint = BigInt('19277929113566293071110308034699488026831934219452440156649784352033');
        let gY: bigint = BigInt('19926808758034470970197974370888749184205991990603949537637343198806');
        let n: bigint = BigInt('26959946667150639794667015087019625940457807714424391721682722368061');
        let h: int = 1;
        let sk: bigint = BigInt('5958211279885070464920675858557961186290168537951857871398143937432');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        generatorBySpec.generatePriKeySync();
        expect(null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1200
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1200
     * @tc.desc   algorithm is ECC Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let a: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298878');
        let b: bigint = BigInt('18958286285566608000408668544493926415504680968679321075787234672564');
        let p: bigint = BigInt('452312848583266388373324160190187140050506649604373537406227380470653132065');
        let gX: bigint = BigInt('19277929113566293071110308034699488026831934219452440156649784352033');
        let gY: bigint = BigInt('19926808758034470970197974370888749184205991990603949537637343198772');
        let n: bigint = BigInt('26959946667150639794667015087019625940457807714424391721682722368061');
        let h: int = 1;
        let sk: bigint = BigInt('5958211279885070464920675858557961186290168537951857871398143937432');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        generatorBySpec.generatePriKeySync();
        expect(null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1300
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1300
     * @tc.desc   algorithm is ECC Spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let a: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298878');
        let b: bigint = BigInt('18958286285566608000408668544493926415504680968679321075787234672567');
        let p: bigint = BigInt('26959946667150639794667015087019630673557916260026308143510066298881');
        let gX: bigint = BigInt('19277929113566293071110308034699488026831934219452440156649784352033');
        let gY: bigint = BigInt('19926808758034470970197974370888749184205991990603949537637343198772');
        let n: bigint = BigInt('26959946667150639794667015087019625940457807714424391721682722368061');
        let h: int = 1;
        let sk: bigint = BigInt('5958211279885070464920675858557961186290168537951857871398143937432');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        generatorBySpec.generatePriKeySync();
        expect(null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

  }
  );
}