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
  describe('EscapeStringaAbilityTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0100
     * @tc.name       : testBuilintsStringSplit0001
     * @tc.desc       : Testing the Buffer interface split with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0001";
      try {
        const str = "Hello\b";
        let splitArray = str.split('\b');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0100
     * @tc.name       : testBuilintsStringSplit0002
     * @tc.desc       : Testing the Buffer interface split with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0002";
      try {
        const str = "Hello\fWorld";
        let splitArray = str.split('\f');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0300
     * @tc.name       : testBuilintsStringSplit0003
     * @tc.desc       : Testing the Buffer interface split with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0003";
      try {
        const str = "Hello\nWorld";
        let splitArray = str.split('\n');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0400
     * @tc.name       : testBuilintsStringSplit0004
     * @tc.desc       : Testing the Buffer interface split with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0004";
      try {
        const str = "Hello\rWorld";
        let splitArray = str.split('\r');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0500
     * @tc.name       : testBuilintsStringSplit0005
     * @tc.desc       : Testing the Buffer interface split with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0005";
      try {
        const str = "Hello\tWorld";
        let splitArray = str.split('\t');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0600
     * @tc.name       : testBuilintsStringSplit0006
     * @tc.desc       : Testing the Buffer interface split with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0006";
      try {
        const str = "Hello\vWorld";
        let splitArray = str.split('\v');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0700
     * @tc.name       : testBuilintsStringSplit0007
     * @tc.desc       : Testing the Buffer interface split with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0007";
      try {
        const str = "Hello\x24World";
        let splitArray = str.split('\x24');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0800
     * @tc.name       : testBuilintsStringSplit0008
     * @tc.desc       : Testing the Buffer interface split with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0008";
      try {
        const str = "abc开";
        let splitArray = str.split('\开');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_0900
     * @tc.name       : testBuilintsStringSplit0009
     * @tc.desc       : Testing the Buffer interface split with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0009";
      try {
        const str = "Hello😊";
        let splitArray = str.split('\😊');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1000
     * @tc.name       : testBuilintsStringSplit0010
     * @tc.desc       : Testing the Buffer interface split with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0010";
      try {
        const str = "Hello";
        let splitArray = str.split('\0');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1100
     * @tc.name       : testBuilintsStringSplit0011
     * @tc.desc       : Testing the Buffer interface split with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSplit0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSplit0011";
      try {
        const str = "Hello\b";
        let splitArray = str.split('\\b');
        let res = encodeURI(splitArray[0]);
        expect(res).assertEqual("Hello%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1200
     * @tc.name       : testBuilintsStringSubstring0001
     * @tc.desc       : Testing the Buffer interface substring with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSubstring0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSubstring0001";
      try {
        const str = "abc\b";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1300
     * @tc.name       : testBuilintsStringSubstring0002
     * @tc.desc       : Testing the Buffer interface substring with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBuilintsStringSubstring0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBuilintsStringSubstring0002";
      try {
        const str = "abc\f";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("%0C");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1400
     * @tc.name       : testBuilintsStringSubstring0003
     * @tc.desc       : Testing the Buffer interface substring with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0003";
      try {
        const str = "abc\n";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("%0A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1500
     * @tc.name       : testBuilintsStringSubstring0004
     * @tc.desc       : Testing the Buffer interface substring with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0004";
      try {
        const str = "abc\r";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("%0D");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1600
     * @tc.name       : testBuilintsStringSubstring0005
     * @tc.desc       : Testing the Buffer interface substring with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0005";
      try {
        const str = "abc\t";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("%09");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1700
     * @tc.name       : testBuilintsStringSubstring0006
     * @tc.desc       : Testing the Buffer interface substring with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0006";
      try {
        const str = "abc\v";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("%0B");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1800
     * @tc.name       : testBuilintsStringSubstring0007
     * @tc.desc       : Testing the Buffer interface substring with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0007";
      try {
        const str = "abc\x24";
        let Array = str.substring(3);
        let res = encodeURI(Array);
        expect(res).assertEqual("$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_1900
     * @tc.name       : testBuilintsStringSubstring0008
     * @tc.desc       : Testing the Buffer interface substring with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0008";
      try {
        const str = "\开";
        let Array = str.substring(0);
        let res = encodeURI(Array);
        expect(res).assertEqual("%E5%BC%80");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_2000
     * @tc.name       : testBuilintsStringSubstring0009
     * @tc.desc       : Testing the Buffer interface substring with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0009";
      try {
        const str = "\😊";
        let Array = str.substring(0);
        let res = encodeURI(Array);
        expect(res).assertEqual("%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_2100
     * @tc.name       : testBuilintsStringSubstring0010
     * @tc.desc       : Testing the Buffer interface substring with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0010";
      try {
        const str = "\0";
        let Array = str.substring(1);
        let res = encodeURI(Array);
        expect(res).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_2200
     * @tc.name       : testBuilintsStringSubstring0011
     * @tc.desc       : Testing the Buffer interface substring with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringSubstring0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringSubstring0011";
      try {
        const str = "\\b";
        let Array = str.substring(1);
        let res = encodeURI(Array);
        expect(res).assertEqual("b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2300
     * @tc.name       : testStringToLocaleLowerCase0001
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0001';
      try {
        let s: string = '\b';
        expect(s.toLocaleLowerCase()).assertEqual('\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2400
     * @tc.name       : testStringToLocaleLowerCase0002
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0002';
      try {
        let s: string = '\f';
        expect(s.toLocaleLowerCase()).assertEqual('\f');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2500
     * @tc.name       : testStringToLocaleLowerCase0003
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0003';
      try {
        let s: string = '\n';
        expect(s.toLocaleLowerCase()).assertEqual('\n');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2600
     * @tc.name       : testStringToLocaleLowerCase0004
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0004';
      try {
        let s: string = '\r';
        expect(s.toLocaleLowerCase()).assertEqual('\r');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2700
     * @tc.name       : testStringToLocaleLowerCase0005
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0005';
      try {
        let s: string = '\t';
        expect(s.toLocaleLowerCase()).assertEqual('\t');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2800
     * @tc.name       : testStringToLocaleLowerCase0006
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0006';
      try {
        let s: string = '\v';
        expect(s.toLocaleLowerCase()).assertEqual('\v');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2900
     * @tc.name       : testStringToLocaleLowerCase0007
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0007';
      try {
        let s: string = '\x24';
        expect(s.toLocaleLowerCase()).assertEqual('\x24');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3000
     * @tc.name       : testStringToLocaleLowerCase0008
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0008';
      try {
        let s: string = '\开';
        expect(s.toLocaleLowerCase()).assertEqual('\开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3100
     * @tc.name       : testStringToLocaleLowerCase0009
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0009';
      try {
        let s: string = '\😊';
        expect(s.toLocaleLowerCase()).assertEqual('\😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3200
     * @tc.name       : testStringToLocaleLowerCase0010
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0010';
      try {
        let s: string = 'null';
        expect(s.toLocaleLowerCase()).assertEqual('null');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3300
     * @tc.name       : testStringToLocaleLowerCase0011
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringToLocaleLowerCase0011';
      try {
        let s: string = '\\b';
        expect(s.toLocaleLowerCase()).assertEqual('\\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3400
     * @tc.name       : testStringtoLocaleUpperCase0001
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0001';
      try {
        let s: string = '\b';
        expect(s.toLocaleUpperCase()).assertEqual('\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3500
     * @tc.name       : testStringtoLocaleUpperCase0002
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0002';
      try {
        let s: string = '\f';
        expect(s.toLocaleUpperCase()).assertEqual('\f');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3600
     * @tc.name       : testStringtoLocaleUpperCase0003
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0003';
      try {
        let s: string = '\n';
        expect(s.toLocaleUpperCase()).assertEqual('\n');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3700
     * @tc.name       : testStringtoLocaleUpperCase0004
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0004';
      try {
        let s: string = '\r';
        expect(s.toLocaleUpperCase()).assertEqual('\r');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3800
     * @tc.name       : testStringtoLocaleUpperCase0005
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0005';
      try {
        let s: string = '\t';
        expect(s.toLocaleUpperCase()).assertEqual('\t');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3900
     * @tc.name       : testStringtoLocaleUpperCase0006
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0006';
      try {
        let s: string = '\v';
        expect(s.toLocaleUpperCase()).assertEqual('\v');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4000
     * @tc.name       : testStringtoLocaleUpperCase0007
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0007';
      try {
        let s: string = '\x24';
        expect(s.toLocaleUpperCase()).assertEqual('\x24');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4100
     * @tc.name       : testStringtoLocaleUpperCase0008
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0008';
      try {
        let s: string = '\开';
        expect(s.toLocaleUpperCase()).assertEqual('\开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4200
     * @tc.name       : testStringtoLocaleUpperCase0009
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0009';
      try {
        let s: string = '\😊';
        expect(s.toLocaleUpperCase()).assertEqual('\😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4300
     * @tc.name       : testStringtoLocaleUpperCase0010
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0010';
      try {
        let s: string = 'null';
        expect(s.toLocaleUpperCase()).assertEqual('NULL');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4400
     * @tc.name       : testStringtoLocaleUpperCase0011
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLocaleUpperCase0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLocaleUpperCase0011';
      try {
        let s: string = '\\b';
        expect(s.toLocaleUpperCase()).assertEqual('\\B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4500
     * @tc.name       : testStringtoLowerCase0001
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0001';
      try {
        let s: string = '\b';
        expect(s.toLowerCase()).assertEqual('\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4600
     * @tc.name       : testStringtoLowerCase0002
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0002';
      try {
        let s: string = '\f';
        expect(s.toLowerCase()).assertEqual('\f');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4700
     * @tc.name       : testStringtoLowerCase0003
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0003';
      try {
        let s: string = '\n';
        expect(s.toLowerCase()).assertEqual('\n');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4800
     * @tc.name       : testStringtoLowerCase0004
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0004';
      try {
        let s: string = '\r';
        expect(s.toLowerCase()).assertEqual('\r');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4900
     * @tc.name       : testStringtoLowerCase0005
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0005';
      try {
        let s: string = '\t';
        expect(s.toLowerCase()).assertEqual('\t');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5000
     * @tc.name       : testStringtoLowerCase0006
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0006';
      try {
        let s: string = '\v';
        expect(s.toLowerCase()).assertEqual('\v');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5100
     * @tc.name       : testStringtoLowerCase0007
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0007';
      try {
        let s: string = '\x24';
        expect(s.toLowerCase()).assertEqual('\x24');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5200
     * @tc.name       : testStringtoLowerCase0008
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0008';
      try {
        let s: string = '\开';
        expect(s.toLowerCase()).assertEqual('\开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5300
     * @tc.name       : testStringtoLowerCase0009
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0009';
      try {
        let s: string = '\😊';
        expect(s.toLowerCase()).assertEqual('\😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5400
     * @tc.name       : testStringtoLowerCase0010
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase0010';
      try {
        let s: string = 'null';
        expect(s.toLowerCase()).assertEqual('null');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5500
     * @tc.name       : testStringtoLowerCase0011
     * @tc.desc       : Test the function of the Interface DateTimeFormat.supportedLocalesOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringtoLowerCase0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testStringtoLowerCase_00011';
      try {
        let s: string = '\\b';
        expect(s.toLowerCase()).assertEqual('\\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_5600
     * @tc.name       : testtoUpperCaseEscape0001
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0001";
      try {
        const escape = "aaa\b";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_5700
     * @tc.name       : testtoUpperCaseEscape0002
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0002";
      try {
        const escape = "aaa\f";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA%0C");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_5800
     * @tc.name       : testtoUpperCaseEscape0003
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0003";
      try {
        const escape = "aaa\n";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA%0A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_5900
     * @tc.name       : testtoUpperCaseEscape0004
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0004";
      try {
        const escape = "aaa\r";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA%0D");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6000
     * @tc.name       : testtoUpperCaseEscape0005
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0005";
      try {
        const escape = "aaa\t";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA%09");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6100
     * @tc.name       : testtoUpperCaseEscape0006
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0006";
      try {
        const escape = "aaa\v";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA%0B");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6200
     * @tc.name       : testtoUpperCaseEscape0007
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0007";
      try {
        const escape = "aaa\x24";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("AAA$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6300
     * @tc.name       : testtoUpperCaseEscape0008
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0008";
      try {
        const escape = "\开";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("%E5%BC%80");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6400
     * @tc.name       : testtoUpperCaseEscape0009
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0009";
      try {
        const escape = "\😊";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6500
     * @tc.name       : testtoUpperCaseEscape0010
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0010";
      try {
        const escape = "\0";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6600
     * @tc.name       : testtoUpperCaseEscape0011
     * @tc.desc       : Test the BUILINTS interface toUpperCase with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoUpperCaseEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoUpperCaseEscape0011";
      try {
        const escape = "\b";
        const result = escape.toUpperCase();
        const res = encodeURI(result);
        expect(res.toString()).assertEqual("%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6700
     * @tc.name       : testtoStringEscape0001
     * @tc.desc       : Test the BUILINTS interface toString with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0001";
      try {
        const escape = "aaa\b";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6800
     * @tc.name       : testtoStringEscape0002
     * @tc.desc       : Test the BUILINTS interface toString with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0002";
      try {
        const escape = "aaa\f";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa%0C");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_6900
     * @tc.name       : testtoStringEscape0003
     * @tc.desc       : Test the BUILINTS interface toString with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0003";
      try {
        const escape = "aaa\n";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa%0A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7000
     * @tc.name       : testtoStringEscape0004
     * @tc.desc       : Test the BUILINTS interface toString with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0004";
      try {
        const escape = "aaa\r";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa%0D");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7100
     * @tc.name       : testtoStringEscape0005
     * @tc.desc       : Test the BUILINTS interface toString with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0005";
      try {
        const escape = "aaa\t";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa%09");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7200
     * @tc.name       : testtoStringEscape0006
     * @tc.desc       : Test the BUILINTS interface toString with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0006";
      try {
        const escape = "aaa\v";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa%0B");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7300
     * @tc.name       : testtoStringEscape0007
     * @tc.desc       : Test the BUILINTS interface toString with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0007";
      try {
        const escape = "aaa\x24";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("aaa$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7400
     * @tc.name       : testtoStringEscape0008
     * @tc.desc       : Test the BUILINTS interface toString with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0008";
      try {
        const escape = "\开";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("%E5%BC%80");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7500
     * @tc.name       : testtoStringEscape0009
     * @tc.desc       : Test the BUILINTS interface toString with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0009";
      try {
        const escape = "\😊";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7600
     * @tc.name       : testtoStringEscape0010
     * @tc.desc       : Test the BUILINTS interface toString with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0010";
      try {
        const escape = "\0";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_7700
     * @tc.name       : testtoStringEscape0011
     * @tc.desc       : Test the BUILINTS interface toString with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testtoStringEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testtoStringEscape0011";
      try {
        const escape = "\b";
        const res = encodeURI(escape);
        expect(res.toString()).assertEqual("%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_7800
     * @tc.name       : testBuilintsStringEscape0001
     * @tc.desc       : Testing the Buffer interface trim with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0001";
      try {
        let rawInput = '   Hello, World!\b   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput)
        expect(res).assertEqual("Hello,%20World!%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_7900
     * @tc.name       : testBuilintsStringEscape0002
     * @tc.desc       : Testing the Buffer interface trim with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0002";
      try {
        let rawInput = '   Hello, World!\f   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput)
        expect(res).assertEqual("Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8000
     * @tc.name       : testBuilintsStringEscape0003
     * @tc.desc       : Testing the Buffer interface trim with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0003";
      try {
        let rawInput = '   Hello, World!\n   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8100
     * @tc.name       : testBuilintsStringEscape0004
     * @tc.desc       : Testing the Buffer interface trim with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0004";
      try {
        let rawInput = '   Hello, World!\r   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8200
     * @tc.name       : testBuilintsStringEscape0005
     * @tc.desc       : Testing the Buffer interface trim with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0005";
      try {
        let rawInput = '   Hello, World!\t   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8300
     * @tc.name       : testBuilintsStringEscape0006
     * @tc.desc       : Testing the Buffer interface trim with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0006";
      try {
        let rawInput = '   Hello, World!\v   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8400
     * @tc.name       : testBuilintsStringEscape0007
     * @tc.desc       : Testing the Buffer interface trim with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0007";
      try {
        let rawInput = '   Hello, World!\x24   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8500
     * @tc.name       : testBuilintsStringEscape0008
     * @tc.desc       : Testing the Buffer interface trim with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0008";
      try {
        let rawInput = '   Hello, World!\开   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!%E5%BC%80");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8600
     * @tc.name       : testBuilintsStringEscape0009
     * @tc.desc       : Testing the Buffer interface trim with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0009";
      try {
        let rawInput = '   Hello, World!\😊   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8700
     * @tc.name       : testBuilintsStringEscape0010
     * @tc.desc       : Testing the Buffer interface trim with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0010";
      try {
        let rawInput = '   Hello, World!\0   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8800
     * @tc.name       : testBuilintsStringEscape0011
     * @tc.desc       : Testing the Buffer interface trim with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscape0011";
      try {
        let rawInput = '   Hello, World!\\b   ';
        let trimmedInput = rawInput.trim();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("Hello,%20World!%5Cb");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_8900
     * @tc.name       : testBuilintsStringEscapeTrimEnd0001
     * @tc.desc       : Testing the Buffer interface trim with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0001";
      try {
        let rawInput = '   Hello, World!\b   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput)
        expect(res).assertEqual("%20%20%20Hello,%20World!%08");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9000
     * @tc.name       : testBuilintsStringEscapeTrimEnd0002
     * @tc.desc       : Testing the Buffer interface trim with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0002";
      try {
        let rawInput = '   Hello, World!\f   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput)
        expect(res).assertEqual("%20%20%20Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9100
     * @tc.name       : testBuilintsStringEscapeTrimEnd0003
     * @tc.desc       : Testing the Buffer interface trim with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0003";
      try {
        let rawInput = '   Hello, World!\n   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9200
     * @tc.name       : testBuilintsStringEscapeTrimEnd0004
     * @tc.desc       : Testing the Buffer interface trim with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0004";
      try {
        let rawInput = '   Hello, World!\r   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9300
     * @tc.name       : testBuilintsStringEscapeTrimEnd0005
     * @tc.desc       : Testing the Buffer interface trim with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0005";
      try {
        let rawInput = '   Hello, World!\t   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9400
     * @tc.name       : testBuilintsStringEscapeTrimEnd0006
     * @tc.desc       : Testing the Buffer interface trim with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0006";
      try {
        let rawInput = '   Hello, World!\v   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9500
     * @tc.name       : testBuilintsStringEscapeTrimEnd0007
     * @tc.desc       : Testing the Buffer interface trim with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0007";
      try {
        let rawInput = '   Hello, World!\x24   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9600
     * @tc.name       : testBuilintsStringEscapeTrimEnd0008
     * @tc.desc       : Testing the Buffer interface trim with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0008";
      try {
        let rawInput = '   Hello, World!\开   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!%E5%BC%80");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9700
     * @tc.name       : testBuilintsStringEscapeTrimEnd0009
     * @tc.desc       : Testing the Buffer interface trim with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0009";
      try {
        let rawInput = '   Hello, World!\😊   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9800
     * @tc.name       : testBuilintsStringEscapeTrimEnd0010
     * @tc.desc       : Testing the Buffer interface trim with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0010";
      try {
        let rawInput = '   Hello, World!\0   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_STRING_ESCAPE_9900
     * @tc.name       : testBuilintsStringEscapeTrimEnd0011
     * @tc.desc       : Testing the Buffer interface trim with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringEscapeTrimEnd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringEscapeTrimEnd0011";
      try {
        let rawInput = '   Hello, World!\\b   ';
        let trimmedInput = rawInput.trimEnd();
        let res = encodeURI(trimmedInput);
        expect(res).assertEqual("%20%20%20Hello,%20World!%5Cb");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10000
     * @tc.name       : testStringTrimStartEscape0001
     * @tc.desc       : Test the function of the Interface escape  \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0001";
      try {
        const escape = encodeURI('\b')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Emoji_10100
     * @tc.name       : testStringTrimStartEscape0002
     * @tc.desc       : Test the function of the Interface escape  \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0002";
      try {
        const escape = encodeURI('\f')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10200
     * @tc.name       : testStringTrimStartEscape0003
     * @tc.desc       : Test the function of the Interface escape  \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0003";
      try {
        const escape = encodeURI('\n')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10300
     * @tc.name       : testStringTrimStartEscape0004
     * @tc.desc       : Test the function of the Interface escape  \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0004";
      try {
        const escape = encodeURI('\r')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10400
     * @tc.name       : testStringTrimStartEscape0005
     * @tc.desc       : Test the function of the Interface escape  \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0005";
      try {
        const escape = encodeURI('\t')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10500
     * @tc.name       : testStringTrimStartEscape0006
     * @tc.desc       : Test the function of the Interface escape  \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0006";
      try {
        const escape = encodeURI('\v')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10600
     * @tc.name       : testStringTrimStartEscape0007
     * @tc.desc       : Test the function of the Interface escape  \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0007";
      try {
        const escape = encodeURI('\x24')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10700
     * @tc.name       : testStringTrimStartEscape0008
     * @tc.desc       : Test the function of the Interface escape  \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0008";
      try {
        const escape = encodeURI('\开')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10800
     * @tc.name       : testStringTrimStartEscape0009
     * @tc.desc       : Test the function of the Interface escape  \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0009";
      try {
        const escape = encodeURI('\😊')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_10900
     * @tc.name       : testStringTrimStartEscape0010
     * @tc.desc       : Test the function of the Interface escape  \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0010";
      try {
        const escape = encodeURI('\0')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_TrimStart_Escape_11000
     * @tc.name       : testStringTrimStartEscape0011
     * @tc.desc       : Test the function of the Interface escape  \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringTrimStartEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStartEscape0011";
      try {
        const escape = encodeURI('\\b')
        let result = (' ' + escape).trimStart()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11100
     * @tc.name       : testStringValueOfEscape0001
     * @tc.desc       : Test the function of the Interface escape  \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0001";
      try {
        const escape = encodeURI('\b')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOft_Emoji_11200
     * @tc.name       : testStringValueOfEscape0002
     * @tc.desc       : Test the function of the Interface escape  \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0002";
      try {
        const escape = encodeURI('\f')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11300
     * @tc.name       : testStringValueOfEscape0003
     * @tc.desc       : Test the function of the Interface escape  \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0003";
      try {
        const escape = encodeURI('\n')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11400
     * @tc.name       : testStringValueOfEscape0004
     * @tc.desc       : Test the function of the Interface escape  \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0004";
      try {
        const escape = encodeURI('\r')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11500
     * @tc.name       : testStringValueOfEscape0005
     * @tc.desc       : Test the function of the Interface escape  \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0005";
      try {
        const escape = encodeURI('\t')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11600
     * @tc.name       : testStringValueOfEscape0006
     * @tc.desc       : Test the function of the Interface escape  \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0006";
      try {
        const escape = encodeURI('\v')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11700
     * @tc.name       : testStringValueOfEscape0007
     * @tc.desc       : Test the function of the Interface escape  \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0007";
      try {
        const escape = encodeURI('\x24')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11800
     * @tc.name       : testStringValueOfEscape0008
     * @tc.desc       : Test the function of the Interface escape  \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0008";
      try {
        const escape = encodeURI('\开')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_11900
     * @tc.name       : testStringValueOfEscape0009
     * @tc.desc       : Test the function of the Interface escape  \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0009";
      try {
        const escape = encodeURI('\😊')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_12000
     * @tc.name       : testStringValueOfEscape0010
     * @tc.desc       : Test the function of the Interface escape  \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0010";
      try {
        const escape = encodeURI('\0')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_String_BASE_ValueOf_Escape_12100
     * @tc.name       : testStringValueOfEscape0011
     * @tc.desc       : Test the function of the Interface escape  \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringValueOfEscape0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOfEscape0011";
      try {
        const escape = encodeURI('\\b')
        let result = new String(escape).valueOf()
        expect(result).assertEqual(escape);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
  })
}