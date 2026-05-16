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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { ASY_ALGORITHM_NAMES_1,
  ASY_ALGORITHM_NAMES_2,
  ASY_ALGORITHM_NAMES_3,
  ASY_ALGORITHM_NAMES_4,
  ASY_ALGORITHM_NAMES_5,
  KeyLenMap, SYM_ALGORITHM_NAMES } from './utils/common/commonUtils';
import { createAsyKeySync } from './utils/syncAsyKey/syncAsyKeyUtils';
import { RSA_1010_PRIVATE_KEY, RSA_1010_PUBLIC_KEY } from './utils/rsa/rsaEncodeDecodeWithPasswdUtils';


export default function SecurityCryptoFwKeyLenTestUnit() {
  describe('SecurityCryptoFwKeyLenTestUnit', (): void => {

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0100
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0100
     * @tc.desc 对称算法密钥长度规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let map: KeyLenMap = new KeyLenMap();
          for (let index = 0; index < SYM_ALGORITHM_NAMES.length; index++) {
            let generator: cryptoFramework.SymKeyGenerator =
              cryptoFramework.createSymKeyGenerator(SYM_ALGORITHM_NAMES[index]);
            let symKey: cryptoFramework.SymKey = await generator.generateSymKey();
            let keyLen: int = symKey.getKeySize();
            expect(keyLen).assertEqual(map.getKeyLen(SYM_ALGORITHM_NAMES[index]));
          }
        } catch (error) {
          console.error(`KeyLen_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0200
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0200
     * @tc.desc 非对称算法密钥长度规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let map: KeyLenMap = new KeyLenMap();
          for (let index = 0; index < ASY_ALGORITHM_NAMES_1.length; index++) {
            let keyPair: cryptoFramework.KeyPair = await createAsyKeySync(ASY_ALGORITHM_NAMES_1[index]);
            let pubKeyLen: int = keyPair.pubKey.getKeySize();
            let priKeyLen: int = keyPair.priKey.getKeySize();
            expect(pubKeyLen).assertEqual(priKeyLen);
            expect(priKeyLen).assertEqual(map.getKeyLen(ASY_ALGORITHM_NAMES_1[index]));
          }
        } catch (error) {
          console.error(`KeyLen_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0300
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0300
     * @tc.desc 非对称算法密钥长度规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let map: KeyLenMap = new KeyLenMap();
          for (let index = 0; index < ASY_ALGORITHM_NAMES_2.length; index++) {
            let keyPair: cryptoFramework.KeyPair = await createAsyKeySync(ASY_ALGORITHM_NAMES_2[index]);
            let pubKeyLen: int = keyPair.pubKey.getKeySize();
            let priKeyLen: int = keyPair.priKey.getKeySize();
            expect(pubKeyLen).assertEqual(priKeyLen);
            expect(priKeyLen).assertEqual(map.getKeyLen(ASY_ALGORITHM_NAMES_2[index]));
          }
        } catch (error) {
          console.error(`KeyLen_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0400
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0400
     * @tc.desc 非对称算法密钥长度规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let map: KeyLenMap = new KeyLenMap();
          for (let index = 0; index < ASY_ALGORITHM_NAMES_3.length; index++) {
            let keyPair: cryptoFramework.KeyPair = await createAsyKeySync(ASY_ALGORITHM_NAMES_3[index]);
            let pubKeyLen: int = keyPair.pubKey.getKeySize();
            let priKeyLen: int = keyPair.priKey.getKeySize();
            expect(pubKeyLen).assertEqual(priKeyLen);
            expect(priKeyLen).assertEqual(map.getKeyLen(ASY_ALGORITHM_NAMES_3[index]));
          }
        } catch (error) {
          console.error(`KeyLen_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0500
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0500
     * @tc.desc 非对称算法密钥长度规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let map: KeyLenMap = new KeyLenMap();
          for (let index = 0; index < ASY_ALGORITHM_NAMES_4.length; index++) {
            let keyPair: cryptoFramework.KeyPair = await createAsyKeySync(ASY_ALGORITHM_NAMES_4[index]);
            let pubKeyLen: int = keyPair.pubKey.getKeySize();
            let priKeyLen: int = keyPair.priKey.getKeySize();
            expect(pubKeyLen).assertEqual(priKeyLen);
            expect(priKeyLen).assertEqual(map.getKeyLen(ASY_ALGORITHM_NAMES_4[index]));
          }
        } catch (error) {
          console.error(`KeyLen_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0600
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0600
     * @tc.desc 非对称算法密钥长度规格遍历测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let map: KeyLenMap = new KeyLenMap();
          for (let index = 0; index < ASY_ALGORITHM_NAMES_5.length; index++) {
            let keyPair: cryptoFramework.KeyPair = await createAsyKeySync(ASY_ALGORITHM_NAMES_5[index]);
            let pubKeyLen: int = keyPair.pubKey.getKeySize();
            let priKeyLen: int = keyPair.priKey.getKeySize();
            expect(pubKeyLen).assertEqual(priKeyLen);
            expect(priKeyLen).assertEqual(map.getKeyLen(ASY_ALGORITHM_NAMES_5[index]));
          }
        } catch (error) {
          console.error(`KeyLen_Func_0600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0700
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0700
     * @tc.desc HMAC生成对称算法密钥长度测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let keyData: number[] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x00
          ];
          let generator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("HMAC");
          let symKey: cryptoFramework.SymKey = generator.convertKeySync({data: new Uint8Array(keyData)});
          let keyLen: int = symKey.getKeySize();
          expect(keyLen).assertEqual(keyData.length * 8);
        } catch (error) {
          console.error(`KeyLen_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_KeyLen_Func_0800
     * @tc.number SUB_Security_CryptoFramework_KeyLen_Func_0800
     * @tc.desc 生成非规格的非对称算法RSA密钥长度测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_KeyLen_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA512");
          let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(RSA_1010_PUBLIC_KEY, RSA_1010_PRIVATE_KEY);
          let priKeyLen: int = keyPair.priKey.getKeySize();
          let pubKeyLen: int = keyPair.pubKey.getKeySize();
          expect(priKeyLen).assertEqual(pubKeyLen);
          expect(priKeyLen).assertEqual(1010); // 改场景的RSA的密钥长度是1010bits
        } catch (error) {
          console.error(`KeyLen_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}