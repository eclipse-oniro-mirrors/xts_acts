/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import cryptoarchitecture from 'libcryptoarchitecture.so'

export default function CryptoArchitecture3Test() {
  describe('CryptoArchitecture3Test', () => {

    /**
     * @tc.number  SUB_CRYPTOVERIFY_SETPARAM_0300
     * @tc.name    OHCryptoVerifySetParam003
     * @tc.desc    test OH_CryptoVerify_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoVerifySetParam003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoVerifySetParam003 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifySetParamNotSupport();
        console.info("====>OHCryptoVerifySetParam003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoVerifySetParam003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSIGN_INIT_0300
     * @tc.name    OHCryptoSignInit003
     * @tc.desc    test OH_CryptoSign_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSignInit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoSignInit003 start====");
        let result : number = cryptoarchitecture.OHCryptoSignInitOpertionError();
        console.info("====>OHCryptoSignInit003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSignInit003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSIGN_UPDATE_0300
     * @tc.name    OHCryptoSignUpdate003
     * @tc.desc    test OH_CryptoSign_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSignUpdate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoSignUpdate003 start====");
        let result : number = cryptoarchitecture.OHCryptoSignUpdateOpertionError();
        console.info("====>OHCryptoSignUpdate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSignUpdate003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOVERIFY_RECOVER_0300
     * @tc.name    OHCryptoVerifyRecover003
     * @tc.desc    test OH_CryptoVerify_Recover
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoVerifyRecover003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoVerifyRecover003 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyRecoverOpertionError();
        console.info("====>OHCryptoVerifyRecover003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoVerifyRecover003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSIGN_FINAL_0300
     * @tc.name    OHCryptoSignFinal003
     * @tc.desc    test OH_CryptoSign_Final
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSignFinal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoSignFinal003 start====");
        let result : number = cryptoarchitecture.OHCryptoSignFinalOpertionError();
        console.info("====>OHCryptoSignFinal003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSignFinal003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSIGN_SETPARAM_0300
     * @tc.name    OHCryptoSignSetParam003
     * @tc.desc    test OH_CryptoSign_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSignSetParam003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoSignSetParam003 start====");
        let result : number = cryptoarchitecture.OHCryptoSignSetParamNotSupport();
        console.info("====>OHCryptoSignSetParam003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSignSetParam003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSIGN_GETPARAM_0300
     * @tc.name    OHCryptoSignGetParam003
     * @tc.desc    test OH_CryptoSign_GetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSignGetParam003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoSignGetParam003 start====");
        let result : number = cryptoarchitecture.OHCryptoSignGetParamOpertionError();
        console.info("====>OHCryptoSignGetParam003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSignGetParam003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOECCSIGNATURESPEC_CREATE_0300
     * @tc.name    OHCryptoEccSignatureSpecCreate003
     * @tc.desc    test OH_CryptoEccSignatureSpec_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoEccSignatureSpecCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoEccSignatureSpecCreate003 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecCreateOpertionError();
        console.info("====>OHCryptoEccSignatureSpecCreate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEccSignatureSpecCreate003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSYMCIPHER_CREATE_0300
     * @tc.name    OHCryptoSymCipherCreate003
     * @tc.desc    test OH_CryptoSymCipher_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSymCipherCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoSymCipherCreate003 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherCreateNotSupport();
        console.info("====>OHCryptoSymCipherCreate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSymCipherCreate003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOSYMKEYGENERATOR_CREATE_0300
     * @tc.name    OHCryptoSymKeyGeneratorCreate003
     * @tc.desc    test OH_CryptoSymKeyGenerator_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('OHCryptoSymKeyGeneratorCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSymKeyGeneratorCreate003 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorCreateNotSupport();
        console.info("====>OHCryptoSymKeyGeneratorCreate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSymKeyGeneratorCreate003 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })
  })
}
