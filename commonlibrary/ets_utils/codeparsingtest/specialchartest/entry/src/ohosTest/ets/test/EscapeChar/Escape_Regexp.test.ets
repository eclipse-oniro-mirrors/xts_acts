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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function abilityTest() {
  describe('RegexpAbilityTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0100
     * @tc.name       : testConstructEscape0001
     * @tc.desc       : Test the BUILINTS interface construct with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0001";
      try {
        const regex1 = /\abc\b/;
        const regex2 = new RegExp('\\abc\\b');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Cb")
        expect(res2).assertEqual("%5Cabc%5Cb")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0200
     * @tc.name       : testConstructEscape0002
     * @tc.desc       : Test the BUILINTS interface construct with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0002";
      try {
        const regex1 = /\abc\f/;
        const regex2 = new RegExp('\\abc\\f');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Cf")
        expect(res2).assertEqual("%5Cabc%5Cf")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0300
     * @tc.name       : testConstructEscape0003
     * @tc.desc       : Test the BUILINTS interface construct with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0003";
      try {
        const regex1 = /\abc\n/;
        const regex2 = new RegExp('\\abc\\n');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Cn")
        expect(res2).assertEqual("%5Cabc%5Cn")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0400
     * @tc.name       : testConstructEscape0004
     * @tc.desc       : Test the BUILINTS interface construct with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0004";
      try {
        const regex1 = /\abc\r/;
        const regex2 = new RegExp('\\abc\\r');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Cr")
        expect(res2).assertEqual("%5Cabc%5Cr")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0500
     * @tc.name       : testConstructEscape0005
     * @tc.desc       : Test the BUILINTS interface construct with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0005";
      try {
        const regex1 = /\abc\t/;
        const regex2 = new RegExp('\\abc\\t');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Ct")
        expect(res2).assertEqual("%5Cabc%5Ct")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0600
     * @tc.name       : testConstructEscape0006
     * @tc.desc       : Test the BUILINTS interface construct with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0006";
      try {
        const regex1 = /\abc\v/;
        const regex2 = new RegExp('\\abc\\v');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Cv")
        expect(res2).assertEqual("%5Cabc%5Cv")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0700
     * @tc.name       : testConstructEscape0007
     * @tc.desc       : Test the BUILINTS interface construct with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0007";
      try {
        const regex1 = /\abc\x24/;
        const regex2 = new RegExp('\\abc\\x24');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5Cx24")
        expect(res2).assertEqual("%5Cabc%5Cx24")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0800
     * @tc.name       : testConstructEscape0008
     * @tc.desc       : Test the BUILINTS interface construct with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0008";
      try {
        const regex1 = /\abc\开/;
        const regex2 = new RegExp('\\abc\\开');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5C%E5%BC%80")
        expect(res2).assertEqual("%5Cabc%5C%E5%BC%80")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0900
     * @tc.name       : testConstructEscape0009
     * @tc.desc       : Test the BUILINTS interface construct with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0009";
      try {
        const regex1 = /\abc\😊/;
        const regex2 = new RegExp('\\abc\\😊');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5C%F0%9F%98%8A")
        expect(res2).assertEqual("%5Cabc%5C%F0%9F%98%8A")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1000
     * @tc.name       : testConstructEscape0010
     * @tc.desc       : Test the BUILINTS interface construct with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0010";
      try {
        const regex1 = /\abc\0/;
        const regex2 = new RegExp('\\abc\\0');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5C0")
        expect(res2).assertEqual("%5Cabc%5C0")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1100
     * @tc.name       : testConstructEscape0011
     * @tc.desc       : Test the BUILINTS interface construct with input escape \\b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testConstructEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConstructEscape0011";
      try {
        const regex1 = /\abc\\b/;
        const regex2 = new RegExp('\\abc\\\b');
        const res1 = encodeURI(regex1.source)
        const res2 = encodeURI(regex2.source)
        expect(res1).assertEqual("%5Cabc%5C%5Cb")
        expect(res2).assertEqual("%5Cabc%5C%08")

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1200
     * @tc.name       : testmacthAllEscape0001
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0001";
      try {
        const escape = "aaa\b";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1300
     * @tc.name       : testmacthAllEscape0002
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0002";
      try {
        const escape = "aaa\f";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1400
     * @tc.name       : testmacthAllEscape0003
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0003";
      try {
        const escape = "aaa\n";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1500
     * @tc.name       : testmacthAllEscape0004
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0004";
      try {
        const escape = "aaa\r";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1600
     * @tc.name       : testmacthAllEscape0005
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0005";
      try {
        const escape = "aaa\t";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1700
     * @tc.name       : testmacthAllEscape0006
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0006";
      try {
        const escape = "aaa\v";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1800
     * @tc.name       : testmacthAllEscape0007
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0007";
      try {
        const escape = "aaa\x24";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1900
     * @tc.name       : testmacthAllEscape0008
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0008";
      try {
        const escape = "\开";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2000
     * @tc.name       : testmacthAllEscape0009
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0009";
      try {
        const escape = "\😊";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2100
     * @tc.name       : testmacthAllEscape0010
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0010";
      try {
        const escape = "\0";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2200
     * @tc.name       : testmacthAllEscape0011
     * @tc.desc       : Test the BUILINTS interface matchAll with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testmacthAllEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testmacthAllEscape0011";
      try {
        const escape = "\b";
        const re = /[0-9]+/g;
        const result = escape.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2300
     * @tc.name       : testreplaceEscape0001
     * @tc.desc       : Test the BUILINTS interface replace with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0001";
      try {
        const escape = "aaa\b";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2400
     * @tc.name       : testreplaceEscape0002
     * @tc.desc       : Test the BUILINTS interface replace with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0002";
      try {
        const escape = "aaa\f";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb%0C");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2500
     * @tc.name       : testreplaceEscape0003
     * @tc.desc       : Test the BUILINTS interface replace with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0003";
      try {
        const escape = "aaa\n";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb%0A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2600
     * @tc.name       : testreplaceEscape0004
     * @tc.desc       : Test the BUILINTS interface replace with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0004";
      try {
        const escape = "aaa\r";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb%0D");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2700
     * @tc.name       : testreplaceEscape0005
     * @tc.desc       : Test the BUILINTS interface replace with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0005";
      try {
        const escape = "aaa\t";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb%09");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2800
     * @tc.name       : testreplaceEscape0006
     * @tc.desc       : Test the BUILINTS interface replace with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0006";
      try {
        const escape = "aaa\v";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb%0B");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_2900
     * @tc.name       : testreplaceEscape0007
     * @tc.desc       : Test the BUILINTS interface replace with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0007";
      try {
        const escape = "aaa\x24";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("bbb$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_3000
     * @tc.name       : testreplaceEscape0008
     * @tc.desc       : Test the BUILINTS interface replace with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0008";
      try {
        const escape = "\开";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("%E5%BC%80");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_3100
     * @tc.name       : testreplaceEscape0009
     * @tc.desc       : Test the BUILINTS interface replace with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0009";
      try {
        const escape = "\😊";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_3200
     * @tc.name       : testreplaceEscape0010
     * @tc.desc       : Test the BUILINTS interface replace with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0010";
      try {
        const escape = "\0";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_3300
     * @tc.name       : testreplaceEscape0011
     * @tc.desc       : Test the BUILINTS interface replace with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testreplaceEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testreplaceEscape0011";
      try {
        const escape = "\b";
        const re = escape.replace(/a/g, 'b');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_3400
     * @tc.name       : testStringRegExpTest0001
     * @tc.desc       : Test the RegExp interface test with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0001';
      try {
        let s: string = '\b';
        let regexp: RegExp = new RegExp('\b');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_3500
     * @tc.name       : testStringRegExpTest0002
     * @tc.desc       : Test the RegExp interface test with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0002';
      try {
        let s: string = '\f';
        let regexp: RegExp = new RegExp('\f');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_3600
     * @tc.name       : testStringRegExpTest0003
     * @tc.desc       : Test the RegExp interface test with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0003';
      try {
        let s: string = '\n';
        let regexp: RegExp = new RegExp('\n');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_3700
     * @tc.name       : testStringRegExpTest0004
     * @tc.desc       : Test the RegExp interface test with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0004';
      try {
        let s: string = '\r';
        let regexp: RegExp = new RegExp('\r');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_3800
     * @tc.name       : testStringRegExpTest0005
     * @tc.desc       : Test the RegExp interface test with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0005';
      try {
        let s: string = '\t';
        let regexp: RegExp = new RegExp('\t');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_3900
     * @tc.name       : testStringRegExpTest0006
     * @tc.desc       : Test the RegExp interface test with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0006';
      try {
        let s: string = '\v';
        let regexp: RegExp = new RegExp('\v');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4000
     * @tc.name       : testStringRegExpTest0007
     * @tc.desc       : Test the RegExp interface test with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0007';
      try {
        let s: string = '\x24';
        let regexp: RegExp = new RegExp('\x24');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4100
     * @tc.name       : testStringRegExpTest0008
     * @tc.desc       : Test the RegExp interface test with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0008';
      try {
        let s: string = '\开';
        let regexp: RegExp = new RegExp('\开');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4200
     * @tc.name       : testStringRegExpTest0009
     * @tc.desc       :Test the RegExp interface test with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0009';
      try {
        let s: string = '\😊';
        let regexp: RegExp = new RegExp('\😊');
        const res = encodeURI(regexp.test(s).toString());
        expect(res).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4300
     * @tc.name       : testStringRegExpTest0010
     * @tc.desc       : Test the RegExp interface test with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0010';
      try {
        let s: string = '\0';
        let regexp: RegExp = new RegExp('\0');
        const res = encodeURI(regexp.test(s).toString());
        expect(res).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4400
     * @tc.name       : testStringRegExpTest0011
     * @tc.desc       : Test the RegExp interface test with input escape \\b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpTest0011';
      try {
        let s: string = '\\b';
        let regexp: RegExp = new RegExp('\\b');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4500
     * @tc.name       : testStringRegExpToString0001
     * @tc.desc       : Test the RegExp interface test with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0001';
      try {
        let regexp: RegExp = new RegExp('\b');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%08/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4600
     * @tc.name       : testStringRegExpToString0002
     * @tc.desc       : Test the RegExp interface test with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0002';
      try {
        let regexp: RegExp = new RegExp('\f');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%0C/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4700
     * @tc.name       : testStringRegExpToString_0003
     * @tc.desc       : Test the RegExp interface test with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString_0003';
      try {
        let regexp: RegExp = new RegExp('\n');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%0A/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4800
     * @tc.name       : testStringRegExpToString_0004
     * @tc.desc       : Test the RegExp interface test with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString_0004';
      try {
        let regexp: RegExp = new RegExp('\r');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%0D/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_4900
     * @tc.name       : testStringRegExpToString0005
     * @tc.desc       : Test the RegExp interface test with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0005';
      try {
        let regexp: RegExp = new RegExp('\t');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%09/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_5000
     * @tc.name       : testStringRegExpToString0006
     * @tc.desc       : Test the RegExp interface test with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0006';
      try {
        let regexp: RegExp = new RegExp('\v');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%0B/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_5100
     * @tc.name       : testStringRegExpToString0007
     * @tc.desc       : Test the RegExp interface test with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0007';
      try {
        let regexp: RegExp = new RegExp('\x24');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/$/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_5200
     * @tc.name       : testStringRegExpToString0008
     * @tc.desc       : Test the RegExp interface test with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0008';
      try {
        let regexp: RegExp = new RegExp('\开');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%E5%BC%80/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_5300
     * @tc.name       : testStringRegExpToString0009
     * @tc.desc       : Test the RegExp interface test with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0009';
      try {
        let regexp: RegExp = new RegExp('\😊');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%F0%9F%98%8A/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_5400
     * @tc.name       : testStringRegExpToString0010
     * @tc.desc       : Test the RegExp interface test with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0010';
      try {
        let regexp: RegExp = new RegExp('\0');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%00/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_5500
     * @tc.name       : testStringRegExpToString0011
     * @tc.desc       : Test the RegExp interface test with input escape \\b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringRegExpToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringRegExpToString0011';
      try {
        let regexp: RegExp = new RegExp('\\b');
        const res = encodeURI(regexp.toString())
        expect(res.toString()).assertEqual('/%5Cb/')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6600
     * @tc.name       : testdotAllEscape0001
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0001";
      try {
        const escape = "aaa\b";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6700
     * @tc.name       : testdotAllEscape0002
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0002";
      try {
        const escape = "aaa\f";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6800
     * @tc.name       : testdotAllEscape0003
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0003";
      try {
        const escape = "aaa\n";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6900
     * @tc.name       : testdotAllEscape0004
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0004";
      try {
        const escape = "aaa\r";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7000
     * @tc.name       : testdotAllEscape0005
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0005";
      try {
        const escape = "aaa\t";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7100
     * @tc.name       : testdotAllEscape0006
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0006";
      try {
        const escape = "aaa\v";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7200
     * @tc.name       : testdotAllEscape0007
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0007";
      try {
        const escape = "aaa\x24";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7300
     * @tc.name       : testdotAllEscape0008
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0008";
      try {
        const escape = "\开";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7400
     * @tc.name       : testdotAllEscape0009
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0009";
      try {
        const escape = "\😊";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7500
     * @tc.name       : testdotAllEscape0010
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0010";
      try {
        const escape = "\0";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7600
     * @tc.name       : testdotAllEscape0011
     * @tc.desc       : Test the BUILINTS interface dotAll with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testdotAllEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testdotAllEscape0011";
      try {
        const escape = "\b";
        const re = new RegExp(escape, 's');
        expect(re.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_7700
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0001
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0001";
      try {
        const regex = /\bword\b/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_7800
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0002
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0002";
      try {
        const regex = /\bword\f/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_7900
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0003
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0003";
      try {
        const regex = /\bword\n/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8000
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0004
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0004";
      try {
        const regex = /\bword\r/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8100
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0005
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0005";
      try {
        const regex = /\bword\t/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8200
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0006
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0006";
      try {
        const regex = /\bword\v/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8300
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0007
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuiltintsRegexpPrototypeFlagsEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0007";
      try {
        const regex = /\bword\x24/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8400
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0008
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \开  == 开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0008";
      try {
        const regex = /\bword\开/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SSUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8500
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0009
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \😊 == 😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0009";
      try {
        const regex = /\bword\😊/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8600
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0010
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \0  == null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0010";
      try {
        const regex = /\bword\0/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8700
     * @tc.name       : testBuilintsRegexpPrototypeFlagsEscape0011
     * @tc.desc       : Testing the Regexp interface prototype.flags with input escape \\b == \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeFlagsEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeFlagsEscape0011";
      try {
        const regex = /\bword\\b/gi;
        const flags = encodeURI(regex.flags);
        expect(flags).assertEqual("gi");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8800
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0001
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0001";
      try {
        const regex = /\bword\b/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_8900
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0002
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0002";
      try {
        const regex = /\bword\f/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9000
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0003
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0003";
      try {
        const regex = /\bword\n/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9100
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0004
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0004";
      try {
        const regex = /\bword\r/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9200
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0005
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0005";
      try {
        const regex = /\bword\t/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9300
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0006
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0006";
      try {
        const regex = /\bword\v/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9400
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0007
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0007";
      try {
        const regex = /\bword\x24/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9500
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0008
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \开  == 开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0008";
      try {
        const regex = /\bword\开/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SSUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9600
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0009
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \😊 == 😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0009";
      try {
        const regex = /\bword\😊/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9700
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0010
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \0  == null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0010";
      try {
        const regex = /\bword\0/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9800
     * @tc.name       : testBuilintsRegExpPrototypeGlobalEscape0011
     * @tc.desc       : Testing the RegExp interface prototype.global with input escape \\b == \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeGlobalEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeGlobalEscape0011";
      try {
        const regex = /\bword\\b/g;
        expect(regex.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_9900
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0001
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0001";
      try {
        const regexFlags = /\bword\b/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10000
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0002
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0002";
      try {
        const regexFlags = /\bword\f/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10100
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0003
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0003";
      try {
        const regexFlags = /\bword\n/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10200
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0004
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0004";
      try {
        const regexFlags = /\bword\r/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10300
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0005
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0005";
      try {
        const regexFlags = /\bword\t/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10400
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0006
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0006";
      try {
        const regexFlags = /\bword\v/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10500
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0007
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0007";
      try {
        const regexFlags = /\bword\x24/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10600
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0008
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \开  == 开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0008";
      try {
        const regexFlags = /\bword\开/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SSUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10700
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0009
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \😊 == 😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0009";
      try {
        const regexFlags = /\bword\😊/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10800
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0010
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \0  == null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0010";
      try {
        const regexFlags = /\bword\0/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_10900
     * @tc.name       : testBuilintsRegExpPrototypeHasIndicesEscape0011
     * @tc.desc       : Testing the RegExp interface prototype.hasIndices with input escape \\b == \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegExpPrototypeHasIndicesEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegExpPrototypeHasIndicesEscape0011";
      try {
        const regexFlags = /\bword\\b/g.flags;
        expect(regexFlags.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11000
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0001
     * @tc.desc       : Testing the Regexp interface prototype.ignoreCase with input escape \b
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0001";
      try {
        const regex = /\bword\b/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11100
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0002
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0002";
      try {
        const regex = /\bword\f/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11200
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0003
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0003";
      try {
        const regex = /\bword\n/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11300
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0004
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0004";
      try {
        const regex = /\bword\r/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11400
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0005
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0005";
      try {
        const regex = /\bword\t/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11500
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0006
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0006";
      try {
        const regex = /\bword\v/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11600
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0007
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0007";
      try {
        const regex = /\bword\x24/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11700
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0008
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \开  == 开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0008";
      try {
        const regex = /\bword\开/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SSUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11800
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0009
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \😊 == 😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0009";
      try {
        const regex = /\bword\😊/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_11900
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0010
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \0  == null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0010";
      try {
        const regex = /\bword\0/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILIINTS_REGEXP_ESCAPE_12000
     * @tc.name       : testBuilintsRegexpPrototypeIgnoreCaseEscape0011
     * @tc.desc       : Testing the RegExp interface prototype.ignoreCase with input escape \\b == \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsRegexpPrototypeIgnoreCaseEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsRegexpPrototypeIgnoreCaseEscape0011";
      try {
        const regex = /\bword\\b/i;
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12100
     * @tc.name       : testRegExpLastIndexEscape0001
     * @tc.desc       : Test the function of the Interface escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0001";
      try {
        const escape = encodeURI('\b');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12200
     * @tc.name       : testRegExpLastIndexEscape0002
     * @tc.desc       : Test the function of the Interface escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0002";
      try {
        const escape = encodeURI('\f');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12300
     * @tc.name       : testRegExpLastIndexEscape0003
     * @tc.desc       : Test the function of the Interface escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0003";
      try {
        const escape = encodeURI('\n');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12400
     * @tc.name       : testRegExpLastIndexEscape0004
     * @tc.desc       : Test the function of the Interface escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0004";
      try {
        const escape = encodeURI('\r');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12500
     * @tc.name       : testRegExpLastIndexEscape0005
     * @tc.desc       : Test the function of the Interface escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0005";
      try {
        const escape = encodeURI('\t');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12600
     * @tc.name       : testRegExpLastIndexEscape0006
     * @tc.desc       : Test the function of the Interface escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0006";
      try {
        const escape = encodeURI('\v');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12700
     * @tc.name       : testRedExpLastIndexEscape0007
     * @tc.desc       : Test the function of the Interface escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0007";
      try {
        const escape = encodeURI('\x24');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12800
     * @tc.name       : testRegExpLastIndexEscape0008
     * @tc.desc       : Test the function of the Interface escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0008";
      try {
        const escape = encodeURI('\开');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(9);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_12900
     * @tc.name       : testRegExpLastIndexEscape0009
     * @tc.desc       : Test the function of the Interface escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0009";
      try {
        const escape = encodeURI('\😊');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(12);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_13000
     * @tc.name       : testRegExpLastIndexEscape0010
     * @tc.desc       : Test the function of the Interface escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0010";
      try {
        const escape = encodeURI('\0');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_LastIndexOf_Escape_13100
     * @tc.name       : testRegExpLastIndexEscape0011
     * @tc.desc       : Test the function of the Interface escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpLastIndexEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpLastIndexEscape0011";
      try {
        const escape = encodeURI('\\b');
        const re = new RegExp(escape, 'g');
        console.log(`${TAG} success: ${escape}`);
        let search = re.exec(escape)
        console.log(`${TAG} success: ${JSON.stringify(search)}`)
        let result = re.lastIndex
        expect(result).assertEqual(4);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13200
     * @tc.name       : testRegExpMultilineEscape0001
     * @tc.desc       : Test the function of the Interface escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0001";
      try {
        const escape = encodeURI('\b');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13300
     * @tc.name       : testRegExpMultilineEscape0002
     * @tc.desc       : Test the function of the Interface escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0002";
      try {
        const escape = encodeURI('\f');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13400
     * @tc.name       : testRegExpMultilineEscape0003
     * @tc.desc       : Test the function of the Interface escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0003";
      try {
        const escape = encodeURI('\n');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13500
     * @tc.name       : testRegExpMultilineEscape0004
     * @tc.desc       : Test the function of the Interface escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0004";
      try {
        const escape = encodeURI('\r');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13600
     * @tc.name       : testRegExpMultilineEscape0005
     * @tc.desc       : Test the function of the Interface escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0005";
      try {
        const escape = encodeURI('\t');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13700
     * @tc.name       : testRegExpMultilineEscape0006
     * @tc.desc       : Test the function of the Interface escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0006";
      try {
        const escape = encodeURI('\v');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13800
     * @tc.name       : testRedExpMultilineEscape0007
     * @tc.desc       : Test the function of the Interface escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRedExpMultilineEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRedExpMultilineEscape0007";
      try {
        const escape = encodeURI('\x24');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_13900
     * @tc.name       : testRegExpMultilineEscape0008
     * @tc.desc       : Test the function of the Interface escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0008";
      try {
        const escape = encodeURI('\开');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_14000
     * @tc.name       : testRegExpMultilineEscape0009
     * @tc.desc       : Test the function of the Interface escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0009";
      try {
        const escape = encodeURI('\😊');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_14100
     * @tc.name       : testRegExpMultilineEscape0010
     * @tc.desc       : Test the function of the Interface escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0010";
      try {
        const escape = encodeURI('\0');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_MULTILINE_Escape_14200
     * @tc.name       : testRegExpMultilineEscape0011
     * @tc.desc       : Test the function of the Interface escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpMultilineEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpMultilineEscape0011";
      try {
        const escape = encodeURI('\\b');
        const re = new RegExp(escape, 'm');
        console.log(`${TAG} success: ${re}`);
        let result = re.multiline
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14300
     * @tc.name       : testRegExpStickyEscape0001
     * @tc.desc       : Test the function of the Interface escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0001";
      try {
        const escape = encodeURI('\b');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14400
     * @tc.name       : testRegExpStickyEscape0002
     * @tc.desc       : Test the function of the Interface escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0002";
      try {
        const escape = encodeURI('\f');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14500
     * @tc.name       : testRegExpStickyEscape0003
     * @tc.desc       : Test the function of the Interface escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0003";
      try {
        const escape = encodeURI('\n');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14600
     * @tc.name       : testRegExpStickyEscape0004
     * @tc.desc       : Test the function of the Interface escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0004";
      try {
        const escape = encodeURI('\r');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14700
     * @tc.name       : testRegExpStickyEscape0005
     * @tc.desc       : Test the function of the Interface escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0005";
      try {
        const escape = encodeURI('\t');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14800
     * @tc.name       : testRegExpStickyEscape0006
     * @tc.desc       : Test the function of the Interface escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0006";
      try {
        const escape = encodeURI('\v');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_14900
     * @tc.name       : testRedExpStickyEscape0007
     * @tc.desc       : Test the function of the Interface escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRedExpStickyEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRedExpStickyEscape0007";
      try {
        const escape = encodeURI('\x24');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_15000
     * @tc.name       : testRegExpStickyEscape0008
     * @tc.desc       : Test the function of the Interface escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0008";
      try {
        const escape = encodeURI('\开');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_15100
     * @tc.name       : testRegExpStickyEscape0009
     * @tc.desc       : Test the function of the Interface escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0009";
      try {
        const escape = encodeURI('\😊');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_15200
     * @tc.name       : testRegExpStickyEscape0010
     * @tc.desc       : Test the function of the Interface escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0010";
      try {
        const escape = encodeURI('\0');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_STICKY_Escape_15300
     * @tc.name       : testRegExpStickyEscape0011
     * @tc.desc       : Test the function of the Interface escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpStickyEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpStickyEscape0011";
      try {
        const escape = encodeURI('\\b');
        const re = new RegExp(escape, 'y');
        console.log(`${TAG} success: ${re}`);
        let result = re.sticky
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_15400
     * @tc.name       : testRegExpUnicodeEscape0001
     * @tc.desc       : Test the function of the Interface escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0001";
      try {
        const escape = encodeURI('\b');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_15500
     * @tc.name       : testRegExpUnicodeEscape0002
     * @tc.desc       : Test the function of the Interface escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0002";
      try {
        const escape = encodeURI('\f');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_15600
     * @tc.name       : testRegExpUnicodeEscape0003
     * @tc.desc       : Test the function of the Interface escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0003";
      try {
        const escape = encodeURI('\n');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_15700
     * @tc.name       : testRegExpUnicodeEscape0004
     * @tc.desc       : Test the function of the Interface escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0004";
      try {
        const escape = encodeURI('\r');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_15800
     * @tc.name       : testRegExpUnicodeEscape0005
     * @tc.desc       : Test the function of the Interface escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0005";
      try {
        const escape = encodeURI('\t');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_15900
     * @tc.name       : testRegExpUnicodeEscape0006
     * @tc.desc       : Test the function of the Interface escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0006";
      try {
        const escape = encodeURI('\v');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_16000
     * @tc.name       : testRedExpUnicodeEscape0007
     * @tc.desc       : Test the function of the Interface escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRedExpUnicodeEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRedExpUnicodeEscape0007";
      try {
        const escape = encodeURI('\x24');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_16100
     * @tc.name       : testRegExpUnicodeEscape0008
     * @tc.desc       : Test the function of the Interface escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0008";
      try {
        const escape = encodeURI('\开');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_16200
     * @tc.name       : testRegExpUnicodeEscape0009
     * @tc.desc       : Test the function of the Interface escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0009";
      try {
        const escape = encodeURI('\😊');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_16300
     * @tc.name       : testRegExpUnicodeEscape0010
     * @tc.desc       : Test the function of the Interface escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0010";
      try {
        const escape = encodeURI('\0');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_REGEXP_BASE_UNICODE_Escape_16400
     * @tc.name       : testRegExpUnicodeEscape0011
     * @tc.desc       : Test the function of the Interface escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpUnicodeEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRegExpUnicodeEscape0011";
      try {
        const escape = encodeURI('\\b');
        const re = new RegExp(escape, 'u');
        console.log(`${TAG} success: ${re}`);
        let result = re.unicode
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
  })
}