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
import * as commonUtils from './utils/common/commonUtils';
import * as negotiateAlgSyncUtils from './utils/negotiate/negotiateAlgSync';


export default function SecurityCryptoFwAgreementSyncTestUnit() {
  describe('SecurityCryptoFwAgreementSyncTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0100
     * @tc.name Test algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0100", 0, async (done: Function) => {
      try {
        for (let algName of negotiateAlgSyncUtils.ECDH_SPEC) {
          let keyAlgName: string = algName;
          if (algName === "ECC") {
            keyAlgName = "ECC256";
          }
          let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let secret_A: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
          let secret_B: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_B.pubKey, keyPair_A.priKey);
          let ret: boolean = commonUtils.compareDataBlob(secret_A, secret_B);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0200
     * @tc.name Test algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0200", 0, async (done: Function) => {
      try {
        for (let algName of negotiateAlgSyncUtils.X25519_SPEC) {
          let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
          let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
          let secret_A: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
          let secret_B: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_B.pubKey, keyPair_A.priKey);
          let ret: boolean = commonUtils.compareDataBlob(secret_A, secret_B);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0300
     * @tc.name Test algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0300", 0, async (done: Function) => {
      try {
        for (let algName of negotiateAlgSyncUtils.DH_SPEC) {
          let keyAlgName: string = algName;
          if (algName === "DH") {
            keyAlgName = "DH_modp2048";
          }
          let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let secret_A: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
          let secret_B: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_B.pubKey, keyPair_A.priKey);
          let ret: boolean = commonUtils.compareDataBlob(secret_A, secret_B);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0400
     * @tc.name Test algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0400", 0, async (done: Function) => {
      try {
        let algName: string = "SM2_256";
        let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
        let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
        negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0500
     * @tc.name Test algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0500", 0, async (done: Function) => {
      let keyAlgName_A: string = "DH_modp1536";
      let keyAlgName_B: string = "DH_modp2048";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_A);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_B);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0600
     * @tc.name Test algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0600", 0, async (done: Function) => {
      let keyAlgName_A: string = "ECC224";
      let keyAlgName_B: string = "ECC256";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_A);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_B);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0700
     * @tc.name Test agreeAlg algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is agreeAlg
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0700", 0, async (done: Function) => {
      let keyAlgName_A: string = "ECC521";
      let keyAlgName_B: string = "ECC384";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_A);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_B);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0800
     * @tc.name Test agreeAlg algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is agreeAlg
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0800", 0, async (done: Function) => {
      let keyAlgName: string = "ECC521";
      let keyAlgName_B: string = "DH_modp2048";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });


  });
}