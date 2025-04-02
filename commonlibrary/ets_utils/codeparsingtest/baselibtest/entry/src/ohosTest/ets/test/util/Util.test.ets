/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import util from '@ohos.util'
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

async function fn() {
  return 'hello world';
}

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

interface GeneratedObjectLiteralInterface_2 {
  gname: string;
  floor: string;
}

interface GeneratedObjectLiteralInterface_3 {
  name: string;
  age: number;
  grade: GeneratedObjectLiteralInterface_2;
}

interface GeneratedObjectLiteralInterface_5 {}

interface GeneratedObjectLiteralInterface_6 {
  "name": string;
  "isStudent": boolean;
  "score": null;
}

export default function utilTest() {
  describe('utilTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILFORMAT_0100
     * @tc.name       : testUtilFormat001
     * @tc.desc       : Testing the format interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilFormat001', 0, () => {
      const TAG = 'testUtilFormat001';
      try {
        let value1 = null;
        let result = util.format(value1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILFORMAT_0200
     * @tc.name       : testUtilFormat002
     * @tc.desc       : Testing the format interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilFormat002', 0, () => {
      const TAG = 'testUtilFormat002';
      try {
        let value1 = undefined;
        let result = util.format(value1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILFORMAT_0300
     * @tc.name       : testUtilFormat003
     * @tc.desc       : Testing the format interface with value 'string+number'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilFormat003', 0, () => {
      const TAG = 'testUtilFormat003';
      try {
        let value1 = 'testPara1';
        let value2 = 64;
        let result = util.format(value1, value2);
        expect(result).assertEqual(value1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_0100
     * @tc.name       : testUtilErrnoToString001
     * @tc.desc       : Testing the errnoToString interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString001', 0, () => {
      const TAG = 'testUtilErrnoToString001';
      try {
        let value = null;
        let result = util.errnoToString(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_0200
     * @tc.name       : testUtilErrnoToString002
     * @tc.desc       : Testing the errnoToString interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString002', 0, () => {
      const TAG = 'testUtilErrnoToString002';
      try {
        let value = undefined;
        let result = util.errnoToString(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_0600
     * @tc.name       : testUtilErrnoToString006
     * @tc.desc       : Testing the errnoToString interface with value -401.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString006', 0, () => {
      const TAG = 'testUtilErrnoToString006';
      try {
        let value = -401;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error -401');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_0700
     * @tc.name       : testUtilErrnoToString007
     * @tc.desc       : Testing the errnoToString interface with value -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString007', 0, () => {
      const TAG = 'testUtilErrnoToString007';
      try {
        let value = -1;
        let result = util.errnoToString(value);
        expect(result).assertEqual('operation not permitted');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_0800
     * @tc.name       : testUtilErrnoToString008
     * @tc.desc       : Testing the errnoToString interface with value 401.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString008', 0, () => {
      const TAG = 'testUtilErrnoToString008';
      try {
        let value = 401;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error 401');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_0900
     * @tc.name       : testUtilErrnoToString009
     * @tc.desc       : Testing the errnoToString interface with value 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString009', 0, () => {
      const TAG = 'testUtilErrnoToString009';
      try {
        let value = 0;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error 0');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_1000
     * @tc.name       : testUtilErrnoToString010
     * @tc.desc       : Testing the errnoToString interface with value 401.6895487.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString010', 0, () => {
      const TAG = 'testUtilErrnoToString010';
      try {
        let value = 401.6895487;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error 401');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_1100
     * @tc.name       : testUtilErrnoToString011
     * @tc.desc       : Testing the errnoToString interface with value Number.MAX_SAFE_INTEGER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString011', 0, () => {
      const TAG = 'testUtilErrnoToString011';
      try {
        let value = Number.MAX_SAFE_INTEGER;
        let result = util.errnoToString(value);
        expect(result).assertEqual('operation not permitted');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_1200
     * @tc.name       : testUtilErrnoToString012
     * @tc.desc       : Testing the errnoToString interface with value Number.MIN_SAFE_INTEGER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString012', 0, () => {
      const TAG = 'testUtilErrnoToString012';
      try {
        let value = Number.MIN_SAFE_INTEGER;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error 1');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_1300
     * @tc.name       : testUtilErrnoToString013
     * @tc.desc       : Testing the errnoToString interface with value Number.MAX_VALUE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString013', 0, () => {
      const TAG = 'testUtilErrnoToString013';
      try {
        let value = Number.MAX_VALUE;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error 0');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILERRNOTOSTRING_1400
     * @tc.name       : testUtilErrnoToString014
     * @tc.desc       : Testing the errnoToString interface with value Number.MIN_VALUE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilErrnoToString014', 0, () => {
      const TAG = 'testUtilErrnoToString014';
      try {
        let value = Number.MIN_VALUE;
        let result = util.errnoToString(value);
        expect(result).assertEqual('Unknown system error 0');
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILCALLBACKWRAPPER_0100
     * @tc.name       : testUtilCallbackWrapper001
     * @tc.desc       : Testing the callbackWrapper interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilCallbackWrapper001', 0, () => {
      const TAG = 'testUtilCallbackWrapper001';
      try {
        util.callbackWrapper(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILCALLBACKWRAPPER_0200
     * @tc.name       : testUtilCallbackWrapper002
     * @tc.desc       : Testing the callbackWrapper interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilCallbackWrapper002', 0, () => {
      const TAG = 'testUtilCallbackWrapper002';
      try {
        util.callbackWrapper(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPROMISIFY_0100
     * @tc.name       : testUtilPromisify001
     * @tc.desc       : Testing the promisify interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilPromisify001', 0, () => {
      const TAG = 'testUtilPromisify001';
      try {
        let result = util.promisify(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPROMISIFY_0200
     * @tc.name       : testUtilPromisify002
     * @tc.desc       : Testing the promisify interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilPromisify002', 0, () => {
      const TAG = 'testUtilPromisify002';
      try {
        let result = util.promisify(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATERANDOMUUID_0100
     * @tc.name       : testUtilGenerateRandomUUID001
     * @tc.desc       : Testing the generateRandomUUID interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomUUID001', 0, () => {
      const TAG = 'testUtilGenerateRandomUUID001';
      try {
        let value = null;
        let result = util.generateRandomUUID(value);
        expect(result.length).assertEqual(36);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATERANDOMUUID_0200
     * @tc.name       : testUtilGenerateRandomUUID002
     * @tc.desc       : Testing the generateRandomUUID interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomUUID002', 0, () => {
      const TAG = 'testUtilGenerateRandomUUID002';
      try {
        let value = undefined;
        let result = util.generateRandomUUID(value);
        expect(result.length).assertEqual(36);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATERANDOMUUID_0500
     * @tc.name       : testUtilGenerateRandomUUID005
     * @tc.desc       : Testing the generateRandomUUID interface with no para.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomUUID005', 0, () => {
      const TAG = 'testUtilGenerateRandomUUID005';
      try {
        let result = util.generateRandomUUID();
        expect(result.length).assertEqual(36);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATERANDOMUUID_0600
     * @tc.name       : testUtilGenerateRandomUUID006
     * @tc.desc       : Testing the generateRandomUUID interface with value false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomUUID006', 0, () => {
      const TAG = 'testUtilGenerateRandomUUID006';
      try {
        let value = false;
        let result = util.generateRandomUUID(value);
        expect(result.length).assertEqual(36);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATERANDOMUUID_0700
     * @tc.name       : testUtilGenerateRandomUUID007
     * @tc.desc       : Testing the generateRandomUUID interface with value true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomUUID007', 0, () => {
      const TAG = 'testUtilGenerateRandomUUID007';
      try {
        let value = true;
        let result = util.generateRandomUUID(value);
        expect(result.length).assertEqual(36);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATERANDOMUUID_0800
     * @tc.name       : testUtilGenerateRandomUUID008
     * @tc.desc       : Testing the generateRandomUUID interface with value true several times.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomUUID008', 0, () => {
      const TAG = 'testUtilGenerateRandomUUID008';
      try {
        for (let i = 0; i < 50; i++) {
          let value = true;
          let result = util.generateRandomUUID(value);
          expect(result.length).assertEqual(36);
        }
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATEBINARYRANDOMUUID_0100
     * @tc.name       : testUtilGenerateRandomBinaryUUID001
     * @tc.desc       : Testing the generateRandomBinaryUUID interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomBinaryUUID001', 0, () => {
      const TAG = 'testUtilGenerateRandomBinaryUUID001';
      try {
        let value = null;
        let result = util.generateRandomBinaryUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATEBINARYRANDOMUUID_0200
     * @tc.name       : testUtilGenerateRandomBinaryUUID002
     * @tc.desc       : Testing the generateRandomBinaryUUID interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomBinaryUUID002', 0, () => {
      const TAG = 'testUtilGenerateRandomBinaryUUID002';
      try {
        let value = undefined;
        let result = util.generateRandomBinaryUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATEBINARYRANDOMUUID_0500
     * @tc.name       : testUtilGenerateRandomBinaryUUID005
     * @tc.desc       : Testing the generateRandomBinaryUUID interface with no para.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomBinaryUUID005', 0, () => {
      const TAG = 'testUtilGenerateRandomBinaryUUID005';
      try {
        let result = util.generateRandomBinaryUUID();
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATEBINARYRANDOMUUID_0600
     * @tc.name       : testUtilGenerateRandomBinaryUUID006
     * @tc.desc       : Testing the generateRandomBinaryUUID interface with value false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomBinaryUUID006', 0, () => {
      const TAG = 'testUtilGenerateRandomBinaryUUID006';
      try {
        let value = false;
        let result = util.generateRandomBinaryUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGENERATEBINARYRANDOMUUID_0700
     * @tc.name       : testUtilGenerateRandomBinaryUUID007
     * @tc.desc       : Testing the generateRandomBinaryUUID interface with value true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGenerateRandomBinaryUUID007', 0, () => {
      const TAG = 'testUtilGenerateRandomBinaryUUID007';
      try {
        let value = true;
        let result = util.generateRandomBinaryUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_0100
     * @tc.name       : testUtilParseUUID001
     * @tc.desc       : Testing the parseUUID interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID001', 0, () => {
      const TAG = 'testUtilParseUUID001';
      try {
        let value = null;
        let result = util.parseUUID(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_0200
     * @tc.name       : testUtilParseUUID002
     * @tc.desc       : Testing the parseUUID interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID002', 0, () => {
      const TAG = 'testUtilParseUUID002';
      try {
        let value = undefined;
        let result = util.parseUUID(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_0600
     * @tc.name       : testUtilParseUUID006
     * @tc.desc       : Testing the parseUUID interface with value '84df796-66cc-4655-9b89-d6218d100f9c'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID006', 0, () => {
      const TAG = 'testUtilParseUUID006';
      try {
        let value = '84df796-66cc-4655-9b89-d6218d100f9c';
        let result = util.parseUUID(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_0700
     * @tc.name       : testUtilParseUUID007
     * @tc.desc       : Testing the parseUUID interface with value '84Wdf796-66cc-4655-9b89-d6218d100f9c'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID007', 0, () => {
      const TAG = 'testUtilParseUUID007';
      try {
        let value = '84Wdf796-66cc-4655-9b89-d6218d100f9c';
        let result = util.parseUUID(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_0800
     * @tc.name       : testUtilParseUUID008
     * @tc.desc       : Testing the parseUUID interface with UUID string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID008', 0, () => {
      const TAG = 'testUtilParseUUID008';
      try {
        let value = '84bdf796-66cc-4655-9b89-d6218d100f9c';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_0900
     * @tc.name       : testUtilParseUUID009
     * @tc.desc       : Testing the parseUUID interface with 'Nil UUID 00000000-0000-0000-0000-000000000000'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID009', 0, () => {
      const TAG = 'testUtilParseUUID009';
      try {
        let value = 'Nil UUID 00000000-0000-0000-0000-000000000000';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_1000
     * @tc.name       : testUtilParseUUID010
     * @tc.desc       : Testing the parseUUID interface with 'Namespace UUID 6ba7b810-9dad-11d1-80b4-00c04fd430c8'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID010', 0, () => {
      const TAG = 'testUtilParseUUID010';
      try {
        let value = 'Namespace UUID 6ba7b810-9dad-11d1-80b4-00c04fd430c8';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_1100
     * @tc.name       : testUtilParseUUID011
     * @tc.desc       : Testing the parseUUID interface with 'URL UUID 6ba7b810-9dad-11d1-80b4-00c04fd430c8'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID011', 0, () => {
      const TAG = 'testUtilParseUUID011';
      try {
        let value = 'URL UUID 6ba7b810-9dad-11d1-80b4-00c04fd430c8';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_1200
     * @tc.name       : testUtilParseUUID012
     * @tc.desc       : Testing the parseUUID interface with 'OID UUID 6ba7b812-9dad-11d1-80b4-00c04fd430c8'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID012', 0, () => {
      const TAG = 'testUtilParseUUID012';
      try {
        let value = 'OID UUID 6ba7b812-9dad-11d1-80b4-00c04fd430c8';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_1300
     * @tc.name       : testUtilParseUUID013
     * @tc.desc       : Testing the parseUUID interface with 'X.500 UUID 6ba7b814-9dad-11d1-80b4-00c04fd430c8'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID013', 0, () => {
      const TAG = 'testUtilParseUUID013';
      try {
        let value = 'X.500 UUID 6ba7b814-9dad-11d1-80b4-00c04fd430c8';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILPARSEUUID_1400
     * @tc.name       : testUtilParseUUID013
     * @tc.desc       : Testing the parseUUID interface with 'UUID FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilParseUUID014', 0, () => {
      const TAG = 'testUtilParseUUID014';
      try {
        let value = 'UUID FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF';
        let result = util.parseUUID(value);
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_0100
     * @tc.name       : testUtilGetHash001
     * @tc.desc       : Testing the getHash interface with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash001', 0, () => {
      const TAG = 'testUtilGetHash001';
      try {
        let value = null;
        let result = util.getHash(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_0200
     * @tc.name       : testUtilGetHash002
     * @tc.desc       : Testing the getHash interface with value undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash002', 0, () => {
      const TAG = 'testUtilGetHash002';
      try {
        let value = undefined;
        let result = util.getHash(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_0700
     * @tc.name       : testUtilGetHash007
     * @tc.desc       : Testing the getHash interface with json value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash007', 0, () => {
      const TAG = 'testUtilGetHash007';
      try {
        let person: GeneratedObjectLiteralInterface_1 = {
          name: "Alice",
          age: 30
        };
        let result1 = util.getHash(person);
        let result2 = util.getHash(person);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_0800
     * @tc.name       : testUtilGetHash008
     * @tc.desc       : Testing the getHash interface with array value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash008', 0, () => {
      const TAG = 'testUtilGetHash008';
      try {
        let numbers = [1, 2, 3, 4, 5];
        let result1 = util.getHash(numbers);
        let result2 = util.getHash(numbers);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_0900
     * @tc.name       : testUtilGetHash009
     * @tc.desc       : Testing the getHash interface with class value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash009', 0, () => {
      const TAG = 'testUtilGetHash009';
      try {
        class Car {
          make: string;
          model: string;

          constructor(make: string, model: string) {
            this.make = make;
            this.model = model;
          }
        }

        let myCar = new Car("Toyota", "Corolla");
        let result1 = util.getHash(myCar);
        let result2 = util.getHash(myCar);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1000
     * @tc.name       : testUtilGetHash010
     * @tc.desc       : Testing the getHash interface with date value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash010', 0, () => {
      const TAG = 'testUtilGetHash010';
      try {
        let time = new Date();
        let result1 = util.getHash(time);
        let result2 = util.getHash(time);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1100
     * @tc.name       : testUtilGetHash011
     * @tc.desc       : Testing the getHash interface with regular expression.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash011', 0, () => {
      const TAG = 'testUtilGetHash011';
      try {
        let value = RegExp('^(\\-)?\\d+(\\.\\d{1,2})?$')
        let result1 = util.getHash(value);
        let result2 = util.getHash(value);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1200
     * @tc.name       : testUtilGetHash012
     * @tc.desc       : Testing the getHash interface with math value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash012', 0, () => {
      const TAG = 'testUtilGetHash012';
      try {
        let mathObject = Math;
        let result1 = util.getHash(mathObject);
        let result2 = util.getHash(mathObject);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1300
     * @tc.name       : testUtilGetHash013
     * @tc.desc       : Testing the getHash interface with math nested json.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash013', 0, () => {
      const TAG = 'testUtilGetHash013';
      try {
        let person: GeneratedObjectLiteralInterface_3 = {
          name: "Alice",
          age: 30,
          grade: ({
            gname: '三年八班',
            floor: 'Three'
          } as GeneratedObjectLiteralInterface_2)
        };
        let result1 = util.getHash(person);
        let result2 = util.getHash(person);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1400
     * @tc.name       : testUtilGetHash014
     * @tc.desc       : Testing the getHash interface with value {}.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash014', 0, () => {
      const TAG = 'testUtilGetHash014';
      try {
        let value: GeneratedObjectLiteralInterface_5 = {};
        let result1 = util.getHash(value);
        let result2 = util.getHash(value);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1500
     * @tc.name       : testUtilGetHash015
     * @tc.desc       : Testing the getHash interface with value {}.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash015', 0, () => {
      const TAG = 'testUtilGetHash015';
      try {
        let value = [];
        let result1 = util.getHash(value);
        let result2 = util.getHash(value);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILGETHASH_1600
     * @tc.name       : testUtilGetHash016
     * @tc.desc       : Testing the getHash interface with special json.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilGetHash016', 0, () => {
      const TAG = 'testUtilGetHash016';
      try {
        let value: GeneratedObjectLiteralInterface_6 = {
          "name": "小明",
          "isStudent": true,
          "score": null
        };
        let result1 = util.getHash(value);
        let result2 = util.getHash(value);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0100
     * @tc.name       : testTextDecoderCreate001
     * @tc.desc       : Testing the Constructor of TextDecoder.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate001', 0, () => {
      const TAG = 'testTextDecoderCreate001';
      try {
        let result = new util.TextDecoder();
        let retStr = result.encoding;
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0200
     * @tc.name       : testTextDecoderCreate002
     * @tc.desc       : Testing the textdecoder create interface with utf-8 value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate002', 0, () => {
      const TAG = 'testTextDecoderCreate002';
      try {
        let value = util.TextDecoder.create('utf-8', {
          ignoreBOM: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0300
     * @tc.name       : testTextDecoderCreate003
     * @tc.desc       : Testing the textdecoder.create interface with no para.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate003', 0, () => {
      const TAG = 'testTextDecoderCreate003';
      try {
        let value = util.TextDecoder.create()
        let retStr = value.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0400
     * @tc.name       : testTextDecoderCreate004
     * @tc.desc       : Testing the textdecoder create interface with Illegal coding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate004', 0, () => {
      const TAG = 'testTextDecoderCreate004';
      try {
        let value = util.TextDecoder.create('utf-7', {
          ignoreBOM: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('utf-7')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0500
     * @tc.name       : testTextDecoderCreate005
     * @tc.desc       : Testing the textdecoder create while TextDecoderOptions with no paras.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate005', 0, () => {
      const TAG = 'testTextDecoderCreate005';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {}
        let result = util.TextDecoder.create(undefined, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0600
     * @tc.name       : testTextDecoderCreate006
     * @tc.desc       : Testing the textdecoder create while ignoreBOM values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate006', 0, () => {
      const TAG = 'testTextDecoderCreate006';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          ignoreBOM: true
        }
        let result = util.TextDecoder.create(undefined, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0700
     * @tc.name       : testTextDecoderCreate007
     * @tc.desc       : Testing the textdecoder create while ignoreBOM values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate007', 0, () => {
      const TAG = 'testTextDecoderCreate007';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          ignoreBOM: false
        }
        let result = util.TextDecoder.create(undefined, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0800
     * @tc.name       : testTextDecoderCreate008
     * @tc.desc       : Testing the textdecoder create while fatal values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate008', 0, () => {
      const TAG = 'testTextDecoderCreate008';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          fatal: true
        }
        let result = util.TextDecoder.create(undefined, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_0900
     * @tc.name       : testTextDecoderCreate009
     * @tc.desc       : Testing the textdecoder create while fatal values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate009', 0, () => {
      const TAG = 'testTextDecoderCreate009';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          fatal: false
        }
        let result = util.TextDecoder.create(undefined, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1000
     * @tc.name       : testTextDecoderCreate010
     * @tc.desc       : Testing the textdecoder create while TextDecoderOptions with no paras.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate010', 0, () => {
      const TAG = 'testTextDecoderCreate010';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {}
        let result = util.TextDecoder.create(null, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1100
     * @tc.name       : testTextDecoderCreate011
     * @tc.desc       : Testing the textdecoder create while ignoreBOM values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate011', 0, () => {
      const TAG = 'testTextDecoderCreate011';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          ignoreBOM: true
        }
        let result = util.TextDecoder.create(null, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1200
     * @tc.name       : testTextDecoderCreate012
     * @tc.desc       : Testing the textdecoder create while ignoreBOM values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate012', 0, () => {
      const TAG = 'testTextDecoderCreate012';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          ignoreBOM: false
        }
        let result = util.TextDecoder.create(null, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1300
     * @tc.name       : testTextDecoderCreate013
     * @tc.desc       : Testing the textdecoder create while fatal values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate013', 0, () => {
      const TAG = 'testTextDecoderCreate013';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          fatal: true
        }
        let result = util.TextDecoder.create(null, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1400
     * @tc.name       : testTextDecoderCreate014
     * @tc.desc       : Testing the textdecoder create while fatal values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate014', 0, () => {
      const TAG = 'testTextDecoderCreate014';
      try {
        let textDecoderOptions: util.TextDecoderOptions = {
          fatal: false
        }
        let result = util.TextDecoder.create(null, textDecoderOptions)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1500
     * @tc.name       : testTextDecoderCreate015
     * @tc.desc       : Testing the textdecoder create interface with iso-8859-15 value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate015', 0, () => {
      const TAG = 'testTextDecoderCreate015';
      try {
        let value = util.TextDecoder.create('iso-8859-15', {
          ignoreBOM: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('iso-8859-15')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1600
     * @tc.name       : testTextDecoderCreate016
     * @tc.desc       : Testing the textdecoder create interface with UTF-16 value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate016', 0, () => {
      const TAG = 'testTextDecoderCreate016';
      try {
        let value = util.TextDecoder.create('UTF-16', {
          ignoreBOM: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-16')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1700
     * @tc.name       : testTextDecoderCreate017
     * @tc.desc       : Testing the textdecoder create interface with UTF-32 value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate017', 0, () => {
      const TAG = 'testTextDecoderCreate017';
      try {
        let value = util.TextDecoder.create('UTF-32', {
          ignoreBOM: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-32')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1800
     * @tc.name       : testTextDecoderCreate018
     * @tc.desc       : Testing the textdecoder create interface while textDecoderOptions no paras.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate018', 0, () => {
      const TAG = 'testTextDecoderCreate018';
      try {
        let value = util.TextDecoder.create('UTF-8', {})
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_1900
     * @tc.name       : testTextDecoderCreate019
     * @tc.desc       : Testing the textdecoder create interface while textDecoderOptions values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate019', 0, () => {
      const TAG = 'testTextDecoderCreate019';
      try {
        let value = util.TextDecoder.create('UTF-8', undefined)
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_2000
     * @tc.name       : testTextDecoderCreate020
     * @tc.desc       : Testing the textdecoder create interface while fatal values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate020', 0, () => {
      const TAG = 'testTextDecoderCreate020';
      try {
        let value = util.TextDecoder.create('UTF-8', {
          fatal: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_2100
     * @tc.name       : testTextDecoderCreate021
     * @tc.desc       : Testing the textdecoder create interface while fatal values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate021', 0, () => {
      const TAG = 'testTextDecoderCreate021';
      try {
        let value = util.TextDecoder.create('UTF-8', {
          fatal: false
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_2200
     * @tc.name       : testTextDecoderCreate022
     * @tc.desc       : Testing the textdecoder create interface while ignoreBOM values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate022', 0, () => {
      const TAG = 'testTextDecoderCreate022';
      try {
        let value = util.TextDecoder.create('UTF-8', {
          ignoreBOM: true
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTDECODERCREAT_2300
     * @tc.name       : testTextDecoderCreate023
     * @tc.desc       : Testing the textdecoder create interface while ignoreBOM values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoderCreate023', 0, () => {
      const TAG = 'testTextDecoderCreate023';
      try {
        let value = util.TextDecoder.create('UTF-8', {
          ignoreBOM: false
        })
        let retStr = value.encoding
        expect(retStr).assertEqual('UTF-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0100
     * @tc.name       : testDecodeWithStream001
     * @tc.desc       : Testing the decodeWithStream interface while input values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream001', 0, () => {
      const TAG = 'testDecodeWithStream001';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
        let retStr = that.decodeWithStream(undefined, decodeWithStreamOptions);
        expect(retStr).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0200
     * @tc.name       : testDecodeWithStream002
     * @tc.desc       : Testing the decodeWithStream interface while input values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream002', 0, () => {
      const TAG = 'testDecodeWithStream002';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
        let retStr = that.decodeWithStream(null, decodeWithStreamOptions);
        expect(retStr).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0300
     * @tc.name       : testDecodeWithStream003
     * @tc.desc       : Testing the decodeWithStream interface while input special value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream003', 0, () => {
      const TAG = 'testDecodeWithStream003';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([999999999.999999999, -0.999999999, 0]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual('   ')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0400
     * @tc.name       : testDecodeWithStream004
     * @tc.desc       : Testing the decodeWithStream interface while input blank value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream004', 0, () => {
      const TAG = 'testDecodeWithStream004';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0500
     * @tc.name       : testDecodeWithStream005
     * @tc.desc       : Testing the decodeWithStream interface while input values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream005', 0, () => {
      const TAG = 'testDecodeWithStream005';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
        let retStr = that.decodeWithStream(uint8arr, undefined);
        expect(retStr).assertEqual(' A15OKFE')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0600
     * @tc.name       : testDecodeWithStream006
     * @tc.desc       : Testing the decodeWithStream interface while input values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream006', 0, () => {
      const TAG = 'testDecodeWithStream006';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
        let retStr = that.decodeWithStream(uint8arr, null);
        expect(retStr).assertEqual(' A15OKFE')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0700
     * @tc.name       : testDecodeWithStream007
     * @tc.desc       : Testing the decodeWithStream interface while stream values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream007', 0, () => {
      const TAG = 'testDecodeWithStream007';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: true
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual(' A15OKFE')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0800
     * @tc.name       : testDecodeWithStream008
     * @tc.desc       : Testing the decodeWithStream interface while stream values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream008', 0, () => {
      const TAG = 'testDecodeWithStream008';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual(' A15OKFE')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_0900
     * @tc.name       : testDecodeWithStream009
     * @tc.desc       : Testing the decodeWithStream interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream009', 0, () => {
      const TAG = 'testDecodeWithStream009';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: true
        }
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertContain('2A01')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_1000
     * @tc.name       : testDecodeWithStream010
     * @tc.desc       : Testing the decodeWithStream interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream010', 0, () => {
      const TAG = 'testDecodeWithStream010';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: true
        }
        const that = util.TextDecoder.create('iso-8859-1');
        const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual('2A01')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_1100
     * @tc.name       : testDecodeWithStream011
     * @tc.desc       : Testing the decodeWithStream interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream011', 0, () => {
      const TAG = 'testDecodeWithStream011';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: true
        }
        const that = util.TextDecoder.create('shift_jis');
        const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual('2A01')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREAM_1200
     * @tc.name       : testDecodeWithStream012
     * @tc.desc       : Testing the decodeWithStream interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeWithStream012', 0, () => {
      const TAG = 'testDecodeWithStream012';
      try {
        let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
          stream: true
        }
        const that = util.TextDecoder.create('big5');
        const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
        let retStr = that.decodeWithStream(uint8arr, decodeWithStreamOptions);
        expect(retStr).assertEqual('2A01')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODER_0100
     * @tc.name       : testTextEncoder001
     * @tc.desc       : Testing the Constructor of TextEncoder.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoder001', 0, () => {
      const TAG = 'testTextEncoder001';
      try {
        let result = new util.TextEncoder();
        let retStr = result.encoding;
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODER_0200
     * @tc.name       : testTextEncoder002
     * @tc.desc       : Testing the Constructor of TextEncoder.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoder002', 0, () => {
      const TAG = 'testTextEncoder002';
      try {
        let result = new util.TextEncoder('iso-8859-14');
        let retStr = result.encoding;
        expect(retStr).assertEqual('iso-8859-14')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODER_0300
     * @tc.name       : testTextEncoder003
     * @tc.desc       : Testing the Constructor of TextEncoder values utf-9.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoder003', 0, () => {
      const TAG = 'testTextEncoder003';
      try {
        let result = new util.TextEncoder('utf-9');
        let retStr = result.encoding;
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODER_0400
     * @tc.name       : testTextEncoder004
     * @tc.desc       : Testing the Constructor of TextEncoder values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoder004', 0, () => {
      const TAG = 'testTextEncoder004';
      try {
        let result = new util.TextEncoder(undefined);
        let retStr = result.encoding;
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0100
     * @tc.name       : testTextEncoderCreate001
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values iso-8859-14.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate001', 0, () => {
      const TAG = 'testTextEncoderCreate001';
      try {
        let result = util.TextEncoder.create('iso-8859-14')
        let retStr = result.encoding
        expect(retStr).assertEqual('iso-8859-14')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0200
     * @tc.name       : testTextEncoderCreate002
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values no paras.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate002', 0, () => {
      const TAG = 'testTextEncoderCreate002';
      try {
        let result = util.TextDecoder.create()
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0300
     * @tc.name       : testTextEncoderCreate003
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate003', 0, () => {
      const TAG = 'testTextEncoderCreate003';
      try {
        let result = util.TextEncoder.create(undefined)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0400
     * @tc.name       : testTextEncoderCreate004
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate004', 0, () => {
      const TAG = 'testTextEncoderCreate004';
      try {
        let result = util.TextEncoder.create(null)
        let retStr = result.encoding
        expect(retStr).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0500
     * @tc.name       : testTextEncoderCreate005
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values 'windows-1250'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate005', 0, () => {
      const TAG = 'testTextEncoderCreate005';
      try {
        let result = util.TextEncoder.create('windows-1250')
        let retStr = result.encoding
        expect(retStr).assertEqual('windows-1250')
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0600
     * @tc.name       : testTextEncoderCreate006
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values 'utf-16'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate006', 0, () => {
      const TAG = 'testTextEncoderCreate006';
      try {
        let result = util.TextEncoder.create('utf-16')
        let retStr = result.encoding
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERCREATE_0700
     * @tc.name       : testTextEncoderCreate007
     * @tc.desc       : Testing the Constructor of TextEncoderCreate values 'utf-32'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderCreate007', 0, () => {
      const TAG = 'testTextEncoderCreate007';
      try {
        let result = util.TextEncoder.create('utf-32')
        let retStr = result.encoding
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERINFO_0100
     * @tc.name       : testTextEncoderInfo001
     * @tc.desc       : Testing the Constructor of testTextEncoderInfo values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderInfo001', 0, () => {
      const TAG = 'testTextEncoderInfo001';
      try {
        let textEncoder = new util.TextEncoder();
        let result = textEncoder.encodeInto(undefined);
        expect(result).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILTEXTENCODERINFO_0200
     * @tc.name       : testTextEncoderInfo002
     * @tc.desc       : Testing the Constructor of testTextEncoderInfo values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEncoderInfo002', 0, () => {
      const TAG = 'testTextEncoderInfo002';
      try {
        let textEncoder = new util.TextEncoder();
        let result = textEncoder.encodeInto(null);
        expect(result).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILencodeIntoUint8Array_0100
     * @tc.name       : testEncodeIntoUint8Array001
     * @tc.desc       : Testing the Constructor of testEncodeIntoUint8Array input values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEncodeIntoUint8Array001', 0, () => {
      const TAG = 'testEncodeIntoUint8Array001';
      try {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(4);
        let dest = new Uint8Array(buffer);
        let result = textEncoder.encodeIntoUint8Array(undefined, dest);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILencodeIntoUint8Array_0200
     * @tc.name       : testEncodeIntoUint8Array002
     * @tc.desc       : Testing the Constructor of testEncodeIntoUint8Array input values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEncodeIntoUint8Array002', 0, () => {
      const TAG = 'testEncodeIntoUint8Array002';
      try {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(4);
        let dest = new Uint8Array(buffer);
        let result = textEncoder.encodeIntoUint8Array(null, dest);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILencodeIntoUint8Array_0300
     * @tc.name       : testEncodeIntoUint8Array003
     * @tc.desc       : Testing the Constructor of testEncodeIntoUint8Array desc values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEncodeIntoUint8Array003', 0, () => {
      const TAG = 'testEncodeIntoUint8Array003';
      try {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(4);
        let result = textEncoder.encodeIntoUint8Array('test', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILencodeIntoUint8Array_0400
     * @tc.name       : testEncodeIntoUint8Array004
     * @tc.desc       : Testing the Constructor of testEncodeIntoUint8Array desc values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEncodeIntoUint8Array004', 0, () => {
      const TAG = 'testEncodeIntoUint8Array004';
      try {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(4);
        let result = textEncoder.encodeIntoUint8Array('test', null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0100
     * @tc.name       : testDecodeToString001
     * @tc.desc       : Testing the decodeWithSting interface while input values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString001', 0, () => {
      const TAG = 'testDecodeToString001';
      try {
        let decodeToStringOptions: util.DecodeToStringOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        let retStr = that.decodeToString(undefined, decodeToStringOptions);
        expect(retStr).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0200
     * @tc.name       : testDecodeToString002
     * @tc.desc       : Testing the decodeToString interface while input values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString002', 0, () => {
      const TAG = 'testDecodeToString002';
      try {
        let decodeToStringOptions: util.DecodeToStringOptions = {
          stream: false
        }
        const that = util.TextDecoder.create('utf-8');
        let retStr = that.decodeToString(null, decodeToStringOptions);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0300
     * @tc.name       : testDecodeToString003
     * @tc.desc       : Testing the decodeToString interface while input special value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString003', 0, () => {
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([999999999.999999999, -0.999999999, 0]);
      let retStr = that.decodeToString(uint8arr);
      let str = encodeURI(retStr)
      expect(str).assertEqual('%00%00%00');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0400
     * @tc.name       : testDecodeToString004
     * @tc.desc       : Testing the decodeToString interface while input blank value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString004', 0, () => {
      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: false
      }
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      expect(retStr).assertEqual('');

    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0500
     * @tc.name       : testDecodeToString005
     * @tc.desc       : Testing the decodeToString interface while input values undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString005', 0, () => {
      const TAG = 'testDecodeToString005';
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
      let retStr = that.decodeToString(uint8arr);
      let str = encodeURI(retStr);
      expect(str).assertEqual('%00A15OKFE');

    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0600
     * @tc.name       : testDecodeToString006
     * @tc.desc       : Testing the decodeToString interface while input values null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString006', 0, () => {
      const TAG = 'testDecodeToString006';
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
      let retStr = that.decodeToString(uint8arr, null);
      let str = encodeURI(retStr);
      expect(str).assertEqual('%00A15OKFE');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0700
     * @tc.name       : testDecodeToString007
     * @tc.desc       : Testing the decodeToString interface while stream values true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString007', 0, () => {
      const TAG = 'testDecodeToString007';

      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: true
      }
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      let str = encodeURI(retStr);
      expect(str).assertEqual('%00A15OKFE');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0800
     * @tc.name       : testDecodeToString008
     * @tc.desc       : Testing the decodeToString interface while stream values false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString008', 0, () => {
      const TAG = 'testDecodeToString008';

      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: false
      }
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      let str = encodeURI(retStr);
      expect(str).assertEqual('%00A15OKFE');
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_0900
     * @tc.name       : testDecodeToString009
     * @tc.desc       : Testing the decodeToString interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString009', 0, () => {
      const TAG = 'testDecodeToString009';

      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: true
      }
      const that = util.TextDecoder.create('utf-8');
      const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      expect(retStr).assertContain('2A01');


    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_1000
     * @tc.name       : testDecodeToString010
     * @tc.desc       : Testing the decodeToString interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString010', 0, () => {
      const TAG = 'testDecodeToString010';
      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: true
      }
      const that = util.TextDecoder.create('iso-8859-1');
      const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      let str = encodeURI(retStr);
      expect(str).assertEqual('2A01%00%00%00%00%00');

    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_1100
     * @tc.name       : testDecodeToString011
     * @tc.desc       : Testing the decodeToString interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString011', 0, () => {
      const TAG = 'testDecodeToString011';

      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: true
      }
      const that = util.TextDecoder.create('shift_jis');
      const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      let str = encodeURI(retStr);
      expect(str).assertEqual('2A01%00%00%00%00%00');

    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILDECODEWITHSTREING_1200
     * @tc.name       : testDecodeToString012
     * @tc.desc       : Testing the decodeToString interface while different code format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDecodeToString012', 0, () => {
      const TAG = 'testDecodeToString012';
      let decodeToStringOptions: util.DecodeToStringOptions = {
        stream: true
      }
      const that = util.TextDecoder.create('big5');
      const uint8arr = new Uint8Array([50, 65, 48, 49, 0, 0, 0, 0, 0]);
      let retStr = that.decodeToString(uint8arr, decodeToStringOptions);
      let str = encodeURI(retStr);
      expect(str).assertEqual('2A01%00%00%00%00%00');

    });
  })
}
