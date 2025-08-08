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
import * as digCallback from './utils/digestalgorithm/publicDigestCallback';
import * as digPromise from './utils/digestalgorithm/publicDigestPromise';
import * as common from './utils/common/publicDoString';
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function cryptoHmacOptParaJsTestUnit() {
  describe('cryptoHmacOptParaJsTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0100
     * @tc.name Test symKey with HMAC|SHA1, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA1
     * @tc.desc 2. MAC with algName SHA1
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0100", 0, async (done: Function) => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA1", "HMAC|SHA1");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 20).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0200
     * @tc.name Test symKey with HMAC|SHA224, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA224
     * @tc.desc 2. MAC with algName SHA224
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0200", 0, async (done: Function) => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA224", "HMAC|SHA224");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 28).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0300
     * @tc.name Test symKey with HMAC|SHA256, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA256
     * @tc.desc 2. MAC with algName SHA256
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0300", 0, async (done: Function) => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA256", "HMAC|SHA256");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0400
     * @tc.name Test symKey with HMAC|SHA384, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA384
     * @tc.desc 2. MAC with algName SHA384
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0400", 0, async (done: Function) => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA384", "HMAC|SHA384");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0500
     * @tc.name Test symKey with HMAC|SHA512, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA512
     * @tc.desc 2. MAC with algName SHA512
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0500", 0, async (done: Function) => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA512", "HMAC|SHA512");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0600
     * @tc.name Test symKey with HMAC|SM3, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SM3
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0600", 0, async (done: Function) => {
      try {
        let retData = await digCallback.HmacDigestProcess("SM3", "HMAC|SM3");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0700
     * @tc.name Test symKey with invalid parameters or MAC with invalid  parameters, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with invalid  parameters or MAC with invalid  parameters
     * @tc.desc 2. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0700", 0, async (done: Function) => {
      try {
        await digCallback.HmacDigestProcess("SM3", "hmac|SM3");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(801);
      }
      try {
        await digCallback.HmacDigestProcess("sm3", "HMAC|SM3");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error2: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0800
     * @tc.name Test symKey with HMAC and symkey with any length[1,4096], HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA512
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0800", 0, async (done: Function) => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: common.stringTouInt8Array("123ab")
      };
      try {
        let retData = await digCallback.HmacAnyLengthKeyDigestProcess("SHA512", keyBlob);
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0900
     * @tc.name Test symKey with HMAC and symkey with superlarge length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0900", 0, async (done: Function) => {
      let strLen: number = 4097;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length));
      }
      common.sliceAndPrintString(randomStr, 500);
      let keyBlob: cryptoFramework.DataBlob = {
        data: common.stringTouInt8Array(randomStr)
      };
      try {
        await digCallback.HmacAnyLengthKeyDigestProcess("SM3", keyBlob);
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1000
     * @tc.name Test symKey with HMAC and symkey with 0 length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1000", 0, async (done: Function) => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: common.stringTouInt8Array("")
      };
      try {
        await digCallback.HmacAnyLengthKeyDigestProcess("SM3", keyBlob);
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1100
     * @tc.name Test symKey with HMAC|SHA1, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA1
     * @tc.desc 2. MAC with algName SHA1
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1100", 0, async (done: Function) => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA1", "HMAC|SHA1");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 20).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1200
     * @tc.name Test symKey with HMAC|SHA224, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA224
     * @tc.desc 2. MAC with algName SHA224
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1200", 0, async (done: Function) => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA224", "HMAC|SHA224");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 28).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1300
     * @tc.name Test symKey with HMAC|SHA256, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA256
     * @tc.desc 2. MAC with algName SHA256
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1300", 0, async (done: Function) => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA256", "HMAC|SHA256");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1400
     * @tc.name Test symKey with HMAC|SHA384, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA384
     * @tc.desc 2. MAC with algName SHA384
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1400", 0, async (done: Function) => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA384", "HMAC|SHA384");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1500
     * @tc.name Test symKey with HMAC|SHA512, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA512
     * @tc.desc 2. MAC with algName SHA512
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1500", 0, async (done: Function) => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA512", "HMAC|SHA512");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1600
     * @tc.name Test symKey with HMAC|SM3, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SM3
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1600", 0, async (done: Function) => {
      try {
        let retData = await digPromise.HmacDigestProcess("SM3", "HMAC|SM3");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1700
     * @tc.name Test symKey with invalid parameters or MAC with invalid  parameters, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with invalid  parameters or MAC with invalid  parameters
     * @tc.desc 2. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1700", 0, async (done: Function) => {
      try {
        await digPromise.HmacDigestProcess("SM3", "HMAC|Sha256");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(801);
      }
      try {
        await digPromise.HmacDigestProcess("sha384", "HMAC|SHA384");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1700 catch error2: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1800
     * @tc.name Test symKey with HMAC and symkey with any length[1,4096], HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA384
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1800", 0, async (done: Function) => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: common.stringTouInt8Array("123ab")
      };
      try {
        let retData = await digPromise.HmacAnyLengthKeyDigestProcess("SHA384", keyBlob);
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1900
     * @tc.name Test symKey with HMAC and symkey with superlarge length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA256
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1900", 0, async (done: Function) => {
      let strLen: number = 4097;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length));
      }
      common.sliceAndPrintString(randomStr, 500);
      let keyBlob: cryptoFramework.DataBlob = {
        data: common.stringTouInt8Array(randomStr)
      };
      try {
        await digPromise.HmacAnyLengthKeyDigestProcess("SHA256", keyBlob);
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1900 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_2000
     * @tc.name Test symKey with HMAC and symkey with 0 length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA1
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_2000", 0, async (done: Function) => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: common.stringTouInt8Array("")
      };
      try {
        await digPromise.HmacAnyLengthKeyDigestProcess("SHA1", keyBlob);
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_2000 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });
  })
}