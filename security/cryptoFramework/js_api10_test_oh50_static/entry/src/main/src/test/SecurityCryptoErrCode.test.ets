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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as symKeySyncUtils from './utils/syncSymKey/syncSymKeyUtils'
import * as signVerifySyncUtils from './utils/signVerify/signVerifySyncUtils';
import * as hkdfUtils from './utils/hkdf/hkdfUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwErrCodeTestUnit() {
  describe("SecurityCryptoFwErrCodeTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0100
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let pubKeyArray = new Uint8Array([48, 89, 48, 19, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7, 3, 66, 0, 4, 83, 96, 142, 9, 86, 214, 126, 106, 247, 233, 92, 125, 4, 128, 138, 105, 246, 162, 215, 71, 81, 58, 202, 121, 26, 105, 211, 55, 130, 45, 236, 143, 55, 16, 248, 75, 167, 160, 167, 106, 2, 152, 243, 44, 68, 66, 0, 167, 99, 92, 235, 215, 159, 239, 28, 106, 124, 171, 34, 145, 124, 174, 57, 92]);
        let priKeyArray = new Uint8Array([32, 115, 56, 137, 35, 207, 0, 60, 191, 90, 61, 136, 105, 210, 16, 27, 4, 171, 57, 10, 61, 123, 40, 189, 28, 34, 207, 236, 22, 45, 223, 10, 189, 160, 10, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7]);
        let pubKeyBlob: cryptoFramework.DataBlob = { data: pubKeyArray };
        let priKeyBlob: cryptoFramework.DataBlob = { data: priKeyArray };
        let asyKeyGenerator = cryptoFramework.createAsyKeyGenerator('ECC256');
        await asyKeyGenerator.convertKey(pubKeyBlob, priKeyBlob);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0100 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0200
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let pubKeyArray = new Uint8Array([48, 89, 48, 19, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7, 3, 66, 0, 4, 83, 96, 142, 9, 86, 214, 126, 106, 247, 233, 92, 125, 4, 128, 138, 105, 246, 162, 215, 71, 81, 58, 202, 121, 26, 105, 211, 55, 130, 45, 236, 143, 55, 16, 248, 75, 167, 160, 167, 106, 2, 152, 243, 44, 68, 66, 0, 167, 99, 92, 235, 215, 159, 239, 28, 106, 124, 171, 34, 145, 124, 174, 57, 92]);
        let priKeyArray = new Uint8Array([32, 115, 56, 137, 35, 207, 0, 60, 191, 90, 61, 136, 105, 210, 16, 27, 4, 171, 57, 10, 61, 123, 40, 189, 28, 34, 207, 236, 22, 45, 223, 10, 189, 160, 10, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7]);
        let pubKeyBlob: cryptoFramework.DataBlob = { data: pubKeyArray };
        let priKeyBlob: cryptoFramework.DataBlob = { data: priKeyArray };
        let generator = cryptoFramework.createAsyKeyGenerator('ECC256');
        generator.convertKeySync(pubKeyBlob, priKeyBlob);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0200 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0300
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let generator = cryptoFramework.createAsyKeyGenerator('ECC256');
        generator.convertKeySync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0300 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_0400
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0400
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      // let arr = [];
      try {
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('3DES192');
        let keyMaterialBlob = new Uint8Array();
        let KeyBlob: cryptoFramework.DataBlob = { data: keyMaterialBlob };
        await symKeyGenerator.convertKey(KeyBlob);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0400 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_0500
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0500
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        // let keyMessage = '';
        let keyBlob: cryptoFramework.DataBlob = {
          data : new Uint8Array() // new Uint8Array(buffer.from(keyMessage, 'utf-8').buffer)
        }
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('HMAC');
        let key = symKeyGenerator.convertKeySync(keyBlob);
        key.getEncoded();
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0500 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_0900
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0900
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let gcmParams = symKeySyncUtils.genGcmParamsSpec();
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('AES128');
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        let symKey = await symKeyGenerator.generateSymKey();
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParams);
        // let message = "";
        let plainText: cryptoFramework.DataBlob = { data: new Uint8Array() } // new Uint8Array(buffer.from(message, 'utf-8').buffer) };
        cipher.updateSync(plainText);
        console.info("updateSync success");
        cipher.doFinalSync(plainText);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0900 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1000
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1000
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let gcmParams = symKeySyncUtils.genGcmParamsSpec();
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('AES128');
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        let symKey = await symKeyGenerator.generateSymKey();
        // let keyMaterialBlob = new Uint8Array([]);
        let keyMaterialBlob = new Uint8Array();
        let plainText: cryptoFramework.DataBlob = { data: keyMaterialBlob };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParams);
        cipher.updateSync(plainText);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1000 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1100
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1100
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        let pSource = new Uint8Array([1,2,3,4]);
        cipher.setCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR, pSource);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1100 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1200
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1200
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1200 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1300
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1300
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "X25519";
        let signAlgName: string = "Ed25519";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1300 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1400
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1400
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let fieldFp: cryptoFramework.ECFieldFp = {
          fieldType: 'Fp',
          p: BigInt('26959946667150639794667015087019630673557916260026308143510066298881')
        }
        let G: cryptoFramework.Point = {
          x: BigInt('2'),
          y: BigInt('19926808758034470970197974370888749184205991990603949537637343198772')
        }
        let eccCommonSpec: cryptoFramework.ECCCommonParamsSpec = {
          algName: 'ECC',
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          field: fieldFp,
          a: BigInt('26959946667150639794667015087019630673557916260026308143510066298878'),
          b: BigInt('18958286285566608000408668544493926415504680968679321075787234672564'),
          g: G,
          n: BigInt('26959946667150639794667015087019625940457807714424391721682722368061'),
          h: 1
        }
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccCommonSpec); // 使用密钥参数对象创建生成器
        console.info("[createAsyKeyGeneratorBySpec success]");
        let keyPair = generatorBySpec.generateKeyPairSync();
        console.info("[generateKeyPairSync success]");
        let gX = keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
        expect(null).assertFail(); // length is 224, hex : b70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1400 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1500
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1500
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let fieldFp: cryptoFramework.ECFieldFp = {
          fieldType: 'Fp',
          p: BigInt('26959946667150639794667015087019630673557916260026308143510066298881')
        }
        let G: cryptoFramework.Point = {
          x: BigInt('2'),
          y: BigInt('19926808758034470970197974370888749184205991990603949537637343198772')
        }
        let eccCommonSpec: cryptoFramework.ECCCommonParamsSpec = {
          algName: 'ECC',
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          field: fieldFp,
          a: BigInt('26959946667150639794667015087019630673557916260026308143510066298878'),
          b: BigInt('18958286285566608000408668544493926415504680968679321075787234672564'),
          g: G,
          n: BigInt('26959946667150639794667015087019625940457807714424391721682722368061'),
          h: 1
        }
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccCommonSpec); // 使用密钥参数对象创建生成器
        console.info("[createAsyKeyGeneratorBySpec success]");
        let keyPair = generatorBySpec.generateKeyPairSync();
        console.info("[generateKeyPairSync success]");
        let gX = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
        console.info('--- gX', gX);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1500 “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1600
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1600
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 0;
      let algName: string = "HMAC";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      let kdfAlgName: string = algName + "|SHA1|EXTRACT_AND_EXPAND";
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1700
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1700
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let kdfAlgName: string = "HKDF" + "|SHA1|EXTRACT_AND_EXPAND";
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName);
        let spec: cryptoFramework.HKDFSpec = {
          salt: new Uint8Array(),
          info: new Uint8Array(),
          key: "",
          keySize: 0,
          algName: 'HKDF'
        };
        kdf.generateSecretSync(spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1800
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1800
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let generator = cryptoFramework.createAsyKeyGenerator('ECC_BrainPoolP256r1');
        let keyPair = await generator.generateKeyPair();
        let eccPkX = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
        let eccPkY = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
        // console.info('ECC_PK_X_BN 16：' + eccPkX.toString(16));
        // console.info('ECC_PK_Y_BN 16：' + eccPkY.toString(16));
        // 将eccPkX.toString(16)结果放入x，eccPkY.toString(16)结果放入y。
        let returnPoint: cryptoFramework.Point = {
          x: BigInt("11"), // eccPkX.toString(16)),
          y: BigInt("11")// eccPkY.toString(16))
        };
        let returnData = cryptoFramework.ECCKeyUtil.getEncodedPoint('NID_brainpoolP258r1', returnPoint, 'UNCOMPRESSED');
        console.info('returnData: ' + returnData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_1900
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1900
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let pkData = new Uint8Array([4]);
        let returnPoint = cryptoFramework.ECCKeyUtil.convertPoint('NID_brainpoolP257r1', pkData);
        console.info('returnPoint: ' + returnPoint.x.toString(16));
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_2000
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_2000
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let generator = cryptoFramework.createSymKeyGenerator("AES128");
        let symKey = await generator.generateSymKey();
        symKey.getEncoded();
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_2100
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_2100
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let sign = cryptoFramework.createSign("RSA512|PKCS1|SHA1")
      let setN = 20;
      let setUint8Array = new Uint8Array([0x20]);
      try {
        sign.setSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, setN);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        sign.setSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, setUint8Array);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        sign.getSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ErrCode_Func_2200
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_2200
     * @tc.desc   convertKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec('NID_brainpoolP256r1');
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(16);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
        console.error(`N############### ${error}, error code: ${error.code}`);
      }
      try {
        cryptoFramework.createAsyKeyGeneratorBySpec({
          algName: "ECC521", specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC});
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        cryptoFramework.createKdf("HKDF");
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      done();
    });

  });
}