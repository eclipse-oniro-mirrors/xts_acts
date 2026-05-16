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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';

export default function SecurityCryptoFuncParamIsNullOrUndefinedTestUnit() {
  describe('SecurityCryptoFuncParamIsNullOrUndefinedTestUnit', () => {
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
     * @tc.name   SUB_Security_Crypto_Framework_CreateAsyKeyGenerator_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateAsyKeyGenerator_Null_001
     * @tc.desc   cryptoFramework.createAsyKeyGenerator with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateAsyKeyGenerator_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createAsyKeyGenerator(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateAsyKeyGenerator_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateAsyKeyGenerator_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateAsyKeyGenerator_Undefined_001
     * @tc.desc   cryptoFramework.createAsyKeyGenerator with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateAsyKeyGenerator_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createAsyKeyGenerator(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateAsyKeyGenerator_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateSymKeyGenerator_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateSymKeyGenerator_Null_001
     * @tc.desc   cryptoFramework.createSymKeyGenerator with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateSymKeyGenerator_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createSymKeyGenerator(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateSymKeyGenerator_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateSymKeyGenerator_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateSymKeyGenerator_Undefined_001
     * @tc.desc   cryptoFramework.createSymKeyGenerator with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateSymKeyGenerator_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createSymKeyGenerator(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateSymKeyGenerator_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateMac_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateMac_Null_001
     * @tc.desc   cryptoFramework.createMac with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateMac_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createMac(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateMac_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateMac_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateMac_Undefined_001
     * @tc.desc   cryptoFramework.createMac with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateMac_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createMac(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateMac_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateMd_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateMd_Null_001
     * @tc.desc   cryptoFramework.createMd with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateMd_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createMd(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateMd_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateMd_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateMd_Undefined_001
     * @tc.desc   cryptoFramework.createMd with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateMd_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createMd(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateMd_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateCipher_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateCipher_Null_001
     * @tc.desc   cryptoFramework.createCipher with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateCipher_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createCipher(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCipher_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateCipher_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateCipher_Undefined_001
     * @tc.desc   cryptoFramework.createCipher with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateCipher_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createCipher(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateCipher_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateSign_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateSign_Null_001
     * @tc.desc   cryptoFramework.createSign with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateSign_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createSign(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateSign_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateSign_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateSign_Undefined_001
     * @tc.desc   cryptoFramework.createSign with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateSign_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createSign(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateSign_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateVerify_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateVerify_Null_001
     * @tc.desc   cryptoFramework.createVerify with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateVerify_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createVerify(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateVerify_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateVerify_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateVerify_Undefined_001
     * @tc.desc   cryptoFramework.createVerify with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateVerify_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createVerify(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateVerify_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_GenerateRandom_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Random_GenerateRandom_Null_001
     * @tc.desc   Random.generateRandom with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_GenerateRandom_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.generateRandom(null, (err, data) => {
          if (err) {
            console.error(`[XTS] Random_GenerateRandom_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Random_GenerateRandom_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_GenerateRandom_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Random_GenerateRandom_Undefined_001
     * @tc.desc   Random.generateRandom with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_GenerateRandom_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.generateRandom(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] Random_GenerateRandom_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Random_GenerateRandom_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_GenerateRandom_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Random_GenerateRandom_Null_002
     * @tc.desc   Random.generateRandom with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_GenerateRandom_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        await random.generateRandom(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Random_GenerateRandom_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_GenerateRandom_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Random_GenerateRandom_Undefined_002
     * @tc.desc   Random.generateRandom with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_GenerateRandom_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        await random.generateRandom(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Random_GenerateRandom_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_GenerateRandomSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Random_GenerateRandomSync_Null_001
     * @tc.desc   Random.generateRandomSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_GenerateRandomSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.generateRandomSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Random_GenerateRandomSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_GenerateRandomSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Random_GenerateRandomSync_Undefined_001
     * @tc.desc   Random.generateRandomSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_GenerateRandomSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.generateRandomSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Random_GenerateRandomSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_SetSeed_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Random_SetSeed_Null_001
     * @tc.desc   Random.setSeed with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_SetSeed_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.setSeed(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Random_SetSeed_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Random_SetSeed_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Random_SetSeed_Undefined_001
     * @tc.desc   Random.setSeed with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Random_SetSeed_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.setSeed(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Random_SetSeed_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_GenerateKeyPair_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_GenerateKeyPair_Null_001
     * @tc.desc   AsyKeyGenerator.generateKeyPair with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_GenerateKeyPair_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        await asyKeyGenerator.generateKeyPair(null);
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_GenerateKeyPair_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_GenerateKeyPair_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_GenerateKeyPair_Undefined_001
     * @tc.desc   AsyKeyGenerator.generateKeyPair with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_GenerateKeyPair_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        await asyKeyGenerator.generateKeyPair(undefined);
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_GenerateKeyPair_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Null_001
     * @tc.desc   AsyKeyGenerator.convertKey with null parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        asyKeyGenerator.convertKey(null, null, (err, data) => {
          if (err) {
            console.error(`[XTS] AsyKeyGenerator_ConvertKey_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertKey_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Undefined_001
     * @tc.desc   AsyKeyGenerator.convertKey with undefined parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        asyKeyGenerator.convertKey(undefined, undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] AsyKeyGenerator_ConvertKey_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertKey_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Null_002
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Null_002
     * @tc.desc   AsyKeyGenerator.convertKey with null parameters using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        await asyKeyGenerator.convertKey(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertKey_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Undefined_002
     * @tc.desc   AsyKeyGenerator.convertKey with undefined parameters using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKey_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        await asyKeyGenerator.convertKey(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertKey_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKeySync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKeySync_Null_001
     * @tc.desc   AsyKeyGenerator.convertKeySync with null parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKeySync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        asyKeyGenerator.convertKeySync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertKeySync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKeySync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKeySync_Undefined_001
     * @tc.desc   AsyKeyGenerator.convertKeySync with undefined parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertKeySync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        asyKeyGenerator.convertKeySync(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertKeySync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKey_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKey_Null_001
     * @tc.desc   AsyKeyGenerator.convertPemKey with null parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKey_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        await asyKeyGenerator.convertPemKey(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertPemKey_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKey_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKey_Undefined_001
     * @tc.desc   AsyKeyGenerator.convertPemKey with undefined parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKey_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        await asyKeyGenerator.convertPemKey(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertPemKey_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKeySync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKeySync_Null_001
     * @tc.desc   AsyKeyGenerator.convertPemKeySync with null parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKeySync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        asyKeyGenerator.convertPemKeySync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertPemKeySync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKeySync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKeySync_Undefined_001
     * @tc.desc   AsyKeyGenerator.convertPemKeySync with undefined parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGenerator_ConvertPemKeySync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        asyKeyGenerator.convertPemKeySync(undefined, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] AsyKeyGenerator_ConvertPemKeySync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_GenerateSymKey_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_GenerateSymKey_Null_001
     * @tc.desc   SymKeyGenerator.generateSymKey with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_GenerateSymKey_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        await symKeyGenerator.generateSymKey(null);
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_GenerateSymKey_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_GenerateSymKey_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_GenerateSymKey_Undefined_001
     * @tc.desc   SymKeyGenerator.generateSymKey with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_GenerateSymKey_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        await symKeyGenerator.generateSymKey(undefined);
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_GenerateSymKey_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Null_001
     * @tc.desc   SymKeyGenerator.convertKey with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        symKeyGenerator.convertKey(null, (err, data) => {
          if (err) {
            console.error(`[XTS] SymKeyGenerator_ConvertKey_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_ConvertKey_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Undefined_001
     * @tc.desc   SymKeyGenerator.convertKey with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        symKeyGenerator.convertKey(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] SymKeyGenerator_ConvertKey_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_ConvertKey_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Null_002
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Null_002
     * @tc.desc   SymKeyGenerator.convertKey with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        await symKeyGenerator.convertKey(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_ConvertKey_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Undefined_002
     * @tc.desc   SymKeyGenerator.convertKey with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKey_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        await symKeyGenerator.convertKey(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_ConvertKey_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKeySync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKeySync_Null_001
     * @tc.desc   SymKeyGenerator.convertKeySync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKeySync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        symKeyGenerator.convertKeySync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_ConvertKeySync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKeySync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKeySync_Undefined_001
     * @tc.desc   SymKeyGenerator.convertKeySync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SymKeyGenerator_ConvertKeySync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        symKeyGenerator.convertKeySync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SymKeyGenerator_ConvertKeySync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Init_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_Init_Null_001
     * @tc.desc   Mac.init with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Init_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        mac.init(null, (err) => {
          if (err) {
            console.error(`[XTS] Mac_Init_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Mac_Init_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Init_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_Init_Undefined_001
     * @tc.desc   Mac.init with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Init_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        mac.init(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Mac_Init_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Mac_Init_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Init_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Mac_Init_Null_002
     * @tc.desc   Mac.init with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Init_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        await mac.init(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_Init_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Init_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Mac_Init_Undefined_002
     * @tc.desc   Mac.init with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Init_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        await mac.init(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_Init_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_InitSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_InitSync_Null_001
     * @tc.desc   Mac.initSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_InitSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        mac.initSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_InitSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_InitSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_InitSync_Undefined_001
     * @tc.desc   Mac.initSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_InitSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        mac.initSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_InitSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Update_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_Update_Null_001
     * @tc.desc   Mac.update with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Update_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await mac.init(symKey);
        mac.update(null, (err) => {
          if (err) {
            console.error(`[XTS] Mac_Update_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Mac_Update_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Update_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_Update_Undefined_001
     * @tc.desc   Mac.update with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Update_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await mac.init(symKey);
        mac.update(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Mac_Update_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Mac_Update_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Update_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Mac_Update_Null_002
     * @tc.desc   Mac.update with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Update_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await mac.init(symKey);
        await mac.update(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_Update_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_Update_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Mac_Update_Undefined_002
     * @tc.desc   Mac.update with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_Update_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await mac.init(symKey);
        await mac.update(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_Update_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_UpdateSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_UpdateSync_Null_001
     * @tc.desc   Mac.updateSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_UpdateSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        mac.initSync(symKey);
        mac.updateSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_UpdateSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_UpdateSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_UpdateSync_Undefined_001
     * @tc.desc   Mac.updateSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_UpdateSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        mac.initSync(symKey);
        mac.updateSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Mac_UpdateSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_DoFinal_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_DoFinal_Null_001
     * @tc.desc   Mac.doFinal with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_DoFinal_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await mac.init(symKey);
        await mac.doFinal(null);
      } catch (error) {
        console.error(`[XTS] Mac_DoFinal_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Mac_DoFinal_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Mac_DoFinal_Undefined_001
     * @tc.desc   Mac.doFinal with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Mac_DoFinal_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let mac: cryptoFramework.Mac = cryptoFramework.createMac("SHA256");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        await mac.init(symKey);
        await mac.doFinal(undefined);
      } catch (error) {
        console.error(`[XTS] Mac_DoFinal_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_Update_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Md_Update_Null_001
     * @tc.desc   Md.update with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_Update_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        md.update(null, (err) => {
          if (err) {
            console.error(`[XTS] Md_Update_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Md_Update_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_Update_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Md_Update_Undefined_001
     * @tc.desc   Md.update with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_Update_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        md.update(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Md_Update_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Md_Update_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_Update_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Md_Update_Null_002
     * @tc.desc   Md.update with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_Update_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        await md.update(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Md_Update_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_Update_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Md_Update_Undefined_002
     * @tc.desc   Md.update with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_Update_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        await md.update(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Md_Update_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_UpdateSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Md_UpdateSync_Null_001
     * @tc.desc   Md.updateSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_UpdateSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        md.updateSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Md_UpdateSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_UpdateSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Md_UpdateSync_Undefined_001
     * @tc.desc   Md.updateSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_UpdateSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        md.updateSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Md_UpdateSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_Digest_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Md_Digest_Null_001
     * @tc.desc   Md.digest with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_Digest_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        await md.digest(null);
      } catch (error) {
        console.error(`[XTS] Md_Digest_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Md_Digest_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Md_Digest_Undefined_001
     * @tc.desc   Md.digest with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Md_Digest_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = cryptoFramework.createMd("SHA256");
        await md.digest(undefined);
      } catch (error) {
        console.error(`[XTS] Md_Digest_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Init_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Init_Null_001
     * @tc.desc   Cipher.init with null key parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Init_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, null, null, (err) => {
          if (err) {
            console.error(`[XTS] Cipher_Init_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Cipher_Init_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Init_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Init_Undefined_001
     * @tc.desc   Cipher.init with undefined key parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Init_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, undefined, null, (err) => {
          if (err) {
            console.error(`[XTS] Cipher_Init_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Cipher_Init_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Init_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Init_Null_002
     * @tc.desc   Cipher.init with null key parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Init_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_Init_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Init_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Init_Undefined_002
     * @tc.desc   Cipher.init with undefined key parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Init_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, undefined, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_Init_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_InitSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_InitSync_Null_001
     * @tc.desc   Cipher.initSync with null key parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_InitSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_InitSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_InitSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_InitSync_Undefined_001
     * @tc.desc   Cipher.initSync with undefined key parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_InitSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, undefined, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_InitSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Update_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Update_Null_001
     * @tc.desc   Cipher.update with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Update_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.update(null, (err, data) => {
          if (err) {
            console.error(`[XTS] Cipher_Update_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Cipher_Update_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Update_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Update_Undefined_001
     * @tc.desc   Cipher.update with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Update_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.update(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] Cipher_Update_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Cipher_Update_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Update_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Update_Null_002
     * @tc.desc   Cipher.update with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Update_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        await cipher.update(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_Update_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_Update_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Cipher_Update_Undefined_002
     * @tc.desc   Cipher.update with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_Update_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        await cipher.update(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_Update_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_UpdateSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_UpdateSync_Null_001
     * @tc.desc   Cipher.updateSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_UpdateSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.updateSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_UpdateSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_UpdateSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_UpdateSync_Undefined_001
     * @tc.desc   Cipher.updateSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_UpdateSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.updateSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_UpdateSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_DoFinal_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_DoFinal_Null_001
     * @tc.desc   Cipher.doFinal with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_DoFinal_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.doFinal(null, (err, data) => {
          if (err) {
            console.error(`[XTS] Cipher_DoFinal_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Cipher_DoFinal_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_DoFinal_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_DoFinal_Undefined_001
     * @tc.desc   Cipher.doFinal with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_DoFinal_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.doFinal(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] Cipher_DoFinal_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Cipher_DoFinal_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_DoFinal_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Cipher_DoFinal_Null_002
     * @tc.desc   Cipher.doFinal with null data parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_DoFinal_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        await cipher.doFinal(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_DoFinal_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_DoFinal_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Cipher_DoFinal_Undefined_002
     * @tc.desc   Cipher.doFinal with undefined data parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_DoFinal_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        await cipher.doFinal(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_DoFinal_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_DoFinalSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_DoFinalSync_Null_001
     * @tc.desc   Cipher.doFinalSync with null data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_DoFinalSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.doFinalSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_DoFinalSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_DoFinalSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_DoFinalSync_Undefined_001
     * @tc.desc   Cipher.doFinalSync with undefined data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_DoFinalSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES256|CBC|PKCS7");
        let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES256");
        let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();
        let ivBlob: cryptoFramework.DataBlob = { data: new Uint8Array(16) };
        let ivParamsSpec: cryptoFramework.IvParamsSpec = {
          algName: "AES256",
          iv: ivBlob
        };
        cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, ivParamsSpec);
        cipher.doFinalSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_DoFinalSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_SetCipherSpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_SetCipherSpec_Null_001
     * @tc.desc   Cipher.setCipherSpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_SetCipherSpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("RSA1024|PKCS1");
        cipher.setCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_SetCipherSpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_SetCipherSpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_SetCipherSpec_Undefined_001
     * @tc.desc   Cipher.setCipherSpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_SetCipherSpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("RSA1024|PKCS1");
        cipher.setCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_SetCipherSpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_GetCipherSpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_GetCipherSpec_Null_001
     * @tc.desc   Cipher.getCipherSpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_GetCipherSpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("RSA1024|PKCS1");
        cipher.getCipherSpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_GetCipherSpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Cipher_GetCipherSpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Cipher_GetCipherSpec_Undefined_001
     * @tc.desc   Cipher.getCipherSpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Cipher_GetCipherSpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher("RSA1024|PKCS1");
        cipher.getCipherSpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cipher_GetCipherSpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Init_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_Init_Null_001
     * @tc.desc   Sign.init with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Init_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        sign.init(null, (err) => {
          if (err) {
            console.error(`[XTS] Sign_Init_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Sign_Init_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Init_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_Init_Undefined_001
     * @tc.desc   Sign.init with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Init_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        sign.init(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Sign_Init_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Sign_Init_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Init_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Sign_Init_Null_002
     * @tc.desc   Sign.init with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Init_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        await sign.init(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_Init_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Init_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Sign_Init_Undefined_002
     * @tc.desc   Sign.init with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Init_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        await sign.init(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_Init_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_InitSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_InitSync_Null_001
     * @tc.desc   Sign.initSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_InitSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        sign.initSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_InitSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_InitSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_InitSync_Undefined_001
     * @tc.desc   Sign.initSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_InitSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        sign.initSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_InitSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Update_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_Update_Null_001
     * @tc.desc   Sign.update with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Update_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        sign.update(null, (err) => {
          if (err) {
            console.error(`[XTS] Sign_Update_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Sign_Update_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Update_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_Update_Undefined_001
     * @tc.desc   Sign.update with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Update_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        sign.update(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Sign_Update_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Sign_Update_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Update_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Sign_Update_Null_002
     * @tc.desc   Sign.update with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Update_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        await sign.update(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_Update_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Update_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Sign_Update_Undefined_002
     * @tc.desc   Sign.update with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Update_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        await sign.update(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_Update_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_UpdateSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_UpdateSync_Null_001
     * @tc.desc   Sign.updateSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_UpdateSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        sign.initSync(keyPair.priKey);
        sign.updateSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_UpdateSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_UpdateSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_UpdateSync_Undefined_001
     * @tc.desc   Sign.updateSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_UpdateSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        sign.initSync(keyPair.priKey);
        sign.updateSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_UpdateSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Sign_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_Sign_Null_001
     * @tc.desc   Sign.sign with null data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Sign_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        sign.sign(null, (err, data) => {
          if (err) {
            console.error(`[XTS] Sign_Sign_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
      } catch (error) {
        console.error(`[XTS] Sign_Sign_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Sign_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_Sign_Undefined_001
     * @tc.desc   Sign.sign with undefined data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Sign_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        sign.sign(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] Sign_Sign_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Sign_Sign_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Sign_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Sign_Sign_Null_002
     * @tc.desc   Sign.sign with null data parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Sign_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        await sign.sign(null);
      } catch (error) {
        console.error(`[XTS] Sign_Sign_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_Sign_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Sign_Sign_Undefined_002
     * @tc.desc   Sign.sign with undefined data parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_Sign_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await sign.init(keyPair.priKey);
        await sign.sign(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_Sign_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_SignSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_SignSync_Null_001
     * @tc.desc   Sign.signSync with null data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_SignSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        sign.initSync(keyPair.priKey);
        sign.signSync(null);
      } catch (error) {
        console.error(`[XTS] Sign_SignSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_SignSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_SignSync_Undefined_001
     * @tc.desc   Sign.signSync with undefined data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_SignSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        sign.initSync(keyPair.priKey);
        sign.signSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_SignSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_SetSignSpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_SetSignSpec_Null_001
     * @tc.desc   Sign.setSignSpec with null itemValue parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_SetSignSpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PSS|SHA256");
        sign.setSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_SetSignSpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_SetSignSpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_SetSignSpec_Undefined_001
     * @tc.desc   Sign.setSignSpec with undefined itemValue parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_SetSignSpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PSS|SHA256");
        sign.setSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_SetSignSpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_GetSignSpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_GetSignSpec_Null_001
     * @tc.desc   Sign.getSignSpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_GetSignSpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PSS|SHA256");
        sign.getSignSpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_GetSignSpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Sign_GetSignSpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Sign_GetSignSpec_Undefined_001
     * @tc.desc   Sign.getSignSpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Sign_GetSignSpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign("RSA1024|PSS|SHA256");
        sign.getSignSpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Sign_GetSignSpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Init_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Init_Null_001
     * @tc.desc   Verify.init with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Init_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        verify.init(null, (err) => {
          if (err) {
            console.error(`[XTS] Verify_Init_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Verify_Init_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Init_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Init_Undefined_001
     * @tc.desc   Verify.init with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Init_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        verify.init(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Verify_Init_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Verify_Init_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Init_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Verify_Init_Null_002
     * @tc.desc   Verify.init with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Init_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        await verify.init(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Init_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Init_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Verify_Init_Undefined_002
     * @tc.desc   Verify.init with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Init_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        await verify.init(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Init_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_InitSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_InitSync_Null_001
     * @tc.desc   Verify.initSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_InitSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        verify.initSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_InitSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_InitSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_InitSync_Undefined_001
     * @tc.desc   Verify.initSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_InitSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        verify.initSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_InitSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Update_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Update_Null_001
     * @tc.desc   Verify.update with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Update_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        verify.update(null, (err) => {
          if (err) {
            console.error(`[XTS] Verify_Update_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Verify_Update_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Update_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Update_Undefined_001
     * @tc.desc   Verify.update with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Update_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        verify.update(undefined, (err) => {
          if (err) {
            console.error(`[XTS] Verify_Update_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Verify_Update_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Update_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Verify_Update_Null_002
     * @tc.desc   Verify.update with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Update_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        await verify.update(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Update_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Update_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Verify_Update_Undefined_002
     * @tc.desc   Verify.update with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Update_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        await verify.update(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Update_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_UpdateSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_UpdateSync_Null_001
     * @tc.desc   Verify.updateSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_UpdateSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        verify.initSync(keyPair.pubKey);
        verify.updateSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_UpdateSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_UpdateSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_UpdateSync_Undefined_001
     * @tc.desc   Verify.updateSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_UpdateSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        verify.initSync(keyPair.pubKey);
        verify.updateSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_UpdateSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Verify_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Verify_Null_001
     * @tc.desc   Verify.verify with null data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Verify_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        let signatureData: cryptoFramework.DataBlob = { data: new Uint8Array(128) };
        verify.verify(null, signatureData, (err, data) => {
          if (err) {
            console.error(`[XTS] Verify_Verify_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
      } catch (error) {
        console.error(`[XTS] Verify_Verify_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Verify_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Verify_Undefined_001
     * @tc.desc   Verify.verify with undefined data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Verify_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        let signatureData: cryptoFramework.DataBlob = { data: new Uint8Array(128) };
        verify.verify(undefined, signatureData, (err, data) => {
          if (err) {
            console.error(`[XTS] Verify_Verify_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
      } catch (error) {
        console.error(`[XTS] Verify_Verify_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Verify_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Verify_Verify_Null_002
     * @tc.desc   Verify.verify with null signatureData parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Verify_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        let dataBlob: cryptoFramework.DataBlob = { data: new Uint8Array(32) };
        verify.verify(dataBlob, null, (err, data) => {
          if (err) {
            console.error(`[XTS] Verify_Verify_Null_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Verify_Verify_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Verify_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Verify_Verify_Undefined_002
     * @tc.desc   Verify.verify with undefined signatureData parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Verify_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        let dataBlob: cryptoFramework.DataBlob = { data: new Uint8Array(32) };
        verify.verify(dataBlob, undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] Verify_Verify_Undefined_002 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Verify_Verify_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Verify_Null_003
     * @tc.number SUB_Security_Crypto_Framework_Verify_Verify_Null_003
     * @tc.desc   Verify.verify with null data parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Verify_Null_003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        let signatureData: cryptoFramework.DataBlob = { data: new Uint8Array(128) };
        await verify.verify(null, signatureData);
      } catch (error) {
        console.error(`[XTS] Verify_Verify_Null_003 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Verify_Undefined_003
     * @tc.number SUB_Security_Crypto_Framework_Verify_Verify_Undefined_003
     * @tc.desc   Verify.verify with undefined data parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Verify_Undefined_003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        let signatureData: cryptoFramework.DataBlob = { data: new Uint8Array(128) };
        await verify.verify(undefined, signatureData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Verify_Undefined_003 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_VerifySync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_VerifySync_Null_001
     * @tc.desc   Verify.verifySync with null data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_VerifySync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        verify.initSync(keyPair.pubKey);
        let signatureData: cryptoFramework.DataBlob = { data: new Uint8Array(128) };
        verify.verifySync(null, signatureData);
      } catch (error) {
        console.error(`[XTS] Verify_VerifySync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_VerifySync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_VerifySync_Undefined_001
     * @tc.desc   Verify.verifySync with undefined data parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_VerifySync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        verify.initSync(keyPair.pubKey);
        let signatureData: cryptoFramework.DataBlob = { data: new Uint8Array(128) };
        verify.verifySync(undefined, signatureData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_VerifySync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Recover_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Recover_Null_001
     * @tc.desc   Verify.recover with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Recover_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        await verify.recover(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Recover_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_Recover_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_Recover_Undefined_001
     * @tc.desc   Verify.recover with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_Recover_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        await verify.init(keyPair.pubKey);
        await verify.recover(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_Recover_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_RecoverSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_RecoverSync_Null_001
     * @tc.desc   Verify.recoverSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_RecoverSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        verify.initSync(keyPair.pubKey);
        verify.recoverSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_RecoverSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_RecoverSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_RecoverSync_Undefined_001
     * @tc.desc   Verify.recoverSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_RecoverSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PKCS1|SHA256");
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        verify.initSync(keyPair.pubKey);
        verify.recoverSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_RecoverSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_SetVerifySpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_SetVerifySpec_Null_001
     * @tc.desc   Verify.setVerifySpec with null itemValue parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_SetVerifySpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PSS|SHA256");
        verify.setVerifySpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_SetVerifySpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_SetVerifySpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_SetVerifySpec_Undefined_001
     * @tc.desc   Verify.setVerifySpec with undefined itemValue parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_SetVerifySpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PSS|SHA256");
        verify.setVerifySpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_SetVerifySpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_GetVerifySpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_GetVerifySpec_Null_001
     * @tc.desc   Verify.getVerifySpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_GetVerifySpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PSS|SHA256");
        verify.getVerifySpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_GetVerifySpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Verify_GetVerifySpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Verify_GetVerifySpec_Undefined_001
     * @tc.desc   Verify.getVerifySpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Verify_GetVerifySpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify("RSA1024|PSS|SHA256");
        verify.getVerifySpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Verify_GetVerifySpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetAsyKeySpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetAsyKeySpec_Null_001
     * @tc.desc   PriKey.getAsyKeySpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetAsyKeySpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getAsyKeySpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetAsyKeySpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetAsyKeySpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetAsyKeySpec_Undefined_001
     * @tc.desc   PriKey.getAsyKeySpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetAsyKeySpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getAsyKeySpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetAsyKeySpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetEncodedDer_Null_001
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetEncodedDer_Null_001
     * @tc.desc   PriKey.getEncodedDer with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetEncodedDer_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getEncodedDer(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetEncodedDer_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetEncodedDer_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetEncodedDer_Undefined_001
     * @tc.desc   PriKey.getEncodedDer with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetEncodedDer_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getEncodedDer(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetEncodedDer_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Null_001
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Null_001
     * @tc.desc   PriKey.getEncodedPem with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getEncodedPem(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetEncodedPem_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Undefined_001
     * @tc.desc   PriKey.getEncodedPem with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getEncodedPem(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetEncodedPem_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Null_002
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Null_002
     * @tc.desc   PriKey.getEncodedPem with null config parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getEncodedPem("PKCS8", null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetEncodedPem_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Undefined_002
     * @tc.desc   PriKey.getEncodedPem with undefined config parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PriKey_GetEncodedPem_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.priKey.getEncodedPem("PKCS8", undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PriKey_GetEncodedPem_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PubKey_GetAsyKeySpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_PubKey_GetAsyKeySpec_Null_001
     * @tc.desc   PubKey.getAsyKeySpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PubKey_GetAsyKeySpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.pubKey.getAsyKeySpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PubKey_GetAsyKeySpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PubKey_GetAsyKeySpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_PubKey_GetAsyKeySpec_Undefined_001
     * @tc.desc   PubKey.getAsyKeySpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PubKey_GetAsyKeySpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.pubKey.getAsyKeySpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PubKey_GetAsyKeySpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PubKey_GetEncodedDer_Null_001
     * @tc.number SUB_Security_Crypto_Framework_PubKey_GetEncodedDer_Null_001
     * @tc.desc   PubKey.getEncodedDer with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PubKey_GetEncodedDer_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.pubKey.getEncodedDer(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PubKey_GetEncodedDer_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PubKey_GetEncodedDer_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_PubKey_GetEncodedDer_Undefined_001
     * @tc.desc   PubKey.getEncodedDer with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PubKey_GetEncodedDer_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.pubKey.getEncodedDer(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PubKey_GetEncodedDer_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PubKey_GetEncodedPem_Null_001
     * @tc.number SUB_Security_Crypto_Framework_PubKey_GetEncodedPem_Null_001
     * @tc.desc   PubKey.getEncodedPem with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PubKey_GetEncodedPem_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.pubKey.getEncodedPem(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PubKey_GetEncodedPem_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_PubKey_GetEncodedPem_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_PubKey_GetEncodedPem_Undefined_001
     * @tc.desc   PubKey.getEncodedPem with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_PubKey_GetEncodedPem_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();
        keyPair.pubKey.getEncodedPem(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] PubKey_GetEncodedPem_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateAsyKeyGeneratorBySpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateAsyKeyGeneratorBySpec_Null_001
     * @tc.desc   cryptoFramework.createAsyKeyGeneratorBySpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateAsyKeyGeneratorBySpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createAsyKeyGeneratorBySpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateAsyKeyGeneratorBySpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateAsyKeyGeneratorBySpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateAsyKeyGeneratorBySpec_Undefined_001
     * @tc.desc   cryptoFramework.createAsyKeyGeneratorBySpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateAsyKeyGeneratorBySpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createAsyKeyGeneratorBySpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateAsyKeyGeneratorBySpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GenerateKeyPair_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GenerateKeyPair_Null_001
     * @tc.desc   AsyKeyGeneratorBySpec.generateKeyPair with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GenerateKeyPair_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rsaCommonParamsSpec: cryptoFramework.RSACommonParamsSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          n: BigInt("0x1234567890ABCDEF")
        };
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: rsaCommonParamsSpec,
          sk: BigInt("0x1234567890ABCDEF"),
          pk: BigInt("0x1234567890ABCDEF")
        };
        let asyKeyGeneratorBySpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorBySpec.generateKeyPair(null);
      } catch (error) {
        console.error(`[XTS] AsyKeyGeneratorBySpec_GenerateKeyPair_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GenerateKeyPair_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GenerateKeyPair_Undefined_001
     * @tc.desc   AsyKeyGeneratorBySpec.generateKeyPair with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GenerateKeyPair_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rsaCommonParamsSpec: cryptoFramework.RSACommonParamsSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          n: BigInt("0x1234567890ABCDEF")
        };
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: rsaCommonParamsSpec,
          sk: BigInt("0x1234567890ABCDEF"),
          pk: BigInt("0x1234567890ABCDEF")
        };
        let asyKeyGeneratorBySpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorBySpec.generateKeyPair(undefined);
      } catch (error) {
        console.error(`[XTS] AsyKeyGeneratorBySpec_GenerateKeyPair_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePriKey_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePriKey_Null_001
     * @tc.desc   AsyKeyGeneratorBySpec.generatePriKey with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePriKey_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rsaCommonParamsSpec: cryptoFramework.RSACommonParamsSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          n: BigInt("0x1234567890ABCDEF")
        };
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: rsaCommonParamsSpec,
          sk: BigInt("0x1234567890ABCDEF"),
          pk: BigInt("0x1234567890ABCDEF")
        };
        let asyKeyGeneratorBySpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorBySpec.generatePriKey(null);
      } catch (error) {
        console.error(`[XTS] AsyKeyGeneratorBySpec_GeneratePriKey_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePriKey_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePriKey_Undefined_001
     * @tc.desc   AsyKeyGeneratorBySpec.generatePriKey with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePriKey_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rsaCommonParamsSpec: cryptoFramework.RSACommonParamsSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          n: BigInt("0x1234567890ABCDEF")
        };
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: rsaCommonParamsSpec,
          sk: BigInt("0x1234567890ABCDEF"),
          pk: BigInt("0x1234567890ABCDEF")
        };
        let asyKeyGeneratorBySpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorBySpec.generatePriKey(undefined);
      } catch (error) {
        console.error(`[XTS] AsyKeyGeneratorBySpec_GeneratePriKey_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePubKey_Null_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePubKey_Null_001
     * @tc.desc   AsyKeyGeneratorBySpec.generatePubKey with null callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePubKey_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rsaCommonParamsSpec: cryptoFramework.RSACommonParamsSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          n: BigInt("0x1234567890ABCDEF")
        };
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: rsaCommonParamsSpec,
          sk: BigInt("0x1234567890ABCDEF"),
          pk: BigInt("0x1234567890ABCDEF")
        };
        let asyKeyGeneratorBySpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorBySpec.generatePubKey(null);
      } catch (error) {
        console.error(`[XTS] AsyKeyGeneratorBySpec_GeneratePubKey_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePubKey_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePubKey_Undefined_001
     * @tc.desc   AsyKeyGeneratorBySpec.generatePubKey with undefined callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_AsyKeyGeneratorBySpec_GeneratePubKey_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let rsaCommonParamsSpec: cryptoFramework.RSACommonParamsSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
          n: BigInt("0x1234567890ABCDEF")
        };
        let rsaKeyPairSpec: cryptoFramework.RSAKeyPairSpec = {
          algName: "RSA",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: rsaCommonParamsSpec,
          sk: BigInt("0x1234567890ABCDEF"),
          pk: BigInt("0x1234567890ABCDEF")
        };
        let asyKeyGeneratorBySpec: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
        await asyKeyGeneratorBySpec.generatePubKey(undefined);
      } catch (error) {
        console.error(`[XTS] AsyKeyGeneratorBySpec_GeneratePubKey_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateKdf_Null_001
     * @tc.number SUB_Security_Crypto_Framework_CreateKdf_Null_001
     * @tc.desc   cryptoFramework.createKdf with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateKdf_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createKdf(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateKdf_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_CreateKdf_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_CreateKdf_Undefined_001
     * @tc.desc   cryptoFramework.createKdf with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_CreateKdf_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.createKdf(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] CreateKdf_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Null_001
     * @tc.desc   Kdf.generateSecret with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
        kdf.generateSecret(null, (err, data) => {
          if (err) {
            console.error(`[XTS] Kdf_GenerateSecret_Null_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Kdf_GenerateSecret_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Undefined_001
     * @tc.desc   Kdf.generateSecret with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
        kdf.generateSecret(undefined, (err, data) => {
          if (err) {
            console.error(`[XTS] Kdf_GenerateSecret_Undefined_001 error code: ${err.code}`);
            expect(err.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
          done();
        });
      } catch (error) {
        console.error(`[XTS] Kdf_GenerateSecret_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Null_002
     * @tc.number SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Null_002
     * @tc.desc   Kdf.generateSecret with null parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Null_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
        await kdf.generateSecret(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Kdf_GenerateSecret_Null_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Undefined_002
     * @tc.number SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Undefined_002
     * @tc.desc   Kdf.generateSecret with undefined parameter using promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Kdf_GenerateSecret_Undefined_002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
        await kdf.generateSecret(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Kdf_GenerateSecret_Undefined_002 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Kdf_GenerateSecretSync_Null_001
     * @tc.number SUB_Security_Crypto_Framework_Kdf_GenerateSecretSync_Null_001
     * @tc.desc   Kdf.generateSecretSync with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Kdf_GenerateSecretSync_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
        kdf.generateSecretSync(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Kdf_GenerateSecretSync_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_Kdf_GenerateSecretSync_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_Kdf_GenerateSecretSync_Undefined_001
     * @tc.desc   Kdf.generateSecretSync with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_Kdf_GenerateSecretSync_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("PBKDF2|SHA256");
        kdf.generateSecretSync(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Kdf_GenerateSecretSync_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SM2CryptoUtil_GenCipherTextBySpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SM2CryptoUtil_GenCipherTextBySpec_Null_001
     * @tc.desc   SM2CryptoUtil.genCipherTextBySpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SM2CryptoUtil_GenCipherTextBySpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SM2CryptoUtil.genCipherTextBySpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SM2CryptoUtil_GenCipherTextBySpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SM2CryptoUtil_GenCipherTextBySpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SM2CryptoUtil_GenCipherTextBySpec_Undefined_001
     * @tc.desc   SM2CryptoUtil.genCipherTextBySpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SM2CryptoUtil_GenCipherTextBySpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SM2CryptoUtil.genCipherTextBySpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SM2CryptoUtil_GenCipherTextBySpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SM2CryptoUtil_GetCipherTextSpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SM2CryptoUtil_GetCipherTextSpec_Null_001
     * @tc.desc   SM2CryptoUtil.getCipherTextSpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SM2CryptoUtil_GetCipherTextSpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SM2CryptoUtil.getCipherTextSpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SM2CryptoUtil_GetCipherTextSpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SM2CryptoUtil_GetCipherTextSpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SM2CryptoUtil_GetCipherTextSpec_Undefined_001
     * @tc.desc   SM2CryptoUtil.getCipherTextSpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SM2CryptoUtil_GetCipherTextSpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SM2CryptoUtil.getCipherTextSpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SM2CryptoUtil_GetCipherTextSpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignatureSpec_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignatureSpec_Null_001
     * @tc.desc   SignatureUtils.genEccSignatureSpec with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignatureSpec_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SignatureUtils.genEccSignatureSpec(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SignatureUtils_GenEccSignatureSpec_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignatureSpec_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignatureSpec_Undefined_001
     * @tc.desc   SignatureUtils.genEccSignatureSpec with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignatureSpec_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SignatureUtils.genEccSignatureSpec(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SignatureUtils_GenEccSignatureSpec_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignature_Null_001
     * @tc.number SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignature_Null_001
     * @tc.desc   SignatureUtils.genEccSignature with null parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignature_Null_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SignatureUtils.genEccSignature(null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SignatureUtils_GenEccSignature_Null_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignature_Undefined_001
     * @tc.number SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignature_Undefined_001
     * @tc.desc   SignatureUtils.genEccSignature with undefined parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Crypto_Framework_SignatureUtils_GenEccSignature_Undefined_001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        cryptoFramework.SignatureUtils.genEccSignature(undefined);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] SignatureUtils_GenEccSignature_Undefined_001 "${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

  });

  

}
