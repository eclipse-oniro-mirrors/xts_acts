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

export default function SecurityCryptoFwMLKeyGenTestUnit() {
  describe('SecurityCryptoFwMLKeyGenTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0100
     * @tc.desc   ML-KEM-512 async key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(generator.algName).assertEqual("ML-KEM-512");
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.priKey.algName).assertEqual("ML-KEM");
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyData instanceof Uint8Array).assertTrue();
        expect(pubKeyData.length).assertEqual(800);
      } catch (error) {
        console.error(`[XTS] ML_KEM_KeyGen_Async_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0200
     * @tc.desc   ML-KEM-768 async key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(generator.algName).assertEqual("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.priKey.algName).assertEqual("ML-KEM");
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyRaw instanceof Uint8Array).assertTrue();
        expect(pubKeyRaw.length).assertEqual(1184);
        let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        expect(priKeyRaw instanceof Uint8Array).assertTrue();
        expect(priKeyRaw.length).assertEqual(2400);
        let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
        expect(seed instanceof Uint8Array).assertTrue();
        expect(seed.length).assertEqual(64);
      } catch (error) {
        console.error(`[XTS] ML_KEM_KeyGen_Async_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0300
     * @tc.desc   ML-KEM-1024 async key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Async_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
        expect(generator.algName).assertEqual("ML-KEM-1024");
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.priKey.algName).assertEqual("ML-KEM");
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(1568);
        let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(3168);
        let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
        expect(seed.length).assertEqual(64);
      } catch (error) {
        console.error(`[XTS] ML_KEM_KeyGen_Async_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0100
     * @tc.desc   ML-KEM-512 sync key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
        expect(generator.algName).assertEqual("ML-KEM-512");
        let keyPair: cryptoFramework.KeyPair = generator.generateKeyPairSync();
        expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.priKey.algName).assertEqual("ML-KEM");
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyRaw instanceof Uint8Array).assertTrue();
        expect(pubKeyRaw.length).assertEqual(800);
        let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(1632);
      } catch (error) {
        console.error(`[XTS] ML_KEM_KeyGen_Sync_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0200
     * @tc.desc   ML-KEM-768 sync key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        expect(generator.algName).assertEqual("ML-KEM-768");
        let keyPair: cryptoFramework.KeyPair = generator.generateKeyPairSync();
        let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(1184);
        let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(2400);
        let seed: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
        expect(seed.length).assertEqual(64);
      } catch (error) {
        console.error(`[XTS] ML_KEM_KeyGen_Sync_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0300
     * @tc.desc   ML-KEM-1024 sync key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Sync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
        expect(generator.algName).assertEqual("ML-KEM-1024");
        let keyPair: cryptoFramework.KeyPair = generator.generateKeyPairSync();
        let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(1568);
        let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(3168);
        let seed: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
        expect(seed.length).assertEqual(64);
      } catch (error) {
        console.error(`[XTS] ML_KEM_KeyGen_Sync_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0100
     * @tc.desc   ML-DSA-44 async key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
        expect(generator.algName).assertEqual("ML-DSA-44");
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        expect(keyPair.pubKey.algName).assertEqual("ML-DSA");
        expect(keyPair.pubKey.format).assertEqual("X.509");
        expect(keyPair.priKey.algName).assertEqual("ML-DSA");
        expect(keyPair.priKey.format).assertEqual("PKCS#8");
        let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(pubKeyRaw instanceof Uint8Array).assertTrue();
        expect(pubKeyRaw.length).assertEqual(1312);
        let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(2560);
        let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        expect(seed.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_DSA_KeyGen_Async_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0200
     * @tc.desc   ML-DSA-65 async key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        expect(generator.algName).assertEqual("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(1952);
        let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(4032);
        let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        expect(seed.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_DSA_KeyGen_Async_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0300
     * @tc.desc   ML-DSA-87 async key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Async_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-87");
        expect(generator.algName).assertEqual("ML-DSA-87");
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(2592);
        let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(4896);
        let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        expect(seed.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_DSA_KeyGen_Async_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0100
     * @tc.desc   ML-DSA-44 sync key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
        expect(generator.algName).assertEqual("ML-DSA-44");
        let keyPair: cryptoFramework.KeyPair = generator.generateKeyPairSync();
        let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(1312);
        let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(2560);
        let seed: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        expect(seed.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_DSA_KeyGen_Sync_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0200
     * @tc.desc   ML-DSA-65 sync key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair: cryptoFramework.KeyPair = generator.generateKeyPairSync();
        let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(1952);
        let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(4032);
        let seed: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        expect(seed.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_DSA_KeyGen_Sync_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0300
     * @tc.desc   ML-DSA-87 sync key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Sync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-87");
        let keyPair: cryptoFramework.KeyPair = generator.generateKeyPairSync();
        let pubKeyRaw: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        expect(pubKeyRaw.length).assertEqual(2592);
        let priKeyRaw: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        expect(priKeyRaw.length).assertEqual(4896);
        let seed: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        expect(seed.length).assertEqual(32);
      } catch (error) {
        console.error(`[XTS] ML_DSA_KeyGen_Sync_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0100
     * @tc.desc   ML-KEM-512 callback key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-512");
          expect(generator.algName).assertEqual("ML-KEM-512");
          let keyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            generator.generateKeyPair((error, keyPair) => {
              if (error) {
                reject(error);
              } else {
                resolve(keyPair);
              }
            });
          });
          expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
          expect(keyPair.pubKey.format).assertEqual("X.509");
          expect(keyPair.priKey.algName).assertEqual("ML-KEM");
          expect(keyPair.priKey.format).assertEqual("PKCS#8");
          let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(pubKeyData instanceof Uint8Array).assertTrue();
          expect(pubKeyData.length).assertEqual(800);
        } catch (error) {
          console.error(`[XTS] ML_KEM_KeyGen_Callback_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0200
     * @tc.desc   ML-KEM-768 callback key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          expect(generator.algName).assertEqual("ML-KEM-768");
          let keyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            generator.generateKeyPair((error, keyPair) => {
              if (error) {
                reject(error);
              } else {
                resolve(keyPair);
              }
            });
          });
          expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
          expect(keyPair.pubKey.format).assertEqual("X.509");
          expect(keyPair.priKey.algName).assertEqual("ML-KEM");
          expect(keyPair.priKey.format).assertEqual("PKCS#8");
          let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(pubKeyRaw instanceof Uint8Array).assertTrue();
          expect(pubKeyRaw.length).assertEqual(1184);
          let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          expect(priKeyRaw instanceof Uint8Array).assertTrue();
          expect(priKeyRaw.length).assertEqual(2400);
          let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
          expect(seed instanceof Uint8Array).assertTrue();
          expect(seed.length).assertEqual(64);
        } catch (error) {
          console.error(`[XTS] ML_KEM_KeyGen_Callback_0200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0300
     * @tc.desc   ML-KEM-1024 callback key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_KeyGen_Callback_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
          expect(generator.algName).assertEqual("ML-KEM-1024");
          let keyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            generator.generateKeyPair((error, keyPair) => {
              if (error) {
                reject(error);
              } else {
                resolve(keyPair);
              }
            });
          });
          expect(keyPair.pubKey.algName).assertEqual("ML-KEM");
          expect(keyPair.pubKey.format).assertEqual("X.509");
          expect(keyPair.priKey.algName).assertEqual("ML-KEM");
          expect(keyPair.priKey.format).assertEqual("PKCS#8");
          let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(pubKeyRaw.length).assertEqual(1568);
          let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          expect(priKeyRaw.length).assertEqual(3168);
          let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
          expect(seed.length).assertEqual(64);
        } catch (error) {
          console.error(`[XTS] ML_KEM_KeyGen_Callback_0300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0100
     * @tc.desc   ML-DSA-44 callback key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
          expect(generator.algName).assertEqual("ML-DSA-44");
          let keyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            generator.generateKeyPair((error, keyPair) => {
              if (error) {
                reject(error);
              } else {
                resolve(keyPair);
              }
            });
          });
          expect(keyPair.pubKey.algName).assertEqual("ML-DSA");
          expect(keyPair.pubKey.format).assertEqual("X.509");
          expect(keyPair.priKey.algName).assertEqual("ML-DSA");
          expect(keyPair.priKey.format).assertEqual("PKCS#8");
          let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(pubKeyRaw instanceof Uint8Array).assertTrue();
          expect(pubKeyRaw.length).assertEqual(1312);
          let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          expect(priKeyRaw.length).assertEqual(2560);
          let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
          expect(seed.length).assertEqual(32);
        } catch (error) {
          console.error(`[XTS] ML_DSA_KeyGen_Callback_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0200
     * @tc.desc   ML-DSA-65 callback key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          expect(generator.algName).assertEqual("ML-DSA-65");
          let keyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            generator.generateKeyPair((error, keyPair) => {
              if (error) {
                reject(error);
              } else {
                resolve(keyPair);
              }
            });
          });
          let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(pubKeyRaw.length).assertEqual(1952);
          let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          expect(priKeyRaw.length).assertEqual(4032);
          let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
          expect(seed.length).assertEqual(32);
        } catch (error) {
          console.error(`[XTS] ML_DSA_KeyGen_Callback_0200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0300
     * @tc.desc   ML-DSA-87 callback key generation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_KeyGen_Callback_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-87");
          expect(generator.algName).assertEqual("ML-DSA-87");
          let keyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            generator.generateKeyPair((error, keyPair) => {
              if (error) {
                reject(error);
              } else {
                resolve(keyPair);
              }
            });
          });
          let pubKeyRaw: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(pubKeyRaw.length).assertEqual(2592);
          let priKeyRaw: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          expect(priKeyRaw.length).assertEqual(4896);
          let seed: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
          expect(seed.length).assertEqual(32);
        } catch (error) {
          console.error(`[XTS] ML_DSA_KeyGen_Callback_0300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}
