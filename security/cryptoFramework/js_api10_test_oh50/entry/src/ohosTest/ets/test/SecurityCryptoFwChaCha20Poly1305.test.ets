/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { cryptoFramework } from '@kit.CryptoArchitectureKit'
import * as commonUtils from './utils/common/commonUtils';
import { doUpdate } from './utils/chacha20/chacha20';


export default function SecurityCryptoFwChaCha20Poly1305TestUnit() {
  describe('SecurityCryptoFwChaCha20Poly1305TestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0100
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 16;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let cipherText: cryptoFramework.DataBlob = await encCipher.doFinal(message);
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0200
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = await encCipher.doFinal(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0300
     * @tc.desc   ChaCha20 with different data sizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let testSizes: number[] = [1, 8, 16, 32, 64, 128, 256, 512];
          let ivLen: number = 16;
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          for (let msgLen of testSizes) {
            /* 随机生成待加密消息 */
            let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
            /* 随机生成IV */
            let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
            /* 设置加密解密参数 */
            let ivParams: cryptoFramework.IvParamsSpec = {
              algName: "IvParamsSpec",
              iv: iv
            };
            /* 异步方式，ChaCha20消息加密 */
            let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
            let cipherText: cryptoFramework.DataBlob = await encCipher.doFinal(message);
            /* 异步方式，ChaCha20消息解密 */
            let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
            await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
            let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
            /* 比较解密后的明文是否和原消息一致 */
            let ret: boolean = commonUtils.compareDataBlob(plainText, message);
            expect(ret).assertTrue();
            console.info(`ChaCha20 ${msgLen}字节数据测试通过`);
          }
        } catch (error) {
          console.error(`ChaCha20_Func_0300 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0400
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0400
     * @tc.desc   ChaCha20 with sync mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 64;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 同步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = generate.generateSymKeySync();
          /* 同步方式，ChaCha20消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          encCipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let cipherText: cryptoFramework.DataBlob = encCipher.doFinalSync(message);
          /* 同步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          decCipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_0400 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0500
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0500
     * @tc.desc   ChaCha20 with update operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 256;
          let ivLen: number = 16;
          let chunkSize: number = 64;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 分块加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let encryptedChunks: Uint8Array[] = [];
          // 分块处理数据
          for (let i = 0; i < message.data.length; i += chunkSize) {
            let chunk = message.data.slice(i, i + chunkSize);
            let chunkBlob: cryptoFramework.DataBlob = { data: chunk };
            if (i + chunkSize < message.data.length) {
              // 不是最后一块，使用update
              let encryptedChunk: cryptoFramework.DataBlob = await encCipher.update(chunkBlob);
              if (encryptedChunk && encryptedChunk.data && encryptedChunk.data.length > 0) {
                encryptedChunks.push(encryptedChunk.data);
              }
            } else {
              // 最后一块，使用doFinal
              let finalChunk: cryptoFramework.DataBlob = await encCipher.doFinal(chunkBlob);
              if (finalChunk && finalChunk.data && finalChunk.data.length > 0) {
                encryptedChunks.push(finalChunk.data);
              }
            }
          }
          // 合并加密数据
          let totalLength = encryptedChunks.reduce((sum, chunk) => sum + chunk.length, 0);
          let cipherText = new Uint8Array(totalLength);
          let offset = 0;
          for (let chunk of encryptedChunks) {
            cipherText.set(chunk, offset);
            offset += chunk.length;
          }
          /* 解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal({ data: cipherText });
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_0500 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0600
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0600
     * @tc.desc   ChaCha20-Poly1305 with different AAD sizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 32;
          let ivLen: number = 12;
          let aadSizes: number[] = [0, 1, 8, 16, 32, 64];
          let authTagLen: number = 16;
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          for (let aadLen of aadSizes) {
            /* 随机生成待加密消息 */
            let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
            /* 随机生成IV */
            let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
            /* 生成不同长度的AAD */
            let aad: cryptoFramework.DataBlob;
            if (aadLen > 0) {
              aad = await commonUtils.createFullData(aadLen);
            } else {
              aad = { data: new Uint8Array(0) };
            }
            /* 设置authTag */
            let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
            /* 设置加密解密参数 */
            let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
              algName: "Poly1305ParamsSpec",
              iv: iv,
              aad: aad,
              authTag: authTag
            };
            /* 异步方式，ChaCha20-Poly1305消息加密 */
            let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
            let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
            /* 设置解密的authTag */
            poly1305Params.authTag = await encCipher.doFinal(null);
            /* 异步方式，ChaCha20-Poly1305消息解密 */
            let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
            await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
            let plainText: cryptoFramework.DataBlob = await decCipher.update(cipherText);
            /* 比较解密后的明文是否和原消息一致 */
            let ret: boolean = commonUtils.compareDataBlob(plainText, message);
            expect(ret).assertTrue();
            console.info(`ChaCha20-Poly1305 AAD长度${aadLen}字节测试通过`);
          }
        } catch (error) {
          console.error(`ChaCha20_Func_0600 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0700
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0700
     * @tc.desc   ChaCha20-Poly1305 with sync mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 48;
          let ivLen: number = 12;
          let aadLen: number = 16;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 同步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = generate.generateSymKeySync();
          /* 同步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          encCipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = encCipher.updateSync(message);
          /* 设置解密的authTag */
          poly1305Params.authTag = encCipher.doFinalSync(null);
          /* 同步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          decCipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = decCipher.updateSync(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_0700 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0800
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0800
     * @tc.desc   ChaCha20 with callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 32;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* Callback模式，ChaCha20消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams, (err) => {
            if (err) {
              console.error(`加密初始化失败: ${err}`);
              expect(null).assertFail();
              done();
              return;
            }
            encCipher.doFinal(message, (err, cipherText) => {
              if (err) {
                console.error(`加密失败: ${err}`);
                expect(null).assertFail();
                done();
                return;
              }
              /* Callback模式，ChaCha20消息解密 */
              let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
              decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams, (err) => {
                if (err) {
                  console.error(`解密初始化失败: ${err}`);
                  expect(null).assertFail();
                  done();
                  return;
                }
                decCipher.doFinal(cipherText, (err, plainText) => {
                  if (err) {
                    console.error(`解密失败: ${err}`);
                    expect(null).assertFail();
                    done();
                    return;
                  }
                  /* 比较解密后的明文是否和原消息一致 */
                  let ret: boolean = commonUtils.compareDataBlob(plainText, message);
                  expect(ret).assertTrue();
                  done();
                });
              });
            });
          });
        } catch (error) {
          console.error(`ChaCha20_Func_0800 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_0900
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_0900
     * @tc.desc   ChaCha20 performance test
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_0900",
      TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let testSizes: number[] = [1024, 4096, 16384]; // 1KB, 4KB, 16KB
          let iterations: number = 10;
          let ivLen: number = 16;
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          for (let msgLen of testSizes) {
            let totalTime = 0;
            for (let i = 0; i < iterations; i++) {
              /* 随机生成待加密消息 */
              let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
              /* 随机生成IV */
              let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
              /* 设置加密解密参数 */
              let ivParams: cryptoFramework.IvParamsSpec = {
                algName: "IvParamsSpec",
                iv: iv
              };
              /* 异步方式，ChaCha20消息加密 */
              let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
              await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
              let cipherText: cryptoFramework.DataBlob = await encCipher.doFinal(message);
              /* 异步方式，ChaCha20消息解密 */
              let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
              await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
              let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
              /* 验证正确性 */
              let ret: boolean = commonUtils.compareDataBlob(plainText, message);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`ChaCha20_Func_0900 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1000
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1000
     * @tc.desc   ChaCha20-Poly1305 error handling test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 32;
          let ivLen: number = 12;
          let aadLen: number = 16;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 正常加密获取正确的authTag */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
          let correctAuthTag: cryptoFramework.DataBlob = await encCipher.doFinal(null);
          /* 测试1: 使用错误的authTag解密 */
          try {
            let wrongAuthTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
            poly1305Params.authTag = wrongAuthTag;
            let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
            await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
            await decCipher.doFinal(cipherText);
            expect(null).assertFail();
          } catch (error) {
            expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
          /* 测试2: 使用错误的AAD解密 */
          try {
            let wrongAad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
            poly1305Params.aad = wrongAad;
            poly1305Params.authTag = correctAuthTag; // 使用正确的authTag但错误的AAD
            let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
            await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
            let plainText: cryptoFramework.DataBlob = await decCipher.update(cipherText);
            let ret: boolean = commonUtils.compareDataBlob(plainText, message);
            expect(ret).assertTrue();
          } catch (error) {
            expect(null).assertFail();
          }
          /* 测试3: 正常解密验证 */
          poly1305Params.aad = aad; // 恢复正确的AAD
          poly1305Params.authTag = correctAuthTag; // 使用正确的authTag
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = await decCipher.update(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1000 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1100
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1100
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let keyLen: number = 32;
          /* 随机生成32字节的随机数用于生成对称密钥 */
          let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(keyLen);
          /* Promise异步方式，通过convert创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.convertKey(dataBlob);
          /* 获取对密钥钥对象中的密钥数据 */
          let keyBlob: cryptoFramework.DataBlob = symKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(keyBlob, dataBlob);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1200
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1200
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let keyLen: number = 32;
          /* 随机生成32字节的随机数用于生成对称密钥 */
          let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(keyLen);
          /* 同步方式，通过convert创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = generate.convertKeySync(dataBlob);
          /* 获取对密钥钥对象中的密钥数据 */
          let keyBlob: cryptoFramework.DataBlob = symKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(keyBlob, dataBlob);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1300
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1300
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let keyLen: number = 32;
          /* 随机生成32字节的随机数用于生成对称密钥 */
          let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(keyLen);
          /* CallBack异步方式，通过convert创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          generate.convertKey(dataBlob,(err, key) => {
            if(err) {
              expect(null).assertFail();
            } else {
              console.log("################# 0");
              /* 获取对密钥钥对象中的密钥数据 */
              let keyBlob: cryptoFramework.DataBlob = key.getEncoded();
              let ret: boolean = commonUtils.compareDataBlob(keyBlob, dataBlob);
              expect(ret).assertTrue();
            }
          });
        } catch (error) {
          console.error(`ChaCha20_Func_1300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1400
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1400
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 135;
          let blockSize: number = 20;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20消息分段加密 */
          let cipherText = new Uint8Array();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          for(let dataSize = 0; dataSize < msgLen / blockSize; dataSize++) {
            let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
            let tmpText: cryptoFramework.DataBlob = { data:tmp };
            let encryptCipher: cryptoFramework.DataBlob = await encCipher.update(tmpText);
            let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
            mergeText.set(cipherText);
            mergeText.set(encryptCipher.data, cipherText.length);
            cipherText = mergeText;
          }
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal({data: new Uint8Array(cipherText)});
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1500
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1500
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 135;
          let blockSize: number = 20;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息分段加密 */
          let cipherText = new Uint8Array();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          for(let dataSize = 0; dataSize < msgLen / blockSize; dataSize++) {
            let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
            let tmpText: cryptoFramework.DataBlob = { data:tmp };
            let encryptCipher: cryptoFramework.DataBlob = await encCipher.update(tmpText);
            let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
            mergeText.set(cipherText);
            mergeText.set(encryptCipher.data, cipherText.length);
            cipherText = mergeText;
          }
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = await encCipher.doFinal(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal({data: new Uint8Array(cipherText)});
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });


    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1600
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1600
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 135;
          let blockSize: number = 20;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20消息分段加密 */
          let cipherText = new Uint8Array();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          for(let dataSize = 0; dataSize < msgLen / blockSize; dataSize++) {
            let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
            let tmpText: cryptoFramework.DataBlob = { data:tmp };
            let encryptCipher: cryptoFramework.DataBlob = encCipher.updateSync(tmpText);
            let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
            mergeText.set(cipherText);
            mergeText.set(encryptCipher.data, cipherText.length);
            cipherText = mergeText;
          }
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync({data: new Uint8Array(cipherText)});
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1700
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1700
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 135;
          let blockSize: number = 20;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息分段加密 */
          let cipherText = new Uint8Array();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          for(let dataSize = 0; dataSize < msgLen / blockSize; dataSize++) {
            let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
            let tmpText: cryptoFramework.DataBlob = { data:tmp };
            let encryptCipher: cryptoFramework.DataBlob = encCipher.updateSync(tmpText);
            let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
            mergeText.set(cipherText);
            mergeText.set(encryptCipher.data, cipherText.length);
            cipherText = mergeText;
          }
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = encCipher.doFinalSync(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync({data: new Uint8Array(cipherText)});
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1800
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1800
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 135;
          let blockSize: number = 20;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20消息分段加密 */
          let cipherText = new Uint8Array();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          for(let dataSize = 0; dataSize < msgLen / blockSize; dataSize++) {
            let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
            let tmpText: cryptoFramework.DataBlob = { data:tmp };
            let encryptCipher: cryptoFramework.DataBlob = await doUpdate(encCipher, tmpText);
            let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
            mergeText.set(cipherText);
            mergeText.set(encryptCipher.data, cipherText.length);
            cipherText = mergeText;
          }
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync({data: new Uint8Array(cipherText)});
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_1900
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_1900
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 135;
          let blockSize: number = 20;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息分段加密 */
          let cipherText = new Uint8Array();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          for(let dataSize = 0; dataSize < msgLen / blockSize; dataSize++) {
            let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
            let tmpText: cryptoFramework.DataBlob = { data:tmp };
            let encryptCipher: cryptoFramework.DataBlob = await doUpdate(encCipher, tmpText);
            let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
            mergeText.set(cipherText);
            mergeText.set(encryptCipher.data, cipherText.length);
            cipherText = mergeText;
          }
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = encCipher.doFinalSync(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync({data: new Uint8Array(cipherText)});
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_1900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2000
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2000
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 16;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let cipherText: cryptoFramework.DataBlob = encCipher.doFinalSync(message);
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_2000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2100
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2100
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = encCipher.updateSync(message);
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = encCipher.doFinalSync(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_2100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2200
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2200
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let msgLen: number = 16;
          let ivLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let cipherText: cryptoFramework.DataBlob = await encCipher.doFinal(message);
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_2200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2300
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2300
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = await encCipher.doFinal(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = decCipher.doFinalSync(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_2300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2400
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2400
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          let cipherTexts: Array<cryptoFramework.DataBlob> = [];
          let aadArrayLen: number[] = [0, 1, 8, 11, 16, 33];
          for (let index = 0; index < aadArrayLen.length; index++) {
            /* 随机生成AAD */
            let aad: cryptoFramework.DataBlob =
              aadArrayLen[index] !== 0 ? await commonUtils.createFullData(aadArrayLen[index]) : {data: new Uint8Array(0)};
            /* 设置aad */
            poly1305Params.aad = aad;
            /* 异步方式，ChaCha20-Poly1305消息加密 */
            let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
            let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
            cipherTexts.push(cipherText);
            /* 设置解密的authTag */
            let auth: cryptoFramework.DataBlob = await encCipher.doFinal(null);
            poly1305Params.authTag = auth;
            /* 异步方式，ChaCha20-Poly1305消息解密 */
            let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
            await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
            let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
            /* 比较解密后的明文是否和原消息一致 */
            let ret: boolean = commonUtils.compareDataBlob(plainText, message);
            expect(ret).assertTrue();
          }
          let ret: boolean = true;
          for (let index = 1; index < cipherTexts.length; index++) {
            ret = ret && commonUtils.compareDataBlob(cipherTexts[index-1], cipherTexts[index]);
          }
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_2400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2500
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2500
     * @tc.desc   ChaCha20-Poly1305 & ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let ivLen_Gt: number = 13;
          let ivLen_Lt: number = 11;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成IV */
          let iv_gt: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen_Gt);
          let iv_lt: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen_Lt);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv_gt,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          try {
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          } catch (error) {
            expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          try {
            poly1305Params.iv = iv_lt;
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          } catch (error) {
            expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
        } catch (error) {
          console.error(`ChaCha20_Func_2500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2600
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2600
     * @tc.desc   ChaCha20-Poly1305 & ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let ivLen_Gt: number = 17;
          let ivLen_Lt: number = 15;
          /* 随机生成IV */
          let iv_gt: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen_Gt);
          let iv_lt: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen_Lt);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: iv_gt,
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          try {
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          } catch (error) {
            expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
          try {
            poly1305Params.iv = iv_lt;
            await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          } catch (error) {
            expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
          }
        } catch (error) {
          console.error(`ChaCha20_Func_2600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2700
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2700
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = await encCipher.doFinal(null);
          /* 篡改authTag */
          auth.data[0]++;
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          await decCipher.doFinal(cipherText);
          expect(null).assertFail();
        } catch (error) {
          console.error(`ChaCha20_Func_2700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2800
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2800
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 异步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update(message);
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = await encCipher.doFinal(null);
          /* 篡改authTag */
          let authText = new Uint8Array();
          let mergeText = new Uint8Array(authText.length + auth.data.length + 1);
          mergeText.set(authText);
          mergeText.set(auth.data, authText.length);
          mergeText.set(new Uint8Array([0x10]), auth.data.length);
          authText = mergeText;
          poly1305Params.authTag = {data: authText};
          console.log("################## len:" + poly1305Params.authTag.data.length);
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          await decCipher.doFinal(cipherText);
          expect(null).assertFail();
        } catch (error) {
          console.error(`ChaCha20_Func_2800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_2900
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_2900
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let expectAlgName: string = "ChaCha20";
          let algName: string = "ChaCha20|CBC";
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          expect(encCipher.algName.split("|")[0]).assertEqual(expectAlgName);
        } catch (error) {
          console.error(`ChaCha20_Func_2900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_3000
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_3000
     * @tc.desc   ChaCha20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          /* 同步方式，通过convert创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          try {
            let keyLen: number = 31;
            /* 随机生成31字节的随机数用于生成对称密钥 */
            let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(keyLen);
            generate.convertKeySync(dataBlob);
            expect(null).assertFail();
          } catch (error) {
            console.error(`convertKeySync “${error}“, error code: ${error.code}`);
            expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
          try {
            let keyLen: number = 33;
            /* 随机生成33字节的随机数用于生成对称密钥 */
            let dataBlob: cryptoFramework.DataBlob = await commonUtils.createFullData(keyLen);
            await generate.convertKey(dataBlob);
            expect(null).assertFail();
          } catch (error) {
            console.error(`convertKeySync “${error}“, error code: ${error.code}`);
            expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        } catch (error) {
          console.error(`ChaCha20_Func_3000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_3100
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_3100
     * @tc.desc   ChaCha20 向量测试，来源RFC5739
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let keyData: number[] = [
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          ];
          let ivData: number[] = [
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          ];
          let plainData: number[] = [
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          ];
          let expectCipherText: number[] = [
            0x76, 0xb8, 0xe0, 0xad, 0xa0, 0xf1, 0x3d, 0x90, 0x40, 0x5d, 0x6a, 0xe5, 0x53, 0x86, 0xbd, 0x28,
            0xbd, 0xd2, 0x19, 0xb8, 0xa0, 0x8d, 0xed, 0x1a, 0xa8, 0x36, 0xef, 0xcc, 0x8b, 0x77, 0x0d, 0xc7,
            0xda, 0x41, 0x59, 0x7c, 0x51, 0x57, 0x48, 0x8d, 0x77, 0x24, 0xe0, 0x3f, 0xb8, 0xd8, 0x4a, 0x37,
            0x6a, 0x43, 0xb8, 0xf4, 0x15, 0x18, 0xa1, 0x1c, 0xc3, 0x87, 0xb6, 0x69, 0xb2, 0xee, 0x65, 0x86
          ];
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: {data: new Uint8Array(ivData)}
          };
          /* 异步方式，通过convertKey创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.convertKey({data:new Uint8Array(keyData)});
          /* 异步方式，ChaCha20消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let cipherText: cryptoFramework.DataBlob = await encCipher.doFinal({data:new Uint8Array(plainData)});
          let ret: boolean = commonUtils.compareDataBlob({data:new Uint8Array(expectCipherText)}, cipherText);
          expect(ret).assertTrue();
          /* 异步方式，ChaCha20消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParams);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          ret = commonUtils.compareDataBlob(plainText, {data:new Uint8Array(plainData)});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_3100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_3200
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_3200
     * @tc.desc   ChaCha20 向量测试，来源RFC5739
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let keyData: number[] = [
            0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f,
            0x90, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f
          ];
          let ivData: number[] = [
            0x07, 0x00, 0x00, 0x00, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47
          ];
          let ivData2: number[] = [
            0x07, 0x00, 0x00, 0x00, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x00, 0x00, 0x00, 0x01
          ];
          let aadData: number[] = [
            0x50, 0x51, 0x52, 0x53, 0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7
          ];
          let authTagData: number[] = [
            0x1a, 0xe1, 0x0b, 0x59, 0x4f, 0x09, 0xe2, 0x6a, 0x7e, 0x90, 0x2e, 0xcb, 0xd0, 0x60, 0x06, 0x91
          ];
          let plainData: number[] = [
            0x4c, 0x61, 0x64, 0x69, 0x65, 0x73, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x47, 0x65, 0x6e, 0x74, 0x6c,
            0x65, 0x6d, 0x65, 0x6e, 0x20, 0x6f, 0x66, 0x20, 0x74, 0x68, 0x65, 0x20, 0x63, 0x6c, 0x61, 0x73,
            0x73, 0x20, 0x6f, 0x66, 0x20, 0x27, 0x39, 0x39, 0x3a, 0x20, 0x49, 0x66, 0x20, 0x49, 0x20, 0x63,
            0x6f, 0x75, 0x6c, 0x64, 0x20, 0x6f, 0x66, 0x66, 0x65, 0x72, 0x20, 0x79, 0x6f, 0x75, 0x20, 0x6f,
            0x6e, 0x6c, 0x79, 0x20, 0x6f, 0x6e, 0x65, 0x20, 0x74, 0x69, 0x70, 0x20, 0x66, 0x6f, 0x72, 0x20,
            0x74, 0x68, 0x65, 0x20, 0x66, 0x75, 0x74, 0x75, 0x72, 0x65, 0x2c, 0x20, 0x73, 0x75, 0x6e, 0x73,
            0x63, 0x72, 0x65, 0x65, 0x6e, 0x20, 0x77, 0x6f, 0x75, 0x6c, 0x64, 0x20, 0x62, 0x65, 0x20, 0x69,
            0x74, 0x2e
          ];
          let expectCipherText: number[] = [
            0xd3, 0x1a, 0x8d, 0x34, 0x64, 0x8e, 0x60, 0xdb, 0x7b, 0x86, 0xaf, 0xbc, 0x53, 0xef, 0x7e, 0xc2,
            0xa4, 0xad, 0xed, 0x51, 0x29, 0x6e, 0x08, 0xfe, 0xa9, 0xe2, 0xb5, 0xa7, 0x36, 0xee, 0x62, 0xd6,
            0x3d, 0xbe, 0xa4, 0x5e, 0x8c, 0xa9, 0x67, 0x12, 0x82, 0xfa, 0xfb, 0x69, 0xda, 0x92, 0x72, 0x8b,
            0x1a, 0x71, 0xde, 0x0a, 0x9e, 0x06, 0x0b, 0x29, 0x05, 0xd6, 0xa5, 0xb6, 0x7e, 0xcd, 0x3b, 0x36,
            0x92, 0xdd, 0xbd, 0x7f, 0x2d, 0x77, 0x8b, 0x8c, 0x98, 0x03, 0xae, 0xe3, 0x28, 0x09, 0x1b, 0x58,
            0xfa, 0xb3, 0x24, 0xe4, 0xfa, 0xd6, 0x75, 0x94, 0x55, 0x85, 0x80, 0x8b, 0x48, 0x31, 0xd7, 0xbc,
            0x3f, 0xf4, 0xde, 0xf0, 0x8e, 0x4b, 0x7a, 0x9d, 0xe5, 0x76, 0xd2, 0x65, 0x86, 0xce, 0xc6, 0x4b,
            0x61, 0x16
          ];
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: {data: new Uint8Array(ivData)},
            aad: {data: new Uint8Array(aadData)},
            authTag: {data: new Uint8Array(authTagData)},
          };
          /* 异步方式，通过convertKey创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.convertKey({data:new Uint8Array(keyData)});
          /* 异步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update({data:new Uint8Array(plainData)});
          /* 设置加密解密参数 */
          let ivParams: cryptoFramework.IvParamsSpec = {
            algName: "IvParamsSpec",
            iv: {data: new Uint8Array(ivData2)}
          };
          let encCipher1: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
          await encCipher1.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParams);
          let cipherText2: cryptoFramework.DataBlob = await encCipher1.update({data:new Uint8Array(plainData)});
          let ret: boolean = commonUtils.compareDataBlob({data:new Uint8Array(expectCipherText)}, cipherText);
          expect(ret).assertTrue();
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          poly1305Params.authTag = {data:new Uint8Array(authTagData)};
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          ret = commonUtils.compareDataBlob(plainText, {data:new Uint8Array(plainData)});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_3200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ChaCha20_Func_3300
     * @tc.number SUB_Security_CryptoFramework_ChaCha20_Func_3300
     * @tc.desc   ChaCha20-Poly1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ChaCha20_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let algName: string = "ChaCha20";
          let cipherName: string = "ChaCha20|Poly1305";
          let msgLen: number = 16;
          let ivLen: number = 12;
          let aadLen: number = 10;
          let authTagLen: number = 16;
          /* 随机生成待加密消息 */
          let message: cryptoFramework.DataBlob = await commonUtils.createFullData(msgLen);
          /* 随机生成IV */
          let iv: cryptoFramework.DataBlob = await commonUtils.createFullData(ivLen);
          /* 随机生成AAD */
          let aad: cryptoFramework.DataBlob = await commonUtils.createFullData(aadLen);
          /* 设置authTag */
          let authTag: cryptoFramework.DataBlob = await commonUtils.createFullData(authTagLen);
          /* 设置加密解密参数 */
          let poly1305Params: cryptoFramework.Poly1305ParamsSpec = {
            algName: "Poly1305ParamsSpec",
            iv: iv,
            aad: aad,
            authTag: authTag
          };
          /* 异步方式，通过generate创建ChaCha20的秘钥 */
          let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
          let symKey: cryptoFramework.SymKey = await generate.generateSymKey();
          /* 同步方式，ChaCha20-Poly1305消息加密 */
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305Params);
          let cipherText: cryptoFramework.DataBlob = encCipher.updateSync(message);
          /* 设置解密的authTag */
          let auth: cryptoFramework.DataBlob = encCipher.doFinalSync(null);
          poly1305Params.authTag = auth;
          /* 异步方式，ChaCha20-Poly1305消息解密 */
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, poly1305Params);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          /* 比较解密后的明文是否和原消息一致 */
          let ret: boolean = commonUtils.compareDataBlob(plainText, message);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`ChaCha20_Func_3300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}