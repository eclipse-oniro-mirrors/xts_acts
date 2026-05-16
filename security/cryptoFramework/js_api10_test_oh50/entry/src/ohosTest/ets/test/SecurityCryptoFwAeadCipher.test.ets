/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import {
  aeadCipherCallback,
  aeadCipherPromise,
  aeadCipherSync,
  aeadCipherWithUpdateCallback,
  aeadCipherWithUpdateSync,
  aeadEncOrDecPromise,
  AES_CCM_IV_LENS, AES_CCM_TAG_LENS,
  genAeadParamsSpec } from './utils/syncSymEncAndDec/syncSymEncAndDecUtils';
import { convertSymKeySync, createSymKey, doUpdatePromise, doUpdateSync } from './utils/syncSymKey/syncSymKeyUtils';
import { compareDataBlob, createFullData } from './utils/common/commonUtils';


export default function SecurityCryptoFwAeadTestUnit() {
  describe('SecurityCryptoFwAeadTestUnit', () => {

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0100
     * @tc.desc CCM 不设置aad，全场景规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            algName = algName + "|CCM";
            for (let ivLen of AES_CCM_IV_LENS) {
              for (let tagLen of AES_CCM_TAG_LENS) {
                let message: cryptoFramework.DataBlob = await createFullData(msgLen);
                let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, tagLen);
                let cipherText: cryptoFramework.DataBlob = aeadCipherSync(algName, true, symKey, message, paramSpec);
                let plainText: cryptoFramework.DataBlob = aeadCipherSync(algName, false, symKey, cipherText, paramSpec);
                let ret: boolean = compareDataBlob(message, plainText);
                expect(ret).assertTrue();
              }
            }
          }
        } catch (error) {
          console.error(`Aead_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0200
     * @tc.desc CCM 设置aad，全场景规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let aadLen: number = 12;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            algName = algName + "|CCM";
            for (let ivLen of AES_CCM_IV_LENS) {
              for (let tagLen of AES_CCM_TAG_LENS) {
                let message: cryptoFramework.DataBlob = await createFullData(msgLen);
                let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, tagLen, aadLen);
                let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, paramSpec);
                let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, false, symKey, cipherText, paramSpec);
                let ret: boolean = compareDataBlob(message, plainText);
                expect(ret).assertTrue();
              }
            }
          }
        } catch (error) {
          console.error(`Aead_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0300
     * @tc.desc CCM 不设置tagLen，功能测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let ivLen: number = 7;
          let aadLen: number = 8;
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          algName = algName + "|CCM";
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, 0, aadLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Aead_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0400
     * @tc.desc CCM 设置aadLen大于2048，功能测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let ivLen: number = 7;
          let aadLen: number = 2050;
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          algName = algName + "|CCM";
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, 6, aadLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Aead_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0500
     * @tc.desc CCM 篡改tag，异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let ivLen: number = 10;
          let aadLen: number = 8;
          let tagLen: number = 6;
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          algName = algName + "|CCM";
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, tagLen, aadLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, paramSpec);
          cipherText.data[cipherText.data.length-1]++;
          await aeadCipherPromise(algName, false, symKey, cipherText, paramSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0600
     * @tc.desc CCM 加密解密使用不同的aad，异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES256";
          let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x07];
          let aad1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x07];
          let aad2: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x08];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv),
            authenticatedData: new Uint8Array(aad1),
            algName: "AeadParamsSpec"
          };
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          algName = algName + "|CCM";
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.authenticatedData = new Uint8Array(aad2);
          await aeadCipherPromise(algName, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0700
     * @tc.desc CCM 加密解密使用不同的iv，异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES256";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x07];
          let iv2: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x08];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x07];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad),
            algName: "AeadParamsSpec"
          };
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          algName = algName + "|CCM";
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.nonce = new Uint8Array(iv2);
          await aeadCipherPromise(algName, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0800
     * @tc.desc CCM 加密解密使用不同的tagLen，异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES256";
          let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x07];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06,0x07];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv),
            authenticatedData: new Uint8Array(aad),
            tagLen: 10,
            algName: "AeadParamsSpec"
          };
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          algName = algName + "|CCM";
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.tagLen = 14;
          await aeadCipherPromise(algName, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_0900
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_0900
     * @tc.desc CCM tagLen非规格长度、nonce非规格长度，异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let algName: string = "AES256";
        let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07];
        let ivError: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06];
        let aad: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07];
        let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
          nonce: new Uint8Array(iv),
          authenticatedData: new Uint8Array(aad),
          tagLen: 15,
          algName: "AeadParamsSpec"
        };
        let symKey: cryptoFramework.SymKey = createSymKey(algName);
        algName = algName + "|CCM";
        let cipher = cryptoFramework.createCipher(algName);
        try {
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0900 tagLen “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        aeadParamsSpec.tagLen = 10;
        try {
          aeadParamsSpec.nonce = new Uint8Array(ivError);
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0900 ivLen “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        try {
          let paramsSpec: cryptoFramework.ParamsSpec = {
            algName: "AeadParamsSpec"
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_0900 paramsSpec “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1000
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1000
     * @tc.desc CCM 设置aad，全场景规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let aadLen: number = 12;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            algName = algName + "|CCM";
            for (let ivLen of AES_CCM_IV_LENS) {
              for (let tagLen of AES_CCM_TAG_LENS) {
                let message: cryptoFramework.DataBlob = await createFullData(msgLen);
                let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, tagLen, aadLen);
                let cipherText: cryptoFramework.DataBlob = aeadCipherWithUpdateSync(algName, true, symKey, message, paramSpec);
                let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, false, symKey, cipherText, paramSpec);
                let ret: boolean = compareDataBlob(message, plainText);
                expect(ret).assertTrue();
              }
            }
          }
        } catch (error) {
          console.error(`Aead_Func_1000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1100
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1100
     * @tc.desc AES XTS，全场景规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 17; // XTS模式，消息长度必须大于16字节
          let ivLen: number = 16;
          let algNames: string[] = ["AES128", "AES256"];
          let keyLens: number[] = [32, 64];
          for (let index = 0; index < algNames.length; index++) {
            let keyData: cryptoFramework.DataBlob = await createFullData(keyLens[index]);
            let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
            let algName: string = algNames[index] + "|XTS";
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let iv: cryptoFramework.DataBlob = await createFullData(ivLen);
            let ivParamsSpec: cryptoFramework.IvParamsSpec = {
              algName: "IvParamsSpec",
              iv: iv
            };
            let cipherText: cryptoFramework.DataBlob = aeadCipherSync(algName, true, symKey, message, ivParamsSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, false, symKey, cipherText, ivParamsSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aead_Func_1100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Aead_Func_1200
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1200
     * @tc.desc   AES XTS，分段，全场景规格遍历测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algNames: string[] = ["AES128", "AES256"];
          let keyLens: number[] = [32, 64];
          let msgLen: number = 77; // 每个块必须大于等于16字节
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array([
              0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
              0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16
            ])
            },
            algName: "IvParamsSpec"
          };
          let blockSize: number = 20;
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          for (let index = 0; index < algNames.length; index++) {
            let alg:string = algNames[index] + "|" + "XTS";
            let keyData: cryptoFramework.DataBlob = await createFullData(keyLens[index]);
            let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
            let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
            let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
            let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
            let cipherText: cryptoFramework.DataBlob = doUpdateSync(encCipher, symKey, initSpec, msg, blockSize,
              cryptoFramework.CryptoMode.ENCRYPT_MODE);
            let plainText: cryptoFramework.DataBlob = await doUpdatePromise(decCipher, symKey, initSpec, cipherText, blockSize,
              cryptoFramework.CryptoMode.DECRYPT_MODE);
            let ret: boolean = compareDataBlob(plainText, msg);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aead_Func_1200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1300
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1300
     * @tc.desc AES XTS，消息长度小于16字节异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 15; // XTS模式，消息长度必须大于16字节
          let ivLen: number = 16;
          let keyLen: number = 32;
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
          let algName: string = "AES128" + "|XTS";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let iv: cryptoFramework.DataBlob = await createFullData(ivLen);
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          aeadCipherSync(algName, true, symKey, message, ivParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_1300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1400
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1400
     * @tc.desc AES XTS，空消息异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let ivLen: number = 16;
          let keyLen: number = 32;
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
          let algName: string = "AES128" + "|XTS";
          let iv: cryptoFramework.DataBlob = await createFullData(ivLen);
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          let cipher = cryptoFramework.createCipher(algName);
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          let dataText: cryptoFramework.DataBlob|null = cipher.doFinalSync(null);
          expect(dataText).assertNull();
        } catch (error) {
          console.error(`Aead_Func_1400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1500
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1500
     * @tc.desc AES XTS，空消息异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let ivLen: number = 15; // XTS模式下iv必须等于16字节
          let keyLen: number = 32;
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
          let algName: string = "AES128" + "|XTS";
          let iv: cryptoFramework.DataBlob = await createFullData(ivLen);
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          let cipher = cryptoFramework.createCipher(algName);
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_1500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1600
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1600
     * @tc.desc AES XTS，加密解密使用不同的iv异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 17;
          let ivLen: number = 16;
          let keyLen: number = 32;
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
          let algName: string = "AES128" + "|XTS";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let iv1: cryptoFramework.DataBlob = await createFullData(ivLen);
          let iv2: cryptoFramework.DataBlob = await createFullData(ivLen);
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv1
          };
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(algName, true, symKey, message, ivParamsSpec);
          ivParamsSpec.iv = iv2;
          let plainText: cryptoFramework.DataBlob = aeadCipherSync(algName, false, symKey, cipherText, ivParamsSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertFalse();
        } catch (error) {
          console.error(`Aead_Func_1600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1700
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1700
     * @tc.desc AES XTS，params参数异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyLen: number = 32;
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
          let algName: string = "AES128" + "|XTS";
          let paramsSpec: cryptoFramework.ParamsSpec = {
            algName: "IvParamsSpec",
          };
          let cipher = cryptoFramework.createCipher(algName);
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_1700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1800
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1800
     * @tc.desc AES XTS，规格异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyLen: number = 48;
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = convertSymKeySync("HMAC", keyData);
          let algName: string = "AES192" + "|XTS";
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: {data: new Uint8Array([
              0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
              0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16
            ])
            },
          };
          let cipher = cryptoFramework.createCipher(algName);
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_1800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_1900
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_1900
     * @tc.desc AES XTS，密钥异常异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "AES128" + "|XTS";
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: {data: new Uint8Array([
              0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
              0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16
            ])
            }
          };
          let symKey: cryptoFramework.SymKey = createSymKey("AES128");
          let cipher = cryptoFramework.createCipher(algName);
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aead_Func_1900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Aead_Func_2000
     * @tc.number SUB_Security_CryptoFramework_Aead_Func_2000
     * @tc.desc CCM 设置aad，callback 全场景规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Aead_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let aadLen: number = 12;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            algName = algName + "|CCM";
            for (let ivLen of AES_CCM_IV_LENS) {
              for (let tagLen of AES_CCM_TAG_LENS) {
                let message: cryptoFramework.DataBlob = await createFullData(msgLen);
                let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(ivLen, tagLen, aadLen);
                let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
                let cipherText: cryptoFramework.DataBlob = await aeadCipherWithUpdateCallback(cipher, true, symKey, message, paramSpec);
                let plainText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, false, symKey, cipherText, paramSpec);
                let ret: boolean = compareDataBlob(message, plainText);
                expect(ret).assertTrue();
              }
            }
          }
        } catch (error) {
          console.error(`Aead_Func_2000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0100
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0100
     * @tc.desc AES-GCM 加解密功能测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0100 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0200
     * @tc.desc AES-GCM 全tagLen规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let tagLens: number[] = [4, 8, 12, 13, 14, 15, 16];
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            for (let tagLen of tagLens) {
              let message: cryptoFramework.DataBlob = await createFullData(msgLen);
              let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, tagLen);
              let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
              let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
              let ret: boolean = compareDataBlob(message, plainText);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0200 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0300
     * @tc.desc AES-GCM 设置aad验证数据完整性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let aadLens: number[] = [8, 16, 64, 128];
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            for (let aadLen of aadLens) {
              let message: cryptoFramework.DataBlob = await createFullData(msgLen);
              let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, aadLen);
              let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
              let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
              let ret: boolean = compareDataBlob(message, plainText);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0300 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0400
     * @tc.desc AES-GCM 设置nonce测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let nonceLens: number[] = [1, 7, 8, 12, 16, 65, 128]; // 1~128
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            for (let nonceLen of nonceLens) {
              let message: cryptoFramework.DataBlob = await createFullData(msgLen);
              let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(nonceLen, 16);
              let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
              let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
              let ret: boolean = compareDataBlob(message, plainText);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0400 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0500
     * @tc.desc AES-GCM 全参数组合测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, 64);
            let cipherText: cryptoFramework.DataBlob = aeadCipherSync(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = aeadCipherSync(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
            let paramSpec2: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(16, 8, 16);
            let cipherText2: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec2);
            let plainText2: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText2, paramSpec2);
            let ret2: boolean = compareDataBlob(message, plainText2);
            expect(ret2).assertTrue();
            let paramSpec3: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 12, 128);
            let cipherText3: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec3);
            let plainText3: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText3, paramSpec3);
            let ret3: boolean = compareDataBlob(message, plainText3);
            expect(ret3).assertTrue();
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0500 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0600
     * @tc.desc AES-GCM 分段加解密测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 63;
          let blockSize: number = 20;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
            let cipherText: cryptoFramework.DataBlob = await aeadEncOrDecPromise(cipherAlg, true, symKey, blockSize, msgLen, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0600 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0700
     * @tc.desc AES-GCM Callback异步方式测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          for (let algName of ["AES128", "AES192", "AES256"]) {
            let symKey: cryptoFramework.SymKey = createSymKey(algName);
            let cipherAlg = algName + "|GCM";
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
            let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadGcm_Func_0700 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Func_0800
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Func_0800
     * @tc.desc AES-GCM 大数据量测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          let msgLen: number = 10240;
          let aadLen: number = 2050;
          let algName: string = "AES256";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, aadLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadGcm_Func_0800 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Err_0100
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Err_0100
     * @tc.desc AES-GCM tag篡改异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Err_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          cipherText.data[cipherText.data.length - 1]++;
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadGcm_Err_0100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Err_0200
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Err_0200
     * @tc.desc AES-GCM aad不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Err_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let aad1: number[] = [0x01, 0x02, 0x03, 0x04];
          let aad2: number[] = [0x01, 0x02, 0x03, 0x05];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad1),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.authenticatedData = new Uint8Array(aad2);
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadGcm_Err_0200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Err_0300
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Err_0300
     * @tc.desc AES-GCM nonce不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Err_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let iv2: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x13];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.nonce = new Uint8Array(iv2);
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadGcm_Err_0300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Err_0400
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Err_0400
     * @tc.desc AES-GCM tagLen不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Err_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "AES128";
          let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv),
            authenticatedData: new Uint8Array(aad),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.tagLen = 12;
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadGcm_Err_0400 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Err_0500
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Err_0500
     * @tc.desc AES-GCM 非法tagLen异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Err_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "AES128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let cipher = cryptoFramework.createCipher(cipherAlg);
          let illegalTagLens: number[] = [3, 5, 7, 9, 17, 20];
          for (let tagLen of illegalTagLens) {
            let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
            let aad: number[] = [0x01, 0x02, 0x03, 0x04];
            let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
              nonce: new Uint8Array(iv),
              authenticatedData: new Uint8Array(aad),
              tagLen: tagLen,
              algName: "AeadParamsSpec"
            };
            try {
              await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, aeadParamsSpec);
              expect(null).assertFail();
            } catch (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
            }
          }
        } catch (error) {
          console.error(`AeadGcm_Err_0500 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadGcm_Err_0600
     * @tc.number SUB_Security_CryptoFramework_AeadGcm_Err_0600
     * @tc.desc AES-GCM 参数缺失异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadGcm_Err_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "AES128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let cipher = cryptoFramework.createCipher(cipherAlg);
          let paramsSpec: cryptoFramework.ParamsSpec = {
            algName: "ParamsSpec"
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadGcm_Err_0600 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0100
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0100
     * @tc.desc SM4-GCM 加解密功能测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          for (let algName of ["SM4", "SM4_128"]) {
            let keyAlgName = algName;
            if (algName == "SM4") {
              keyAlgName = "SM4_128";
            }
            let symKey: cryptoFramework.SymKey = createSymKey(keyAlgName);
            let cipherAlg = algName + "|GCM";
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0100 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0200
     * @tc.desc SM4-GCM 全tagLen规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let tagLens: number[] = [4, 8, 12, 13, 14, 15, 16];
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          for (let tagLen of tagLens) {
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, tagLen);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0200 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0300
     * @tc.desc SM4-GCM 设置aad验证数据完整性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let aadLens: number[] = [8, 16, 64, 128];
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          for (let aadLen of aadLens) {
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, aadLen);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0300 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0400
     * @tc.desc SM4-GCM 设置nonce测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let nonceLens: number[] = [8, 12, 16];
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          for (let nonceLen of nonceLens) {
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(nonceLen, 16);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0400 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0500
     * @tc.desc SM4-GCM 全参数组合测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, 64);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
          let paramSpec2: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(16, 8, 16);
          let cipherText2: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec2);
          let plainText2: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText2, paramSpec2);
          let ret2: boolean = compareDataBlob(message, plainText2);
          expect(ret2).assertTrue();
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0500 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0600
     * @tc.desc SM4-GCM 分段加解密测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 60;
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = aeadCipherWithUpdateSync(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0600 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0700
     * @tc.desc SM4-GCM Callback异步方式测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadSm4Gcm_Func_0700 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0100
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0100
     * @tc.desc SM4-GCM tag篡改异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          cipherText.data[cipherText.data.length - 1]++;
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadSm4Gcm_Err_0100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0200
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0200
     * @tc.desc SM4-GCM aad不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "SM4_128";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let aad1: number[] = [0x01, 0x02, 0x03, 0x04];
          let aad2: number[] = [0x01, 0x02, 0x03, 0x05];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad1),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.authenticatedData = new Uint8Array(aad2);
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadSm4Gcm_Err_0200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0300
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0300
     * @tc.desc SM4-GCM nonce不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "SM4_128";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let iv2: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x13];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.nonce = new Uint8Array(iv2);
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadSm4Gcm_Err_0300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0400
     * @tc.number SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0400
     * @tc.desc SM4-GCM 非法tagLen异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadSm4Gcm_Err_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "SM4_128";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|GCM";
          let cipher = cryptoFramework.createCipher(cipherAlg);
          let illegalTagLens: number[] = [3, 5, 7, 9, 17, 20];
          for (let tagLen of illegalTagLens) {
            let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
            let aad: number[] = [0x01, 0x02, 0x03, 0x04];
            let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
              nonce: new Uint8Array(iv),
              authenticatedData: new Uint8Array(aad),
              tagLen: tagLen,
              algName: "AeadParamsSpec"
            };
            try {
              await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, aeadParamsSpec);
              expect(null).assertFail();
            } catch (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
            }
          }
        } catch (error) {
          console.error(`AeadSm4Gcm_Err_0400 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0100
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0100
     * @tc.desc ChaCha20-Poly1305 加解密功能测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = aeadCipherSync(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadChaCha_Func_0100 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0200
     * @tc.desc ChaCha20-Poly1305 设置aad验证数据完整性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let aadLens: number[] = [8, 16, 64, 128];
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          for (let aadLen of aadLens) {
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, aadLen);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadChaCha_Func_0200 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0300
     * @tc.desc ChaCha20-Poly1305 设置nonce测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let nonceLens: number[] = [12];
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          for (let nonceLen of nonceLens) {
            let message: cryptoFramework.DataBlob = await createFullData(msgLen);
            let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(nonceLen, 16);
            let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
            let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
            let ret: boolean = compareDataBlob(message, plainText);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`AeadChaCha_Func_0300 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0400
     * @tc.desc ChaCha20-Poly1305 全参数组合测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16, 64);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadChaCha_Func_0400 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0500
     * @tc.desc ChaCha20-Poly1305 分段加解密测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 60;
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = aeadCipherWithUpdateSync(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadChaCha_Func_0500 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0600
     * @tc.desc ChaCha20-Poly1305 Callback异步方式测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlg);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherCallback(cipher, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadChaCha_Func_0600 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Func_0700
     * @tc.desc ChaCha20-Poly1305 tagLen=16固定长度测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          let plainText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          let ret: boolean = compareDataBlob(message, plainText);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`AeadChaCha_Func_0700 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Err_0100
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Err_0100
     * @tc.desc ChaCha20-Poly1305 tag篡改异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Err_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let paramSpec: cryptoFramework.AeadParamsSpec = await genAeadParamsSpec(12, 16);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, paramSpec);
          cipherText.data[cipherText.data.length - 1]++;
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, paramSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadChaCha_Err_0100 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Err_0200
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Err_0200
     * @tc.desc ChaCha20-Poly1305 aad不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Err_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let aad1: number[] = [0x01, 0x02, 0x03, 0x04];
          let aad2: number[] = [0x01, 0x02, 0x03, 0x05];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad1),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.authenticatedData = new Uint8Array(aad2);
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadChaCha_Err_0200 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Err_0300
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Err_0300
     * @tc.desc ChaCha20-Poly1305 nonce不一致异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Err_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let msgLen: number = 20;
          let algName: string = "ChaCha20";
          let iv1: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let iv2: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x13];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04];
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv1),
            authenticatedData: new Uint8Array(aad),
            tagLen: 16,
            algName: "AeadParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let message: cryptoFramework.DataBlob = await createFullData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await aeadCipherPromise(cipherAlg, true, symKey, message, aeadParamsSpec);
          aeadParamsSpec.nonce = new Uint8Array(iv2);
          await aeadCipherPromise(cipherAlg, false, symKey, cipherText, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadChaCha_Err_0300 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Err_0400
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Err_0400
     * @tc.desc ChaCha20-Poly1305 非法tagLen异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Err_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let cipher = cryptoFramework.createCipher(cipherAlg);
          let illegalTagLens: number[] = [4, 8, 12]; // 16
          for (let tagLen of illegalTagLens) {
            let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
            let aad: number[] = [0x01, 0x02, 0x03, 0x04];
            let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
              nonce: new Uint8Array(iv),
              authenticatedData: new Uint8Array(aad),
              tagLen: tagLen,
              algName: "AeadParamsSpec"
            };
            try {
              await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, aeadParamsSpec);
              expect(null).assertFail();
            } catch (error) {
              console.error(`AeadChaCha_Err_0400 for "${error}", error code: ${error.code}`);
              expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
            }
          }
        } catch (error) {
          console.error(`AeadChaCha_Err_0400 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_AeadChaCha_Err_0500
     * @tc.number SUB_Security_CryptoFramework_AeadChaCha_Err_0500
     * @tc.desc ChaCha20-Poly1305 非法Param Name异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_AeadChaCha_Err_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let symKey: cryptoFramework.SymKey = createSymKey(algName);
          let cipherAlg = algName + "|Poly1305";
          let cipher = cryptoFramework.createCipher(cipherAlg);
          let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12];
          let aad: number[] = [0x01, 0x02, 0x03, 0x04];
          let tagLen: number = 16;
          let aeadParamsSpec: cryptoFramework.AeadParamsSpec = {
            nonce: new Uint8Array(iv),
            authenticatedData: new Uint8Array(aad),
            tagLen: tagLen,
            algName: "IvParamsSpec"
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, aeadParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`AeadChaCha_Err_0500 "${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

  })
}