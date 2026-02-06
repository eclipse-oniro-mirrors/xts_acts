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
import * as commonUtils from './utils/common/commonUtils';
import * as v from './utils/vectors/vectors';
import {
  genIvParamsSpec,
  genGcmOrCcmParamsSpec,
  encryptDecryptMessageSync,
  tagEncryptDecryptMessageSync,
  dataGcmOrCCMSpec,
  dataSpec,
} from './utils/syncSymEncAndDec/syncSymEncAndDecUtils'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwVectorTestUnit() {
  describe("SecurityCryptoFwVectorTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0100
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0100
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let digestVectors: v.mdVectorData[] = v.digestVectors;
        for (let vector of digestVectors) {
          let algName: string = vector.algName;
          for (let data of vector.mdVectorSpec) {
            let plainUint8Array = commonUtils.stringToUint8Array(data.plainText);
            let plainText: cryptoFramework.DataBlob = v.uint8ArrayToDataBlob(plainUint8Array);
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            await md.update(plainText);
            let digest: cryptoFramework.DataBlob = await md.digest();
            let expectDigest: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectDigest);
            let ret: boolean = commonUtils.compareDataBlob(digest, expectDigest);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0200
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0200
     * @tc.desc   algorithm is Hmac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let hmacVectors: v.macVectorData[] = v.hmacVectors;
        for (let vector of hmacVectors) {
          let algName: string = vector.algName;
          for (let data of vector.macVectorSpec) {
            let plainUint8Array = commonUtils.stringToUint8Array(data.plainText);
            let plainText: cryptoFramework.DataBlob = v.uint8ArrayToDataBlob(plainUint8Array);
            let symKey: cryptoFramework.SymKey = await v.convertSymKey(vector.macAlgName, data);
            let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
            await mac.init(symKey);
            await mac.update(plainText);
            let digest: cryptoFramework.DataBlob = await mac.doFinal();
            let expectMac: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectMac);
            let ret: boolean = commonUtils.compareDataBlob(digest, expectMac);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0300
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0300
     * @tc.desc   algorithm is pbkdf2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let pbkdf2Vectors: v.pbkdf2VectorData[] = v.pbkdf2Vectors;
        for (let vector of pbkdf2Vectors) {
          let digestAlgName: string = vector.algName;
          let kdfAlgName: string = vector.kdfAlgName;
          for (let data of vector.kdfVectorSpec) {
            let password: number[] = data.password;
            let salt: number[] = data.salt;
            let iterations: int = data.iterations;
            let keySize: int = data.keySize;
            let kdfSpec: cryptoFramework.PBKDF2Spec = v.getKdfSpec(password, salt, iterations, keySize);
            let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
            let secret: cryptoFramework.DataBlob = await kdf.generateSecret(kdfSpec);

            let expectKdf: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectKdf);
            let ret: boolean = commonUtils.compareDataBlob(secret, expectKdf);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0400
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0400
     * @tc.desc   algorithm is hkdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let hkdfVectors: v.hkdfVectorData[] = v.hkdfVectors;
        for (let vector of hkdfVectors) {
          let digestAlgName: string = vector.algName;
          let kdfAlgName: string = vector.kdfAlgName;
          for (let data of vector.kdfVectorSpec) {
            let key: number[] = data.key;
            let salt: number[] = data.salt;
            let info: number[] = data.info;
            let keySize: int = data.keySize;
            let kdfSpec: cryptoFramework.HKDFSpec = v.getHkdfSpec(key, salt, info, keySize);
            let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
            let secret: cryptoFramework.DataBlob = await kdf.generateSecret(kdfSpec);

            let expectKdf: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectKdf);
            let ret: boolean = commonUtils.compareDataBlob(secret, expectKdf);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0500
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0500
     * @tc.desc   algorithm is aes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g_index: number = 0;
      let g_vector_failed_index: number = 0;
      try {
        () => {
          let symVectors: v.symVectorData[] = v.symVectors;
          for (let vector of symVectors) {
            let algName: string = vector.symAlgName;
            let mode: string = vector.mode;
            let bits: number = vector.bits;
            g_index = vector.index;
            for (let data of vector.symVectorSpec) {
              let iv: number[] = data.iv;
              let padding: string = data.padding;
              let symKeyAlgName: string = `${algName}${bits}`;
              let algEncDecName = `${algName}${bits}|${mode}|${padding}`;
              let symKey: cryptoFramework.SymKey = await v.convertSymKey(symKeyAlgName, data);
              let paramSpec: cryptoFramework.IvParamsSpec = genIvParamsSpec(iv);
              let expectCipher: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.cipherText);
              let plainText: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.plainText);
              let cipherText: dataSpec = encryptDecryptMessageSync(algEncDecName, true, symKey, plainText, paramSpec);
              let ret: boolean  = commonUtils.compareDataBlob(cipherText.data, expectCipher);
              g_vector_failed_index = data.index;
              expect(ret).assertTrue();
              console.info("#################### algEncDecName:" + algEncDecName)
            }
          }          
        }();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        console.info("[FAILED] g_index:" + g_index + " g_vector_failed_index:" + g_vector_failed_index)
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0600
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0600
     * @tc.desc   algorithm is aes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g_index: number = 0;
      let g_vector_failed_index: number = 0;
      try {
          () => {
            let symAeadVectors: v.symVectorData[] = v.symAeadVectors

            for (let vector of symAeadVectors) {
              let algName: string = vector.symAlgName;
              let mode: string = vector.mode;
              let bits: number = vector.bits;
              let specAlgName: string = mode == "GCM" ? "GcmParamsSpec" : "CcmParamsSpec";
              g_index = vector.index;
              for (let data of vector.symVectorSpec) {
                let iv: number[] = data.iv;
                let aad: number[] = data.aad;
                let tag: number[] = data.tag;
                let padding: string = data.padding;
                let not_run: boolean = data.not_run ? true : false;
                g_vector_failed_index = data.index;
                if (not_run) {
                  continue
                }
                let symKeyAlgName: string = `${algName}${bits}`;
                let algEncDecName = `${algName}${bits}|${mode}|${padding}`;
                let symKey: cryptoFramework.SymKey = await v.convertSymKey(symKeyAlgName, data);
                let paramSpec: cryptoFramework.GcmParamsSpec = genGcmOrCcmParamsSpec(iv, aad, tag, specAlgName);
                let expectCipher: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.cipherText);
                let plainText: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.plainText)
                let cipherData: dataGcmOrCCMSpec = tagEncryptDecryptMessageSync(algEncDecName, true, symKey, plainText, paramSpec);
                console.info("################### cipherData.paramSpec.authTag:" + commonUtils.decToHexString({data:cipherData.paramSpec.authTag.data}))
                console.info("################### tag                         :" + tag)
                console.info("################### expectCipher                :" + expectCipher.data)
                // console.info("################### cipherData.data             :" + commonUtils.decToHexString({data:cipherData.data.data}))
                console.info("################### data.plainText              :" + data.plainText)
                console.info("################### plainText                   :" + plainText.data)
                let ret: boolean  = commonUtils.compareDataBlob(cipherData.data, expectCipher);
                ret = ret && commonUtils.compareDataBlob(cipherData.paramSpec.authTag, {data: new Uint8Array(tag)});
                expect(ret).assertTrue();
                console.info("################### algEncDecName:" + algEncDecName)
              }
            }
        }();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        console.info("[FAILED] g_index:" + g_index + " g_vector_failed_index:" + g_vector_failed_index)
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_VectorTest_Func_0700
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0700
     * @tc.desc   algorithm is X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g_index: number = 0;
      let g_vector_failed_index: number = 0;
      try {
          () => {
            let agreementVectors: v.agreementVectorData[] = v.agreementVectors;
            for (let vector of agreementVectors) {
              let algName: string = vector.algName;
              g_index = vector.index;
              for (let data of vector.agreementVectorSpec) {
                let peer_priKey: string = data.peer_priKey;
                let peer_pubKey: string = data.peer_pubKey;
                let local_priKey: string = data.local_priKey;
                let local_pubKey: string = data.local_pubKey;
                let sharedKey: number[] = data.sharedKey;
                let not_run: boolean = data.not_run ? true : false;
                g_vector_failed_index = data.index;
                if (not_run) {
                  continue
                }
                let peer_Spec: cryptoFramework.X25519KeyPairSpec = {
                  algName: algName,
                  specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
                  sk: BigInt(peer_priKey),
                  pk: BigInt(peer_pubKey)
                };
                let local_Spec: cryptoFramework.X25519KeyPairSpec = {
                  algName: algName,
                  specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
                  sk: BigInt(local_priKey),
                  pk: BigInt(local_pubKey)
                };
                let peer_generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(peer_Spec);
                let peer_keyPair: cryptoFramework.KeyPair = await peer_generator.generateKeyPair();
                let local_generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(local_Spec);
                let local_keyPair: cryptoFramework.KeyPair = await local_generator.generateKeyPair();
                let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
                let secret: cryptoFramework.DataBlob = await agreement.generateSecret(peer_keyPair.priKey, local_keyPair.pubKey);
                let ret: boolean = commonUtils.compareDataBlob(secret, {data: new Uint8Array(sharedKey)});
                expect(ret).assertTrue();
              }
            }
        }();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        console.info("[FAILED] g_index:" + g_index + " g_vector_failed_index:" + g_vector_failed_index)
        expect(null).assertFail();
      }
      done();
    });

  });
}