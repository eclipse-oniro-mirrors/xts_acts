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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as pkcs8Utils from './utils/pkcs8/pkcs8Utils';



export default function SecurityCryptoFwECCRfc5208TestUnit() {
  describe('SecurityCryptoFwECCRfc5208TestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0100
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_1) {
          let dataKeyPair: pkcs8Utils.dataKeyPair = await pkcs8Utils.generateRfc5915KeyPairEncoded(algName);
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.convertDataKeyPairToKeyPair(algName, dataKeyPair);
          pkcs8Utils.generatePriKeyDerData(keyPair);
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0200
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_1) {
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5915KeyPair(algName);
          let dataDerKeyPair: cryptoFramework.DataBlob = pkcs8Utils.generatePriKeyDerData(keyPair);
          let convertRFC5208KeyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5208KeyPair(algName,
            {dataPubKey:keyPair.pubKey.getEncoded(), dataPriKey: dataDerKeyPair});
          let convertPubKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.pubKey.getEncoded();
          let convertPriKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.priKey.getEncoded();
          await pkcs8Utils.convertDataKeyPairToKeyPair(algName, {
            dataPriKey: convertPriKey, dataPubKey: convertPubKey
          });
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0201
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0201
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_2) {
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5915KeyPair(algName);
          let dataDerKeyPair: cryptoFramework.DataBlob = pkcs8Utils.generatePriKeyDerData(keyPair);
          let convertRFC5208KeyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5208KeyPair(algName,
            {dataPubKey:keyPair.pubKey.getEncoded(), dataPriKey: dataDerKeyPair});
          let convertPubKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.pubKey.getEncoded();
          let convertPriKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.priKey.getEncoded();
          await pkcs8Utils.convertDataKeyPairToKeyPair(algName, {
            dataPriKey: convertPriKey, dataPubKey: convertPubKey
          });
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0202
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0202
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_3) {
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5915KeyPair(algName);
          let dataDerKeyPair: cryptoFramework.DataBlob = pkcs8Utils.generatePriKeyDerData(keyPair);
          let convertRFC5208KeyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5208KeyPair(algName,
            {dataPubKey:keyPair.pubKey.getEncoded(), dataPriKey: dataDerKeyPair});
          let convertPubKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.pubKey.getEncoded();
          let convertPriKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.priKey.getEncoded();
          await pkcs8Utils.convertDataKeyPairToKeyPair(algName, {
            dataPriKey: convertPriKey, dataPubKey: convertPubKey
          });
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0300
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024|PRIMES_2";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.pubKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`RSA PubKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0400
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0400
     * @tc.desc   algorithm is DSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "DSA1024";
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        if (pkcs8Utils.keys.key_1024) {
          let priKey: cryptoFramework.DataBlob = {data: new Uint8Array(pkcs8Utils.keys.key_1024.pri)}
          let pubKey: cryptoFramework.DataBlob = {data: new Uint8Array(pkcs8Utils.keys.key_1024.pub)};
          keyPair = await cipher.convertKey(pubKey, priKey)
        }
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`DSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`DSA “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0500
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0500
     * @tc.desc   algorithm is SM2_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "SM2_256";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0600
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0600
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "Ed25519";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0700
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0700
     * @tc.desc   algorithm is DH_modp2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "DH_modp2048";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ECCRFC5915_Func_0800
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0800
     * @tc.desc   algorithm is X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "X25519";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}