/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { AES_WRAP_SPEC,
  JsAesWrapCallback,
  JsAesWrapPromise, JsAesWrapSync,
  JsConvertSymKey,
  JsGenSymKey, JsSetIv } from './utils/aesWrap/aes_wrap';
import { compareDataBlob, createFullData } from './utils/common/commonUtils';


export default function SecurityCryptoFwAesWrapTestUnit() {
  describe('SecurityCryptoFwAesWrapTestUnit', (): void => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0100
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0100
     * @tc.desc   algorithm is Aes-Wrap Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          /* 设置iv与openssl默认iv一致 */
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          /* 随机生成待加密的数据 */
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          /* 规格遍历 */
          for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
            /* 生成AES随机对称密钥 */
            let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
            let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
            /* Promise异步加密操作 */
            let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
            let cipherText: cryptoFramework.DataBlob =
              await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
            let cipherText_default: cryptoFramework.DataBlob =
              await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null, keyData);
            let ret: boolean = compareDataBlob(cipherText_default, cipherText);
            expect(ret).assertTrue();
            /* Promise异步解密操作 */
            let plainText: cryptoFramework.DataBlob =
              await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
            /* 对比前后一致性 */
            ret = compareDataBlob(plainText, keyData);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aes Wrap 0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0200
     * @tc.desc   algorithm is Aes-Wrap without IV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          /* 随机生成待加密的数据 */
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          /* 规格遍历 - 不设置IV */
          for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
            /* 生成AES随机对称密钥 */
            let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
            let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
            /* Promise异步加密操作 - 不传入IV参数 */
            let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
            let cipherText: cryptoFramework.DataBlob =
              await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null, keyData);
            /* Promise异步解密操作 - 不传入IV参数 */
            let plainText: cryptoFramework.DataBlob =
              await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, null, cipherText);
            /* 对比前后一致性 */
            let ret: boolean = compareDataBlob(plainText, keyData);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aes Wrap 0200 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0300
     * @tc.desc   algorithm is Aes-Wrap without IV with different key sizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let testKeySizes: int[] = [16, 24, 32, 40]; // 不同的密钥数据长度
          /* 设置iv与openssl默认iv不一致 */
          let iv: number[] = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08];
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv(iv);
          /* 设置IV的情况下测试不同密钥数据长度 */
          for (let keyLen of testKeySizes) {
            /* 随机生成待加密的数据 */
            let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
            /* 规格遍历 */
            for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
              /* 生成AES随机对称密钥 */
              let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
              let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
              /* Promise异步加密操作 - 不传入IV参数 */
              let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
              let cipherText: cryptoFramework.DataBlob =
                await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
              /* Promise异步解密操作 - 不传入IV参数 */
              let plainText: cryptoFramework.DataBlob =
                await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
              /* 对比前后一致性 */
              let ret: boolean = compareDataBlob(plainText, keyData);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`Aes Wrap 0300 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0400
     * @tc.desc   algorithm is Aes-Wrap Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          /* 设置iv与openssl默认iv一致 */
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          /* 随机生成待加密的数据 */
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          /* 规格遍历 */
          for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
            /* 生成AES随机对称密钥 */
            let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
            let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
            /* Sync同步加密操作 */
            let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
            let cipherText: cryptoFramework.DataBlob =
              JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
            let cipherText_default: cryptoFramework.DataBlob =
              JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null, keyData);
            let ret: boolean = compareDataBlob(cipherText_default, cipherText);
            expect(ret).assertTrue();
            /* Sync同步解密操作 */
            let plainText: cryptoFramework.DataBlob =
              JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
            /* 对比前后一致性 */
            ret = compareDataBlob(plainText, keyData);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aes Wrap 0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0500
     * @tc.desc   algorithm is Aes-Wrap without IV Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          /* 随机生成待加密的数据 */
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          /* 规格遍历 - 不设置IV */
          for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
            /* 生成AES随机对称密钥 */
            let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
            let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
            /* Sync同步加密操作 - 不传入IV参数 */
            let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
            let cipherText: cryptoFramework.DataBlob =
              JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null, keyData);
            /* Sync同步解密操作 - 不传入IV参数 */
            let plainText: cryptoFramework.DataBlob =
              JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, null, cipherText);
            /* 对比前后一致性 */
            let ret: boolean = compareDataBlob(plainText, keyData);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aes Wrap 0500 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0600
     * @tc.desc   algorithm is Aes-Wrap without IV with different key sizes Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let testKeySizes: int[] = [16, 24, 32, 40]; // 不同的密钥数据长度
          /* 设置iv与openssl默认iv不一致 */
          let iv: number[] = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08];
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv(iv);
          /* 设置IV的情况下测试不同密钥数据长度 */
          for (let keyLen of testKeySizes) {
            /* 随机生成待加密的数据 */
            let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
            /* 规格遍历 */
            for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
              /* 生成AES随机对称密钥 */
              let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
              let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
              /* Sync同步加密操作 - 不传入IV参数 */
              let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
              let cipherText: cryptoFramework.DataBlob =
                JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
              /* Sync同步解密操作 - 不传入IV参数 */
              let plainText: cryptoFramework.DataBlob =
                JsAesWrapSync(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
              /* 对比前后一致性 */
              let ret: boolean = compareDataBlob(plainText, keyData);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`Aes Wrap 0600 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0700
     * @tc.desc   algorithm is Aes-Wrap Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          /* 设置iv与openssl默认iv一致 */
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          /* 随机生成待加密的数据 */
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          /* 规格遍历 */
          for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
            /* 生成AES随机对称密钥 */
            let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
            let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
            /* Callback异步加密操作 */
            let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
            let cipherText: cryptoFramework.DataBlob =
              await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
            let cipherText_default: cryptoFramework.DataBlob =
              await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null, keyData);
            let ret: boolean = compareDataBlob(cipherText_default, cipherText);
            expect(ret).assertTrue();
            /* Callback异步解密操作 */
            let plainText: cryptoFramework.DataBlob =
              await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
            /* 对比前后一致性 */
            ret = compareDataBlob(plainText, keyData);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aes Wrap 0700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0800
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0800
     * @tc.desc   algorithm is Aes-Wrap without IV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          /* 随机生成待加密的数据 */
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          /* 规格遍历 - 不设置IV */
          for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
            /* 生成AES随机对称密钥 */
            let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
            let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
            /* Callback异步加密操作 - 不传入IV参数 */
            let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
            let cipherText: cryptoFramework.DataBlob =
              await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, null, keyData);
            /* Callback异步解密操作 - 不传入IV参数 */
            let plainText: cryptoFramework.DataBlob =
              await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, null, cipherText);
            /* 对比前后一致性 */
            let ret: boolean = compareDataBlob(plainText, keyData);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Aes Wrap 0800 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_0900
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_0900
     * @tc.desc   algorithm is Aes-Wrap without IV with different key sizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let testKeySizes: int[] = [16, 24, 32, 40]; // 不同的密钥数据长度
          /* 设置iv与openssl默认iv不一致 */
          let iv: number[] = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08];
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv(iv);
          /* 设置IV的情况下测试不同密钥数据长度 */
          for (let keyLen of testKeySizes) {
            /* 随机生成待加密的数据 */
            let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
            /* 规格遍历 */
            for (let index = 0; index < AES_WRAP_SPEC.length; index++) {
              /* 生成AES随机对称密钥 */
              let keyAlgName: string = AES_WRAP_SPEC[index].split(":")[1];
              let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
              /* Callback异步加密操作 - 不传入IV参数 */
              let cipherAlgName: string = AES_WRAP_SPEC[index].split(":")[0];
              let cipherText: cryptoFramework.DataBlob =
                await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
              /* Callback异步解密操作 - 不传入IV参数 */
              let plainText: cryptoFramework.DataBlob =
                await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
              /* 对比前后一致性 */
              let ret: boolean = compareDataBlob(plainText, keyData);
              expect(ret).assertTrue();
            }
          }
        } catch (error) {
          console.error(`Aes Wrap 0900 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1000
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1000
     * @tc.desc   algorithm is Aes-Wrap, data not a multiple of 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 17;
          let cipherAlgName: string = "AES128-WRAP";
          let keyAlgName: string = "AES128";
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aes Wrap 1000 "${error}", error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1100
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1100
     * @tc.desc   algorithm is Aes-Wrap, data len is 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 8;
          let cipherAlgName: string = "AES192-WRAP";
          let keyAlgName: string = "AES192";
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aes Wrap 1100 "${error}", error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1200
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1200
     * @tc.desc   algorithm is Aes-Wrap, cipherData len is 16, the minimum is 24 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 16;
          let cipherAlgName: string = "AES256-WRAP";
          let keyAlgName: string = "AES256";
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          await JsAesWrapCallback(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, keyData);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aes Wrap 1200 "${error}", error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1300
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1300
     * @tc.desc   algorithm is Aes-Wrap, iv len is 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let cipherAlgName: string = "AES256-WRAP";
          let keyAlgName: string = "AES256";
          let iv: number[] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09];
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv(iv);
          let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlgName);
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlgName);
          try {
            encCipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          } catch (error) {
            expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
          try {
            await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec);
          } catch (error) {
            expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        } catch (error) {
          console.error(`Aes Wrap 1300 "${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1400
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1400
     * @tc.desc   algorithm is Aes-Wrap Promise, encrypt and decrypt use different iv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let iv: number[] = [0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x09, 0x08];
          let key: number[] = [
            0x17, 0x94, 0x52, 0x19, 0x76, 0xff, 0xbe, 0x3f, 0xa9, 0xda, 0x73, 0x6c, 0xae, 0xc3, 0x02, 0x18
          ];
          let sKey: number[] = [
            0xb7, 0x8a, 0xc9, 0xec, 0xc3, 0xdc, 0xb9, 0xba, 0x31, 0xf3, 0x60, 0x29, 0x54, 0x13, 0x7c, 0x43
          ];
          let keyAlgName: string = "AES128";
          let cipherAlgName: string = "AES128-WRAP";
          let encIvParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let decIvParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv(iv);
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(key)};
          let symKey: cryptoFramework.SymKey = await JsConvertSymKey(keyAlgName, {data: new Uint8Array(sKey)});
          let cipherText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, encIvParamsSpec, keyData);
          await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, decIvParamsSpec, cipherText);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aes Wrap 1400 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1500
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1500
     * @tc.desc   algorithm is Aes-Wrap Promise、Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyLen: int = 24;
          let keyAlgName: string = "AES128";
          let cipherAlgName: string = "AES128-WRAP";
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv([0, 0, 0, 0, 0, 0, 0, 0]);
          let keyData: cryptoFramework.DataBlob = await createFullData(keyLen);
          let symKey: cryptoFramework.SymKey = await JsGenSymKey(keyAlgName);
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlgName);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          try {
            await encCipher.update(keyData);
            expect(null).assertFail();
          } catch (error) {
            expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlgName);
          await decCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec);
          try {
            await decCipher.update(keyData);
            expect(null).assertFail();
          } catch (error) {
            expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        } catch (error) {
          console.error(`Aes Wrap 1500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1600
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1600
     * @tc.desc   algorithm is Aes-Wrap Promise, AES128-WRAP 向量测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let kek: number[] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F
          ];
          let key: number[] = [
            0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF
          ];
          let encKey: number[] = [
            0x1f, 0xa6, 0x8b, 0x0a, 0x81, 0x12, 0xb4, 0x47, 0xae, 0xf3, 0x4b, 0xd8, 0xfb, 0x5a, 0x7b, 0x82,
            0x9d, 0x3e, 0x86, 0x23, 0x71, 0xd2, 0xcf, 0xe5
          ];
          let kekData: cryptoFramework.DataBlob = {data: new Uint8Array(kek)};
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(key)};
          let keyAlgName: string = "AES128";
          let symKey: cryptoFramework.SymKey = await JsConvertSymKey(keyAlgName, kekData);
          let cipherAlgName: string = "AES128-WRAP";
          let cipherText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
          let ret: boolean = compareDataBlob(cipherText, {data: new Uint8Array(encKey)});
          expect(ret).assertTrue();
          let plainText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
          ret = compareDataBlob(plainText, keyData);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Aes Wrap 1600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1700
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1700
     * @tc.desc   algorithm is Aes-Wrap Promise, AES192-WRAP 向量测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let kek: number[] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
            0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
          ];
          let key: number[] = [
            0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF
          ];
          let encKey: number[] = [
            0x96, 0x77, 0x8B, 0x25, 0xAE, 0x6C, 0xA4, 0x35, 0xF9, 0x2B, 0x5B, 0x97, 0xC0, 0x50, 0xAE, 0xD2,
            0x46, 0x8A, 0xB8, 0xA1, 0x7A, 0xD8, 0x4E, 0x5D
          ];
          let kekData: cryptoFramework.DataBlob = {data: new Uint8Array(kek)};
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(key)};
          let keyAlgName: string = "AES192";
          let symKey: cryptoFramework.SymKey = await JsConvertSymKey(keyAlgName, kekData);
          let cipherAlgName: string = "AES192-WRAP";
          let cipherText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
          let ret: boolean = compareDataBlob(cipherText, {data: new Uint8Array(encKey)});
          expect(ret).assertTrue();
          let plainText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
          ret = compareDataBlob(plainText, keyData);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Aes Wrap 1700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1800
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1800
     * @tc.desc   algorithm is Aes-Wrap Promise, AES256-WRAP 向量测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let kek: number[] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
            0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
          ];
          let key: number[] = [
            0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF
          ];
          let encKey: number[] = [
            0x64, 0xE8, 0xC3, 0xF9, 0xCE, 0x0F, 0x5B, 0xA2, 0x63, 0xE9, 0x77, 0x79, 0x05, 0x81, 0x8A, 0x2A,
            0x93, 0xC8, 0x19, 0x1E, 0x7D, 0x6E, 0x8A, 0xE7
          ];
          let kekData: cryptoFramework.DataBlob = {data: new Uint8Array(kek)};
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(key)};
          let keyAlgName: string = "AES256";
          let symKey: cryptoFramework.SymKey = await JsConvertSymKey(keyAlgName, kekData);
          let cipherAlgName: string = "AES256-WRAP";
          let cipherText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, keyData);
          let ret: boolean = compareDataBlob(cipherText, {data: new Uint8Array(encKey)});
          expect(ret).assertTrue();
          let plainText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, ivParamsSpec, cipherText);
          ret = compareDataBlob(plainText, keyData);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Aes Wrap 1800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AesWrap_Func_1900
     * @tc.number SUB_Security_CryptoFramework_AesWrap_Func_1900
     * @tc.desc   algorithm is Aes-Wrap Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_AesWrap_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let ivParamsSpec: cryptoFramework.IvParamsSpec = JsSetIv();
          let kek1: number[] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
            0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
          ];
          let key: number[] = [
            0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF
          ];
          let kek2: number[] = [
            0x64, 0xE8, 0xC3, 0xF9, 0xCE, 0x0F, 0x5B, 0xA2, 0x63, 0xE9, 0x77, 0x79, 0x05, 0x81, 0x8A, 0x2A,
            0x93, 0xC8, 0x19, 0x1E, 0x7D, 0x6E, 0x8A, 0xE7, 0x93, 0xC8, 0x19, 0x1E, 0x7D, 0x6E, 0x8A, 0xE7
          ];
          let kekData1: cryptoFramework.DataBlob = {data: new Uint8Array(kek1)};
          let kekData2: cryptoFramework.DataBlob = {data: new Uint8Array(kek2)};
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(key)};
          let keyAlgName: string = "AES256";
          let symKey1: cryptoFramework.SymKey = await JsConvertSymKey(keyAlgName, kekData1);
          let symKey2: cryptoFramework.SymKey = await JsConvertSymKey(keyAlgName, kekData2);
          let cipherAlgName: string = "AES256-WRAP";
          let cipherText: cryptoFramework.DataBlob =
            await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey1, ivParamsSpec, keyData);
          await JsAesWrapPromise(cipherAlgName, cryptoFramework.CryptoMode.DECRYPT_MODE, symKey2, ivParamsSpec, cipherText);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Aes Wrap 1900 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

  });
}