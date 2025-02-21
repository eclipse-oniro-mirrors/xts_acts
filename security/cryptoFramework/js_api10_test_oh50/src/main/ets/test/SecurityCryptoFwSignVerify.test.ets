/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as signVerifySyncUtils from './utils/signVerify/signVerifySyncUtils';


export default function SecurityCryptoFwSignVerifySyncTestUnit() {
  describe('SecurityCryptoFwSignVerifySyncTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0100
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0100", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0101
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0101", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0200
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0200", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0300
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0300", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0400
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0400", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0500
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0500", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0600
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0600", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0700
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0700", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0800
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0800", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_0900
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_0900", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1000
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1000", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1100
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1100", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1101
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1101", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1200
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1200", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1300
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1300", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1400
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1400", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "Ed25519";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(algName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(algName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1500
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1500", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "Ed25519";
        let signAlgName: string = "Ed25519";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1501
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1501", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "Ed25519";
        let signAlgName: string = "Ed25519";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignWithUpdatePromise(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_1501 SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1600
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1600", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA512";
        let signAlgName: string = "RSA512|PKCS1|MD5";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1700
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1700", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA768";
        let signAlgName: string = "RSA768|PSS|MD5|MGF1_SHA1";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1800
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1800", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "ECC256";
        let signAlgName: string = "ECC256|SHA256";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_1900
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_1900", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2000
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2000", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA2048";
        let signAlgName: string = "DSA2048|NoHash";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_2000 SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2001
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2001", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA2048";
        let signAlgName: string = "DSA2048|NoHash";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        await signVerifySyncUtils.doSignWithUpdatePromise(signAlgName, keyPair.priKey, msg, blockSize);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_2000 SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2100
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2100", 0, async (done: Function) => {
      try {
        let msgLen: number = 16384;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "SM2_256";
        let signAlgName: string = "SM2_256|SM3";
        let blockSize: number = 20;
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignWithUpdateSync(signAlgName, keyPair.priKey, msg, blockSize);
        let ret: boolean = signVerifySyncUtils.doVerifyWithUpdateSync(signAlgName, keyPair.pubKey, msg, dataSign, blockSize);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2200
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2200", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2201
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2201", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2301
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2301", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2400
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2400", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2401
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2401", 0, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        let dataSign = sign.signSync(null);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signAlgName);
        verify.initSync(keyPair.pubKey);
        let ret = verify.verifySync(null, dataSign);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2500
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2500", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2501
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2501", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2502
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2502", 0, async (done: Function) => {
      try {
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        sign.signSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2600
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2600", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2700
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2700", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2701
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2701", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2800
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2800", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2801
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2801", 0, async (done: Function) => {
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
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2900
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2900", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512|OnlySign";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_2901
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_2901", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512|OnlySign";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA512";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3000
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3000", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_3000 SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3001
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3001", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA2048";
        let signAlgName: string = "RSA2048|PKCS1|SHA512";
        let verifyAlgName: string = "RSA2048|PKCS1|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_SignVerifySync_Func_3000 SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });


    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3100
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3100", 0, async (done: Function) => {
      let signAlgName: string = "RSA2048|PKCS7|SHA512";
      let verifyAlgName: string = "RSA2048|PKCS7|SHA512";
      let algNameNoHash: string = "RSA2048|PKCS7";
      let algName: string = "RSA2048|PSS|SHA256";
      let algNameMGF: string = "RSA2048|PSS|MGF1_SHA256";
      try {
        cryptoFramework.createSign(signAlgName);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(verifyAlgName);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createSign(algNameNoHash);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(algNameNoHash);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createSign(algName);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(algName);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createSign(algNameMGF);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        cryptoFramework.createVerify(algNameMGF);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3200
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3200", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA512|MGF1_MD5";
        let verifyAlgName: string = "RSA1024|PSS|SHA512|MGF1_SHA1";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3201
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3201", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA1024";
        let signAlgName: string = "RSA1024|PSS|SHA512|MGF1_MD5";
        let verifyAlgName: string = "RSA1024|PSS|SHA512|MGF1_SHA1";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3300
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3300", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA3072";
        let signAlgName: string = "RSA3072|PSS|SHA256|MGF1_SHA256";
        let verifyAlgName: string = "RSA3072|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3301
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3301", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "RSA3072";
        let signAlgName: string = "RSA3072|PSS|SHA256|MGF1_SHA256";
        let verifyAlgName: string = "RSA3072|PSS|SHA384|MGF1_SHA256";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3400
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3400", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "ECC256";
        let signAlgName: string = "ECC256|SHA256";
        let verifyAlgName: string = "ECC256|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3401
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3401", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "ECC256";
        let signAlgName: string = "ECC256|SHA256";
        let verifyAlgName: string = "ECC256|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3500
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3500", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3501
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3501", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3600
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3600", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|NoHash";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3601
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3601", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|NoHash";
        let verifyAlgName: string = "DSA1024|SHA384";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3700
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3700", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|NoHash";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = signVerifySyncUtils.doSignSync(signAlgName, keyPair.priKey, msg);
        let ret: boolean = signVerifySyncUtils.doVerifySync(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3701
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3701", 0, async (done: Function) => {
      try {
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let algName: string = "DSA1024";
        let signAlgName: string = "DSA1024|SHA256";
        let verifyAlgName: string = "DSA1024|NoHash";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let dataSign = await signVerifySyncUtils.doSignPromise(signAlgName, keyPair.priKey, msg);
        let ret: boolean = await signVerifySyncUtils.doVerifyPromise(verifyAlgName, keyPair.pubKey, msg, dataSign);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3800
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3800", 0, async (done: Function) => {
      try {
        let signAlgName: string = "SM2_256|NoHash";
        let verifyAlgName: string = "SM2_256|SHA256";
        let AlgName: string = "SM2_256";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign(AlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(AlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`SignVerify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_3900
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_3900", 0, async (done: Function) => {
      try {
        let signAlgName: string = "Ed25519|SHA256";
        let verifyAlgName: string = "Ed25519|NoHash|SHA";
        try {
          cryptoFramework.createSign(signAlgName);
        } catch (error) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4000
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4000", 0, async (done: Function) => {
      try {
        let signAlgName: string = "ECC256|SM3";
        let verifyAlgName: string = "ECC256|NoHash";
        let algName: string = "ECC256";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign(algName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(algName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4100
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4100", 0, async (done: Function) => {
      try {
        let signAlgName: string = "DSA1024|SM4";
        let verifyAlgName: string = "DSA1024";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);

          expect(null).assertFail();
        } catch (error) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_SignVerifySync_Func_4200
     * @tc.name Test Sign and verify algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Sign and verify
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerifySync_Func_4200", 0, async (done: Function) => {
      try {
        let signAlgName: string = "SM9|SM3";
        let verifyAlgName: string = "SM9";
        try {
          cryptoFramework.createSign(signAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Sign “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify(verifyAlgName);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Verify “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
  });
}