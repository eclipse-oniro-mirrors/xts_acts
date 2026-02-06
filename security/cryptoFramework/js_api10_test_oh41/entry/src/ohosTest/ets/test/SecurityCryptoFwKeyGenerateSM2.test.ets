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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';
import * as specUtil from './utils/common/keyGenSpecUtil';

export default function SecurityCryptoFwKeyGenerateSM2TestUnit() {
  describe('SecurityCryptoFwKeyGenerateSM2TestUnit', () => {
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
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100
     * @tc.desc   1. AsyKeyGenerator with algName SM2_512
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        spec.algName = "SM2_512";
        cryptoFramework.createAsyKeyGeneratorBySpec(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100: createAsyKeyGeneratorBySpec succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200
     * @tc.desc   1. AsyKeyGenerator with algName SM2_512
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.SM2CommonSpec();
        spec.specType = cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC;
        cryptoFramework.createAsyKeyGeneratorBySpec(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200: createAsyKeyGeneratorBySpec succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300: generatePriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400
     * @tc.desc   2. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400: generatePriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500: generatePriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600
     * @tc.desc   2. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600: generatePriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700: generatePriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800
     * @tc.desc   2. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800: generatePriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800: success.");
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: generatePriKey succeed.");
        for (let i = 201; i < 214; ++i) {
          if (i != 208) {
            keyPair.pubKey.getAsyKeySpec(i);
            console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: getPriParam " + i + " succeed.");
          }
          if (i != 209 && i != 210) {
            keyPair.priKey.getAsyKeySpec(i);
            console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: getPubParam " + i + " succeed.");
          }
        }
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: success.");
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200
     * @tc.desc   AsyKeyGenerator with spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200";
      console.log(testNumber + ": started");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log(testNumber + ": generateKeyPair succeed.");
        expect(keyPair.pubKey.format == "X.509").assertTrue();
        expect(keyPair.pubKey.algName == "SM2").assertTrue();
        expect(keyPair.priKey.format == "PKCS#8").assertTrue();
        expect(keyPair.priKey.algName == "SM2").assertTrue();
      } catch (err) {
        console.error(testNumber + `: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success.");
      done();
    });


  })
}