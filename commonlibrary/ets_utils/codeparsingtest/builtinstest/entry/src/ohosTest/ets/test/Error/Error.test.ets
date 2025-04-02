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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';

export default function ErrorTest() {
  describe('errorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0100
     * @tc.name       : testImportError0001
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0001', 0, () => {
      const TAG = "testImportError0001";
      try {
        throw Error("Whoops!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message.includes("Whoops!")).assertEqual(true);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0200
     * @tc.name       : testImportError0002
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0002', 0, () => {
      const TAG = "testImportError0002";
      try {
        throw Error("Whoops!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message.includes("Whoops!")).assertEqual(true);
        expect(err.name).assertEqual('Error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0300
     * @tc.name       : testImportError0003
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0003', 0, () => {
      const TAG = "testImportError0003";
      try {
        throw new Error("Whoops!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message.includes("Whoops!")).assertEqual(true);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0400
     * @tc.name       : testImportError0004
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0004', 0, () => {
      const TAG = "testImportError0004";
      try {
        throw new Error("Whoops!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('Error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0500
     * @tc.name       : testImportError0005
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0005', 0, () => {
      const TAG = "testImportError0005";
      try {
        throw new Error();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0600
     * @tc.name       : testImportError0006
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0006', 0, () => {
      const TAG = "testImportError0006";
      try {
        throw new Error();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('Error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0700
     * @tc.name       : testImportError0007
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0007', 0, () => {
      const TAG = "testImportError0007";
      try {
        throw new Error('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0800
     * @tc.name       : testImportError0008
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0008', 0, () => {
      const TAG = "testImportError0008";
      try {
        throw new Error('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('Error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_0900
     * @tc.name       : testImportError0009
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0009', 0, () => {
      const TAG = "testImportError0009";
      try {
        throw new Error(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
        //expect(err.name).assertEqual('Error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1000
     * @tc.name       : testImportError0010
     * @tc.desc       : Test the function of the ImportError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportError0010', 0, () => {
      const TAG = "testImportError0010";
      try {
        throw new Error(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('Error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1100
     * @tc.name       : testImportRangeError0001
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0001', 0, () => {
      const TAG = "testImportRangeError0001";
      try {
        throw new RangeError('It is a RangeError');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('It is a RangeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1200
     * @tc.name       : testImportRangeError0002
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0002', 0, () => {
      const TAG = "testImportRangeError0002";
      try {
        throw new RangeError('It is a RangeError');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('RangeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1300
     * @tc.name       : testImportRangeError0003
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0003', 0, () => {
      const TAG = "testImportRangeError0003";
      try {
        throw RangeError('It is a RangeError');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('It is a RangeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1400
     * @tc.name       : testImportRangeError0004
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0004', 0, () => {
      const TAG = "testImportRangeError0004";
      try {
        throw RangeError('It is a RangeError');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('RangeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1500
     * @tc.name       : testImportRangeError0005
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0005', 0, () => {
      const TAG = "testImportRangeError0005";
      try {
        throw RangeError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1600
     * @tc.name       : testImportRangeError0006
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0006', 0, () => {
      const TAG = "testImportRangeError0006";
      try {
        throw RangeError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('RangeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1700
     * @tc.name       : testImportRangeError0007
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0007', 0, () => {
      const TAG = "testImportRangeError0007";
      try {
        throw RangeError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1800
     * @tc.name       : testImportRangeError0008
     * @tc.desc       : Test the function of the RangeError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImportRangeError0008', 0, () => {
      const TAG = "testImportRangeError0008";
      try {
        throw RangeError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('RangeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_1900
     * @tc.name       : testReferenceError0001
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0001", 0, () => {
      try {
        throw ReferenceError('message err');
      } catch (e) {
        expect(e.message).assertEqual('message err')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2000
     * @tc.name       : testReferenceError0002
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0002", 0, () => {
      try {
        throw ReferenceError('message err');
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2100
     * @tc.name       : testReferenceError0003
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0003", 0, () => {
      try {
        throw ReferenceError('message err');
      } catch (e) {
        expect(e.filename).assertEqual(undefined)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2200
     * @tc.name       : testReferenceError0004
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0004", 0, () => {
      try {
        throw ReferenceError('message err');
      } catch (e) {
        expect(e.lineNumber).assertEqual(undefined)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2300
     * @tc.name       : testReferenceError0005
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0005", 0, () => {
      try {
        throw ReferenceError('message err');
      } catch (e) {
        expect(e.columnNumber).assertEqual(undefined)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2400
     * @tc.name       : testReferenceError0006
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0006", 0, () => {
      try {
        throw ReferenceError('message err');
      } catch (e) {
        expect(e.stack).assertContain('')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2500
     * @tc.name       : testReferenceError0007
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0007", 0, () => {
      try {
        throw new ReferenceError('message err');
      } catch (e) {
        expect(e.message).assertEqual('message err')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2600
     * @tc.name       : testReferenceError0008
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0008", 0, () => {
      try {
        throw new ReferenceError('message err');
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2700
     * @tc.name       : testReferenceError0009
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0009", 0, () => {
      try {
        throw new ReferenceError('message err');
      } catch (e) {
        expect(e.filename).assertEqual(undefined)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2800
     * @tc.name       : testReferenceError0010
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0010", 0, () => {
      try {
        throw new ReferenceError('message err');
      } catch (e) {
        expect(e.lineNumber).assertEqual(undefined)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_2900
     * @tc.name       : testReferenceError0011
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0011", 0, () => {
      try {
        throw new ReferenceError('message err');
      } catch (e) {
        expect(e.columnNumber).assertEqual(undefined)
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3000
     * @tc.name       : testReferenceError0012
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0012", 0, () => {
      try {
        throw new ReferenceError('message err');
      } catch (e) {
        expect(e.stack).assertContain('')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3100
     * @tc.name       : testReferenceError0013
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0013", 0, () => {
      try {
        throw new TypeError(undefined);
      } catch (e) {
        expect(e.message).assertEqual('')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3200
     * @tc.name       : testReferenceError0014
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0014", 0, () => {
      try {
        throw new TypeError(undefined);
      } catch (e) {
        expect(e.name).assertEqual('TypeError')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3300
     * @tc.name       : testReferenceError0015
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0015", 0, () => {
      try {
        throw ReferenceError();
      } catch (e) {
        expect(e.message).assertEqual('')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3400
     * @tc.name       : testReferenceError0016
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0016", 0, () => {
      try {
        throw ReferenceError();
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3500
     * @tc.name       : testReferenceError0017
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0017", 0, () => {
      try {
        throw ReferenceError('');
      } catch (e) {
        expect(e.message).assertEqual('')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3600
     * @tc.name       : testReferenceError0018
     * @tc.desc       : Test the function of the interface testReferenceError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testReferenceError0018", 0, () => {
      try {
        throw ReferenceError('');
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError')
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3700
     * @tc.name       : testTypeError0001
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0001', 0, () => {
      const TAG = "testTypeError0001"
      try {
        throw new TypeError('"Hello","someFile.js",10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.message)
        expect(`${err.message}`).assertEqual('"Hello","someFile.js",10');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3800
     * @tc.name       : testTypeError0002
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0002', 0, () => {
      const TAG = "testTypeError0002"
      try {
        throw new TypeError('"Hello","someFile.js",10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.name)
        expect(`${err.name}`).assertEqual('TypeError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_3900
     * @tc.name       : testTypeError0003
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0003', 0, () => {
      const TAG = "testTypeError0003"
      try {
        throw new TypeError('"Hello","someFile.js",10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.filename)
        expect(`${err.filename}`).assertEqual('undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4000
     * @tc.name       : testTypeError0004
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0004', 0, () => {
      const TAG = "testTypeError0004"
      try {
        throw new TypeError('"Hello","someFile.js",10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.lineNumber)
        expect(`${err.lineNumber}`).assertEqual('undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4100
     * @tc.name       : testTypeError0005
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0005', 0, () => {
      const TAG = "testTypeError0005"
      try {
        throw new TypeError('"Hello","someFile.js",10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.columnNumber)
        expect(`${err.columnNumber}`).assertEqual('undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4200
     * @tc.name       : testTypeError0006
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0006', 0, () => {
      const TAG = "testTypeError0006"
      try {
        throw new TypeError('"Hello","someFile.js",10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.stack}`);
        console.log("result:" + err.stack + "result1")
        expect(`${err.stack}`).assertContain('entry/src/ohosTest/ets/test/Error/Error.test.ts');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4300
     * @tc.name       : testTypeError0007
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0007', 0, () => {
      const TAG = "testTypeError0007"
      try {
        throw new TypeError('message err');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.message)
        expect(`${err.message}`).assertEqual('message err');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4400
     * @tc.name       : testTypeError0008
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0008', 0, () => {
      const TAG = "testTypeError0008"
      try {
        throw new TypeError('message err');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.name)
        expect(`${err.name}`).assertEqual('TypeError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4500
     * @tc.name       : testTypeError0009
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0009', 0, () => {
      const TAG = "testTypeError0009"
      try {
        throw new TypeError('message err');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.filename)
        expect(`${err.filename}`).assertEqual('undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4600
     * @tc.name       : testTypeError0010
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0010', 0, () => {
      const TAG = "testTypeError0010"
      try {
        throw new TypeError('message err');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.lineNumber)
        expect(`${err.lineNumber}`).assertEqual('undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_47001
     * @tc.name       : testTypeError0011
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0011', 0, () => {
      const TAG = "testTypeError0011"
      try {
        throw new TypeError('message err');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.columnNumber)
        expect(`${err.columnNumber}`).assertEqual('undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4800
     * @tc.name       : testTypeError0012
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0012', 0, () => {
      const TAG = "testTypeError0012"
      try {
        throw new TypeError('message err');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.stack}`);
        console.log("result:" + err.stack)
        expect(`${err.stack}`).assertContain('entry/src/ohosTest/ets/test/Error/Error.test.ts');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_4900
     * @tc.name       : testTypeError0013
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0013', 0, () => {
      const TAG = "testTypeError0013"
      try {
        throw new TypeError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.message)
        expect(`${err.message}`).assertDeepEquals('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5000
     * @tc.name       : testTypeError0014
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0014', 0, () => {
      const TAG = "testTypeError0014"
      try {
        throw new TypeError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.name)
        expect(`${err.name}`).assertDeepEquals('TypeError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5100
     * @tc.name       : testTypeError0015
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0015', 0, () => {
      const TAG = "testTypeError0015"
      try {
        throw new TypeError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.message)
        expect(`${err.message}`).assertDeepEquals('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5200
     * @tc.name       : testTypeError0016
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0016', 0, () => {
      const TAG = "testTypeError0016"
      try {
        throw new TypeError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.name)
        expect(`${err.name}`).assertDeepEquals('TypeError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5300
     * @tc.name       : testTypeError0017
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0017', 0, () => {
      const TAG = "testTypeError0017"
      try {
        throw new TypeError();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.message)
        expect(`${err.message}`).assertDeepEquals('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5400
     * @tc.name       : testTypeError0018
     * @tc.desc       : Test the function of the interface TypeError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypeError0018', 0, () => {
      const TAG = "testTypeError0018"
      try {
        throw new TypeError();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        console.log("result:" + err.name)
        expect(`${err.name}`).assertDeepEquals('TypeError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5500
     * @tc.name       : testAggregateError0001
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0001', 0, () => {
      const TAG = "testAggregateError0001"
      try {
        throw AggregateError([new Error("some error")], "Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Hello");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5600
     * @tc.name       : testAggregateError0002
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0002', 0, () => {
      const TAG = "testAggregateError0002"
      try {
        throw AggregateError([new Error("some error")], "Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual("AggregateError");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5700
     * @tc.name       : testAggregateError0003
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0003', 0, () => {
      const TAG = "testAggregateError0003"
      try {
        throw AggregateError([new Error("some error")], "Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.errors}`).assertEqual("Error: some error");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5800
     * @tc.name       : testAggregateError0004
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0004', 0, () => {
      const TAG = "testAggregateError0004"
      try {
        throw new AggregateError([new Error("some error")], "Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Hello");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_5900
     * @tc.name       : testAggregateError0005
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0005', 0, () => {
      const TAG = "testAggregateError0005"
      try {
        throw new AggregateError([new Error("some error")], "Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual("AggregateError");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6000
     * @tc.name       : testAggregateError0006
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0006', 0, () => {
      const TAG = "testAggregateError0006"
      try {
        throw new AggregateError([new Error("some error")], "Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.errors}`).assertEqual('Error: some error');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6100
     * @tc.name       : testAggregateError0007
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0007', 0, () => {
      const TAG = "testAggregateError0007"
      try {
        throw AggregateError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6200
     * @tc.name       : testAggregateError0008
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0008', 0, () => {
      const TAG = "testAggregateError0008"
      try {
        throw AggregateError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('AggregateError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6300
     * @tc.name       : testAggregateError0009
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0009', 0, () => {
      const TAG = "testAggregateError0009"
      try {
        throw AggregateError([new Error("some error")])
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6400
     * @tc.name       : testAggregateError0010
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0010', 0, () => {
      const TAG = "testAggregateError0010"
      try {
        throw AggregateError([new Error("some error")])
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('AggregateError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6500
     * @tc.name       : testAggregateError0011
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0011', 0, () => {
      const TAG = "testAggregateError0011"
      try {
        throw AggregateError('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6600
     * @tc.name       : testAggregateError0012
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0012', 0, () => {
      const TAG = "testAggregateError0012"
      try {
        throw AggregateError('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('AggregateError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6700
     * @tc.name       : testAggregateError0013
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0013', 0, () => {
      const TAG = "testAggregateError0013"
      try {
        throw AggregateError([new Error("some error")], undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6800
     * @tc.name       : testAggregateError0014
     * @tc.desc       : Test the function of the interface AggregateError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAggregateError0014', 0, () => {
      const TAG = "testAggregateError0014"
      try {
        throw AggregateError([new Error("some error")], undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('AggregateError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_6900
     * @tc.name       : testURIError0001
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0001', 0, () => {
      const TAG = "testURIError0001"
      try {
        throw URIError();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7000
     * @tc.name       : testURIError0002
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0002', 0, () => {
      const TAG = "testURIError0002"
      try {
        throw URIError();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('URIError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7100
     * @tc.name       : testURIError0003
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0003', 0, () => {
      const TAG = "testURIError0003"
      try {
        throw new URIError();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7200
     * @tc.name       : testURIError0004
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0004', 0, () => {
      const TAG = "testURIError0004"
      try {
        throw new URIError();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('URIError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7300
     * @tc.name       : testURIError0005
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0005', 0, () => {
      const TAG = "testURIError0005"
      try {
        throw URIError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7400
     * @tc.name       : testURIError0006
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0006', 0, () => {
      const TAG = "testURIError0006"
      try {
        throw URIError('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('URIError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7500
     * @tc.name       : testURIError0007
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0007', 0, () => {
      const TAG = "testURIError0007"
      try {
        throw URIError('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('abc');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7600
     * @tc.name       : testURIError0008
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0008', 0, () => {
      const TAG = "testURIError0008"
      try {
        throw URIError('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('URIError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7700
     * @tc.name       : testURIError0009
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0009', 0, () => {
      const TAG = "testURIError0009"
      try {
        throw URIError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7800
     * @tc.name       : testURIError0010
     * @tc.desc       : Test the function of the interface URIError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIError0010', 0, () => {
      const TAG = "testURIError0010"
      try {
        throw URIError('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.name).assertEqual('URIError');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_7900
     * @tc.name       : testError.SyntaxError0001
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0001', 0, () => {
      const TAG = "testError.SyntaxError0001";
      try {
        throw SyntaxError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8000
     * @tc.name       : testError.SyntaxError0002
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0002', 0, () => {
      const TAG = "testError.SyntaxError0002";
      try {
        throw SyntaxError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('SyntaxError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8100
     * @tc.name       : testError.SyntaxError0003
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0003', 0, () => {
      const TAG = "testError.SyntaxError0003";
      try {
        throw new SyntaxError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8200
     * @tc.name       : testError.SyntaxError0004
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0004', 0, () => {
      const TAG = "testError.SyntaxError0004";
      try {
        throw new SyntaxError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('SyntaxError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8300
     * @tc.name       : testError.SyntaxError0005
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0005', 0, () => {
      const TAG = "testError.SyntaxError0005";
      try {
        throw new SyntaxError('test');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('test');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8400
     * @tc.name       : testError.SyntaxError0006
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0006', 0, () => {
      const TAG = "testError.SyntaxError0006";
      try {
        throw new SyntaxError('test');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('SyntaxError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8500
     * @tc.name       : testError.SyntaxError0007
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0007', 0, () => {
      const TAG = "testError.SyntaxError0007";
      try {
        throw new SyntaxError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8600
     * @tc.name       : testError.SyntaxError0008
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0008', 0, () => {
      const TAG = "testError.SyntaxError0008";
      try {
        throw new SyntaxError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('SyntaxError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8700
     * @tc.name       : testError.SyntaxError0009
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0009', 0, () => {
      const TAG = "testError.SyntaxError0009";
      try {
        throw new SyntaxError('');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8800
     * @tc.name       : testError.SyntaxError0010
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testError.SyntaxError0010', 0, () => {
      const TAG = "testError.SyntaxError0010";
      try {
        throw new SyntaxError('');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('SyntaxError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_8900
     * @tc.name       : testErrorEvalError0001
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0001', 0, () => {
      const TAG = "testErrorEvalError0001";
      try {
        throw new EvalError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9000
     * @tc.name       : testErrorEvalError0002
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0002', 0, () => {
      const TAG = "testErrorEvalError0002";
      try {
        throw new EvalError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('EvalError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9100
     * @tc.name       : testErrorEvalError0003
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0003', 0, () => {
      const TAG = "testErrorEvalError0003";
      try {
        throw EvalError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9200
     * @tc.name       : testErrorEvalError0004
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0004', 0, () => {
      const TAG = "testErrorEvalError0004";
      try {
        throw EvalError();
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('EvalError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9300
     * @tc.name       : testErrorEvalError0005
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0005', 0, () => {
      const TAG = "testErrorEvalError0005";
      try {
        throw EvalError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9400
     * @tc.name       : testErrorEvalError0006
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0006', 0, () => {
      const TAG = "testErrorEvalError0006";
      try {
        throw EvalError(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('EvalError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9500
     * @tc.name       : testErrorEvalError0007
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0007', 0, () => {
      const TAG = "testErrorEvalError0007";
      try {
        throw new EvalError('');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9600
     * @tc.name       : testErrorEvalError0008
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0008', 0, () => {
      const TAG = "testErrorEvalError0008";
      try {
        throw new EvalError('');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('EvalError');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9700
     * @tc.name       : testErrorEvalError0009
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0009', 0, () => {
      const TAG = "testErrorEvalError0009";
      try {
        throw new EvalError('test');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.message}`).assertEqual('test');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ERROR_9800
     * @tc.name       : testErrorEvalError0010
     * @tc.desc       : Test the function of the interface SyntaxError.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrorEvalError0010', 0, () => {
      const TAG = "testErrorEvalError0010";
      try {
        throw new EvalError('test');
      } catch (err) {
        console.error(`${TAG} failed, error:${err}`);
        expect(`${err.name}`).assertEqual('EvalError');
      }
    })
  })
}