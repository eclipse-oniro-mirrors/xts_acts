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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { compareUint8Array } from './utils/common/commonUtils';


export default function SecurityCryptoFwMLKeyEncodeTestUnit() {
  describe('SecurityCryptoFwMLKeyEncodeTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Encoding_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Encoding_Func_0100
     * @tc.desc   ML-KEM DER and PEM encoding format test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Encoding_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyDer: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("X509");
        expect(pubKeyDer.data.length).assertEqual(1206); // 公钥DER编码1184字节+SPKI开销
        let priKeyDer: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS8");
        expect(priKeyDer.data.length).assertEqual(2498); // 私钥DER编码2400字节+PKCS8开销
        let pubKeyPem: string = keyPair.pubKey.getEncodedPem("X509");
        expect(pubKeyPem.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
        let priKeyPem: string = keyPair.priKey.getEncodedPem("PKCS8");
        expect(priKeyPem.indexOf("BEGIN PRIVATE KEY") >= 0).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Encoding_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_Encoding_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_Encoding_Func_0100
     * @tc.desc   ML-DSA DER and PEM encoding format test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_Encoding_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyDer: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("X509");
        expect(pubKeyDer.data.length).assertEqual(1974); // 公钥DER编码1952字节+SPKI开销
        let priKeyDer: cryptoFramework.DataBlob = keyPair.priKey.getEncodedDer("PKCS8");
        expect(priKeyDer.data.length).assertEqual(4098); // 私钥DER编码4032字节+PKCS8开销
        let pubKeyPem: string = keyPair.pubKey.getEncodedPem("X509");
        expect(pubKeyPem.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
        let priKeyPem: string = keyPair.priKey.getEncodedPem("PKCS8");
        expect(priKeyPem.indexOf("BEGIN PRIVATE KEY") >= 0).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_DSA_Encoding_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Key_Interface_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Key_Interface_Func_0100
     * @tc.desc   Key interface common method test (getEncoded/getKeySize/format/algName).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Key_Interface_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyEncoded: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        expect(pubKeyEncoded !== null).assertTrue();
        expect(pubKeyEncoded.data instanceof Uint8Array).assertTrue();
        let priKeyEncoded: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(priKeyEncoded !== null).assertTrue();
        let pubKeySize: number = keyPair.pubKey.getKeySize();
        expect(pubKeySize).assertEqual(9472); // 公钥长1184
        let priKeySize: number = keyPair.priKey.getKeySize();
        expect(priKeySize).assertEqual(19200); // 私钥长2400
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
        expect(keyPair.priKey.algName).assertEqual("ML-KEM");
        keyPair.priKey.clearMem();
        keyPair.priKey.getEncoded();
      } catch (error) {
        console.error(`[XTS] Key_Interface_Func_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Key_Interface_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Key_Interface_Func_0200
     * @tc.desc   ML-DSA Key interface common method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Key_Interface_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyEncoded: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
        expect(pubKeyEncoded.data.length).assertEqual(1974);
        let pubKeySize: number = keyPair.pubKey.getKeySize();
        expect(pubKeySize).assertEqual(15616); // 公钥长1952
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.pubKey.algName).assertEqual("ML-DSA");
        let priKeyEncoded: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(priKeyEncoded.data.length).assertEqual(4098);
        let priKeySize: number = keyPair.priKey.getKeySize();
        expect(priKeySize).assertEqual(32256); // 私钥长4032
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        expect(keyPair.priKey.algName).assertEqual("ML-DSA");
      } catch (error) {
        console.error(`[XTS] Key_Interface_Func_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKey_Interface_Func_0100
     * @tc.number SUB_Security_CryptoFramework_PriKey_Interface_Func_0100
     * @tc.desc   PriKey clearMem() interface test (memory clearing).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKey_Interface_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let priKeyData: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        expect(priKeyData.length).assertEqual(2400);
        keyPair.priKey.clearMem();
        keyPair.priKey.getEncoded();
      } catch (error) {
        console.error(`[XTS] PriKey_Interface_Func_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKey_Interface_Func_0200
     * @tc.number SUB_Security_CryptoFramework_PriKey_Interface_Func_0200
     * @tc.desc   PriKey getPubKey() async interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKey_Interface_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let derivedPubKey: cryptoFramework.PubKey = await keyPair.priKey.getPubKey();
        expect(derivedPubKey.getKeySize()).assertEqual(9472); // 派生公钥尺寸(比特)
        expect(derivedPubKey.algName).assertEqual("ML-KEM");
        let originalPubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let derivedPubKeyData: Uint8Array = await derivedPubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let ret: boolean = compareUint8Array(originalPubKeyData, derivedPubKeyData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] PriKey_Interface_Func_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKey_Interface_Func_0300
     * @tc.number SUB_Security_CryptoFramework_PriKey_Interface_Func_0300
     * @tc.desc   PriKey getPubKeySync() sync interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKey_Interface_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = gen.generateKeyPairSync();
        let derivedPubKey: cryptoFramework.PubKey = keyPair.priKey.getPubKeySync();
        expect(derivedPubKey.getKeySize()).assertEqual(9472); // 派生公钥尺寸(比特)
        expect(derivedPubKey.algName).assertEqual("ML-KEM");
        let originalPubKeyData: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let derivedPubKeyData: Uint8Array = derivedPubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let ret: boolean = compareUint8Array(originalPubKeyData, derivedPubKeyData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] PriKey_Interface_Func_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetAsyKeySpec_Error_0100
     * @tc.number SUB_Security_CryptoFramework_GetAsyKeySpec_Error_0100
     * @tc.desc   ML-KEM getAsyKeySpec interface not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetAsyKeySpec_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.RSA_N_BN);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetAsyKeySpec_Error_0100_pub ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.RSA_SK_BN);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetAsyKeySpec_Error_0100_pri ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetAsyKeySpec_Error_0200
     * @tc.number SUB_Security_CryptoFramework_GetAsyKeySpec_Error_0200
     * @tc.desc   ML-DSA getAsyKeySpec interface not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetAsyKeySpec_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetAsyKeySpec_Error_0200_pub ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_SK_BN);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetAsyKeySpec_Error_0200_pri ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKey_EncryptPem_Error_0100
     * @tc.number SUB_Security_CryptoFramework_PriKey_EncryptPem_Error_0100
     * @tc.desc   ML-KEM private key encrypted PEM not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKey_EncryptPem_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let config: cryptoFramework.KeyEncodingConfig = {
          password: "test123",
          cipherName: "AES-256-CBC"
        };
        keyPair.priKey.getEncodedPem("PKCS8", config);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_EncryptPem_Error_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_PriKey_EncryptPem_Error_0200
     * @tc.number SUB_Security_CryptoFramework_PriKey_EncryptPem_Error_0200
     * @tc.desc   ML-DSA private key encrypted PEM not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_PriKey_EncryptPem_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let config: cryptoFramework.KeyEncodingConfig = {
          password: "test123",
          cipherName: "AES-256-CBC"
        };
        keyPair.priKey.getEncodedPem("PKCS8", config);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_EncryptPem_Error_0200_256 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let config2: cryptoFramework.KeyEncodingConfig = {
          password: "test123",
          cipherName: "AES-128-CBC"
        };
        keyPair.priKey.getEncodedPem("PKCS1", config2);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_EncryptPem_Error_0200_128 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0100
     * @tc.number SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0100
     * @tc.desc   ML-KEM convertPemKey encrypted private key not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let rsaGen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA2048");
        let rsaKeyPair: cryptoFramework.KeyPair = await rsaGen.generateKeyPair();
        let config: cryptoFramework.KeyEncodingConfig = {
          password: "test123",
          cipherName: "AES-256-CBC"
        };
        let encryptedRsaPem: string = rsaKeyPair.priKey.getEncodedPem("PKCS8", config);
        expect(encryptedRsaPem.indexOf("ENCRYPTED") >= 0).assertTrue();
        let mlkemGen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let mlkemKeyPair: cryptoFramework.KeyPair = await mlkemGen.generateKeyPair();
        let mlkemPubPem: string = mlkemKeyPair.pubKey.getEncodedPem("X509");
        await mlkemGen.convertPemKey(mlkemPubPem, encryptedRsaPem, "test123");
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ConvertPemKey_Encrypt_Error_0100_async ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0200
     * @tc.number SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0200
     * @tc.desc   ML-DSA convertPemKey encrypted private key not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let rsaGen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA2048");
        let rsaKeyPair: cryptoFramework.KeyPair = await rsaGen.generateKeyPair();
        let config: cryptoFramework.KeyEncodingConfig = {
          password: "test123",
          cipherName: "AES-256-CBC"
        };
        let encryptedRsaPem: string = rsaKeyPair.priKey.getEncodedPem("PKCS8", config);
        let mldsaGen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let mldsaKeyPair: cryptoFramework.KeyPair = await mldsaGen.generateKeyPair();
        let mldsaPubPem: string = mldsaKeyPair.pubKey.getEncodedPem("X509");
        await mldsaGen.convertPemKey(mldsaPubPem, encryptedRsaPem, "test123");
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ConvertPemKey_Encrypt_Error_0200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0300
     * @tc.number SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0300
     * @tc.desc   ML-KEM/ML-DSA convertPemKey(password) interface not supported test, error code 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ConvertPemKey_Encrypt_Error_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let mlkemGen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let mlkemKeyPair: cryptoFramework.KeyPair = await mlkemGen.generateKeyPair();
        let pubPem: string = mlkemKeyPair.pubKey.getEncodedPem("X509");
        let priPem: string = mlkemKeyPair.priKey.getEncodedPem("PKCS8");
        await mlkemGen.convertPemKey(pubPem, priPem, "test123");
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ConvertPemKey_Encrypt_Error_0300_mlkem ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      try {
        let mldsaGen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let mldsaKeyPair: cryptoFramework.KeyPair = await mldsaGen.generateKeyPair();
        let pubPem: string = mldsaKeyPair.pubKey.getEncodedPem("X509");
        let priPem: string = mldsaKeyPair.priKey.getEncodedPem("PKCS8");
        await mldsaGen.convertPemKey(pubPem, priPem, "test123");
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] ConvertPemKey_Encrypt_Error_0300_mldsa ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Encoding_Roundtrip_0100
     * @tc.number SUB_Security_CryptoFramework_Encoding_Roundtrip_0100
     * @tc.desc   ML-KEM encoding roundtrip consistency test (RAW-DER-PEM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Encoding_Roundtrip_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let rawPubKey1: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(rawPubKey1.length).assertEqual(1184);
        let derPubKey: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("X509");
        expect(derPubKey.data.length).assertEqual(1206);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair2: cryptoFramework.KeyPair = await gen2.convertKey(derPubKey, null);
        let rawPubKey2: Uint8Array = await keyPair2.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let ret: boolean = compareUint8Array(rawPubKey1, rawPubKey2);
        expect(ret).assertTrue();
        let pemPubKey: string = keyPair.pubKey.getEncodedPem("X509");
        expect(pemPubKey.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
      } catch (error) {
        console.error(`[XTS] Encoding_Roundtrip_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Encoding_Roundtrip_0200
     * @tc.number SUB_Security_CryptoFramework_Encoding_Roundtrip_0200
     * @tc.desc   ML-DSA encoding roundtrip consistency test (RAW-DER-PEM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Encoding_Roundtrip_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let rawPubKey1: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(rawPubKey1.length).assertEqual(1952);
        let derPubKey: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer("X509");
        expect(derPubKey.data.length).assertEqual(1974);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair2: cryptoFramework.KeyPair = await gen2.convertKey(derPubKey, null);
        let rawPubKey2: Uint8Array = await keyPair2.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        let ret: boolean = compareUint8Array(rawPubKey1, rawPubKey2);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] Encoding_Roundtrip_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}
