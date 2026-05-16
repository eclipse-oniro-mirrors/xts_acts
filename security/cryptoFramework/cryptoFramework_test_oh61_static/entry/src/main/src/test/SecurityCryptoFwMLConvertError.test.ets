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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { BusinessError } from '@ohos.base';

export default function SecurityCryptoFwMLConvertErrorTestUnit() {
  describe('SecurityCryptoFwMLConvertErrorTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0100
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0100
     * @tc.desc   convertKey null parameter test, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        await gen.convertKey(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0100 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        gen.convertKeySync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0100_sync ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0200
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0200
     * @tc.desc   convertKey invalid parameter data test, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let emptyParam: cryptoFramework.DataBlob = {data: new Uint8Array(0)};
        await gen.convertKey(emptyParam, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0200 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let emptyParam: cryptoFramework.DataBlob = {data: new Uint8Array(0)};
        gen.convertKeySync(emptyParam, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0200_sync ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0300
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0300
     * @tc.desc   convertKey key data length mismatch test, error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let invalidPubKey: cryptoFramework.DataBlob = {data: new Uint8Array(100)};
        await gen.convertKey(invalidPubKey, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0300_pub ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let validPubKey: cryptoFramework.DataBlob = {data: new Uint8Array(1184)};
        let invalidPriKey: cryptoFramework.DataBlob = {data: new Uint8Array(100)};
        await gen.convertKey(validPubKey, invalidPriKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0300_pri ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0400
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0400
     * @tc.desc   convertKey cross-algorithm key data conversion test, error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
        let mlkemPubKey: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        await gen2.convertKey({data: mlkemPubKey}, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0400_1 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
        let mldsaPubKey: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        await gen2.convertKey({data: mldsaPubKey}, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0400_2 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0500
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0500
     * @tc.desc   ML-KEM seed data length error test (PQ special scenario), error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let wrongSeed32: cryptoFramework.DataBlob = {data: new Uint8Array(32)};
        await gen.convertKey({data: pubKeyData}, wrongSeed32);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0500_32 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let wrongSeed128: cryptoFramework.DataBlob = {data: new Uint8Array(128)};
        await gen.convertKey({data: pubKeyData}, wrongSeed128);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0500_128 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0600
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0600
     * @tc.desc   ML-DSA seed data length error test (PQ special scenario), error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        let wrongSeed16: cryptoFramework.DataBlob = {data: new Uint8Array(16)};
        await gen.convertKey({data: pubKeyData}, wrongSeed16);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0600_16 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        let wrongSeed64: cryptoFramework.DataBlob = {data: new Uint8Array(64)};
        await gen.convertKey({data: pubKeyData}, wrongSeed64);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Convert_Error_0600_64 ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Convert_Error_0700
     * @tc.number SUB_Security_CryptoFramework_Convert_Error_0700
     * @tc.desc   ML-DSA seed data length error test (PQ special scenario), error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Convert_Error_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair2: cryptoFramework.KeyPair = await gen2.generateKeyPair();
          let gen3: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let priKeyData: Uint8Array = await keyPair2.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
          await gen3.convertKey({data: pubKeyData}, {data: priKeyData});
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Convert_Error_0700 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetKeyData_Error_0100
     * @tc.number SUB_Security_CryptoFramework_GetKeyData_Error_0100
     * @tc.desc   getKeyData parameter type mismatch test, error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetKeyData_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetKeyData_Error_0100_pub ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetKeyData_Error_0100_pri ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetKeyData_Error_0200
     * @tc.number SUB_Security_CryptoFramework_GetKeyData_Error_0200
     * @tc.desc   getKeyData cross-algorithm EC parameter test, error code 17620003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetKeyData_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetKeyData_Error_0200_xy ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      try {
        let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
        await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] GetKeyData_Error_0200_k ${error}, error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    }); 

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetEncodedPem_Error_0100
     * @tc.number SUB_Security_CryptoFramework_GetEncodedPem_Error_0100
     * @tc.desc   pubKey getEncodedPem only supports X509, test with unsupported format "PKCS8", "PKCS1".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetEncodedPem_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedPem("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0100_mlkem ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedPem("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0100_mldsa_pkcs8 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedPem("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0100_mlkem_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedPem("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0100_mldsa_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetEncodedPem_Error_0200
     * @tc.number SUB_Security_CryptoFramework_GetEncodedPem_Error_0200
     * @tc.desc   priKey getEncodedPem only supports PKCS8, test with unsupported format "X509", "PKCS1".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetEncodedPem_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedPem("X509");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0200_mlkem ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedPem("X509");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0200_mldsa_x509 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedPem("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0200_mlkem_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedPem("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0200_mldsa_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          let config: cryptoFramework.KeyEncodingConfig = {
            password: "123456",
            cipherName: "AES-256-CBC"
          }
          keyPair.priKey.getEncodedPem("PKCS8", config);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0200_mldsa_enc ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          let config: cryptoFramework.KeyEncodingConfig = {
            password: "123456",
            cipherName: "AES-256-CBC"
          }
          keyPair.priKey.getEncodedPem("PKCS8", config);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedPem_Error_0200_mldkem_enc ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetEncodedDer_Error_0100
     * @tc.number SUB_Security_CryptoFramework_GetEncodedDer_Error_0100
     * @tc.desc   pubKey getEncodedDer only supports X509, test with unsupported format "PKCS8", "PKCS1".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetEncodedDer_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0100_mlkem ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0100_mldsa_pkcs8 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedDer("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0100_mlkem_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.pubKey.getEncodedDer("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0100_mldsa_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_GetEncodedDer_Error_0200
     * @tc.number SUB_Security_CryptoFramework_GetEncodedDer_Error_0200
     * @tc.desc   priKey getEncodedDer only supports PKCS8, test with unsupported format "X509", "PKCS1".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_GetEncodedDer_Error_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedDer("X509");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0200_mlkem ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedDer("X509");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0200_mldsa_x509 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedDer("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0200_mlkem_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await gen.generateKeyPair();
          keyPair.priKey.getEncodedDer("PKCS1");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] GetEncodedDer_Error_0200_mldsa_pkcs1 ${error}, error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ConvertPemKey_Error_0100
     * @tc.number SUB_Security_CryptoFramework_ConvertPemKey_Error_0100
     * @tc.desc   convertPemKey with empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ConvertPemKey_Error_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await gen.convertPemKey("", "");
          expect(keyPair.priKey === undefined).assertFalse();
          expect(keyPair.pubKey === undefined).assertFalse();
        } catch (error) {
          console.error(`[XTS] ConvertPemKey_Error_0100 KEM ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        try {
          let gen: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = gen.convertPemKeySync("", "");
          expect(keyPair.priKey === undefined).assertFalse();
          expect(keyPair.pubKey === undefined).assertFalse();
        } catch (error) {
          console.error(`[XTS] ConvertPemKey_Error_0100 DSA ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}
