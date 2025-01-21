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
import * as pbkCallback from './utils/pbkdf2/publicPbkdf2Callback';
import * as pbkPromise from './utils/pbkdf2/publicPbkdf2Promise';
import * as common from './utils/common/publicDoString';
import crypto from "@ohos.security.cryptoFramework";

export default function cryptoPbkdf2JsTestUnit() {
  describe('cryptoPbkdf2JsTestUnit', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0100
     * @tc.name Test createKdf with normal parameter
     * @tc.desc Input parameter is PBKDF2|SM3
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0100", 0, async function (done) {
      try {
        let inputParam: string = "PBKDF2|SM3";
        let kdfObj: crypto.Kdf = crypto.createKdf(inputParam);
        expect(kdfObj != null).assertTrue();
        expect(kdfObj.algName).assertEqual(inputParam);
        console.log(`kdfObj algName is: ${kdfObj.algName}`);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0100 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0200
     * @tc.name Test createKdf with abnormal parameter
     * @tc.desc Test createKdf with abnormal parameter
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0200", 0, async function (done) {
      let strLen: number = 10000;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length));
      }
      try {
        crypto.createKdf(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        crypto.createKdf("");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        crypto.createKdf(randomStr);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        crypto.createKdf("pbKDF2|SHA1");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        crypto.createKdf("PBKDF2|SHA2");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0300
     * @tc.name Test generateSecret with PBKDF2|SHA1, generateSecret process is successful
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0300", 0, async function (done) {
      try {
        let keySize: number = 32;
        let password: string = '123456';
        let iterations: number = 10000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA1", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0300 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0400
     * @tc.name Test generateSecret with PBKDF2|SHA1, generateSecret process is successful
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0400", 0, async function (done) {
      try {
        let keySize: number = 32;
        let password: string = '123456';
        let iterations: number = 10000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA1", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0400 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0500
     * @tc.name Test generateSecret with PBKDF2|SHA224, generateSecret process is successful
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0500", 0, async function (done) {
      try {
        let keySize: number = 32;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA224", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0500 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0600
     * @tc.name Test generateSecret with PBKDF2|SHA224, generateSecret process is successful
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0600", 0, async function (done) {
      try {
        let keySize: number = 32;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA224", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0600 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0700
     * @tc.name Test generateSecret with PBKDF2|SHA256, generateSecret process is successful
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0700", 0, async function (done) {
      try {
        let keySize: number = 15;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA256", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0700 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0800
     * @tc.name Test generateSecret with PBKDF2|SHA256, generateSecret process is successful
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0800", 0, async function (done) {
      try {
        let keySize: number = 15;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA256", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0800 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_0900
     * @tc.name Test generateSecret with PBKDF2|SHA384, generateSecret process is successful
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_0900", 0, async function (done) {
      try {
        let keySize: number = 55;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA384", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_0900 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1000
     * @tc.name Test generateSecret with PBKDF2|SHA384, generateSecret process is successful
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1000", 0, async function (done) {
      try {
        let keySize: number = 55;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array(16),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA384", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1000 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1100
     * @tc.name Test generateSecret with PBKDF2|SHA512, generateSecret process is successful
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1100", 0, async function (done) {
      try {
        let keySize: number = 55;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array([11, 12]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA512", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1100 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1200
     * @tc.name Test generateSecret with PBKDF2|SHA512, generateSecret process is successful
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1200", 0, async function (done) {
      try {
        let keySize: number = 55;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array([11, 12]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA512", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1200 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1300
     * @tc.name Test generateSecret with PBKDF2|SM3, generateSecret process is successful
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1300", 0, async function (done) {
      try {
        let keySize: number = 35;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array([11, 12, 13]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SM3", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1300 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1400
     * @tc.name Test generateSecret with PBKDF2|SM3, generateSecret process is successful
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1400", 0, async function (done) {
      try {
        let keySize: number = 35;
        let password: string = 'abcdef';
        let iterations: number = 20000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array([11, 12, 13]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SM3", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1400 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1500
     * @tc.name Test generateSecret with PBKDF2|SM3, generateSecret process is successful two
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1500", 0, async function (done) {
      try {
        let keySize: number = 33;
        let password: string = 'abcdef123456';
        let iterations: number = 20000;
        let preSpec: crypto.KdfSpec = {
          algName: "PBKDF2",
        }
        let dataSpec: crypto.PBKDF2Spec = {
          algName: preSpec.algName,
          password: password,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SM3", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1500 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1600
     * @tc.name Test generateSecret with PBKDF2|SM3, generateSecret process is successful two
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1600", 0, async function (done) {
      try {
        let keySize: number = 33;
        let password: string = 'abcdef123456';
        let iterations: number = 20000;
        let preSpec: crypto.KdfSpec = {
          algName: "PBKDF2",
        }
        let dataSpec: crypto.PBKDF2Spec = {
          algName: preSpec.algName,
          password: password,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SM3", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1600 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1700
     * @tc.name Test generateSecret with PBKDF2|SHA256, generateSecret process is successful two
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1700", 0, async function (done) {
      try {
        let keySize: number = 16;
        let password: Uint8Array = new Uint8Array([10, 102, 13, 0, 63, 55]);
        let iterations: number = 20000;
        let preSpec: crypto.KdfSpec = {
          algName: "PBKDF2",
        }
        let dataSpec: crypto.PBKDF2Spec = {
          algName: preSpec.algName,
          password: password,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA256", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1700 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1800
     * @tc.name Test generateSecret with PBKDF2|SHA256, generateSecret process is successful two
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1800", 0, async function (done) {
      try {
        let keySize: number = 16;
        let password: Uint8Array = new Uint8Array([10, 102, 13, 0, 63, 55]);
        let iterations: number = 20000;
        let preSpec: crypto.KdfSpec = {
          algName: "PBKDF2",
        }
        let dataSpec: crypto.PBKDF2Spec = {
          algName: preSpec.algName,
          password: password,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA256", dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(keySize);
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1800 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_1900
     * @tc.name Test generateSecret with PBKDF2|SHA512, generateSecret process is successful two
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_1900", 0, async function (done) {
      try {
        let keySize: number = 16;
        let password: string = "123";
        let password2: Uint8Array = common.stringTouInt8Array(password);
        let iterations: number = 10000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let dataSpec2: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password2,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA512", dataSpec);
        let retData2: crypto.DataBlob = await pbkPromise.pbkdf2NormalProcess("PBKDF2|SHA512", dataSpec2);
        expect(common.uInt8ArrayToString(retData.data)).assertEqual(common.uInt8ArrayToString(retData2.data));
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_1900 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2000
     * @tc.name Test generateSecret with PBKDF2|SHA512, generateSecret process is successful two
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2000", 0, async function (done) {
      try {
        let keySize: number = 16;
        let password: string = "123";
        let password2: Uint8Array = common.stringTouInt8Array(password);
        let iterations: number = 10000;
        let dataSpec: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let dataSpec2: crypto.PBKDF2Spec = {
          algName: "PBKDF2",
          password: password2,
          salt: new Uint8Array([11, 12, 13, 0, 6]),
          iterations: iterations,
          keySize: keySize
        };
        let retData: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA512", dataSpec);
        let retData2: crypto.DataBlob = await pbkCallback.pbkdf2NormalProcess("PBKDF2|SHA512", dataSpec2);
        expect(common.uInt8ArrayToString(retData.data)).assertEqual(common.uInt8ArrayToString(retData2.data));
      } catch (err) {
        console.error(`Security_CryptoFramework_Pbkdf2_Func_2000 catch error: ${err}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2100
     * @tc.name Test generateSecret with empty input
     * @tc.desc Test generateSecret with empty input
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2100", 0, async function (done) {
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA384");
      try {
        await kdfObj.generateSecret(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await kdfObj.generateSecret(null, null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await new Promise((resolve, reject) => {
          kdfObj.generateSecret(null, (err, dataBlob) => {
            if (err) {
              reject(err);
            } else {
              resolve(dataBlob);
            }
          });
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2200
     * @tc.name Test generateSecret with PBKDF2|SHA1, with invalid KdfSpec algName
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2200", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "",
        password: "abcdef",
        salt: new Uint8Array([11, 12, 13]),
        iterations: 20000,
        keySize: 5
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA1");
      try {
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.algName = "PBkdf2";
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.algName = null;
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2300
     * @tc.name Test generateSecret with PBKDF2|SHA1, with invalid KdfSpec algName
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2300", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "",
        password: "abcdef",
        salt: new Uint8Array([11, 12, 13]),
        iterations: 20000,
        keySize: 5
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA1");
      try {
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.algName = "PBkdf2";
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.algName = null;
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2400
     * @tc.name Test generateSecret with PBKDF2|SHA224, with invalid KdfSpec password
     * @tc.desc Test generateSecret with PBKDF2|SHA224, with invalid KdfSpec password
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2400", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "PBKDF2",
        password: null,
        salt: new Uint8Array([11, 12, 13]),
        iterations: 20000,
        keySize: 5
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA224");
      try {
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2500
     * @tc.name Test generateSecret with PBKDF2|SHA256, with invalid KdfSpec iterations
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2500", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "PBKDF2",
        password: "abcdef",
        salt: new Uint8Array([11, 12, 13]),
        iterations: -1,
        keySize: 5
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA256");
      try {
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.iterations = 0;
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.iterations = 3.65;
        let retData: crypto.DataBlob = await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(dataSpec.keySize)
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2600
     * @tc.name Test generateSecret with PBKDF2|SHA256, with invalid KdfSpec iterations
     * @tc.desc Use Promise Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2600", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "PBKDF2",
        password: "abcdef",
        salt: new Uint8Array([11, 12, 13]),
        iterations: -1,
        keySize: 5
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA256");
      try {
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.iterations = 0;
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.iterations = 3.65;
        let retData: crypto.DataBlob = await kdfObj.generateSecret(dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(dataSpec.keySize)
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2700
     * @tc.name Test generateSecret with PBKDF2|SHA512, with invalid KdfSpec keySize
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2700", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "PBKDF2",
        password: "abcdef",
        salt: new Uint8Array([11, 12, 13]),
        iterations: 13,
        keySize: -1
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA512");
      try {
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.keySize = 0;
        await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.keySize = 3.65;
        let retData: crypto.DataBlob = await pbkCallback.kdfGenerateSecret(kdfObj, dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(Math.floor(dataSpec.keySize))
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_Pbkdf2_Func_2800
     * @tc.name Test generateSecret with PBKDF2|SHA512, with invalid KdfSpec keySize
     * @tc.desc Use AsyncCallback Style
     */
    it("Security_CryptoFramework_Pbkdf2_Func_2800", 0, async function (done) {
      var dataSpec: crypto.PBKDF2Spec = {
        algName: "PBKDF2",
        password: "abcdef",
        salt: new Uint8Array([11, 12, 13]),
        iterations: 13,
        keySize: -1
      };
      let kdfObj: crypto.Kdf = crypto.createKdf("PBKDF2|SHA512");
      try {
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.keySize = 0;
        await kdfObj.generateSecret(dataSpec);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        dataSpec.keySize = 3.65;
        let retData: crypto.DataBlob = await kdfObj.generateSecret(dataSpec);
        expect(retData.data != null).assertTrue();
        expect(retData.data.length).assertEqual(Math.floor(dataSpec.keySize))
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });
  })
}