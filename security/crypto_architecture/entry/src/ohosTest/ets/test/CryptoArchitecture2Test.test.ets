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

export default function CryptoArchitecture2Test() {
  describe('CryptoArchitecture2Test', () => {

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTORAND_CREATE_0100
     * @tc.name    testOHCryptoRandCreate0100
     * @tc.desc    test OH_CryptoRand_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoRandCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoRandCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoRandCreate0100();
        console.info("====>testOHCryptoRandCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoRandCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTORAND_CREATE_0200
     * @tc.name    testOHCryptoRandCreate0200
     * @tc.desc    test OH_CryptoRand_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoRandCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoRandCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoRandCreate0200();
        console.info("====>testOHCryptoRandCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoRandCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTORAND_GENERATERANDOM_0100
     * @tc.name    testOHCryptoRandGenerateRandom0100
     * @tc.desc    test OH_CryptoRand_GenerateRandom
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoRandGenerateRandom0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoRandGenerateRandom0100 start====");
        let result : number = cryptoarchitecture.OHCryptoRandGenerateRandom0100();
        console.info("====>testOHCryptoRandGenerateRandom0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoRandGenerateRandom0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTORAND_GENERATERANDOM_0200
     * @tc.name    testOHCryptoRandGenerateRandom0200
     * @tc.desc    test OH_CryptoRand_GenerateRandom
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoRandGenerateRandom0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoRandGenerateRandom0200 start====");
        let result : number = cryptoarchitecture.OHCryptoRandGenerateRandom0200();
        console.info("====>testOHCryptoRandGenerateRandom0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoRandGenerateRandom0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTORAND_SETSEED_0100
     * @tc.name    testOHCryptoRandSetSeed0100
     * @tc.desc    test OH_CryptoRand_SetSeed
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoRandSetSeed0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoRandSetSeed0100 start====");
        let result : number = cryptoarchitecture.OHCryptoRandSetSeed0100();
        console.info("====>testOHCryptoRandSetSeed0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoRandSetSeed0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTORAND_SETSEED_0200
     * @tc.name    testOHCryptoRandSetSeed0200
     * @tc.desc    test OH_CryptoRand_SetSeed
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoRandSetSeed0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoRandSetSeed0200 start====");
        let result : number = cryptoarchitecture.OHCryptoRandSetSeed0200();
        console.info("====>testOHCryptoRandSetSeed0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoRandSetSeed0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_CREATE_0100
     * @tc.name    testOHCryptoVerifyCreate0100
     * @tc.desc    test OH_CryptoVerify_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyCreate0100();
        console.info("====>testOHCryptoVerifyCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_CREATE_0200
     * @tc.name    testOHCryptoVerifyCreate0200
     * @tc.desc    test OH_CryptoVerify_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyCreate0200();
        console.info("====>testOHCryptoVerifyCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_INIT_0100
     * @tc.name    testOHCryptoVerifyInit0100
     * @tc.desc    test OH_CryptoVerify_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyInit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyInit0100 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyInit0100();
        console.info("====>testOHCryptoVerifyInit0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyInit0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_INIT_0200
     * @tc.name    testOHCryptoVerifyInit0200
     * @tc.desc    test OH_CryptoVerify_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyInit0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyInit0200 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyInit0200();
        console.info("====>testOHCryptoVerifyInit0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyInit0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_UPDATE_0100
     * @tc.name    testOHCryptoVerifyUpdate0100
     * @tc.desc    test OH_CryptoVerify_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyUpdate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyUpdate0100();
        console.info("====>testOHCryptoVerifyUpdate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyUpdate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_UPDATE_0200
     * @tc.name    testOHCryptoVerifyUpdate0200
     * @tc.desc    test OH_CryptoVerify_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyUpdate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyUpdate0200();
        console.info("====>testOHCryptoVerifyUpdate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyUpdate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_RECOVER_0100
     * @tc.name    testOHCryptoVerifyRecover0100
     * @tc.desc    test OH_CryptoVerify_Recover
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyRecover0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyRecover0100 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyRecover0100();
        console.info("====>testOHCryptoVerifyRecover0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyRecover0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_RECOVER_0200
     * @tc.name    testOHCryptoVerifyRecover0200
     * @tc.desc    test OH_CryptoVerify_Recover
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyRecover0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyRecover0200 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyRecover0200();
        console.info("====>testOHCryptoVerifyRecover0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyRecover0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_SETPARAM_0100
     * @tc.name    testOHCryptoVerifySetParam0100
     * @tc.desc    test OH_CryptoVerify_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifySetParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifySetParam0100 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifySetParam0100();
        console.info("====>testOHCryptoVerifySetParam0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifySetParam0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_SETPARAM_0200
     * @tc.name    testOHCryptoVerifySetParam0200
     * @tc.desc    test OH_CryptoVerify_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifySetParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifySetParam0200 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifySetParam0200();
        console.info("====>testOHCryptoVerifySetParam0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifySetParam0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_GETPARAM_0100
     * @tc.name    testOHCryptoVerifyGetParam0100
     * @tc.desc    test OH_CryptoVerify_GetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyGetParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyGetParam0100 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyGetParam0100();
        console.info("====>testOHCryptoVerifyGetParam0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyGetParam0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOVERIFY_GETPARAM_0200
     * @tc.name    testOHCryptoVerifyGetParam0200
     * @tc.desc    test OH_CryptoVerify_GetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoVerifyGetParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoVerifyGetParam0200 start====");
        let result : number = cryptoarchitecture.OHCryptoVerifyGetParam0200();
        console.info("====>testOHCryptoVerifyGetParam0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoVerifyGetParam0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_CREATE_0100
     * @tc.name    testOHCryptoSignCreate0100
     * @tc.desc    test OH_CryptoSign_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSignCreate0100();
        console.info("====>testOHCryptoSignCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_CREATE_0200
     * @tc.name    testOHCryptoSignCreate0200
     * @tc.desc    test OH_CryptoSign_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSignCreate0200();
        console.info("====>testOHCryptoSignCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_INIT_0100
     * @tc.name    testOHCryptoSignInit0100
     * @tc.desc    test OH_CryptoSign_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignInit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignInit0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSignInit0100();
        console.info("====>testOHCryptoSignInit0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignInit0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_INIT_0200
     * @tc.name    testOHCryptoSignInit0200
     * @tc.desc    test OH_CryptoSign_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignInit0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignInit0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSignInit0200();
        console.info("====>testOHCryptoSignInit0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignInit0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_UPDATE_0100
     * @tc.name    testOHCryptoSignUpdate0100
     * @tc.desc    test OH_CryptoSign_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignUpdate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSignUpdate0100();
        console.info("====>testOHCryptoSignUpdate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignUpdate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_UPDATE_0200
     * @tc.name    testOHCryptoSignUpdate0200
     * @tc.desc    test OH_CryptoSign_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignUpdate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSignUpdate0200();
        console.info("====>testOHCryptoSignUpdate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignUpdate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_FINAL_0100
     * @tc.name    testOHCryptoSignFinal0100
     * @tc.desc    test OH_CryptoSign_Final
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignFinal0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignFinal0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSignFinal0100();
        console.info("====>testOHCryptoSignFinal0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignFinal0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_FINAL_0200
     * @tc.name    testOHCryptoSignFinal0200
     * @tc.desc    test OH_CryptoSign_Final
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignFinal0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignFinal0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSignFinal0200();
        console.info("====>testOHCryptoSignFinal0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignFinal0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_SETPARAM_0100
     * @tc.name    testOHCryptoSignSetParam0100
     * @tc.desc    test OH_CryptoSign_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignSetParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignSetParam0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSignSetParam0100();
        console.info("====>testOHCryptoSignSetParam0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignSetParam0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_SETPARAM_0200
     * @tc.name    testOHCryptoSignSetParam0200
     * @tc.desc    test OH_CryptoSign_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignSetParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignSetParam0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSignSetParam0200();
        console.info("====>testOHCryptoSignSetParam0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignSetParam0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_GETPARAM_0100
     * @tc.name    testOHCryptoSignGetParam0100
     * @tc.desc    test OH_CryptoSign_GetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignGetParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignGetParam0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSignGetParam0100();
        console.info("====>testOHCryptoSignGetParam0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignGetParam0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

    /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSIGN_GETPARAM_0200
     * @tc.name    testOHCryptoSignGetParam0200
     * @tc.desc    test OH_CryptoSign_GetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSignGetParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHCryptoSignGetParam0200 start====");
          let result : number = cryptoarchitecture.OHCryptoSignGetParam0200();
        console.info("====>testOHCryptoSignGetParam0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSignGetParam0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

   /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_CREATE_0100
     * @tc.name    testOHCryptoEccSignatureSpecCreate0100
     * @tc.desc    test OH_CryptoEccSignatureSpec_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecCreate0100();
        console.info("====>testOHCryptoEccSignatureSpecCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

   /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_CREATE_0200
     * @tc.name    testOHCryptoEccSignatureSpecCreate0200
     * @tc.desc    test OH_CryptoEccSignatureSpec_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecCreate0200();
        console.info("====>testOHCryptoEccSignatureSpecCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

   /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_GETRANDS_0100
     * @tc.name    testOHCryptoEccSignatureSpecGetRAndS0100
     * @tc.desc    test OH_CryptoEccSignatureSpec_GetRAndS
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecGetRAndS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecGetRAndS0100 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecGetRAndS0100();
        console.info("====>testOHCryptoEccSignatureSpecGetRAndS0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecGetRAndS0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

   /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_GETRANDS_0200
     * @tc.name    testOHCryptoEccSignatureSpecGetRAndS0200
     * @tc.desc    test OH_CryptoEccSignatureSpec_GetRAndS
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecGetRAndS0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecGetRAndS0200 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecGetRAndS0200();
        console.info("====>testOHCryptoEccSignatureSpecGetRAndS0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecGetRAndS0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_SETRANDS_0100
     * @tc.name    testOHCryptoEccSignatureSpecSetRAndS0100
     * @tc.desc    test OH_CryptoEccSignatureSpec_SetRAndS
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecSetRAndS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecSetRAndS0100 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecSetRAndS0100();
        console.info("====>testOHCryptoEccSignatureSpecSetRAndS0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecSetRAndS0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_SETRANDS_0200
     * @tc.name    testOHCryptoEccSignatureSpecSetRAndS0200
     * @tc.desc    test OH_CryptoEccSignatureSpec_SetRAndS
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecSetRAndS0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecSetRAndS0200 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecSetRAndS0200();
        console.info("====>testOHCryptoEccSignatureSpecSetRAndS0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecSetRAndS0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_ENCODE_0100
     * @tc.name    testOHCryptoEccSignatureSpecEncode0100
     * @tc.desc    test OH_CryptoEccSignatureSpec_Encode
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecEncode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecEncode0100 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecEncode0100();
        console.info("====>testOHCryptoEccSignatureSpecEncode0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecEncode0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOECCSIGNATURESPEC_ENCODE_0200
     * @tc.name    testOHCryptoEccSignatureSpecEncode0200
     * @tc.desc    test OH_CryptoEccSignatureSpec_Encode
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoEccSignatureSpecEncode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoEccSignatureSpecEncode0200 start====");
        let result : number = cryptoarchitecture.OHCryptoEccSignatureSpecEncode0200();
        console.info("====>testOHCryptoEccSignatureSpecEncode0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoEccSignatureSpecEncode0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHERPARAMS_CREATE_0100
     * @tc.name    testOHCryptoSymCipherParamsCreate0100
     * @tc.desc    test OH_CryptoSymCipherParams_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherParamsCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherParamsCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherParamsCreate0100();
        console.info("====>testOHCryptoSymCipherParamsCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherParamsCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHERPARAMS_CREATE_0200
     * @tc.name    testOHCryptoSymCipherParamsCreate0200
     * @tc.desc    test OH_CryptoSymCipherParams_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherParamsCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherParamsCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherParamsCreate0200();
        console.info("====>testOHCryptoSymCipherParamsCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherParamsCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHERPARAMS_SETPARAM_0100
     * @tc.name    testOHCryptoSymCipherParamsSetParam0100
     * @tc.desc    test OH_CryptoSymCipherParams_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherParamsSetParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherParamsSetParam0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherParamsSetParam0100();
        console.info("====>testOHCryptoSymCipherParamsSetParam0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherParamsSetParam0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHERPARAMS_SETPARAM_0200
     * @tc.name    testOHCryptoSymCipherParamsSetParam0200
     * @tc.desc    test OH_CryptoSymCipherParams_SetParam
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherParamsSetParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherParamsSetParam0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherParamsSetParam0200();
        console.info("====>testOHCryptoSymCipherParamsSetParam0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherParamsSetParam0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_CREATE_0100
     * @tc.name    testOHCryptoSymCipherCreate0100
     * @tc.desc    test OH_CryptoSymCipher_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherCreate0100();
        console.info("====>testOHCryptoSymCipherCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_CREATE_0200
     * @tc.name    testOHCryptoSymCipherCreate0200
     * @tc.desc    test OH_CryptoSymCipher_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherCreate0200();
        console.info("====>testOHCryptoSymCipherCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_INIT_0100
     * @tc.name    testOHCryptoSymCipherInit0100
     * @tc.desc    test OH_CryptoSymCipher_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherInit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherInit0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherInit0100();
        console.info("====>testOHCryptoSymCipherInit0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherInit0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_INIT_0200
     * @tc.name    testOHCryptoSymCipherInit0200
     * @tc.desc    test OH_CryptoSymCipher_Init
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherInit0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherInit0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherInit0200();
        console.info("====>testOHCryptoSymCipherInit0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherInit0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_UPDATE_0100
     * @tc.name    testOHCryptoSymCipherUpdate0100
     * @tc.desc    test OH_CryptoSymCipher_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherUpdate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherUpdate0100();
        console.info("====>testOHCryptoSymCipherUpdate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherUpdate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_UPDATE_0200
     * @tc.name    testOHCryptoSymCipherUpdate0200
     * @tc.desc    test OH_CryptoSymCipher_Update
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherUpdate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherUpdate0200();
        console.info("====>testOHCryptoSymCipherUpdate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherUpdate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_FINAL_0100
     * @tc.name    testOHCryptoSymCipherFinale0100
     * @tc.desc    test OH_CryptoSymCipher_Final
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherFinale0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherFinale0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherFinale0100();
        console.info("====>testOHCryptoSymCipherFinale0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherFinale0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMCIPHER_FINAL_0200
     * @tc.name    testOHCryptoSymCipherFinale0200
     * @tc.desc    test OH_CryptoSymCipher_Final
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymCipherFinale0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymCipherFinale0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymCipherFinale0200();
        console.info("====>testOHCryptoSymCipherFinale0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymCipherFinale0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEYGENERATOR_CREATE_0100
     * @tc.name    testOHCryptoSymKeyGeneratorCreate0100
     * @tc.desc    test OH_CryptoSymKeyGenerator_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGeneratorCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGeneratorCreate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorCreate0100();
        console.info("====>testOHCryptoSymKeyGeneratorCreate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGeneratorCreate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEYGENERATOR_CREATE_0200
     * @tc.name    testOHCryptoSymKeyGeneratorCreate0200
     * @tc.desc    test OH_CryptoSymKeyGenerator_Create
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGeneratorCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGeneratorCreate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorCreate0200();
        console.info("====>testOHCryptoSymKeyGeneratorCreate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGeneratorCreate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEYGENERATOR_GENERATE_0100
     * @tc.name    testOHCryptoSymKeyGeneratorGenerate0100
     * @tc.desc    test OH_CryptoSymKeyGenerator_Generate
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGeneratorGenerate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGeneratorGenerate0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorGenerate0100();
        console.info("====>testOHCryptoSymKeyGeneratorGenerate0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGeneratorGenerate0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEYGENERATOR_GENERATE_0200
     * @tc.name    testOHCryptoSymKeyGeneratorGenerate0200
     * @tc.desc    test OH_CryptoSymKeyGenerator_Generate
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGeneratorGenerate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGeneratorGenerate0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorGenerate0200();
        console.info("====>testOHCryptoSymKeyGeneratorGenerate0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGeneratorGenerate0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEYGENERATOR_CONVERT_0100
     * @tc.name    testOHCryptoSymKeyGeneratorConvert0100
     * @tc.desc    test OH_CryptoSymKeyGenerator_Convert
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGeneratorConvert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGeneratorConvert0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorConvert0100();
        console.info("====>testOHCryptoSymKeyGeneratorConvert0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGeneratorConvert0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEYGENERATOR_CONVERT_0200
     * @tc.name    testOHCryptoSymKeyGeneratorConvert0200
     * @tc.desc    test OH_CryptoSymKeyGenerator_Convert
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGeneratorConvert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGeneratorConvert0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGeneratorConvert0200();
        console.info("====>testOHCryptoSymKeyGeneratorConvert0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGeneratorConvert0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEY_GETKEYDATA_0100
     * @tc.name    testOHCryptoSymKeyGetKeyData0100
     * @tc.desc    test OH_CryptoSymKey_GetKeyData
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGetKeyData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGetKeyData0100 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGetKeyData0100();
        console.info("====>testOHCryptoSymKeyGetKeyData0100 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGetKeyData0100 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

 /**
     * @tc.number  SUB_CRYPTOARCHITECTURE_OH_CRYPTOSYMKEY_GETKEYDATA_0200
     * @tc.name    testOHCryptoSymKeyGetKeyData0200
     * @tc.desc    test OH_CryptoSymKey_GetKeyData
     * @tc.level   Level1
     * @tc.size    MediumTest
     * @tc.type    Function
     */
    it('testOHCryptoSymKeyGetKeyData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>testOHCryptoSymKeyGetKeyData0200 start====");
        let result : number = cryptoarchitecture.OHCryptoSymKeyGetKeyData0200();
        console.info("====>testOHCryptoSymKeyGetKeyData0200 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>testOHCryptoSymKeyGetKeyData0200 catch err: " + err);
        expect().assertFalse();
        done()
      }
    })

  })
}
