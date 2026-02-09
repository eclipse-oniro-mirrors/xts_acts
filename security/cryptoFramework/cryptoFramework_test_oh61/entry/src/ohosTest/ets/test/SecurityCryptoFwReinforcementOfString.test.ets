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
import { generatorKeyPair, RSA_3072_PRIVATE_KEY_PEM, RSA_3072_PUBLIC_KEY_PEM } from './utils/asymKey/asymKey';

export default function SecurityCryptoFwReinforcementTestUnit() {
  describe('SecurityCryptoFwReinforcementTestUnit', () => {

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0100
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0100
     * @tc.desc Test createAsyKeyGenerator with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createAsyKeyGenerator("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0100 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0200
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0200
     * @tc.desc Test createSymKeyGenerator with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createSymKeyGenerator("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0200 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0300
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0300
     * @tc.desc Test createMac with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createMac("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0300 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0400
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0400
     * @tc.desc Test createMd with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createMd("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0400 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0500
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0500
     * @tc.desc Test createCipher with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createCipher("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0500 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0600
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0600
     * @tc.desc Test createSign with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createSign("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0600 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0700
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0700
     * @tc.desc Test createVerify with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createVerify("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0700 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0800
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0800
     * @tc.desc Test createKeyAgreement with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createKeyAgreement("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0800 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_0900
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_0900
     * @tc.desc Test createKdf with empty string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.createKdf("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_0900 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1000
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1000
     * @tc.desc Test getEncodedDer with empty format string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          keyPair.priKey.getEncodedDer("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1000 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1100
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1100
     * @tc.desc Test getEncodedPem with empty format string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          keyPair.priKey.getEncodedPem("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1100 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1200
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1200
     * @tc.desc Test getEncodedPem with empty format string and config
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          let config: cryptoFramework.KeyEncodingConfig = {
            password: "testPassword",
            cipherName: "AES-256-CBC"
          };
          keyPair.priKey.getEncodedPem("", config);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1200 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1300
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1300
     * @tc.desc Test PubKey getEncodedDer with empty format string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          keyPair.pubKey.getEncodedDer("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1300 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1400
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1400
     * @tc.desc Test PubKey getEncodedPem with empty format string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          keyPair.pubKey.getEncodedPem("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1400 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1500
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1500
     * @tc.desc Test convertPemKey with empty password string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA512");
          await generator.convertPemKey(RSA_3072_PUBLIC_KEY_PEM, RSA_3072_PRIVATE_KEY_PEM, "");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1500 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1600
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1600
     * @tc.desc Test convertPemKeySync with empty password string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA512");
          generator.convertPemKeySync(RSA_3072_PUBLIC_KEY_PEM, RSA_3072_PRIVATE_KEY_PEM, "");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1600 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1700
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1700
     * @tc.desc Test KeyEncodingConfig with empty password string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          let config: cryptoFramework.KeyEncodingConfig = {
            password: "",
            cipherName: "AES-256-CBC"
          };
          keyPair.priKey.getEncodedPem("PKCS8", config);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1700 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1800
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1800
     * @tc.desc Test KeyEncodingConfig with empty cipherName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let keyPair: cryptoFramework.KeyPair = await generatorKeyPair("RSA512");
          let config: cryptoFramework.KeyEncodingConfig = {
            password: "testPassword",
            cipherName: ""
          };
          keyPair.priKey.getEncodedPem("PKCS8", config);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1800 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_1900
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_1900
     * @tc.desc Test ECCKeyUtil genECCCommonParamsSpec with empty curveName
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec("");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_1900 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2000
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2000
     * @tc.desc Test ECCKeyUtil convertPoint with empty curveName
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodedPoint: Uint8Array = new Uint8Array([0x04, 0x00, 0x01]);
          cryptoFramework.ECCKeyUtil.convertPoint("", encodedPoint);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2000 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2100
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2100
     * @tc.desc Test ECCKeyUtil getEncodedPoint with empty curveName
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          // Create a simple Point object for testing
          let point: cryptoFramework.Point = {
            x: BigInt("1234567890123456789012345678901234567890123456789012345678901234"),
            y: BigInt("9876543210987654321098765432109876543210987654321098765432109876")
          };
          cryptoFramework.ECCKeyUtil.getEncodedPoint("", point, "UNCOMPRESSED");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2100 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2200
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2200
     * @tc.desc Test ECCKeyUtil getEncodedPoint with empty format
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          // Create a simple Point object for testing
          let point: cryptoFramework.Point = {
            x: BigInt("1234567890123456789012345678901234567890123456789012345678901234"),
            y: BigInt("9876543210987654321098765432109876543210987654321098765432109876")
          };
          cryptoFramework.ECCKeyUtil.getEncodedPoint("NID_X9_62_prime256v1", point, "");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2200 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2300
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2300
     * @tc.desc Test MacSpec with empty algName
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let macSpec: cryptoFramework.MacSpec = {
            algName: ""
          };
          cryptoFramework.createMac(macSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2300 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2400
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2400
     * @tc.desc Test HmacSpec with empty mdName
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let hmacSpec: cryptoFramework.HmacSpec = {
            algName: "HMAC",
            mdName: ""
          };
          cryptoFramework.createMac(hmacSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2400 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2500
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2500
     * @tc.desc Test CmacSpec with empty cipherName
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let cmacSpec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: ""
          };
          cryptoFramework.createMac(cmacSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2500 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2600
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2600
     * @tc.desc Test PBKDF2Spec with empty password string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let pbkdf2Spec: cryptoFramework.PBKDF2Spec = {
            algName: "PBKDF2",
            password: "",
            salt: new Uint8Array([0x01, 0x02, 0x03]),
            iterations: 16,
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
          await kdf.generateSecret(pbkdf2Spec);
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2700
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2700
     * @tc.desc Test HKDFSpec with empty key string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let hkdfSpec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: "",
            salt: new Uint8Array([0x01, 0x02, 0x03]),
            info: new Uint8Array([0x04, 0x05, 0x06]),
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("HKDF|SHA256");
          await kdf.generateSecret(hkdfSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2700 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2800
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2800
     * @tc.desc Test ScryptSpec with empty passphrase string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let n: number = 16384;
          let r: number = 8;
          let p: number = 1;
          let scryptSpec: cryptoFramework.ScryptSpec = {
            algName: "SCRYPT",
            passphrase: "",
            salt: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            n: n,
            r: r,
            p: p,
            maxMemory: p * 128 * r + 32 * r * (n + 2) * 4 + 1,
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("SCRYPT");
          await kdf.generateSecret(scryptSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2800 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_2900
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_2900
     * @tc.desc Test X963KdfSpec with empty key string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let x963KdfSpec: cryptoFramework.X963KdfSpec = {
            algName: "X963KDF",
            key: "",
            info: new Uint8Array([0x01, 0x02, 0x03]),
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("X963KDF|SHA256");
          await kdf.generateSecret(x963KdfSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_2900 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3000
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3000
     * @tc.desc Test SM2CryptoUtil genCipherTextBySpec with empty mode string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let spec: cryptoFramework.SM2CipherTextSpec = {
            xCoordinate: BigInt("1234567890123456789012345678901234567890123456789012345678901234"),
            yCoordinate: BigInt("9876543210987654321098765432109876543210987654321098765432109876"),
            cipherTextData: new Uint8Array([0x01, 0x02, 0x03]),
            hashData: new Uint8Array([0x04, 0x05, 0x06])
          };
          cryptoFramework.SM2CryptoUtil.genCipherTextBySpec(spec, "");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3000 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3100
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3100
     * @tc.desc Test SM2CryptoUtil getCipherTextSpec with empty mode string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let cipherText: cryptoFramework.DataBlob = {
            data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05])
          };
          cryptoFramework.SM2CryptoUtil.getCipherTextSpec(cipherText, "");
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3100 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION); // mode 为空字符串使用默认模式
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3200
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3200
     * @tc.desc Test Cipher.init with IvParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]) }
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3200 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3300
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3300
     * @tc.desc Test Cipher.init with GcmParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|GCM|PKCS7");
          let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3300 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3400
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3400
     * @tc.desc Test Cipher.init with CcmParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CCM|PKCS7");
          let ccmParamsSpec: cryptoFramework.CcmParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ccmParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3400 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3500
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3500
     * @tc.desc Test Cipher.init with Poly1305ParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("ChaCha20");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("ChaCha20|Poly1305");
          let poly1305ParamsSpec: cryptoFramework.Poly1305ParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305ParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3500 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3600
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3600
     * @tc.desc Test Cipher.initSync with IvParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]) }
          };
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3600 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3700
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3700
     * @tc.desc Test Cipher.initSync with GcmParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|GCM|PKCS7");
          let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3700 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3800
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3800
     * @tc.desc Test Cipher.initSync with CcmParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CCM|PKCS7");
          let ccmParamsSpec: cryptoFramework.CcmParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ccmParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3800 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_3900
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_3900
     * @tc.desc Test Cipher.initSync with Poly1305ParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_3900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("ChaCha20");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("ChaCha20|Poly1305");
          let poly1305ParamsSpec: cryptoFramework.Poly1305ParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305ParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_3900 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4000
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4000
     * @tc.desc Test createAsyKeyGeneratorBySpec with ECCCommonParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let eccCommonParamsSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec("NID_X9_62_prime256v1");
          eccCommonParamsSpec.algName = "";
          cryptoFramework.createAsyKeyGeneratorBySpec(eccCommonParamsSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4000 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4100
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4100
     * @tc.desc Test Kdf.generateSecretSync with PBKDF2Spec containing empty password string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let pbkdf2Spec: cryptoFramework.PBKDF2Spec = {
            algName: "PBKDF2",
            password: "",
            salt: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            iterations: 1000,
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
          kdf.generateSecretSync(pbkdf2Spec);
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4200
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4200
     * @tc.desc Test Kdf.generateSecretSync with HKDFSpec containing empty key string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let hkdfSpec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: "",
            salt: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            info: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18]),
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("HKDF|SHA256");
          kdf.generateSecretSync(hkdfSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4200 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4300
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4300
     * @tc.desc Test Kdf.generateSecretSync with ScryptSpec containing empty passphrase string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let n: number = 16384;
          let r: number = 8;
          let p: number = 1;
          let scryptSpec: cryptoFramework.ScryptSpec = {
            algName: "SCRYPT",
            passphrase: "",
            salt: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            n: n,
            r: r,
            p: p,
            maxMemory: p * 128 * r + 32 * r * (n + 2) * 4 + 1,
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("SCRYPT");
          kdf.generateSecretSync(scryptSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4300 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4400
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4400
     * @tc.desc Test Kdf.generateSecretSync with X963KdfSpec containing empty key string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let x963KdfSpec: cryptoFramework.X963KdfSpec = {
            algName: "X963KDF",
            key: "",
            info: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("X963KDF|SHA256");
          kdf.generateSecretSync(x963KdfSpec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4400 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4500
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4500
     * @tc.desc Test Kdf.generateSecret callback with PBKDF2Spec containing empty password string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let pbkdf2Spec: cryptoFramework.PBKDF2Spec = {
            algName: "PBKDF2",
            password: "",
            salt: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            iterations: 16,
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
          kdf.generateSecret(pbkdf2Spec, (error, secret) => {});
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4600
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4600
     * @tc.desc Test Kdf.generateSecret callback with HKDFSpec containing empty key string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let hkdfSpec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: "",
            salt: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]),
            info: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18]),
            keySize: 32
          };
          let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("HKDF|SHA256");
          kdf.generateSecret(hkdfSpec, (error, secret) => {
            if (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
              done();
            } else {
              expect(null).assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4600 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          done();
        }
        done();
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4700
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4700
     * @tc.desc Test Cipher.init callback with IvParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
          let ivParamsSpec: cryptoFramework.IvParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]) }
          };
          cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec, (error) => {
            if (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
              done();
            } else {
              expect(null).assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4700 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          done();
        }
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4800
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4800
     * @tc.desc Test Cipher.init callback with GcmParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|GCM|PKCS7");
          let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParamsSpec, (error) => {
            if (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
              done();
            } else {
              expect(null).assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4800 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          done();
        }
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_4900
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_4900
     * @tc.desc Test Cipher.init callback with CcmParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_4900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CCM|PKCS7");
          let ccmParamsSpec: cryptoFramework.CcmParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ccmParamsSpec, (error) => {
            if (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
              done();
            } else {
              expect(null).assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_4900 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          done();
        }
      });

    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_5000
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_5000
     * @tc.desc Test Cipher.init callback with Poly1305ParamsSpec containing empty algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_5000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("ChaCha20");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
          let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("ChaCha20|Poly1305");
          let poly1305ParamsSpec: cryptoFramework.Poly1305ParamsSpec = {
            algName: "",
            iv: { data: new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C]) },
            aad: { data: new Uint8Array([0x0D, 0x0E, 0x0F, 0x10]) },
            authTag: { data: new Uint8Array([0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20]) }
          };
          cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, poly1305ParamsSpec, (error) => {
            if (error) {
              expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
              done();
            } else {
              expect(null).assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`[XTS] Reinforcement_Func_5000 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          done();
        }
      });
      
    /**
     * @tc.number SUB_Security_CryptoFramework_Reinforcement_Func_5100
     * @tc.name SUB_Security_CryptoFramework_Reinforcement_Func_5100
     * @tc.desc Test Cipher.createCipher containing algName string
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Reinforcement_Func_5100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
            cryptoFramework.createCipher("AES128/ECB/PKCS7");
            expect(null).assertFail();
        } catch (err) {
            console.error("[XTS] Reinforcement_Func_5100 err is :" + err.code);
            expect(err.code).assertEqual(801);
        }
        try {
            cryptoFramework.createCipher("AES128ECBPKCS7");
            expect(null).assertFail();
        } catch (err) {
            console.error("[XTS] Reinforcement_Func_5100 err is :" + err.code);
            expect(err.code).assertEqual(801);
        }
        done();
      });

  });

}