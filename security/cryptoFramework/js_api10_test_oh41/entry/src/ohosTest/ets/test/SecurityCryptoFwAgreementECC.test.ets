/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as agreementAsyCallbackFunc from './utils/agreement/agreementAsyCallbackFunc';
import * as agreementAsyPromiseFunc from './utils/agreement/agreementAsyPromiseFunc';
import * as specUtil from './utils/common/keyGenSpecUtil';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';

export default function SecurityCryptoFwAgreementECCTestUnit() {
  describe('SecurityCryptoFwAgreementECCTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0100
     * @tc.name Test agreement with ECC, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0100", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0200
     * @tc.name Test agreement with ECC, Promise style, process success
     * @tc.desc AsyKeyGenerator with X25519Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0200", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, spec);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0300
     * @tc.name Test agreement with ECC, Callback style, process success
     * @tc.desc AsyKeyGenerator with algName X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0300", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0400
     * @tc.name Test agreement algName with ECC. Process success
     * @tc.desc createKeyAgreement with algName X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0400", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0400";
      console.log(testNumber + ": started");
      let agreementAlg: string = "X25519";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(agreement.algName == agreementAlg).assertTrue();
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0500
     * @tc.name Test agreement with ECC. Promise style. Process fail
     * @tc.desc AsyKeyGenerator with error algName Ed25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0500", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0500";
      console.log(testNumber + ": started");
      let agreementAlg: string = "Ed25519";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code == 801).assertTrue();
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0600
     * @tc.name Test agreement with ECC. Promise style. Process fail
     * @tc.desc createKeyAgreement with error algName x25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0600", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0600";
      console.log(testNumber + ": started");
      let agreementAlg: string = "x25519";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code == 401).assertTrue();
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_ECC_Func_0700
     * @tc.name Test agreement with ECC. Promise style. Process fail
     * @tc.desc generateSecret with unavailable algName x25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_ECC_Func_0700", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_ECC_Func_0700";
      console.log(testNumber + ": started");
      let agreementAlg: string = "X25519";
      let keyAlg: string = "Ed25519";
      let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(keyAlg);
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        await agreement.generateSecret(keyPair.priKey, keyPair.pubKey);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code == 17630001).assertTrue();
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
      }
      console.log(testNumber + ": succeed");
      done();
    });

  })
}