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
import { rsa_pri_pkcs1, rsa_pri_pkcs8, rsa_pub_pkcs1, rsa_pub_x509 } from './utils/rsa/rsaEncodeDecodeWithPasswdUtils';
import { compareDataBlob } from './utils/common/commonUtils';


export default function SecurityCryptoFwRsaPkcs1TestUnit() {
  describe('SecurityCryptoFwRsaPkcs1TestUnit', (): void => {

    /**
     * @tc.name SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0100
     * @tc.desc pkcs1格式DER编码的RSA公私钥能够解码成RSA密钥对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA3072");
          let keyPair: cryptoFramework.KeyPair = await generator.convertKey(
            {data: new Uint8Array(rsa_pub_pkcs1)},
            {data: new Uint8Array(rsa_pri_pkcs1)}
          );
          let pubBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("PKCS1");
          let priBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS1");
          let iRet: boolean = compareDataBlob(pubBlob, {data: new Uint8Array(rsa_pub_pkcs1)});
          expect(iRet).assertTrue();
          iRet = compareDataBlob(priBlob, {data: new Uint8Array(rsa_pri_pkcs1)});
          expect(iRet).assertTrue();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA3072|PKCS1|SHA256");
          await sign.init(keyPair.priKey);
          let signData: cryptoFramework.DataBlob = await sign.sign(pubBlob);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA3072|PKCS1|SHA256");
          verify.initSync(keyPair.pubKey);
          iRet = verify.verifySync(pubBlob, signData);
          expect(iRet).assertTrue();
        } catch (error) {
          console.error(`Rsa_Pkcs1_Func_0100 1.2 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0200
     * @tc.desc pkcs1格式DER编码的RSA私钥能够解码成RSA密钥对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA3072");
          let keyPair: cryptoFramework.KeyPair = await generator.convertKey(
            null,
            {data: new Uint8Array(rsa_pri_pkcs1)}
          );
          let priBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS1");
          let iRet: boolean = compareDataBlob(priBlob, {data: new Uint8Array(rsa_pri_pkcs1)});
          expect(iRet).assertTrue();
        } catch (error) {
          console.error(`Rsa_Pkcs1_Func_0200 1.2 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0300
     * @tc.desc pkcs1格式DER编码的RSA公钥能够解码成RSA密钥对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA3072");
          let keyPair: cryptoFramework.KeyPair = await generator.convertKey(
            {data: new Uint8Array(rsa_pub_pkcs1)},
            null
          );
          let pubBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("PKCS1");
          let iRet: boolean = compareDataBlob(pubBlob, {data: new Uint8Array(rsa_pub_pkcs1)});
          expect(iRet).assertTrue();
        } catch (error) {
          console.error(`Rsa_Pkcs1_Func_0300 1.2 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0400
     * @tc.desc RSA公钥编码非规格的format异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA3072");
          let keyPair: cryptoFramework.KeyPair = await generator.convertKey(
            {data: new Uint8Array(rsa_pub_pkcs1)},
            null
          );
          keyPair.pubKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`Rsa_Pkcs1_Func_0400 1.2 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0500
     * @tc.desc RSA私钥编码非规格的format异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA3072");
          let keyPair: cryptoFramework.KeyPair = await generator.convertKey(
            null,
            {data: new Uint8Array(rsa_pri_pkcs1)},
          );
          keyPair.priKey.getEncodedDer("X509");
          expect(null).assertFail();
        } catch (error) {
          console.error(`Rsa_Pkcs1_Func_0500 1.2 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0600
     * @tc.desc pkcs8、x509格式DER编码的RSA公私钥能够解码成RSA密钥对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_Rsa_Pkcs1_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA3072");
          let keyPair: cryptoFramework.KeyPair = await generator.convertKey(
            {data: new Uint8Array(rsa_pub_x509)},
            {data: new Uint8Array(rsa_pri_pkcs8)}
          );
          let pubBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("PKCS1");
          let priBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS1");
          let iRet: boolean = compareDataBlob(pubBlob, {data: new Uint8Array(rsa_pub_pkcs1)});
          expect(iRet).assertTrue();
          iRet = compareDataBlob(priBlob, {data: new Uint8Array(rsa_pri_pkcs1)});
          expect(iRet).assertTrue();
          let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA3072|PKCS1|SHA256");
          await sign.init(keyPair.priKey);
          let signData: cryptoFramework.DataBlob = await sign.sign(pubBlob);
          let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA3072|PKCS1|SHA256");
          verify.initSync(keyPair.pubKey);
          iRet = verify.verifySync(pubBlob, signData);
          expect(iRet).assertTrue();
        } catch (error) {
          console.error(`Rsa_Pkcs1_Func_0600 1.2 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });
  });
}