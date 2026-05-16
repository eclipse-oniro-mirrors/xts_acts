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
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as asyKeySyncUtils  from './utils/syncAsyKey/syncAsyKeyUtils';
import { createData } from './utils/common/commonUtils';
import { doSignSync, doVerifyPromise } from './utils/signVerify/signVerifySyncUtils';

export default function SecurityCryptoFwECEncodedDecodedTestUnit() {
  describe('SecurityCryptoFwECEncodedDecodedTestUnit', (): void => {

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0100
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0100
     * @tc.desc convertKey with EC_PUBLIC_X_Y and EC_PRIVATE_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0200
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0200
     * @tc.desc convertKey with EC_PUBLIC_X_Y and EC_PRIVATE_04_X_Y_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let msgLen: int = 16;
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let priKeyBlob: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_04_X_Y_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        let dataSign: cryptoFramework.DataBlob = doSignSync(algName + "|SHA256", convertKeyPair.priKey, msg);
        let ret: boolean = await doVerifyPromise(algName + "|SHA256", convertKeyPair.pubKey, msg, dataSign);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0300
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0300
     * @tc.desc convertKey with EC_PUBLIC_04_X_Y and EC_PRIVATE_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_04_X_Y);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = generator2.convertKeySync({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0400
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0400
     * @tc.desc convertKey with EC_PUBLIC_04_X_Y and EC_PRIVATE_04_X_Y_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_04_X_Y);
        let priKeyBlob: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_04_X_Y_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0500
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0500
     * @tc.desc convertKey with EC_PUBLIC_COMPRESS_X and EC_PRIVATE_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_COMPRESS_X);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = generator2.convertKeySync({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0600
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0600
     * @tc.desc convertKey with EC_PUBLIC_COMPRESS_X and EC_PRIVATE_04_X_Y_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_COMPRESS_X);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_04_X_Y_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0700
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0700
     * @tc.desc convertKey with ECC224
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC224';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let priKeyBlob: Uint8Array = keyPair.priKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0800
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0800
     * @tc.desc convertKey with ECC384
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC384';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = generator2.convertKeySync({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_0900
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_0900
     * @tc.desc convertKey with ECC521
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC521';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1000
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1000
     * @tc.desc convertKey with invalid Y key data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let pubKeyBlob: Uint8Array = new Uint8Array([
          0x03, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
          0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
          0xf3
        ]);
        let invalidPriKeyBlob: Uint8Array = new Uint8Array([
          0x04, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
          0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
          0xf3, 0xf2, 0x23, 0x3e, 0x90, 0x53, 0x6d, 0xe7, 0x26, 0x22, 0xad, 0x80, 0x6c, 0x7e, 0x33, 0x2e, // 0xf1->0xf2
          0x99, 0xc1, 0x8d, 0x78, 0x58, 0x4b, 0x23, 0xae, 0xd0, 0x7d, 0xa3, 0x94, 0x9f, 0x67, 0x23, 0x14,
          0xcd, 0x9a, 0x3b, 0x15, 0xe4, 0x79, 0x4b, 0x53, 0x40, 0x6f, 0xf6, 0xa6, 0x67, 0x33, 0xf7, 0xc6,
          0x7e, 0x2b, 0x0f, 0xa6, 0x49, 0x6d, 0xdb, 0x9f, 0x72, 0xa4, 0x45, 0x89, 0x68, 0xcd, 0xc4, 0xb3,
          0x7d
        ]);
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertKey({data:pubKeyBlob}, {data:invalidPriKeyBlob});
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1100
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1100
     * @tc.desc convertKey with invalid X key data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let pubKeyBlob: Uint8Array = new Uint8Array([
          0x03, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
          0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
          0xf3
        ]);
        let invalidPriKeyBlob: Uint8Array = new Uint8Array([ // 篡改0x92 -> 0x93
          0x04, 0x93, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
          0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
          0xf3, 0xf1, 0x23, 0x3e, 0x90, 0x53, 0x6d, 0xe7, 0x26, 0x22, 0xad, 0x80, 0x6c, 0x7e, 0x33, 0x2e,
          0x99, 0xc1, 0x8d, 0x78, 0x58, 0x4b, 0x23, 0xae, 0xd0, 0x7d, 0xa3, 0x94, 0x9f, 0x67, 0x23, 0x14,
          0xcd, 0x9a, 0x3b, 0x15, 0xe4, 0x79, 0x4b, 0x53, 0x40, 0x6f, 0xf6, 0xa6, 0x67, 0x33, 0xf7, 0xc6,
          0x7e, 0x2b, 0x0f, 0xa6, 0x49, 0x6d, 0xdb, 0x9f, 0x72, 0xa4, 0x45, 0x89, 0x68, 0xcd, 0xc4, 0xb3,
          0x7d
        ]);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        await generator2.convertKey({data:pubKeyBlob}, {data:invalidPriKeyBlob});
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1200
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1200
     * @tc.desc convertKey with null public key - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let nullPubKeyBlob: Uint8Array = new Uint8Array([]);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:nullPubKeyBlob}, {data:priKeyBlob});
        expect(convertKeyPair.pubKey).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1300
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1300
     * @tc.desc convertKey with null private key - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let nullPriKeyBlob: Uint8Array = new Uint8Array([]);
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:nullPriKeyBlob});
        expect(convertKeyPair.priKey).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1400
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1400
     * @tc.desc convertKey with mismatched algorithm - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName1: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName1);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
        let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
        let algName2: string = 'ECC224';
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName2);
        await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1500
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1500
     * @tc.desc convertPemKey with X509 and EC format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let msgLen: int = 16;
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
        let priKeyString: string = keyPair.priKey.getEncodedPem("EC");
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertPemKey(pubKeyString, priKeyString);
        let dataSign: cryptoFramework.DataBlob = doSignSync(algName + "|SHA256", convertKeyPair.priKey, msg);
        let ret: boolean = await doVerifyPromise(algName + "|SHA256", convertKeyPair.pubKey, msg, dataSign);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1600
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1600
     * @tc.desc convertPemKey with X509 and PKCS8 format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
        let priKeyString: string = keyPair.priKey.getEncodedPem("PKCS8");
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertPemKey(pubKeyString, priKeyString);
        expect(convertKeyPair).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1700
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1700
     * @tc.desc convertPemKey with invalid public key - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let invalidPubKeyString: string = "INVALID_PUBLIC_KEY";
        let priKeyString: string = keyPair.priKey.getEncodedPem("PKCS8");
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        await generator2.convertPemKey(invalidPubKeyString, priKeyString);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1800
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1800
     * @tc.desc convertPemKey with invalid private key - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
        let invalidPriKeyString: string = "INVALID_PRIVATE_KEY";
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        await generator2.convertPemKey(pubKeyString, invalidPriKeyString);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_1900
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_1900
     * @tc.desc convertPemKey with empty public key - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let emptyPubKeyString: string = "";
        let priKeyString: string = keyPair.priKey.getEncodedPem("PKCS8");
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertPemKey(emptyPubKeyString, priKeyString);
        expect(convertKeyPair.pubKey).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2000
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2000
     * @tc.desc convertPemKey with empty private key - expect error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let algName: string = 'ECC256';
        let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
        let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
        let emptyPriKeyString: string = "";
        let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
        let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertPemKey(pubKeyString, emptyPriKeyString);
        expect(convertKeyPair.priKey).not().assertNull();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2100
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2100
     * @tc.desc convertKey with ASY_ECC_KEY_SPEC_1 algorithms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2200
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2200
     * @tc.desc convertKey with ASY_ECC_KEY_SPEC_2 algorithms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_2) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2300
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2300
     * @tc.desc convertKey with ASY_ECC_KEY_SPEC_3 algorithms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_3) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2400
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2400
     * @tc.desc convertKey with all ASY_ECC_KEY_SPEC algorithms and EC_PUBLIC_04_X_Y
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_04_X_Y);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2500
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2500
     * @tc.desc convertKey with all ASY_ECC_KEY_SPEC algorithms and EC_PRIVATE_04_X_Y_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_X_Y);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_04_X_Y_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2600
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2600
     * @tc.desc convertKey with all ASY_ECC_KEY_SPEC algorithms and EC_PUBLIC_COMPRESS_X
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_COMPRESS_X);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2700
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2700
     * @tc.desc convertKey with all ASY_ECC_KEY_SPEC algorithms and EC_PUBLIC_04_X_Y + EC_PRIVATE_04_X_Y_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_04_X_Y);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_04_X_Y_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2800
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2800
     * @tc.desc convertKey with all ASY_ECC_KEY_SPEC algorithms and EC_PUBLIC_COMPRESS_X + EC_PRIVATE_04_X_Y_K
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyBlob: Uint8Array = await keyPair.pubKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_COMPRESS_X);
          let priKeyBlob: Uint8Array = await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_04_X_Y_K);
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertKey({data:pubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_2900
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_2900
     * @tc.desc convertPemKey with all ASY_ECC_KEY_SPEC algorithms (X509 + EC)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
          let priKeyString: string = keyPair.priKey.getEncodedPem("EC");
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertPemKey(pubKeyString, priKeyString);
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3000
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3000
     * @tc.desc convertPemKey with all ASY_ECC_KEY_SPEC algorithms (X509 + PKCS8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
        try {
          let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
          let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
          let priKeyString: string = keyPair.priKey.getEncodedPem("PKCS8");
          let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator2.convertPemKey(pubKeyString, priKeyString);
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
          expect(null).assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3100
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3100
     * @tc.desc convertKey with invalid K key data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let algName: string = 'ECC256';
          let pubKeyBlob: Uint8Array = new Uint8Array([
            0x03, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
            0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
            0xf3
          ]);
          let invalidPriKeyBlob: Uint8Array = new Uint8Array([
            0x04, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
            0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
            0xf3, 0xf1, 0x23, 0x3e, 0x90, 0x53, 0x6d, 0xe7, 0x26, 0x22, 0xad, 0x80, 0x6c, 0x7e, 0x33, 0x2e,
            0x99, 0xc1, 0x8d, 0x78, 0x58, 0x4b, 0x23, 0xae, 0xd0, 0x7d, 0xa3, 0x94, 0x9f, 0x67, 0x23, 0x14,
            0xcd, 0x9b, 0x3b, 0x15, 0xe4, 0x79, 0x4b, 0x53, 0x40, 0x6f, 0xf6, 0xa6, 0x67, 0x33, 0xf7, 0xc6, // 0x9a->0x9b
            0x7e, 0x2b, 0x0f, 0xa6, 0x49, 0x6d, 0xdb, 0x9f, 0x72, 0xa4, 0x45, 0x89, 0x68, 0xcd, 0xc4, 0xb3,
            0x7d
          ]);
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          await generator.convertKey({data:pubKeyBlob}, {data:invalidPriKeyBlob});
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3200
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3200
     * @tc.desc convertKey with invalid key data of pubKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let algName: string = 'ECC256';
          let invalidPubKeyBlob: Uint8Array = new Uint8Array([ // 0x03 -> 0x02 奇偶性
            0x02, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
            0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
            0xf3
          ]);
          let priKeyBlob: Uint8Array = new Uint8Array([
            0x04, 0x92, 0xf1, 0x30, 0xe3, 0x8f, 0xf8, 0x55, 0x4e, 0xb2, 0xb2, 0x83, 0x52, 0xbb, 0x5f, 0xfb,
            0x75, 0xf8, 0xf2, 0xce, 0x25, 0xaa, 0xfd, 0xe6, 0x18, 0xdd, 0x61, 0xe1, 0x13, 0xff, 0xfa, 0x9d,
            0xf3, 0xf1, 0x23, 0x3e, 0x90, 0x53, 0x6d, 0xe7, 0x26, 0x22, 0xad, 0x80, 0x6c, 0x7e, 0x33, 0x2e,
            0x99, 0xc1, 0x8d, 0x78, 0x58, 0x4b, 0x23, 0xae, 0xd0, 0x7d, 0xa3, 0x94, 0x9f, 0x67, 0x23, 0x14,
            0xcd, 0x9a, 0x3b, 0x15, 0xe4, 0x79, 0x4b, 0x53, 0x40, 0x6f, 0xf6, 0xa6, 0x67, 0x33, 0xf7, 0xc6,
            0x7e, 0x2b, 0x0f, 0xa6, 0x49, 0x6d, 0xdb, 0x9f, 0x72, 0xa4, 0x45, 0x89, 0x68, 0xcd, 0xc4, 0xb3,
            0x7d
          ]);
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          let convertKeyPair: cryptoFramework.KeyPair = await generator.convertKey({data:invalidPubKeyBlob}, {data:priKeyBlob});
          expect(convertKeyPair).not().assertNull();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3300
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3300
     * @tc.desc convertKey with invalid X key data of pubKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let algName: string = 'ECC256';
          let invalidPubKeyBlob: Uint8Array = new Uint8Array([ // 篡改0x96 -> 0x97
            0x04, 0x97, 0xd6, 0x95, 0xb1, 0xea, 0x7a, 0x81, 0x1f, 0xfe, 0xfb, 0x04, 0x91, 0xf4, 0x8e, 0x13,
            0x21, 0xae, 0x55, 0x58, 0xf6, 0x5a, 0x4a, 0x4d, 0xfb, 0x02, 0x9b, 0x43, 0xdb, 0x92, 0x15, 0x1d,
            0x21, 0xce, 0xa4, 0x0e, 0xbb, 0xf5, 0xf4, 0x85, 0x5c, 0xd7, 0x22, 0x4c, 0xcb, 0xfd, 0x01, 0xd7,
            0x3d, 0x4a, 0x27, 0x8c, 0x77, 0x82, 0x2d, 0xc5, 0x24, 0xbf, 0xb6, 0xff, 0xef, 0xc5, 0x0e, 0x22,
            0x43
          ]);
          let priKeyBlob: Uint8Array = new Uint8Array([
            0x41, 0x20, 0xe7, 0x4a, 0x98, 0x4a, 0x8d, 0x28, 0x46, 0xda, 0x61, 0x28, 0xb1, 0x2c, 0x76, 0x76,
            0x8e, 0x3a, 0x40, 0x21, 0x2d, 0x41, 0x18, 0x81, 0x18, 0x13, 0x0f, 0xfb, 0x3a, 0x02, 0xd5, 0x7a
          ]);
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          await generator.convertKey({data:invalidPubKeyBlob}, {data:priKeyBlob});
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3400
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3400
     * @tc.desc convertKey with invalid Y key data of pubKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let algName: string = 'ECC256';
          let invalidPubKeyBlob: Uint8Array = new Uint8Array([
            0x04, 0x97, 0xd6, 0x95, 0xb1, 0xea, 0x7a, 0x81, 0x1f, 0xfe, 0xfb, 0x04, 0x91, 0xf4, 0x8e, 0x13,
            0x21, 0xae, 0x55, 0x58, 0xf6, 0x5a, 0x4a, 0x4d, 0xfb, 0x02, 0x9b, 0x43, 0xdb, 0x92, 0x15, 0x1d,
            0x21, 0xcf, 0xa4, 0x0e, 0xbb, 0xf5, 0xf4, 0x85, 0x5c, 0xd7, 0x22, 0x4c, 0xcb, 0xfd, 0x01, 0xd7, // 0xce->0xcf
            0x3d, 0x4a, 0x27, 0x8c, 0x77, 0x82, 0x2d, 0xc5, 0x24, 0xbf, 0xb6, 0xff, 0xef, 0xc5, 0x0e, 0x22,
            0x43
          ]);
          let priKeyBlob: Uint8Array = new Uint8Array([
            0x41, 0x20, 0xe7, 0x4a, 0x98, 0x4a, 0x8d, 0x28, 0x46, 0xda, 0x61, 0x28, 0xb1, 0x2c, 0x76, 0x76,
            0x8e, 0x3a, 0x40, 0x21, 0x2d, 0x41, 0x18, 0x81, 0x18, 0x13, 0x0f, 0xfb, 0x3a, 0x02, 0xd5, 0x7a
          ]);
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          await generator.convertKey({data:invalidPubKeyBlob}, {data:priKeyBlob});
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3500
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3500
     * @tc.desc not supported algName RSA\DSA\DH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algNames: string[] = ['RSA512', 'DSA1024', 'SM2_256', 'Ed25519', 'X25519', 'DH_modp1536'];
          for (let algName of algNames) {
            console.error("+++++++++++++ algName:" + algName);
            let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
            let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
            try {
              keyPair.pubKey.getKeyDataSync(cryptoFramework.AsyKeyDataItem.EC_PUBLIC_04_X_Y);
              expect(null).assertFail();
            } catch (error) {
              console.error(`"${error}", pubkey error code: ${error.code}`);
              expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
            }
            try {
              await keyPair.priKey.getKeyData(cryptoFramework.AsyKeyDataItem.EC_PRIVATE_K);
              expect(null).assertFail();
            } catch (error) {
              console.error(`"${error}", prikey error code: ${error.code}`);
              expect(error.code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
            }
          }
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_CryptoFramework_ECC_Func_3600
     * @tc.number SUB_Security_CryptoFramework_ECC_Func_3600
     * @tc.desc convertPemKeySync with all ASY_ECC_KEY_SPEC algorithms (X509 + PKCS8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_CryptoFramework_ECC_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_2) {
          try {
            let generator1: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
            let keyPair: cryptoFramework.KeyPair = await generator1.generateKeyPair();
            let pubKeyString: string = keyPair.pubKey.getEncodedPem("X509");
            let priKeyString: string = keyPair.priKey.getEncodedPem("PKCS8");
            let generator2 = cryptoFramework.createAsyKeyGenerator(algName);
            let convertKeyPair: cryptoFramework.KeyPair = generator2.convertPemKeySync(pubKeyString, priKeyString);
            expect(convertKeyPair).not().assertNull();
          } catch (error) {
            console.error(`"${error}", error code: ${error.code}, algorithm: ${algName}`);
            expect(null).assertFail();
          }
        }
        done();
      });
  });
}

