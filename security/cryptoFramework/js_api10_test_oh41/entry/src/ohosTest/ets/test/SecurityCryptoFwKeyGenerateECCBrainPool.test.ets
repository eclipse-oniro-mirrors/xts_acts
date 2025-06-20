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
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';
import * as specUtil from './utils/common/keyGenSpecUtil';

export default function SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit() {
  describe('SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit', () => {
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
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0100
     * @tc.name Test createAsyKeyGenerator with wrong BrainPool, process is fail
     * @tc.desc 1. AsyKeyGenerator with algName BrainPool
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0100: started.");
      try {
        cryptoFramework.createAsyKeyGenerator("ECC_BrainPoolP160r11");
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0100: createAsyKeyGenerator succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0100 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300
     * @tc.name Test getAsyKeySpec with BrainPool, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300: started.");
      let algName: string = "ECC_BrainPoolP512t1";
      try {
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300: generatePriKey succeed.");
        for (let i = 201; i < 214; ++i) {
          if (i != 208) {
            keyPair.pubKey.getAsyKeySpec(i);
            console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300: getPriParam " + i + " succeed.");
          }
          if (i != 209 && i != 210) {
            keyPair.priKey.getAsyKeySpec(i);
            console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300: getPubParam " + i + " succeed.");
          }
        }
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0500
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0500: started.");
      let algName: string = "ECC_BrainPoolP160r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0500: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0600
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0600: started.");
      let algName: string = "ECC_BrainPoolP160t1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0600: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0700
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0700: started.");
      let algName: string = "ECC_BrainPoolP192r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0700: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0800
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0800: started.");
      let algName: string = "ECC_BrainPoolP192t1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0800: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0900
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0900", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0900: started.");
      let algName: string = "ECC_BrainPoolP224r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0900: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_0900: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1000
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1000", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1000: started.");
      let algName: string = "ECC_BrainPoolP224t1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1000: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1000: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1100
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1100: started.");
      let algName: string = "ECC_BrainPoolP256r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1100: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1200
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1200: started.");
      let algName: string = "ECC_BrainPoolP256t1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1200: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1300
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1300: started.");
      let algName: string = "ECC_BrainPoolP320r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1300: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1400
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1400: started.");
      let algName: string = "ECC_BrainPoolP320t1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1400: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1500
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1500: started.");
      let algName: string = "ECC_BrainPoolP384r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1500: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1600
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1600: started.");
      let algName: string = "ECC_BrainPoolP384t1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1600: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1700
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1700: started.");
      let algName: string = "ECC_BrainPoolP512r1";
      try {
        await asyKeyGenPromiseFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1700: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1800
     * @tc.name Test convertKey with BrainPoolGenerator, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 3. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1800: started.");
      let algName: string = "ECC_BrainPoolP512t1";
      try {
        await asyKeyGenCallbackFunc.convertKey(algName);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1800: convertKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1900
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level4
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1900", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1900: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP160r1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1900: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_1900: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2000
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2000", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2000: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP192r1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2000: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2000: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2100
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2100: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP224r1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2100: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2200
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2200: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP256r1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2200: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2300
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP320t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2300: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2400
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP384t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2400: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500
     * @tc.name Test generateKeyPair with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 3. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP512t1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500: genKeyPair succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2600
     * @tc.name Test generateKeyPair with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName BrainPool
     * @tc.desc 3. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.p160r1Spec();
        spec.algName = "BrainPool";
        await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2600: genKeyPair succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2600 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2700
     * @tc.name Test generateKeyPair with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.desc 3. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2700: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.p160r1Spec();
        spec.specType = cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC;
        await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2700: genKeyPair succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2700 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2800
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2800: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP160r1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2800: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2900
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2900", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2900: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP192t1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2900: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_2900: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3000
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3000", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3000: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP224r1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3000: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3000: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3100
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3100: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP256t1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3100: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3200
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3200: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP320r1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3200: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3300
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP384t1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3300: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3400
     * @tc.name Test generatePriKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512r1
     * @tc.desc 3. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP512r1KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3400: genPriKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3500
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP160t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3500: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3600
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3600: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP192r1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3600: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3700
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3700: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP224t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3700: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3700 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3800
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3800: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP256r1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3800: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3900
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3900", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3900: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP320t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3900: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3900 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_3900: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4000
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4000", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4000: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP384r1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4000: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4000: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4100
     * @tc.name Test generatePubKey with BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512t1
     * @tc.desc 3. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4100", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4100: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP512t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4100: genPubKey succeed.");
      } catch (err) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4200
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4200", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4200: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP160t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4200: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4200 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4300
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP192t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4300", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP192t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4300: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4300 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4400
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP224t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4400", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP224t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4400: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4400 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4500
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP256t1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4500", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP256t1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4500: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4500 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4600
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP320r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4600", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4600: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP320r1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4600: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4600 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4700
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP384r1
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4700", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4700: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP384r1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4700: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4700 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4800
     * @tc.name Test generatePubKey with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP512r1
     * @tc.desc 3. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4800", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4800: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP512r1KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4800: genPriKey succeed.");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4800 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_4800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5000
     * @tc.name Test createAsyGeneratorBySpec with error BrainPool spec, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5000", 0, async (done: Function) => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5000: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genP160r1KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5000: generatePriKey succeed.");
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
        console.error(`Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5000: success.");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5200
     * @tc.name Test algName,format with BrainPool. Promsie style. Process success
     * @tc.desc AsyKeyGenerator with algName ECC_BrainPoolP160r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5200", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_BrainPool_Func_5200";
      console.log(testNumber + ": started");
      let keyAlg: string = "ECC_BrainPoolP160r1";
      try {
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(keyAlg);
        expect(keyPair.pubKey.format == "X.509").assertTrue();
        expect(keyPair.pubKey.algName == "EC").assertTrue();
        expect(keyPair.priKey.format == "PKCS#8").assertTrue();
        expect(keyPair.priKey.algName == "EC").assertTrue();
      } catch (err) {
        console.error(testNumber + `: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });


  })
}