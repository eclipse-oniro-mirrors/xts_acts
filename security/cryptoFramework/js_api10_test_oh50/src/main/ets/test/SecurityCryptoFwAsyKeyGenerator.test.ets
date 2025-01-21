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
import * as asyKeySyncUtils from './utils/syncAsyKey/syncAsyKeyUtils';
import * as commonUtils from './utils/common/commonUtils';


export default function SecurityCryptoFwAsyKeyGeneratorTestUnit() {
  describe('SecurityCryptoFwAsyKeyGeneratorTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0100
     * @tc.name Test Generator Asymmetric Key algName with RSA. Sync style. Process success
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0100", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_RSA_KEY_SPEC) {
          let algName: string = asyKeySpecs[0][0];
          let primes: string[] = asyKeySpecs[1];
          for (let prime of primes) {
            let keyAlgName: string = algName + "|" + prime;
            let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(keyAlgName);
            let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
            let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
            let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(keyAlgName, pubKeyBlob, priKeyBlob);
            let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
            let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
            let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
            ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0200
     * @tc.name Test Generator Asymmetric Key algName with ECC. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0200", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0201
     * @tc.name Test Generator Asymmetric Key algName with ECC. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0201", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_ECC_KEY_SPEC_2) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0202
     * @tc.name Test Generator Asymmetric Key algName with ECC. Sync style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0202", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_ECC_KEY_SPEC_3) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0300
     * @tc.name Test Generator Asymmetric Key algName with DSA. Sync style. Process success
     * @tc.desc algorithm is DSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0300", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DSA_KEY_SPEC_1) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0301
     * @tc.name Test Generator Asymmetric Key algName with DSA. Sync style. Process success
     * @tc.desc algorithm is DSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0301", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DSA_KEY_SPEC_2) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0400
     * @tc.name Test Generator Asymmetric Key algName with SM2. Sync style. Process success
     * @tc.desc algorithm is SM2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0400", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_SM2_KEY_SPEC) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0500
     * @tc.name Test Generator Asymmetric Key algName with 25519. Sync style. Process success
     * @tc.desc algorithm is 25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0500", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_25519_KEY_SPEC) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0600
     * @tc.name Test Generator Asymmetric Key algName with DH. Sync style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0600", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_1) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0601
     * @tc.name Test Generator Asymmetric Key algName with DH. Sync style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0601", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_2) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0602
     * @tc.name Test Generator Asymmetric Key algName with DH. Sync style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0602", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_3) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0603
     * @tc.name Test Generator Asymmetric Key algName with DH. Sync style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0603", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_4) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0604
     * @tc.name Test Generator Asymmetric Key algName with DH. Sync style. Process success
     * @tc.desc algorithm is DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0604", 0, async (done: Function) => {
      try {
        for (let asyKeySpecs of asyKeySyncUtils.ASY_DH_KEY_SPEC_5) {
          let algName: string = asyKeySpecs;
          let keyPair: cryptoFramework.KeyPair = await asyKeySyncUtils.createAsyKeySync(algName);
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0700
     * @tc.name Test Generator Asymmetric Key algName with SM2 Spec. Sync style. Process success
     * @tc.desc algorithm is SM2 Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0700", 0, async (done: Function) => {
      let sm2KeyPairSpec = asyKeySyncUtils.genSM2KeyPairSpec();
      let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(sm2KeyPairSpec);
      try {
        let keyPair = generatorBySpec.generateKeyPairSync();
        if (keyPair != null) {
          let sm2CurveName: string | number | bigint = keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
          expect(sm2CurveName).assertEqual("NID_sm2");
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0800
     * @tc.name Test Generator Asymmetric Key algName with RSA Spec. Sync style. Process success
     * @tc.desc algorithm is RSA Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0800", 0, async (done: Function) => {
      try {
        let rsaPubKeySpec = asyKeySyncUtils.genRsa2048PubKeySpec();
        let rsaGeneratorSpec = cryptoFramework.createAsyKeyGeneratorBySpec(rsaPubKeySpec);
        let pubKey = rsaGeneratorSpec.generatePubKeySync();
        if (pubKey != null) {
          let nBN = pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.RSA_N_BN);
          let eBN = pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.RSA_PK_BN);
          if (asyKeySyncUtils.compareRsaPubKeyBySpec(rsaPubKeySpec, nBN, eBN) != true) {
            expect(null).assertFail();
          } else {
            expect(null).assertNull();
          }
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0900
     * @tc.name Test Generator Asymmetric Key algName with ECC Spec. Sync style. Process success
     * @tc.desc algorithm is ECC Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_0900", 0, async (done: Function) => {
      try {
        for (let algName of asyKeySyncUtils.ASY_ECC_KEY_SPEC_1) {
          let commKeySpec = asyKeySyncUtils.genEccCommonSpec();
          let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(commKeySpec);
          let keyPair: cryptoFramework.KeyPair = generatorBySpec.generateKeyPairSync();
          asyKeySyncUtils.showEccSpecDetailInfo(keyPair.priKey, "priKey");
          let pubKeyBlob: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
          let priKeyBlob: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, pubKeyBlob, priKeyBlob);
          let conPubKeyBlob: cryptoFramework.DataBlob = convKeyPair.pubKey.getEncoded();
          let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
          let ret: boolean = commonUtils.compareDataBlob(pubKeyBlob, conPubKeyBlob);
          ret = ret && commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1000
     * @tc.name Test Generator Asymmetric Key algName with ECC Spec. Sync style. Process success
     * @tc.desc algorithm is ECC Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1000", 0, async (done: Function) => {
      try {
        let algName: string = "ECC256";
        let a: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE');
        let b: bigint = BigInt('0xB4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB4');
        let p: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000001');
        let gX: bigint = BigInt('0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21');
        let gY: bigint = BigInt('0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34');
        let n: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D');
        let h: number = 1;
        let sk: bigint = BigInt('0x0038939bfb7af5365552c34ff4dfc256c928211119e80f876d97724b98');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        let priKey: cryptoFramework.PriKey = generatorBySpec.generatePriKeySync();
        let priKeyBlob: cryptoFramework.DataBlob = priKey.getEncoded();
        let convKeyPair: cryptoFramework.KeyPair = asyKeySyncUtils.convertAsyKeySync(algName, null, priKeyBlob);
        let conPriKeyBlob: cryptoFramework.DataBlob = convKeyPair.priKey.getEncoded();
        let ret = commonUtils.compareDataBlob(priKeyBlob, conPriKeyBlob);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1100
     * @tc.name Test Generator Asymmetric Key algName with ECC Spec. Sync style. Process success
     * @tc.desc algorithm is ECC Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1100", 0, async (done: Function) => {
      try {
        let a: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE');
        let b: bigint = BigInt('0xB4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB4');
        let p: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000001');
        let gX: bigint = BigInt('0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21');
        let gY: bigint = BigInt('0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e56');
        let n: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D');
        let h: number = 1;
        let sk: bigint = BigInt('0x0038939bfb7af5365552c34ff4dfc256c928211119e80f876d97724b98');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        generatorBySpec.generatePriKeySync();
        expect(null).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1200
     * @tc.name Test Generator Asymmetric Key algName with ECC Spec. Sync style. Process success
     * @tc.desc algorithm is ECC Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1200", 0, async (done: Function) => {
      try {
        let a: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE');
        let b: bigint = BigInt('0xB4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB4');
        let p: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000015C1D21');
        let gX: bigint = BigInt('0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21');
        let gY: bigint = BigInt('0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34');
        let n: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D');
        let h: number = 1;
        let sk: bigint = BigInt('0x0038939bfb7af5365552c34ff4dfc256c928211119e80f876d97724b98');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        generatorBySpec.generatePriKeySync();
        expect(null).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1300
     * @tc.name Test Generator Asymmetric Key algName with ECC Spec. Sync style. Process success
     * @tc.desc algorithm is ECC Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_Func_1300", 0, async (done: Function) => {
      try {
        let a: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE');
        let b: bigint = BigInt('0xB4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB7');
        let p: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000001');
        let gX: bigint = BigInt('0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21');
        let gY: bigint = BigInt('0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34');
        let n: bigint = BigInt('0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D');
        let h: number = 1;
        let sk: bigint = BigInt('0x0038939bfb7af5365552c34ff4dfc256c928211119e80f876d97724b98');
        let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = asyKeySyncUtils.genEccPriKeySpec(gX, gY, a, b, p, n, h, sk);
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
        generatorBySpec.generatePriKeySync();
        expect(null).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

  }
  );
}