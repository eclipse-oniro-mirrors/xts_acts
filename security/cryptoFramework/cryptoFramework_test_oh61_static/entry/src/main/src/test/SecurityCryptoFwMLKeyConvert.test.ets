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
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { compareUint8Array } from './utils/common/commonUtils';
import { BusinessError } from '@ohos.base';


export default function SecurityCryptoFwMLKeyConvertTestUnit() {
  describe('SecurityCryptoFwMLKeyConvertTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0100
     * @tc.desc   ML-KEM async public key conversion test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyData.length).assertEqual(1184);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let convertedKeyPair: cryptoFramework.KeyPair = await gen2.convertKey({data: pubKeyData}, null);
        expect(convertedKeyPair !== null).assertTrue();
        expect(convertedKeyPair.pubKey !== null).assertTrue();
        let convertedPubKeyData: Uint8Array = await convertedKeyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let ret: boolean = compareUint8Array(pubKeyData, convertedPubKeyData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Convert_Async_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0200
     * @tc.desc   ML-KEM async keypair conversion test (RAW + seed).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let priKeyData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        let seedData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let converted1: cryptoFramework.KeyPair = await gen2.convertKey({data: pubKeyData}, {data: priKeyData});
        expect(converted1.pubKey !== null).assertTrue();
        expect(converted1.priKey !== null).assertTrue();
        let converted2: cryptoFramework.KeyPair = await gen2.convertKey({data: pubKeyData}, {data: seedData});
        expect(converted2.priKey !== null).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Convert_Async_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_Convert_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_Convert_Async_Func_0100
     * @tc.desc   ML-DSA async key conversion test (pub key + keypair).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_Convert_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
        let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        let priKeyData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        let seedData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let convertedPub: cryptoFramework.KeyPair = await gen2.convertKey({data: pubKeyData}, null);
        expect(convertedPub.pubKey !== null).assertTrue();
        let converted1: cryptoFramework.KeyPair = await gen2.convertKey({data: pubKeyData}, {data: priKeyData});
        expect(converted1.priKey !== null).assertTrue();
        let converted2: cryptoFramework.KeyPair = await gen2.convertKey({data: pubKeyData}, {data: seedData});
        expect(converted2.priKey !== null).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_DSA_Convert_Async_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Sync_Func_0100
     * @tc.desc   ML-KEM sync public key conversion test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair1: cryptoFramework.KeyPair = gen1.generateKeyPairSync();
        let pubKeyData: Uint8Array = keyPair1.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        expect(pubKeyData.length).assertEqual(1184);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let convertedKeyPair: cryptoFramework.KeyPair = gen2.convertKeySync({data: pubKeyData}, null);
        expect(convertedKeyPair !== null).assertTrue();
        expect(convertedKeyPair.pubKey !== null).assertTrue();
        let convertedPubKeyData: Uint8Array = convertedKeyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let ret: boolean = compareUint8Array(pubKeyData, convertedPubKeyData);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Convert_Sync_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Sync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Sync_Func_0200
     * @tc.desc   ML-KEM sync keypair conversion test (RAW + seed).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Sync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let keyPair1: cryptoFramework.KeyPair = gen1.generateKeyPairSync();
        let pubKeyData: Uint8Array = keyPair1.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
        let priKeyData: Uint8Array = keyPair1.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
        let seedData: Uint8Array = keyPair1.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
        let converted1: cryptoFramework.KeyPair = gen2.convertKeySync({data: pubKeyData}, {data: priKeyData});
        expect(converted1.pubKey !== null).assertTrue();
        expect(converted1.priKey !== null).assertTrue();
        let converted2: cryptoFramework.KeyPair = gen2.convertKeySync({data: pubKeyData}, {data: seedData});
        expect(converted2.priKey !== null).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_KEM_Convert_Sync_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_Convert_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_Convert_Sync_Func_0100
     * @tc.desc   ML-DSA sync key conversion test (pub key + keypair).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_Convert_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let keyPair1: cryptoFramework.KeyPair = gen1.generateKeyPairSync();
        let pubKeyData: Uint8Array = keyPair1.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
        let priKeyData: Uint8Array = keyPair1.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
        let seedData: Uint8Array = keyPair1.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
        let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
        let convertedPub: cryptoFramework.KeyPair = gen2.convertKeySync({data: pubKeyData}, null);
        expect(convertedPub.pubKey !== null).assertTrue();
        let converted1: cryptoFramework.KeyPair = gen2.convertKeySync({data: pubKeyData}, {data: priKeyData});
        expect(converted1.priKey !== null).assertTrue();
        let converted2: cryptoFramework.KeyPair = gen2.convertKeySync({data: pubKeyData}, {data: seedData});
        expect(converted2.priKey !== null).assertTrue();
      } catch (error) {
        console.error(`[XTS] ML_DSA_Convert_Sync_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_Convert_Async_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_Convert_Async_Func_0200
     * @tc.desc   ML-DSA-65 ML-DSA-44 key conversion test (pub key + keypair).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_Convert_Async_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-44");
          let keyPair: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          let priKeyData: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          await gen2.convertKey({data: pubKeyData}, {data: priKeyData});
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] ML_DSA_Convert_Async_Func_0200 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0300
     * @tc.desc   ML-KEM-1024 ML-KEM-768 key conversion test (pub key + keypair).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Async_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-1024");
          let keyPair: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let pubKeyData: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          let priKeyData: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          await gen2.convertKey({data: pubKeyData}, {data: priKeyData});
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] ML_KEM_Convert_Async_Func_0300 ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_ConvertPem_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_ConvertPem_Async_Func_0100
     * @tc.desc   ML-KEM async convertPemKey test (full keypair + pubKey only + priKey only).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_ConvertPem_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let rawPubKey: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          let rawPriKey: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          let pubPem: string = keyPair1.pubKey.getEncodedPem("X509");
          expect(pubPem.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
          let priPem: string = keyPair1.priKey.getEncodedPem("PKCS8");
          expect(priPem.indexOf("BEGIN PRIVATE KEY") >= 0).assertTrue();

          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedFull: cryptoFramework.KeyPair = await gen2.convertPemKey(pubPem, priPem);
          expect(convertedFull.pubKey !== null).assertTrue();
          expect(convertedFull.priKey !== null).assertTrue();
          let convertedPubRaw: Uint8Array = await convertedFull.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, convertedPubRaw)).assertTrue();
          let convertedPriRaw: Uint8Array = await convertedFull.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          expect(compareUint8Array(rawPriKey, convertedPriRaw)).assertTrue();

          let gen3: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedPubOnly: cryptoFramework.KeyPair = await gen3.convertPemKey(pubPem, null);
          expect(convertedPubOnly.pubKey !== null).assertTrue();
          let pubOnlyRaw: Uint8Array = await convertedPubOnly.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, pubOnlyRaw)).assertTrue();

          let gen4: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedPriOnly: cryptoFramework.KeyPair = await gen4.convertPemKey(null, priPem);
          expect(convertedPriOnly.priKey !== null).assertTrue();
          expect(convertedPriOnly.pubKey !== null).assertTrue();
          let priOnlyRaw: Uint8Array = await convertedPriOnly.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          expect(compareUint8Array(rawPriKey, priOnlyRaw)).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_KEM_ConvertPem_Async_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_ConvertPem_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_ConvertPem_Async_Func_0100
     * @tc.desc   ML-DSA async convertPemKey test (full keypair + pubKey only + priKey only).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_ConvertPem_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let rawPubKey: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          let rawPriKey: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          let pubPem: string = keyPair1.pubKey.getEncodedPem("X509");
          expect(pubPem.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
          let priPem: string = keyPair1.priKey.getEncodedPem("PKCS8");
          expect(priPem.indexOf("BEGIN PRIVATE KEY") >= 0).assertTrue();

          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedFull: cryptoFramework.KeyPair = await gen2.convertPemKey(pubPem, priPem);
          expect(convertedFull.pubKey !== null).assertTrue();
          expect(convertedFull.priKey !== null).assertTrue();
          let convertedPubRaw: Uint8Array = await convertedFull.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, convertedPubRaw)).assertTrue();

          let gen3: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedPubOnly: cryptoFramework.KeyPair = await gen3.convertPemKey(pubPem, null);
          expect(convertedPubOnly.pubKey !== null).assertTrue();
          let pubOnlyRaw: Uint8Array = await convertedPubOnly.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, pubOnlyRaw)).assertTrue();

          let gen4: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedPriOnly: cryptoFramework.KeyPair = await gen4.convertPemKey(null, priPem);
          expect(convertedPriOnly.priKey !== null).assertTrue();
          expect(convertedPriOnly.pubKey !== null).assertTrue();
          let priOnlyRaw: Uint8Array = await convertedPriOnly.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          expect(compareUint8Array(rawPriKey, priOnlyRaw)).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_DSA_ConvertPem_Async_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_ConvertPem_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_ConvertPem_Sync_Func_0100
     * @tc.desc   ML-KEM sync convertPemKeySync test (full keypair + pubKey only + priKey only).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_ConvertPem_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair1: cryptoFramework.KeyPair = gen1.generateKeyPairSync();
          let rawPubKey: Uint8Array = keyPair1.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          let rawPriKey: Uint8Array = keyPair1.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          let pubPem: string = keyPair1.pubKey.getEncodedPem("X509");
          expect(pubPem.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
          let priPem: string = keyPair1.priKey.getEncodedPem("PKCS8");
          expect(priPem.indexOf("BEGIN PRIVATE KEY") >= 0).assertTrue();

          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedFull: cryptoFramework.KeyPair = gen2.convertPemKeySync(pubPem, priPem);
          expect(convertedFull.pubKey !== null).assertTrue();
          expect(convertedFull.priKey !== null).assertTrue();
          let convertedPubRaw: Uint8Array = convertedFull.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, convertedPubRaw)).assertTrue();
          let convertedPriRaw: Uint8Array = convertedFull.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          expect(compareUint8Array(rawPriKey, convertedPriRaw)).assertTrue();

          let gen3: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedPubOnly: cryptoFramework.KeyPair = gen3.convertPemKeySync(pubPem, null);
          expect(convertedPubOnly.pubKey !== null).assertTrue();
          let pubOnlyRaw: Uint8Array = convertedPubOnly.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, pubOnlyRaw)).assertTrue();

          let gen4: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedPriOnly: cryptoFramework.KeyPair = gen4.convertPemKeySync(null, priPem);
          expect(convertedPriOnly.priKey !== null).assertTrue();
          expect(convertedPriOnly.pubKey !== null).assertTrue();
          let priOnlyRaw: Uint8Array = convertedPriOnly.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          expect(compareUint8Array(rawPriKey, priOnlyRaw)).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_KEM_ConvertPem_Sync_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_ConvertPem_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_ConvertPem_Sync_Func_0100
     * @tc.desc   ML-DSA sync convertPemKeySync test (full keypair + pubKey only + priKey only).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_ConvertPem_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair1: cryptoFramework.KeyPair = gen1.generateKeyPairSync();
          let rawPubKey: Uint8Array = keyPair1.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          let rawPriKey: Uint8Array = keyPair1.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          let pubPem: string = keyPair1.pubKey.getEncodedPem("X509");
          expect(pubPem.indexOf("BEGIN PUBLIC KEY") >= 0).assertTrue();
          let priPem: string = keyPair1.priKey.getEncodedPem("PKCS8");
          expect(priPem.indexOf("BEGIN PRIVATE KEY") >= 0).assertTrue();

          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedFull: cryptoFramework.KeyPair = gen2.convertPemKeySync(pubPem, priPem);
          expect(convertedFull.pubKey !== null).assertTrue();
          expect(convertedFull.priKey !== null).assertTrue();
          let convertedPubRaw: Uint8Array = convertedFull.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, convertedPubRaw)).assertTrue();

          let gen3: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedPubOnly: cryptoFramework.KeyPair = gen3.convertPemKeySync(pubPem, null);
          expect(convertedPubOnly.pubKey !== null).assertTrue();
          let pubOnlyRaw: Uint8Array = convertedPubOnly.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          expect(compareUint8Array(rawPubKey, pubOnlyRaw)).assertTrue();

          let gen4: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedPriOnly: cryptoFramework.KeyPair = gen4.convertPemKeySync(null, priPem);
          expect(convertedPriOnly.priKey !== null).assertTrue();
          expect(convertedPriOnly.pubKey !== null).assertTrue();
          let priOnlyRaw: Uint8Array = convertedPriOnly.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          expect(compareUint8Array(rawPriKey, priOnlyRaw)).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_DSA_ConvertPem_Sync_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Callback_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Callback_Func_0100
     * @tc.desc   ML-KEM callback convertKey public key test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Callback_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(pubKeyData.length).assertEqual(1184);
          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let convertedKeyPair: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            gen2.convertKey({data: pubKeyData}, null, (error: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (error || keyPair === undefined) {
                reject(error as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            });
          });
          expect(convertedKeyPair !== null).assertTrue();
          expect(convertedKeyPair.pubKey !== null).assertTrue();
          expect(convertedKeyPair.priKey === undefined).assertFalse();
          let convertedPubKeyData: Uint8Array = await convertedKeyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          expect(compareUint8Array(pubKeyData, convertedPubKeyData)).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_KEM_Convert_Callback_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_KEM_Convert_Callback_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ML_KEM_Convert_Callback_Func_0200
     * @tc.desc   ML-KEM callback convertKey keypair test (RAW + seed).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_KEM_Convert_Callback_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PUBLIC_RAW);
          let priKeyData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_RAW);
          let seedData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_KEM_PRIVATE_SEED);
          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-KEM-768");
          let converted1: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            gen2.convertKey({data: pubKeyData}, {data: priKeyData}, (error: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (error || keyPair === undefined) {
                reject(error as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            });
          });
          expect(converted1.pubKey !== null).assertTrue();
          expect(converted1.priKey !== null).assertTrue();
          let converted2: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            gen2.convertKey({data: pubKeyData}, {data: seedData}, (error: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (error || keyPair === undefined) {
                reject(error as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            });
          });
          expect(converted2.priKey !== null).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_KEM_Convert_Callback_0200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_ML_DSA_Convert_Callback_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ML_DSA_Convert_Callback_Func_0100
     * @tc.desc   ML-DSA callback convertKey test (pub key + keypair).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_ML_DSA_Convert_Callback_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let gen1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let keyPair1: cryptoFramework.KeyPair = await gen1.generateKeyPair();
          let pubKeyData: Uint8Array = await keyPair1.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PUBLIC_RAW);
          let priKeyData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_RAW);
          let seedData: Uint8Array = await keyPair1.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.ML_DSA_PRIVATE_SEED);
          let gen2: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("ML-DSA-65");
          let convertedPub: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            gen2.convertKey({data: pubKeyData}, null, (error: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (error || keyPair === undefined) {
                reject(error as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            });
          });
          expect(convertedPub.pubKey !== null).assertTrue();
          expect(convertedPub.priKey === undefined).assertFalse();
          let converted1: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            gen2.convertKey({data: pubKeyData}, {data: priKeyData}, (error: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (error || keyPair === undefined) {
                reject(error as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            });
          });
          expect(converted1.priKey !== null).assertTrue();
          let converted2: cryptoFramework.KeyPair = await new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
            gen2.convertKey({data: pubKeyData}, {data: seedData}, (error: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
              if (error || keyPair === undefined) {
                reject(error as Error);
              } else {
                resolve(keyPair as cryptoFramework.KeyPair);
              }
            });
          });
          expect(converted2.priKey !== null).assertTrue();
        } catch (error) {
          console.error(`[XTS] ML_DSA_Convert_Callback_0100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}
