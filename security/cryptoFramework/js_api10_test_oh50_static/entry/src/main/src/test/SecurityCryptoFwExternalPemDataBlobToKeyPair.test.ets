/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { DataBlobMap, externalPemData } from './utils/externalPemData/externalPemData';
import * as commonUtils from './utils/common/commonUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwDataBlobToPemTestUnit() {
  describe("SecurityCryptoFwDataBlobToPemTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0100
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0100
     * @tc.desc   algorithm is asy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "";
      try {
        () => {
          for(let data of externalPemData) {
            algName = (data.algName) as string;
            let keyPair: cryptoFramework.KeyPair;
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
        }();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0200
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0200
     * @tc.desc   algorithm is asy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "";
      try {
        for(let data of externalPemData) {
          algName = (data.algName) as string;
          let keyPair: cryptoFramework.KeyPair;
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          for (let pemData of data.keyPair) {
            keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
            await generator.convertPemKey(null, pemData.priKey);
            await generator.convertPemKey(pemData.pubKey, null);
            keyPair.priKey.clearMem();
          }
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0201
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0201
     * @tc.desc   algorithm is asy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0300
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0300
     * @tc.desc   algorithm is dsa
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "DSA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = (pemData.algName) as string;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0400
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0400
     * @tc.desc   algorithm is dsa
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "DSA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = (pemData.algName) as string;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0500
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0500
     * @tc.desc   algorithm is x25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "X25519";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0600
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0600
     * @tc.desc   algorithm is x25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "X25519";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0700
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0700
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "Ed25519";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0800
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0800
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "Ed25519";
      let keyPair: cryptoFramework.KeyPair;
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
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_0900
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_0900
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "SM2";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = (pemData.algName) as string;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = await generator.convertPemKey(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1000
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1000
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "SM2";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = (pemData.algName) as string;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1100
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1100
     * @tc.desc   algorithm is DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "DH";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getDataWithArray(algName);
        let keyPair: cryptoFramework.KeyPair;
        for (let pemData of data) {
          if (pemData.algName) {
            algName = (pemData.algName) as string;
          }
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
          keyPair = generator.convertPemKeySync(pemData.pubKey, pemData.priKey);
          await generator.convertPemKey(null, pemData.priKey);
          await generator.convertPemKey(pemData.pubKey, null);
          keyPair.priKey.clearMem();
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1200
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1200
     * @tc.desc   algorithm is DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "DH";
      try {
        () => {
          let dataMap: DataBlobMap = new DataBlobMap(false);
          let data = dataMap.getDataWithArray(algName);
          let keyPair: cryptoFramework.KeyPair;
          for (let pemData of data) {
            if (pemData.algName) {
              algName = (pemData.algName) as string;
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
        }();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1300
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1300
     * @tc.desc   algorithm is ECC256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "ECC256";
      let generator: cryptoFramework.AsyKeyGenerator;
      try {
        generator = cryptoFramework.createAsyKeyGenerator(algName);
      } catch (error: BusinessError) {
        console.error(`${algName} createAsyKeyGenerator “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        await generator.convertPemKey(null, null);
      } catch (error: BusinessError) {
        console.error(`${algName} convertPemKey “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      try {
        generator.convertPemKeySync(null, null);
      } catch (error: BusinessError) {
        console.error(`${algName} convertPemKeySync “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1400
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1400
     * @tc.desc   algorithm is ECC521
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1500
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1500
     * @tc.desc   algorithm is DSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "DSA1024";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        algName = "DSA2048";
        let msgLen: int = 64;
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
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1600
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1600
     * @tc.desc   algorithm is X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "ECC521_FALSIFIED_HEAD";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        generator.convertPemKeySync(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1700
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1700
     * @tc.desc   algorithm is X25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "X25519_FALSIFIED_TAIL";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1800
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1800
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PUB_KEY_ERROR";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_1900
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_1900
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_KEY_ERROR";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        generator.convertPemKeySync(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2000
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2000
     * @tc.desc   algorithm is OH_modp1536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "NOT_FOUND_PEM_HEAD";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        generator.convertPemKeySync(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2100
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2100
     * @tc.desc   algorithm is OH_modp1536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "NOT_FOUND_PEM_TAIL";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2200
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2200
     * @tc.desc   algorithm is ECC224
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_KEY_ENCRYPTED";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2300
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2300
     * @tc.desc   algorithm is ECC384
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_FALSIFIED_PRIME";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2400
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2400
     * @tc.desc   algorithm is ECC384
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_FALSIFIED_CURVE_NAME";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2500
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2500
     * @tc.desc   algorithm is brainpool_p160r1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "ECC_160R1";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2600
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2600
     * @tc.desc   algorithm is ECC384
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_DEL_PEM_DATA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(data.pubKey, data.priKey);
        keyPair.priKey.clearMem();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2700
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2700
     * @tc.desc   algorithm is DSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_DSA_FALSIFIED_OBJECT";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2800
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2800
     * @tc.desc   algorithm is DH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_FALSIFIED_DATA_TYPE";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_2900
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_2900
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "SM2_FALSIFIED_OBJECT_ONE";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3000
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3000
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "SM2_FALSIFIED_OBJECT_TWO";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3100
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3100
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_PUB_FROM_DIFF_KEYPAIR";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3200
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3200
     * @tc.desc   algorithm is ECC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PRI_PUB_FROM_DIFF_ALGO";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3300
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3300
     * @tc.desc   algorithm is ENC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "FALSIFIED_PRI_ENC_BEGIN";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3400
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3400
     * @tc.desc   algorithm is ENC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "FALSIFIED_PRI_ENC_ALL";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3500
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3500
     * @tc.desc   algorithm is PKCS12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "GET_PRI_OF_PKCS12_FILE";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(data.pubKey, data.priKey);
        keyPair.priKey.clearMem();
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3600
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3600
     * @tc.desc   algorithm is PKCS12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PKCS12";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3700
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3700
     * @tc.desc   algorithm is PKCS7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PKCS7";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3800
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3800
     * @tc.desc   algorithm is ECC256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PEM_WITH_DIRTY_DATA";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_3900
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_3900
     * @tc.desc   algorithm is ECC256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "PEM_WITH_PKCS8_NOT_PKCS8";
      try {
        let dataMap: DataBlobMap = new DataBlobMap(false);
        let data = dataMap.getData(algName);
        if (data.algName) {
          algName = (data.algName) as string;
        }
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await generator.convertPemKey(data.pubKey, data.priKey);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_4000
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_4000
     * @tc.desc   algorithm is RSA1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA1024";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey('', '');
        expect(keyPair.priKey !== undefined).assertTrue();
        expect(keyPair.pubKey !== undefined).assertTrue();
        keyPair.priKey.getEncoded();
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_4100
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_4100
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA1024";
      let pubKey: string = "-----BEGIN PUBLIC KEY-----\n" +
        "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDi9zW7r2rXcswcK8KEkOAil2Fc\n" +
        "D5y2f2SFcPj+WmxphLkICcpnMArvgin+LRZwjBjC5USmCCSjQMOmWKgKdiNT84S2\n" +
        "fQ6nG3V/iafXse9R941kM3Rfed4XjckXlrFM28gkO4d2ItahZQwrQm199JQxDsXH\n" +
        "cxbIBZqEMH02yW2SkwIDAQAB\n" +
        "-----END PUBLIC KEY-----";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(pubKey, '');
        expect(keyPair.priKey !== undefined).assertTrue();
        keyPair.priKey.getEncoded();
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DataBlobToPem_Func_4200
     * @tc.number SUB_Security_CryptoFramework_DataBlobToPem_Func_4200
     * @tc.desc   algorithm is Ed25519
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DataBlobToPem_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA1024";
      let priKey: string = "-----BEGIN PRIVATE KEY-----\n" +
        "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAOL3NbuvatdyzBwr\n" +
        "woSQ4CKXYVwPnLZ/ZIVw+P5abGmEuQgJymcwCu+CKf4tFnCMGMLlRKYIJKNAw6ZY\n" +
        "qAp2I1PzhLZ9DqcbdX+Jp9ex71H3jWQzdF953heNyReWsUzbyCQ7h3Yi1qFlDCtC\n" +
        "bX30lDEOxcdzFsgFmoQwfTbJbZKTAgMBAAECgYAxSa4JjBaPowZgN8COOUfzOxyR\n" +
        "eXJ2z0NtFxN7aPeSEph7/mRN9EjrqkCkSfZNip719APsamhKa44RWb9kRjN1ZwJp\n" +
        "8tDa3RGsg8CW5kE3exwaw49j7kq8nce+Bs3YcDyPQd/j10H7wdvfc8/MmKSDyr0x\n" +
        "jDBdBbE4oSmt3H6/wQJBAPMcY9smcSOdn+hj6ILsrB+WrRrkAw9VRDjcPxc/bZt9\n" +
        "EgYBQ7DWz+za4qHleCj7U2Yho3ZkHsbYk3SEnx+i1H8CQQDu/7CBepmVw9fC/YTc\n" +
        "jY2XJM1DQ4bonaOMGtNX8j7WAR12JrAWFey92Oekt8pbML7gmdiztKdozuvxURvw\n" +
        "8KftAkEAjPcsS5mpxt4SJ90uqCP11kc3Tr1hrNVjPpkvGBrWQm+uML8w8exNGmj9\n" +
        "OqTlHNZGUJU2xGJfmitgrRJtdhmjnwJBANKZ8VlHRYtZVgl3CNqoyboELfQ1zu2v\n" +
        "62wMP2viBUjjFqkEkmoDy+fG+OiHJAOTQr/8EZ7ZdCPBItw00uBP0EkCQQDnLklt\n" +
        "heeopxTC3VN1/Jt5xtMBTuXkpUHHoQPiA/utcQwYqlgOT6UTUVQO3/6yMiD4ogU2\n" +
        "Xr+0Wzu8l10lvf6v\n" +
        "-----END PRIVATE KEY-----";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey('', priKey);
        expect(keyPair.pubKey !== undefined).assertTrue();
        keyPair.pubKey.getEncoded();
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`${algName} “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
      }
      done();
    });

  });
}