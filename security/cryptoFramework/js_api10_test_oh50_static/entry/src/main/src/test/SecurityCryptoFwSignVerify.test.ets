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
import * as commonUtils from './utils/common/commonUtils';
import * as signVerifySyncUtils from './utils/signVerify/signVerifySyncUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSignVerifySyncTestUnit() {
  describe("SecurityCryptoFwSignVerifySyncTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.RSA_PKCS1_CIPHER_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "RSA" ? "RSA512": algName;
          let padding: string = cipherSpec[1][0];
          let digests: string[] = cipherSpec[2];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let digest of digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0101
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0101
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.RSA_PKCS1_CIPHER_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "RSA" ? "RSA512": algName;
          let padding: string = cipherSpec[1][0];
          let digests: string[] = cipherSpec[2];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let digest of digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = await signVerifySyncUtils.doVerifyPromise(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.RSA_PSS_CIPHER_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA3072_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA4096_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0500
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA8192_MD5_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0600
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA8192_SHA1_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0700
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA8192_SHA224_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0800
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA8192_SHA256_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_0900
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA8192_SHA384_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1000
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_RSA8192_SHA512_CIPHER_OAEP_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "RSA" ? "RSA512": algName;
          let padding: string = cipherSpec[1][0];
          let digest: string = cipherSpec[2][0];
          let mgf_digests: string[] = cipherSpec[3];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let mgf_digest of mgf_digests) {
            let signAlgName: string = algName + "|" + padding + "|" + digest + "|" + mgf_digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1100
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_SM2_CIPHER_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "SM2" ? "SM2_256": algName;
          let digests: string[] = cipherSpec[1];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let digest of digests) {
            let signAlgName: string = algName + "|" + digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1101
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1101
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ASY_SM2_CIPHER_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "SM2" ? "SM2_256": algName;
          let digests: string[] = cipherSpec[1];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let digest of digests) {
            let signAlgName: string = algName + "|" + digest;
            let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1200
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.ECDSA_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "ECC" ? "ECC224": algName;
          let digests: string[] = cipherSpec[1];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let digest of digests) {
            let signAlgName: string = algName + "|" + digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1300
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        for (let cipherSpec of signVerifySyncUtils.DSA_SPEC) {
          let algName: string = cipherSpec[0][0];
          algName = algName === "DSA" ? "DSA1024": algName;
          let digests: string[] = cipherSpec[1];
          let keyPair = await signVerifySyncUtils.generateSignKey(algName);
          for (let digest of digests) {
            let signAlgName: string = algName + "|" + digest;
            let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
            let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
            expect(ret).assertTrue();
          }
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1400
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "Ed25519";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(algName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(algName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1500
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "Ed25519";
        let signAlgName: string = "Ed25519";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1501
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1501
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "Ed25519";
        let signAlgName: string = "Ed25519";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignWithUpdatePromise(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_1501 SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1600
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA512";
        let signAlgName: string = "RSA512|PKCS1|MD5";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1700
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA768";
        let signAlgName: string = "RSA768|PSS|MD5|MGF1_SHA1";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1800
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "ECC256";
        let signAlgName: string = "ECC256|SHA256";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_1900
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2000
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA2048";
        let signAlgName: string = "DSA2048|NoHash";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_2000 SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2001
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2001
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA2048";
        let signAlgName: string = "DSA2048|NoHash";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignWithUpdatePromise(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_2000 SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2100
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "SM2_256";
        let signAlgName: string = "SM2_256|SM3";
        let blockSize: int = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2200
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "SM2_256";
        let signAlgName: string = "SM2_256|SM3";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2201
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2201
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "SM2_256";
        let signAlgName: string = "SM2_256|SM3";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2301
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2301
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "RSA512";
        let signAlgName: string = "RSA512|PKCS1|SHA1";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2400
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(signAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2401
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2401
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        let dataSign: cryptoFramework.DataBlob = sign.signSync(null);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        verify.initSync(keyPair.pubKey);
        let ret: boolean = verify.verifySync(null, dataSign);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2500
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2501
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2501
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2502
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2502
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2502", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        sign.signSync(null);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2600
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|NoHash";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2700
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "ECC384";
        let signAlgName: string = "ECC384|SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2701
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2701
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "ECC384";
        let signAlgName: string = "ECC384|SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2800
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "Ed25519";
        let signAlgName: string = "Ed25519";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2801
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2801
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2801", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let msg: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let algName: string = "Ed25519";
        let signAlgName: string = "Ed25519";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2900
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512|OnlySign";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_2901
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2901
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2901", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512|OnlySign";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3000
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_3000 SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3001
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3001
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_3000 SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });


    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3100
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let signAlgName: string = "RSA2048|PKCS7|SHA512";
      let verifyAlgName: string = "RSA2048|PKCS7|SHA512";
      let algNameNoHash: string = "RSA2048|PKCS7";
      let algName: string = "RSA2048|PSS|SHA256";
      let algNameMGF: string = "RSA2048|PSS|MGF1_SHA256";
      try {
        cryptoFramework.createSign(signAlgName);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(verifyAlgName);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createSign(algNameNoHash);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(algNameNoHash);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createSign(algName);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(algName);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createSign(algNameMGF);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(algNameMGF);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3200
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA512|MGF1_MD5";
        let verifyAlgName: string = "RSA1024|PSS|SHA512|MGF1_SHA1";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3201
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3201
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA512|MGF1_MD5";
        let verifyAlgName: string = "RSA1024|PSS|SHA512|MGF1_SHA1";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3300
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA3072";
        let signAlgName: string = "RSA3072|PSS|SHA256|MGF1_SHA256";
        let verifyAlgName: string = "RSA3072|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3301
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3301
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA3072";
        let signAlgName: string = "RSA3072|PSS|SHA256|MGF1_SHA256";
        let verifyAlgName: string = "RSA3072|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3400
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "ECC256";
        let signAlgName: string = "ECC256|SHA256";
        let verifyAlgName: string = "ECC256|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3401
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3401
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "ECC256";
        let signAlgName: string = "ECC256|SHA256";
        let verifyAlgName: string = "ECC256|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3500
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3501
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3501
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3600
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|NoHash";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3601
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3601
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|NoHash";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3700
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|NoHash";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3701
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3701
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|NoHash";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3800
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let signAlgName: string = "SM2_256|NoHash";
        let verifyAlgName: string = "SM2_256|SHA256";
        let AlgName: string = "SM2_256";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign(AlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(AlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_3900
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let signAlgName: string = "Ed25519|SHA256";
        let verifyAlgName: string = "Ed25519|NoHash|SHA";
        try {
          cryptoFramework.createSign(signAlgName);
        } catch (error: BusinessError) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_4000
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let signAlgName: string = "ECC256|SM3";
        let verifyAlgName: string = "ECC256|NoHash";
        let algName: string = "ECC256";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign(algName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(algName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_4100
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let signAlgName: string = "DSA1024|SM4";
        let verifyAlgName: string = "DSA1024";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);

          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_4200
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let signAlgName: string = "SM9|SM3";
        let verifyAlgName: string = "SM9";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_4300
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        let dataSign: cryptoFramework.DataBlob = await sign.sign(null);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        verify.initSync(keyPair.pubKey);
        let ret: boolean = await verify.verify(null, dataSign);
        expect(ret).assertTrue();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_4400
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        let dataSign: cryptoFramework.DataBlob = await sign.sign(null);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        verify.initSync(keyPair.pubKey);
        // 篡改签名
        dataSign.data[0]++;
        let ret: boolean = await verify.verify(null, dataSign);
        expect(ret).assertFalse();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SignVerifySync_Func_4500
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        let dataSign: cryptoFramework.DataBlob = await sign.sign(null);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        verify.initSync(keyPair.pubKey);
        // 篡改签名
        dataSign.data[0]++;
        verify.verify(null, dataSign, (err, ret) => {
          expect(ret).assertFalse();
        });
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}