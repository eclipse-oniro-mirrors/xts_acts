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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { DataBlobMap, externalPemData } from './utils/externalPemData/externalPemData';
import * as commonUtils from './utils/common/commonUtils';


export default function SecurityCryptoFwDataBlobToPemTestUnit() {
  describe('SecurityCryptoFwDataBlobToPemTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0100
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is asy
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0100", 0, async (done: Function) => {
      let algName: string = "";
      try {
        for(let data of externalPemData) {
          algName = data.algName;
          let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          for (let pemData of data.keyPair) {
            keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
            await generator.convertPemKey(null, pemData.priKey);
            await generator.convertPemKey(pemData.pubKey, null);
            let keyAgreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
            let secretA = await keyAgreement.generateSecret(keyPair.priKey, keyPair.pubKey);
            let secretB = keyAgreement.generateSecretSync(keyPair.priKey, keyPair.pubKey);
            let ret: boolean = commonUtils.compareDataBlob(secretA, secretB);
            keyPair.priKey.clearMem();
            expect(ret).assertTrue();
          }
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0200
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is asy
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0200", 0, async (done: Function) => {
      let algName: string = "";
      try {
        for(let data of externalPemData) {
          algName = data.algName;
          let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          for (let pemData of data.keyPair) {
            keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
            await generator.convertPemKey(null, pemData.priKey);
            await generator.convertPemKey(pemData.pubKey, null);
            keyPair.priKey.clearMem();
          }
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0201
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is asy
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0201", 0, async (done: Function) => {
      let algName: string = "ECC224";
      let priKey: string =
        '-----BEGIN PRIVATE KEY-----\n'                                        +
        'MHgCAQAwEAYHKoZIzj0CAQYFK4EEACEEYTBfAgEBBBwG4S0OeZ3qf6Nn1spQJJTt\n' +
        'eVtMXgGNIqeQv3nVoTwDOgAE+IGQSpfmiPvaWwrinnRySYg/NeimiYvzY+j5wnM+\n' +
        'dXy40IDQd/3XVJ+Q7D3brvB1Y7cO/ZmaPtM=\n'                             +
        '-----END PRIVATE KEY-----\n';
      let pubKey: string =
      '-----BEGIN PUBLIC KEY-----\n'                                       +
        'ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAE+IGQSpfmiPvaWwrinnRySYg/NeimiYvz\n' +
        'Y+j5wnM+dXy40IDQd/3XVJ+Q7D3brvB1Y7cO/ZmaPtM=\n'                     +
        '-----END PUBLIC KEY-----\n'
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(pubKey, priKey);
        keyPair.priKey.clearMem();
        expect(true).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0300
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is dsa
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0300", 0, async (done: Function) => {
      let algName: string = "DSA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = pemData.algName;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0400
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is dsa
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0400", 0, async (done: Function) => {
      let algName: string = "DSA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = pemData.algName;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0500
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is x25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0500", 0, async (done: Function) => {
      let algName: string = "X25519";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0600
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is x25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0600", 0, async (done: Function) => {
      let algName: string = "X25519";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0700
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Ed25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0700", 0, async (done: Function) => {
      let algName: string = "Ed25519";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0800
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is Ed25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0800", 0, async (done: Function) => {
      let algName: string = "Ed25519";
      let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0900
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is SM2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0900", 0, async (done: Function) => {
      let algName: string = "SM2";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = pemData.algName;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1000
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is SM2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1000", 0, async (done: Function) => {
      let algName: string = "SM2";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = pemData.algName;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1100
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1100", 0, async (done: Function) => {
      let algName: string = "DH";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = pemData.algName;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1200
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1200", 0, async (done: Function) => {
      let algName: string = "DH";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = pemData.algName;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          let keyAgreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
          let secretA = await keyAgreement.generateSecret(keyPair.priKey, keyPair.pubKey);
          let secretB = keyAgreement.generateSecretSync(keyPair.priKey, keyPair.pubKey);
          let ret: boolean = commonUtils.compareDataBlob(secretA, secretB);
          keyPair.priKey.clearMem();
          expect(ret).assertTrue();
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1300
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC256
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1300", 0, async (done: Function) => {
      let algName: string = "ECC256";
      let generator: cryptoFramework.AsyKeyGenerator = {} as cryptoFramework.AsyKeyGenerator;
      try {
        generator = cryptoFramework.createAsyKeyGenerator(algName);
      } catch (error) {
        console.error(`${algName} createAsyKeyGenerator “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        await generator.convertPemKey(null, null);
      } catch (error) {
        console.error(`${algName} convertPemKey “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        generator.convertPemKeySync(null, null);
      } catch (error) {
        console.error(`${algName} convertPemKeySync “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1400
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is ECC521
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1400", 0, async (done: Function) => {
      let algName: string = "ECC521";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        algName = "ECC224"
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(data.pubKey, data.priKey);
        let keyAgreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
        let secretA = await keyAgreement.generateSecret(keyPair.priKey, keyPair.pubKey);
        let secretB = keyAgreement.generateSecretSync(keyPair.priKey, keyPair.pubKey);
        let ret: boolean = commonUtils.compareDataBlob(secretA, secretB);
        keyPair.priKey.clearMem();
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1500
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is DSA1024
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1500", 0, async (done: Function) => {
      let algName: string = "DSA1024";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        algName = "DSA2048";
        let msgLen: number = 64;
        let msg: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(data.pubKey, data.priKey);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName + "|SHA256");
        await sign.init(keyPair.priKey);
        let dataSign = await sign.sign(msg);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName + "|SHA256");
        await verify.init(keyPair.pubKey);
        let ret = await verify.verify(msg, dataSign);
        keyPair.priKey.clearMem();
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1600
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1600", 0, async (done: Function) => {
      let algName: string = "ECC521_FALSIFIED_HEAD";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        generator.convertPemKeySync(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1700
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1700", 0, async (done: Function) => {
      let algName: string = "X25519_FALSIFIED_TAIL";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1800
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is Ed25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1800", 0, async (done: Function) => {
      let algName: string = "PUB_KEY_ERROR";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1900
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is Ed25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1900", 0, async (done: Function) => {
      let algName: string = "PRI_KEY_ERROR";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        generator.convertPemKeySync(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2000
     * @tc.name Test asy algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is OH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2000", 0, async (done: Function) => {
      let algName: string = "NOT_FOUND_PEM_HEAD";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        generator.convertPemKeySync(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2100
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is OH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2100", 0, async (done: Function) => {
      let algName: string = "NOT_FOUND_PEM_TAIL";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2200
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC224
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2200", 0, async (done: Function) => {
      let algName: string = "PRI_KEY_ENCRYPTED";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2300
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC384
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2300", 0, async (done: Function) => {
      let algName: string = "PRI_FALSIFIED_PRIME";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2400
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC384
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2400", 0, async (done: Function) => {
      let algName: string = "PRI_FALSIFIED_CURVE_NAME";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2500
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is brainpool_p160r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2500", 0, async (done: Function) => {
      let algName: string = "ECC_160R1";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2600
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC384
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2600", 0, async (done: Function) => {
      let algName: string = "PRI_DEL_PEM_DATA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(data.pubKey, data.priKey);
        keyPair.priKey.clearMem();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2700
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is DSA1024
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2700", 0, async (done: Function) => {
      let algName: string = "PRI_DSA_FALSIFIED_OBJECT";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2800
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2800", 0, async (done: Function) => {
      let algName: string = "PRI_FALSIFIED_DATA_TYPE";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2900
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is SM2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2900", 0, async (done: Function) => {
      let algName: string = "SM2_FALSIFIED_OBJECT_ONE";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3000
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is SM2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3000", 0, async (done: Function) => {
      let algName: string = "SM2_FALSIFIED_OBJECT_TWO";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3100
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3100", 0, async (done: Function) => {
      let algName: string = "PRI_PUB_FROM_DIFF_KEYPAIR";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3200
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3200", 0, async (done: Function) => {
      let algName: string = "PRI_PUB_FROM_DIFF_ALGO";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3300
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ENC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3300", 0, async (done: Function) => {
      let algName: string = "FALSIFIED_PRI_ENC_BEGIN";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3400
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ENC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3400", 0, async (done: Function) => {
      let algName: string = "FALSIFIED_PRI_ENC_ALL";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3500
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is PKCS12
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3500", 0, async (done: Function) => {
      let algName: string = "GET_PRI_OF_PKCS12_FILE";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(data.pubKey, data.priKey);
        keyPair.priKey.clearMem();
        expect(null).assertNull();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3600
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is PKCS12
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3600", 0, async (done: Function) => {
      let algName: string = "PKCS12";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3700
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is PKCS7
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3700", 0, async (done: Function) => {
      let algName: string = "PKCS7";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3800
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC256
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3800", 0, async (done: Function) => {
      let algName: string = "PEM_WITH_DIRTY_DATA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3900
     * @tc.name Test asy algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC256
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3900", 0, async (done: Function) => {
      let algName: string = "PEM_WITH_PKCS8_NOT_PKCS8";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = data.algName;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

  });
}