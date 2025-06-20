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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function StringTest() {
  describe('stringTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0100
     * @tc.name       : testFromCharCode0001
     * @tc.desc       : Test the function of the interface fromCharCode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0001";
      try {
        let result = String.fromCharCode();
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0200
     * @tc.name       : testFromCharCode0002
     * @tc.desc       : Test the function of the interface fromCharCode().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0002";
      try {
        let result = String.fromCharCode(189, 43, 190, 61);
        expect(result).assertEqual("½+¾=");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0300
     * @tc.name       : testFromCharCode0003
     * @tc.desc       : Test the function of the interface fromCharCode().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0003";
      try {
        let result = String.fromCharCode(65);
        expect(result).assertEqual("A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0400
     * @tc.name       : testFromCharCode0004
     * @tc.desc       : Test the function of the interface fromCharCode().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0004";
      try {
        let result = String.fromCharCode(65, 66);
        expect(result).assertEqual("AB");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0500
     * @tc.name       : testFromCharCode0005
     * @tc.desc       : Test the function of the interface fromCharCode().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0005";
      try {
        let result = String.fromCharCode(65, 66, 67);
        expect(result).assertEqual("ABC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0600
     * @tc.name       : testFromCharCode0006
     * @tc.desc       : Test the function of the interface fromCharCode().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0006";
      try {
        let result = String.fromCharCode(0x2014);
        expect(result).assertEqual("—");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0700
     * @tc.name       : testFromCharCode0007
     * @tc.desc       : Test the function of the interface fromCharCode().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0007";
      try {
        let result = String.fromCharCode(0x12014);
        expect(result).assertEqual("—");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0800
     * @tc.name       : testFromCharCode0008
     * @tc.desc       : Test the function of the interface testFromCharCode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0008";
      try {
        let result = String.fromCharCode(8212);
        expect(result).assertEqual("—");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0900
     * @tc.name       : testFromCharCode0009
     * @tc.desc       : Test the function of the interface testFromCharCode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCharCode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCharCode0009";
      try {
        let result = String.fromCharCode(-1);
        expect(result).assertEqual("￿");
        let res = encodeURI(result);
        expect(res).assertEqual("%EF%BF%BF");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0100
     * @tc.name       : testFromCodePoint0001
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0001";
      try {
        let result = String.fromCodePoint();
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0200
     * @tc.name       : testFromCodePoint0002
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0002";
      try {
        let result = String.fromCodePoint(42);
        expect(result).assertEqual("*");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0300
     * @tc.name       : testFromCodePoint0003
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0003";
      try {
        let result = String.fromCodePoint(65, 90);
        expect(result).assertEqual("AZ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0400
     * @tc.name       : testFromCodePoint0004
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0004";
      try {
        let result = String.fromCodePoint(0x404);
        expect(result).assertEqual("Є");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0500
     * @tc.name       : testFromCodePoint0005
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0005";
      try {
        let result = String.fromCodePoint(194564);
        expect(result).assertEqual("你");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0600
     * @tc.name       : testFromCodePoint0006
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0006";
      try {
        let result = String.fromCodePoint(0x1d306, 0x61, 0x1d307);
        expect(result).assertEqual("𝌆a𝌇");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0700
     * @tc.name       : testFromCodePoint0007
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0007";
      try {
        let result = String.fromCodePoint(Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("is not integer");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0800
     * @tc.name       : testFromCodePoint0008
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0008";
      try {
        let result = String.fromCodePoint(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("CodePoint < 0 or CodePoint > 0x10FFFF");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_0900
     * @tc.name       : testFromCodePoint0009
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0009";
      try {
        let result = String.fromCodePoint(3.14);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("is not integer");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_1000
     * @tc.name       : testFromCodePoint0010
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0010";
      try {
        let result = String.fromCodePoint(3e-2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("is not integer");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROMCODEPOINT_1100
     * @tc.name       : testFromCodePoint0011
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFromCodePoint0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFromCodePoint0011";
      try {
        let result = String.fromCodePoint(NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("is not integer");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RAW_0100
     * @tc.name       : testRaw0001
     * @tc.desc       : Test the function of the interface testFromCodePoint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRaw0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRaw0001";
      try {
        let result = String.raw`C:\Development\profile\aboutme.html`;
        expect(result).assertEqual("C:\\Development\\profile\\aboutme.html");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RAW_0200
     * @tc.name       : testRaw0002
     * @tc.desc       : Test the function of the interface testRaw.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRaw0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRaw0002";
      try {
        let result = String.raw`Hi\n${2 + 3}!`;
        expect(result).assertEqual("Hi\\n5!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RAW_0300
     * @tc.name       : testRaw0003
     * @tc.desc       : Test the function of the interface testRaw.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRaw0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRaw0003";
      try {
        let result = String.raw`Hi\u000A!`;
        expect(result).assertEqual("Hi\\u000A!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARAT_0100
     * @tc.name       : testCharAt0001
     * @tc.desc       : Test the function of the interface testCharAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharAt0001";
      try {
        const sentence = 'The quick brown fox jumps over the lazy dog.';
        let index = 4;
        let flag1 = sentence.charAt(index);
        expect(flag1).assertEqual("q");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARAT_0200
     * @tc.name       : testCharAt0002
     * @tc.desc       : Test the function of the interface testCharAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharAt0002";
      try {
        const sentence = 'The quick brown fox jumps over the lazy dog.';
        let index = 3;
        let flag1 = sentence.charAt(index);
        expect(flag1).assertEqual(" ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARAT_0300
     * @tc.name       : testCharAt0003
     * @tc.desc       : Test the function of the interface testCharAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharAt0003";
      try {
        const sentence = 'The quick brown fox jumps over the lazy dog.';
        let index = 100;
        let flag1 = sentence.charAt(index);
        expect(flag1).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARAT_0400
     * @tc.name       : testCharAt0004
     * @tc.desc       : Test the function of the interface testCharAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharAt0004";
      try {
        const sentence = 'The quick brown fox jumps over the lazy dog.';
        let index = 0;
        let flag1 = sentence.charAt(index);
        expect(flag1).assertEqual("T");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARAT_0500
     * @tc.name       : testCharAt0005
     * @tc.desc       : Test the function of the interface testCharAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharAt0005";
      try {
        const sentence = 'The quick brown fox jumps over the lazy dog.';
        let index = -1;
        let flag1 = sentence.charAt(index);
        expect(flag1).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARAT_0600
     * @tc.name       : testCharAt0006
     * @tc.desc       : Test the function of the interface testCharAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharAt0006";
      try {
        const sentence = '';
        let index = 1;
        let flag1 = sentence.charAt(index);
        expect(flag1).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARCODEAT_0100
     * @tc.name       : testCharCodeAt0001
     * @tc.desc       : Test the function of the interface testCharCodeAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharCodeAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharCodeAt0001";
      try {
        const sentence = 'ABC';
        let flag1 = sentence.charCodeAt(0);
        expect(flag1).assertEqual(65);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARCODEAT_0200
     * @tc.name       : testCharCodeAt0002
     * @tc.desc       : Test the function of the interface testCharCodeAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharCodeAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharCodeAt0002";
      try {
        const sentence = 'ABC';
        let flag1 = sentence.charCodeAt(1);
        expect(flag1).assertEqual(66);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARCODEAT_0300
     * @tc.name       : testCharCodeAt0003
     * @tc.desc       : Test the function of the interface testCharCodeAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharCodeAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharCodeAt0003";
      try {
        const sentence = '测试';
        let flag1 = sentence.charCodeAt(0);
        expect(flag1).assertEqual(27979);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CHARCODEAT_0400
     * @tc.name       : testCharCodeAt0004
     * @tc.desc       : Test the function of the interface testCharCodeAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCharCodeAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCharCodeAt0004";
      try {
        const sentence = '测试';
        let flag1 = sentence.charCodeAt(1);
        expect(flag1).assertEqual(35797);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0100
     * @tc.name       : testCodePointAt0001
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0001";
      try {
        const sentence = 'ABC';
        let flag1 = sentence.codePointAt(0);
        expect(flag1).assertEqual(65);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0200
     * @tc.name       : testCodePointAt0002
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0002";
      try {
        const sentence = 'ABC';
        let flag1 = sentence.codePointAt(0)?.toString(16);
        expect(flag1).assertEqual("41");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0300
     * @tc.name       : testCodePointAt0003
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0003";
      try {
        const sentence = '😍';
        let flag1 = sentence.codePointAt(0);
        expect(flag1).assertEqual(128525);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0400
     * @tc.name       : testCodePointAt0004
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0004";
      try {
        const sentence = '\ud83d\ude0d';
        let flag1 = sentence.codePointAt(0);
        expect(flag1).assertEqual(128525);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0500
     * @tc.name       : testCodePointAt0005
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0005";
      try {
        const sentence = '\ud83d\ude0d';
        let flag1 = sentence.codePointAt(0)?.toString(16);
        expect(flag1).assertEqual("1f60d");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0600
     * @tc.name       : testCodePointAt0006
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0006";
      try {
        const sentence = '😍';
        let flag1 = sentence.codePointAt(1);
        expect(flag1).assertEqual(56845);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0700
     * @tc.name       : testCodePointAt0007
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0007";
      try {
        const sentence = '\ud83d\ude0d';
        let flag1 = sentence.codePointAt(1);
        expect(flag1).assertEqual(56845);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0800
     * @tc.name       : testCodePointAt0008
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0008";
      try {
        const sentence = '\ud83d\ude0d';
        let index = 1;
        let result8 = sentence.codePointAt(index)?.toString(16);
        expect(result8).assertEqual("de0d");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_0900
     * @tc.name       : testCodePointAt0009
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0009";
      try {
        const sentence = 'ABC';
        let index = 42;
        let result9 = sentence.codePointAt(index);
        expect(result9).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_1000
     * @tc.name       : testCodePointAt0010
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0010";
      try {
        const sentence = 'ABC';
        let index = 5;
        let result10 = sentence.codePointAt(index);
        expect(result10).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CODEPOINTAT_1100
     * @tc.name       : testCodePointAt0011
     * @tc.desc       : Test the function of the interface testCodePointAt.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCodePointAt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCodePointAt0011";
      try {
        const sentence = 'ABC';
        let index = -1;
        let result11 = sentence.codePointAt(index);
        expect(result11).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0100
     * @tc.name       : testConcat0001
     * @tc.desc       : Test the function of the interface testConcat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConcat0001";
      try {
        const str1 = 'Hello';
        const str2 = 'World';
        let flag1 = str1.concat(str2);
        let flag2 = str2.concat(str1);
        expect(flag1).assertEqual("HelloWorld");
        expect(flag2).assertEqual("WorldHello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0200
     * @tc.name       : testConcat0002
     * @tc.desc       : Test the function of the interface testConcat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConcat0002";
      try {
        const str1 = '';
        const str2 = 'World';
        let flag1 = str1.concat(str2);
        console.log(flag1);
        expect(flag1).assertEqual("World");
        let flag2 = str2.concat(str1);
        console.log(flag2);
        expect(flag2).assertEqual("World");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0300
     * @tc.name       : testConcat0003
     * @tc.desc       : Test the function of the interface testConcat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConcat0003";
      try {
        const str1 = 'Hello';
        const str2 = '';
        let flag1 = str1.concat(str2);
        console.log(flag1);
        expect(flag1).assertEqual("Hello");
        let flag2 = str2.concat(str1);
        console.log(flag2);
        expect(flag2).assertEqual("Hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0400
     * @tc.name       : testConcat0004
     * @tc.desc       : Test the function of the interface testConcat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testConcat0004";
      try {
        const str1 = 'Hello';
        const str2 = 'World';
        const str3 = 'PyTest';
        let flag1 = str3.concat(str1, str2);
        console.log(flag1);
        expect(flag1).assertEqual("PyTestHelloWorld");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0100
     * @tc.name       : testEndsWith0001
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0001";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith("world");
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0200
     * @tc.name       : testEndsWith0002
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0002";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith("hello");
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0300
     * @tc.name       : testEndsWith0003
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0003";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith("test");
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0400
     * @tc.name       : testEndsWith0004
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0004";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith('world，14');
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0500
     * @tc.name       : testEndsWith0005
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0005";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith('world', 65536);
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0600
     * @tc.name       : testEndsWith0006
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0006";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith('world', -1);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0700
     * @tc.name       : testEndsWith0007
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0007";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith('world', undefined);
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0800
     * @tc.name       : testEndsWith0008
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0008";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith('my', 2);
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_0900
     * @tc.name       : testEndsWith0009
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0009";
      try {
        const str1 = 'my hello world';
        let flag1 = str1.endsWith('my', 10);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ENDSWITH_1000
     * @tc.name       : testEndsWith0010
     * @tc.desc       : Test the function of the interface testEndsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEndsWith0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testEndsWith0010";
      try {
        const str1 = '';
        let flag1 = str1.endsWith('test');
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0100
     * @tc.name       : testIncludes0001
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0001";
      try {
        const str1 = 'Hello world';
        let flag1 = str1.includes('world');
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0200
     * @tc.name       : testIncludes0002
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0002";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('Hello');
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0300
     * @tc.name       : testIncludes0003
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0003";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('WORLD');
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0400
     * @tc.name       : testIncludes0004
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0004";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('hello');
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0500
     * @tc.name       : testIncludes0005
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0005";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('');
        expect(flag1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0600
     * @tc.name       : testIncludes0006
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0006";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('world', 0);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0700
     * @tc.name       : testIncludes0007
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0007";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('world', 5);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0800
     * @tc.name       : testIncludes0008
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0008";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('world', 11);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0900
     * @tc.name       : testIncludes0009
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0009";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('world', undefined);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1000
     * @tc.name       : testIncludes0010
     * @tc.desc       : Test the function of the interface testIncludes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIncludes0010";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.includes('world', -1);
        expect(flag1).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0100
     * @tc.name       : testIndexOf0001
     * @tc.desc       : Test the function of the interface testIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIndexOf0001";
      try {
        const str1 = 'Hello World';
        let flag1 = str1.indexOf('World');
        expect(flag1).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0100
     * @tc.name       : testLastIndexOf0001
     * @tc.desc       : Test the function of the interface testLastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLastIndexOf0001";
      try {
        const str1 = 'HelloWorld';
        let flag1 = str1.lastIndexOf("World");
        expect(flag1).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0200
     * @tc.name       : testLocaleCompare0001
     * @tc.desc       : Test the function of the interface testLocaleCompare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLocaleCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLocaleCompare0001";
      try {
        const a = 'réservé';
        const b = 'RESERVE';
        let flag1 = a.lastIndexOf(b);
        expect(flag1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0300
     * @tc.name       : testMatchAll0001
     * @tc.desc       : Test the function of the interface testMatchAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMatchAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testMatchAll0001";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = 'test1test2';
        let result: IterableIterator<RegExpMatchArray>;
        result = str.matchAll(regexp);
        for (const match of result) {
          console.log(
            `找到${match[0]} 起始位置=${match.index} 结束位置=${
            match.index} + ${match[0].length}
            `
          );
          console.log('String.matchAll result:' + JSON.stringify(match));
          if (match.index == 0) {
            expect(JSON.stringify(match)).assertEqual('["test1","e","st1","1"]');
          } else {
            expect(JSON.stringify(match)).assertEqual('["test2","e","st2","2"]');
          }
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0400
     * @tc.name       : testNormalize0001
     * @tc.desc       : Test the function of the interface testNormalize.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNormalize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNormalize0001";
      try {
        let string1 = "\u00F1";
        string1 = string1.normalize("NFD");
        let result = string1.length;
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0500
     * @tc.name       : testPadEnd0001
     * @tc.desc       : Test the function of the interface testPadEnd.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPadEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPadEnd0001";
      try {
        const str1 = 'Breaded Mushrooms';
        let flag1 = str1.padEnd(25, '.');
        expect(flag1).assertEqual("Breaded Mushrooms........");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0600
     * @tc.name       : testPadStart0001
     * @tc.desc       : Test the function of the interface testPadStart.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPadStart0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testPadStart0001";
      try {
        const str1 = '5';
        let flag1 = str1.padStart(2, '0');
        expect(flag1).assertEqual("05");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0700
     * @tc.name       : testRepeat0001
     * @tc.desc       : Test the function of the interface testRepeat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRepeat0001";
      try {
        const str = '1';
        let flag1 = str.repeat(3);
        expect(flag1).assertEqual("111");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0800
     * @tc.name       : testReplace0001
     * @tc.desc       : Test the function of the interface testReplace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReplace0001";
      try {
        const str = '1';
        let flag1 = str.replace("1", "2");
        expect(flag1).assertEqual("2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_0900
     * @tc.name       : testReplaceAll0001
     * @tc.desc       : Test the function of the interface testReplaceAll.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReplaceAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReplaceAll0001";
      try {
        const str = "123321";
        let flag1 = str.replaceAll('1', '2');
        expect(flag1).assertEqual("223322");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1000
     * @tc.name       : testSearch0001
     * @tc.desc       : Test the function of the interface testSearch.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSearch0001";
      try {
        const paragraph = "I think Ruth's dog is cuter than your dog!";
        const regex = /[^\w\s']/g;
        let flag1 = paragraph.search(regex);
        expect(flag1).assertEqual(41);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1100
     * @tc.name       : testSlice0001
     * @tc.desc       : Test the function of the interface testSlice.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSlice0001";
      try {
        const paragraph = "I think Ruth's dog is cuter than your dog.";
        let flag1 = paragraph.slice(-4);
        expect(flag1).assertEqual("dog.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1200
     * @tc.name       : testSplit0001
     * @tc.desc       : Test the function of the interface testSplit.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSplit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSplit0001";
      try {
        const str = "The quick brown fox jumps over the lazy dog.";
        let words = str.split(' ');
        let flag1 = words[3];
        expect(flag1).assertEqual("fox");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1300
     * @tc.name       : testStartsWith0001
     * @tc.desc       : Test the function of the interface testStartsWith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStartsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartsWith0001";
      try {
        const str = 'Saturday night plans';
        let result = str.startsWith('Sat');
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1400
     * @tc.name       : testSubstring0001
     * @tc.desc       : Test the function of the interface testSubstring.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSubstring0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSubstring0001";
      try {
        const str = 'Mozilla';
        let result = str.substring(1, 3);
        expect(result).assertEqual("oz");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1500
     * @tc.name       : testProtoTypeSymbol0001
     * @tc.desc       : Test the function of the interface testProtoTypeSymbol.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProtoTypeSymbol0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProtoTypeSymbol0001";
      try {
        const str: string = "The quick red fox jumped over the lazy dog's back.";
        const iterator = str[Symbol.iterator]();
        let result = iterator.next();
        console.log('String.prototypeSymbol result:' + JSON.stringify(result));
        expect(JSON.stringify(result)).assertEqual("{\"value\":\"T\",\"done\":false}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1600
     * @tc.name       : testToLocaleLowerCase0001
     * @tc.desc       : Test the function of the interface testToLocaleLowerCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToLocaleLowerCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testToLocaleLowerCase0001";
      try {
        const str = 'İstanbul';
        let result = str.toLocaleLowerCase('en-US');
        expect(result).assertEqual("i̇stanbul");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1700
     * @tc.name       : testToLocaleUpperCase0001
     * @tc.desc       : Test the function of the interface testToLocaleUpperCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToLocaleUpperCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testToLocaleUpperCase0001";
      try {
        const str = 'istanbul';
        let result = str.toLocaleUpperCase('en-US');
        expect(result).assertEqual("ISTANBUL");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1800
     * @tc.name       : testToLowerCase0001
     * @tc.desc       : Test the function of the interface testToLowerCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToLowerCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testToLowerCase0001";
      try {
        const str = 'The quick brown fox jumps over the lazy dog.';
        let result = str.toLowerCase();
        expect(result).assertEqual("the quick brown fox jumps over the lazy dog.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_1900
     * @tc.name       : testToString0001
     * @tc.desc       : Test the function of the interface testToString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testToString0001";
      try {
        const stringObj = new String('foo');
        let result = stringObj.toString();
        expect(result).assertEqual("foo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2000
     * @tc.name       : testToUpperCase0001
     * @tc.desc       : Test the function of the interface testToUpperCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToUpperCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testToUpperCase0001";
      try {
        const sentence = "abc";
        let result = sentence.toUpperCase();
        expect(result).assertEqual("ABC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2100
     * @tc.name       : testTrim0001
     * @tc.desc       : Test the function of the interface testTrim.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTrim0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTrim0001";
      try {
        const sentence = "  abc  ";
        let result = sentence.trim();
        expect(result).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_22000
     * @tc.name       : testTrimEnd0001
     * @tc.desc       : Test the function of the interface testTrimEnd.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTrimEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTrimEnd0001";
      try {
        const sentence = "  abc  ";
        let result = sentence.trimEnd();
        expect(result).assertEqual("  abc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_23000
     * @tc.name       : testTrimStart0001
     * @tc.desc       : Test the function of the interface testTrimStart.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTrimStart0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTrimStart0001";
      try {
        const sentence = "  abc  ";
        let result = sentence.trimStart();
        expect(result).assertEqual("abc  ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_24000
     * @tc.name       : testValueOf0001
     * @tc.desc       : Test the function of the interface testValueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testValueOf0001";
      try {
        const stringObj = new String('foo');
        let result = stringObj.valueOf();
        expect(result).assertEqual("foo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2500
     * @tc.name      : testPrototypeIndexOf0001
     * @tc.desc      : The indexOf() method of String values searches this string and returns
     *                 the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0001';
      try {
        const str = "hello world";
        let str1 = str.indexOf("");
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2600
     * @tc.name      : testPrototypeIndexOf0002
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0002';
      try {
        const str = "hello world";
        let str1 = str.indexOf("", 0);
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2700
     * @tc.name      : testPrototypeIndexOf0003
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0003';
      try {
        const str = "hello world";
        let str1 = str.indexOf("", -1);
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2800
     * @tc.name      : testPrototypeIndexOf0004
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0004';
      try {
        const str = "hello world";
        let str1 = str.indexOf("", 8);
        expect(str1).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_2900
     * @tc.name      : testPrototypeIndexOf0005
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0005';
      try {
        const str = "hello world";
        let str1 = str.indexOf("", 11);
        expect(str1).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3000
     * @tc.name      : testPrototypeIndexOf0006
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0006';
      try {
        const str = "hello world";
        let str1 = str.indexOf("", 13);
        expect(str1).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3100
     * @tc.name      : testPrototypeIndexOf0007
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "hello world";
      const TAG = 'testPrototypeIndexOf0007';
      let str1 = str.indexOf("abc", undefined);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3200
     * @tc.name      : testPrototypeIndexOf0008
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeIndexOf0008';
      try {
        const str = "hello world";
        let str1 = str.indexOf("", 5.5);
        expect(str1).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3300
     * @tc.name      : testPrototypeIndexOf0009
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Brave new world";
      const TAG = 'testPrototypeIndexOf0009';
      let str1 = str.indexOf("w");
      try {
        expect(str1).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3400
     * @tc.name      : testPrototypeIndexOf0010
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Brave new world";
      const TAG = 'testPrototypeIndexOf0010';
      let str1 = str.indexOf("new");
      try {
        expect(str1).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3500
     * @tc.name      : testPrototypeIndexOf0011
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "brie, pepper jack, cheddar";
      const TAG = 'testPrototypeIndexOf0011';
      let str1 = str.indexOf("cheddar");
      try {
        expect(str1).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3600
     * @tc.name      : testPrototypeIndexOf0012
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Brie, Pepper Jack, Cheddar";
      const TAG = 'testPrototypeIndexOf0012';
      let str1 = str.indexOf("cheddar");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3700
     * @tc.name      : testPrototypeIndexOf0013
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale";
      const TAG = 'testPrototypeIndexOf0013';
      let str1 = str.indexOf("Blue");
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3800
     * @tc.name      : testPrototypeIndexOf0014
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale";
      const TAG = 'testPrototypeIndexOf0014';
      let str1 = str.indexOf("Blute");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_3900
     * @tc.name      : testPrototypeIndexOf0015
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale";
      const TAG = 'testPrototypeIndexOf0015';
      let str1 = str.indexOf("Whale", 0);
      try {
        expect(str1).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4000
     * @tc.name      : testPrototypeIndexOf0016
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale";
      const TAG = 'testPrototypeIndexOf0016';
      let str1 = str.indexOf("Whale", 5);
      try {
        expect(str1).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4100
     * @tc.name      : testPrototypeIndexOf0017
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale";
      const TAG = 'testPrototypeIndexOf0017';
      let str1 = str.indexOf("Whale", 7);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4200
     * @tc.name      : testPrototypeIndexOf0018
     * @tc.desc      : The indexOf() method of String values searches this string and returns the index of the first occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale";
      const TAG = 'testPrototypeIndexOf0018';
      let str1 = str.indexOf("biue");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4300
     * @tc.name      : testPrototypeLastIndexOf0001
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0001';
      let str1 = str.lastIndexOf("a");
      try {
        expect(str1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4400
     * @tc.name      : testPrototypeLastIndexOf0002
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0002';
      let str1 = str.lastIndexOf("a", 2);
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4500
     * @tc.name      : testPrototypeLastIndexOf0003
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0003';
      let str1 = str.lastIndexOf("a", 0);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4600
     * @tc.name      : testPrototypeLastIndexOf0004
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0004';
      let str1 = str.lastIndexOf("x");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4700
     * @tc.name      : testPrototypeLastIndexOf0005
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0005';
      let str1 = str.lastIndexOf("c", -5);
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_4800
     * @tc.name      : testPrototypeLastIndexOf0006
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0006';
      let str1 = str.lastIndexOf("c", 0);
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5000
     * @tc.name      : testPrototypeLastIndexOf0008
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0008';
      let str1 = str.lastIndexOf("", 2);
      try {
        expect(str1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5100
     * @tc.name      : testPrototypeLastIndexOf0009
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeLastIndexOf0009';
      try {
        const str = "canal";
        let str1 = str.lastIndexOf("a", undefined);
        expect(str1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5200
     * @tc.name      : testPrototypeLastIndexOf0010
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0010';
      let str1 = str.lastIndexOf("", 2.5);
      try {
        expect(str1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5300
     * @tc.name      : testPrototypeLastIndexOf0011
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0011';
      let str1 = str.lastIndexOf("A");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5400
     * @tc.name      : testPrototypeLastIndexOf0012
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0012';
      let str1 = str.lastIndexOf("A", 2);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5500
     * @tc.name      : testPrototypeLastIndexOf0013
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "canal";
      const TAG = 'testPrototypeLastIndexOf0013';
      let str1 = str.lastIndexOf("A", 0);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5600
     * @tc.name      : testPrototypeLastIndexOf0014
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0014';
      let str1 = str.lastIndexOf("Blue");
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5700
     * @tc.name      : testPrototypeLastIndexOf0015
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0015';
      let str1 = str.lastIndexOf("Blue", 2);
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5800
     * @tc.name      : testPrototypeLastIndexOf0016
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0016';
      let str1 = str.lastIndexOf("Blue", 0);
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_5900
     * @tc.name      : testPrototypeLastIndexOf0017
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0017';
      let str1 = str.lastIndexOf("blue");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6000
     * @tc.name      : testPrototypeLastIndexOf0018
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0018';
      let str1 = str.lastIndexOf("blue", 2);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6100
     * @tc.name      : testPrototypeLastIndexOf0019
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0019';
      let str1 = str.lastIndexOf("blue", 0);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6300
     * @tc.name      : testPrototypeLastIndexOf0021
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0021';
      let str1 = str.lastIndexOf("", 2);
      try {
        expect(str1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6400
     * @tc.name      : testPrototypeLastIndexOf0022
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0022';
      let str1 = str.lastIndexOf("", 2.5);
      try {
        expect(str1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6500
     * @tc.name      : testPrototypeLastIndexOf0023
     * @tc.desc      : The lastIndexOf() method of String values searches this string and returns the index of the last occurrence of the specified substring.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLastIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Blue Whale, Killer Whale";
      const TAG = 'testPrototypeLastIndexOf0023';
      let str1 = str.lastIndexOf("Blue", undefined);
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6600
     * @tc.name      : testPrototypeLocaleCompare0001
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Banana";
      const TAG = 'testPrototypeLocaleCompare0001';
      let str1 = str.localeCompare("Apple");
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6700
     * @tc.name      : testPrototypeLocaleCompare0002
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Banana";
      const TAG = 'testPrototypeLocaleCompare0002';
      let str1 = str.localeCompare("Banana");
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6800
     * @tc.name      : testPrototypeLocaleCompare0003
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Banana";
      const TAG = 'testPrototypeLocaleCompare0003';
      let str1 = str.localeCompare("Grape");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_6900
     * @tc.name      : testPrototypeLocaleCompare0004
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "Banana";
      const TAG = 'testPrototypeLocaleCompare0004';
      let str1 = str.localeCompare("");
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7000
     * @tc.name      : testPrototypeLocaleCompare0005
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "B";
      const TAG = 'testPrototypeLocaleCompare0005';
      let str1 = str.localeCompare("A");
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7100
     * @tc.name      : testPrototypeLocaleCompare0006
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "B";
      const TAG = 'testPrototypeLocaleCompare0006';
      let str1 = str.localeCompare("B");
      try {
        expect(str1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7200
     * @tc.name      : testPrototypeLocaleCompare0007
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "B";
      const TAG = 'testPrototypeLocaleCompare0007';
      let str1 = str.localeCompare("G");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7300
     * @tc.name      : testPrototypeLocaleCompare0008
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "B";
      const TAG = 'testPrototypeLocaleCompare0008';
      let str1 = str.localeCompare("");
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7400
     * @tc.name      : testPrototypeLocaleCompare0009
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "B";
      const TAG = 'testPrototypeLocaleCompare0009';
      let str1 = str.localeCompare("undefinded");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7500
     * @tc.name      : testPrototypeLocaleCompare0010
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "ä";
      const TAG = 'testPrototypeLocaleCompare0010';
      let str1 = str.localeCompare("z", "de");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7600
     * @tc.name      : testPrototypeLocaleCompare0011
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "ä";
      const TAG = 'testPrototypeLocaleCompare0011';
      let str1 = str.localeCompare("z", "sv");
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7700
     * @tc.name      : testPrototypeLocaleCompare0012
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "2";
      const TAG = 'testPrototypeLocaleCompare0012';
      let str1 = str.localeCompare("10");
      try {
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7800
     * @tc.name      : testPrototypeLocaleCompare0013
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeLocaleCompare0013';
      try {
        const str = "2";
        let str1 = str.localeCompare("1");
        expect(str1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_7900
     * @tc.name      : testPrototypeLocaleCompare0014
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "2";
      const TAG = 'testPrototypeLocaleCompare0014';
      let str1 = str.localeCompare("10", undefined, {
        numeric: true
      });
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8000
     * @tc.name      : testPrototypeLocaleCompare0015
     * @tc.desc      : The localeCompare() method of String values returns a number indicating whether this string comes before, or after, or is the same as the given string in sort order.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeLocaleCompare0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "2";
      const TAG = 'testPrototypeLocaleCompare0015';
      let str1 = str.localeCompare("10", "en-u-kn-true");
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8100
     * @tc.name      : testPrototypeMatch0001
     * @tc.desc      : The match() method of String values retrieves the result of matching this string against a regular expression.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "For more information, see Chapter 3.4.5.1";
      const TAG = 'testPrototypeMatch0001';
      const re = /see (chapter \d+(\.\d)*)/i;
      const found = str.match(re);
      let str1 = JSON.stringify(found);
      try {
        expect(str1).assertEqual('["see Chapter 3.4.5.1","Chapter 3.4.5.1",".1"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8200
     * @tc.name      : testPrototypeMatch0002
     * @tc.desc      : The match() method of String values retrieves the result of matching this string against a regular expression.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "ABCDEFGHIJKLMNOPQRSTUVWHIZabcdefghijklmnopqrstuvwxyz";
      const TAG = 'testPrototypeMatch0002';
      const regexp = /[A-E]/gi;
      const found = str.match(regexp);
      let str1 = JSON.stringify(found);
      try {
        expect(str1).assertEqual('["A","B","C","D","E","a","b","c","d","e"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8300
     * @tc.name      : testPrototypeMatch0003
     * @tc.desc      : The match() method of String values retrieves the result of matching this string against a regular expression.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The quick brown fox jumps over the lazy dog. It barked.";
      const regexp = /(?<animal>fox|cat) jumps over/;
      const found = str.match(regexp);
      const TAG = 'testPrototypeMatch0003';
      let str1 = JSON.stringify(found);
      try {
        expect(str1).assertEqual('["fox jumps over","fox"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8400
     * @tc.name      : testPrototypeMatch0004
     * @tc.desc      : The match() method of String values retrieves the result of matching this string against a regular expression.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeMatch0004';
      try {
        const str = '123';
        const found = str.match("1,3");
        expect(found).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8500
     * @tc.name      : testPrototypeMatch0005
     * @tc.desc      : The match() method of String values retrieves the result of matching this string against a regular expression.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeMatch0005';
      try {
        const str = "123";
        const found = str.match("1\\.3");
        expect(found).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8600
     * @tc.name      : testPrototypeMatch0006
     * @tc.desc      : The match() method of String values retrieves the result of matching this string against a regular expression.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeMatch0006';
      try {
        const str = "北风卷地白草折";
        const found = str.match("北风卷地白草折");
        let str1 = JSON.stringify(found);
        expect(str1).assertEqual('["北风卷地白草折"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8700
     * @tc.name      : testPrototypeMatchAll0001
     * @tc.desc      : The matchAll() method of String values returns an iterator of all results matching this string against a regular expression, including capturing groups.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatchAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeMatchAll0001';
      try {
        const str = "abc";
        const regexp = /[a-c]/;
        const matches = str.matchAll(regexp);
        for (const match of matches) {
          console.log(
            `找到 ${match[0]} 起始位置=${match.index} 结束位置=${
            match.index} + match[0].length;
             }.`
          );
        }
        let value = Array.from(str.matchAll(regexp), (m) => m[0]);
        let str1 = JSON.stringify(value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("matchAll called with a non-global RegExp argument");
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8800
     * @tc.name      : testPrototypeMatchAll0002
     * @tc.desc      : The matchAll() method of String values returns an iterator of all results matching this string against a regular expression, including capturing groups.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatchAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "table football, foosball";
      const regexp = /foo[a-z]*/g;
      const matches = str.matchAll(regexp);
      for (const match of matches) {
        console.log(
          `找到 ${match[0]} 起始位置=${match.index} 结束位置=${
          match.index} + match[0].length;
             }.`
        );
      }
      let value = Array.from(str.matchAll(regexp), (m) => m[0]);
      const TAG = 'testPrototypeMatchAll0002';
      let str1 = JSON.stringify(value);
      try {
        expect(str1).assertEqual('["football","foosball"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_8900
     * @tc.name      : testPrototypeMatchAll0003
     * @tc.desc      : The matchAll() method of String values returns an iterator of all results matching this string against a regular expression, including capturing groups.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeMatchAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "abc";
      const regexp = /[a-c]/g;
      regexp.lastIndex = 1;
      let value = Array.from(str.matchAll(regexp), (m) => `${regexp.lastIndex} ${m[0]}`);
      const TAG = 'testPrototypeMatchAll0003';
      let str1 = JSON.stringify(value);
      try {
        expect(str1).assertEqual('["1 b","1 c"]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9000
     * @tc.name      : testPrototypeNormalize0001
     * @tc.desc      : The normalize() method of String values returns the Unicode Normalization Form of this string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeNormalize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1 = "\u00F1";
      let str2 = "\u006E\u0303";
      str1 = str1.normalize("NFD");
      str2 = str2.normalize("NFD");
      const TAG = 'testPrototypeNormalize0001';
      try {
        expect(str1).assertEqual(str2);
        expect(str1.length).assertEqual(str2.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9100
     * @tc.name      : testPrototypeNormalize0002
     * @tc.desc      : The normalize() method of String values returns the Unicode Normalization Form of this string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeNormalize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1 = "\u00F1";
      let str2 = "\u006E\u0303";
      str1 = str1.normalize("NFKD");
      str2 = str2.normalize("NFKD");
      const TAG = 'testPrototypeNormalize0002';
      try {
        expect(str1).assertEqual(str2);
        expect(str1.length).assertEqual(str2.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9200
     * @tc.name      : testPrototypeNormalize0003
     * @tc.desc      : The normalize() method of String values returns the Unicode Normalization Form of this string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeNormalize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "\uFB00";
      str = str.normalize(undefined);
      const TAG = 'testPrototypeNormalize0003';
      try {
        expect(str).assertEqual("ﬀ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9300
     * @tc.name      : testPrototypeNormalize0004
     * @tc.desc      : The normalize() method of String values returns the Unicode Normalization Form of this string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeNormalize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1 = "\u1E9B\u0323";
      const str2 = "\u1E9B\u0323";
      const TAG = 'testPrototypeNormalize0004';
      str1.normalize("NFC");
      str2.normalize();
      try {
        expect(str1.length).assertEqual(str2.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9400
     * @tc.name      : testPrototypeNormalize0005
     * @tc.desc      : The normalize() method of String values returns the Unicode Normalization Form of this string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeNormalize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "\u1E9B\u0323";
      const TAG = 'testPrototypeNormalize0005';
      str = str.normalize("NFKC");
      try {
        expect(str).assertEqual("ṩ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9500
     * @tc.name      : testPrototypePadEnd0001
     * @tc.desc      : The padEnd() method of String values pads this string with a given string (repeated, if needed) so that the resulting string reaches a given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "test";
      const TAG = 'testPrototypePadEnd0001';
      str = str.padEnd(10);
      try {
        expect(str).assertEqual("test      ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9600
     * @tc.name      : testPrototypePadEnd0002
     * @tc.desc      : The padEnd() method of String values pads this string with a given string (repeated, if needed) so that the resulting string reaches a given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadEnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "test";
      const TAG = 'testPrototypePadEnd0002';
      str = str.padEnd(10, "foo");
      try {
        expect(str).assertEqual("testfoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9700
     * @tc.name      : testPrototypePadEnd0003
     * @tc.desc      : The padEnd() method of String values pads this string with a given string (repeated, if needed) so that the resulting string reaches a given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "test";
      const TAG = 'testPrototypePadEnd0003';
      str = str.padEnd(6, "123456");
      try {
        expect(str).assertEqual("test12");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9800
     * @tc.name      : testPrototypePadEnd0004
     * @tc.desc      : The padEnd() method of String values pads this string with a given string (repeated, if needed) so that the resulting string reaches a given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadEnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "test";
      const TAG = 'testPrototypePadEnd0004';
      str = str.padEnd(1);
      try {
        expect(str).assertEqual("test");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_9900
     * @tc.name      : testPrototypePadEnd0005
     * @tc.desc      : The padEnd() method of String values pads this string with a given string (repeated, if needed) so that the resulting string reaches a given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadEnd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "test";
      const TAG = 'testPrototypePadEnd0005';
      str = str.padEnd(-1);
      try {
        expect(str).assertEqual("test");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10000
     * @tc.name      : testPrototypePadStart0001
     * @tc.desc      : The padStart() method of String values pads this string with another string (multiple times, if needed) until the resulting string reaches the given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadStart0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "red";
      const TAG = 'testPrototypePadStart0001';
      str = str.padStart(10);
      try {
        expect(str).assertEqual("       red");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10100
     * @tc.name      : testPrototypePadStart0002
     * @tc.desc      : The padStart() method of String values pads this string with another string (multiple times, if needed) until the resulting string reaches the given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadStart0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "red";
      const TAG = 'testPrototypePadStart0002';
      str = str.padStart(10, "foo");
      try {
        expect(str).assertEqual("foofoofred");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10200
     * @tc.name      : testPrototypePadStart0003
     * @tc.desc      : The padStart() method of String values pads this string with another string (multiple times, if needed) until the resulting string reaches the given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadStart0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "red";
      const TAG = 'testPrototypePadStart0003';
      str = str.padStart(6, "123456");
      try {
        expect(str).assertEqual("123red");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10300
     * @tc.name      : testPrototypePadStart0004
     * @tc.desc      : The padStart() method of String values pads this string with another string (multiple times, if needed) until the resulting string reaches the given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadStart0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "red";
      const TAG = 'testPrototypePadStart0004';
      str = str.padStart(8, "0");
      try {
        expect(str).assertEqual("00000red");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10400
     * @tc.name      : testPrototypePadStart0005
     * @tc.desc      : The padStart() method of String values pads this string with another string (multiple times, if needed) until the resulting string reaches the given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadStart0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "red";
      const TAG = 'testPrototypePadStart0005';
      str = str.padStart(1);
      try {
        expect(str).assertEqual("red");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10500
     * @tc.name      : testPrototypePadStart0006
     * @tc.desc      : The padStart() method of String values pads this string with another string (multiple times, if needed) until the resulting string reaches the given length.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypePadStart0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "red";
      const TAG = 'testPrototypePadStart0006';
      str = str.padStart(-1);
      try {
        expect(str).assertEqual("red");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10600
     * @tc.name      : testPrototypeRepeat0001
     * @tc.desc      : The repeat() method of String values constructs and returns a new string which contains the specified number of copies of this string, concatenated together.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeRepeat0001';
      try {
        const str = "abc";
        let str1 = str.repeat(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("less than 0");
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10700
     * @tc.name      : testPrototypeRepeat0002
     * @tc.desc      : The repeat() method of String values constructs and returns a new string which contains the specified number of copies of this string, concatenated together.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeRepeat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "abc";
      const TAG = 'testPrototypeRepeat0002';
      let str1 = str.repeat(0);
      try {
        expect(str1).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10800
     * @tc.name      : testPrototypeRepeat0003
     * @tc.desc      : The repeat() method of String values constructs and returns a new string which contains the specified number of copies of this string, concatenated together.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeRepeat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const string1 = 'abc';
      const TAG = 'testPrototypeRepeat0003';
      try {
        let str1 = string1.repeat(1);
        expect(str1).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_10900
     * @tc.name      : testPrototypeRepeat0004
     * @tc.desc      : The repeat() method of String values constructs and returns a new string which contains the specified number of copies of this string, concatenated together.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeRepeat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const string1 = 'abc';
      const TAG = 'testPrototypeRepeat0004';
      try {
        let str1 = string1.repeat(2);
        expect(str1).assertEqual('abcabc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11000
     * @tc.name      : testPrototypeRepeat0005
     * @tc.desc      : The repeat() method of String values constructs and returns a new string which contains the specified number of copies of this string, concatenated together.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeRepeat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const string1 = 'abc';
      const TAG = 'testPrototypeRepeat0005';
      try {
        let str1 = string1.repeat(3.5);
        expect(str1).assertEqual('abcabcabc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11100
     * @tc.name      : testPrototypeRepeat0006
     * @tc.desc      : The repeat() method of String values constructs and returns a new string which contains the specified number of copies of this string, concatenated together.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeRepeat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeRepeat0006';
      try {
        const string1 = 'abc';
        let str1 = string1.repeat(1 / 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("is infinity");
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11200
     * @tc.name      : testPrototypeReplace0001
     * @tc.desc      : The replace() method of String values returns a new string with one, some, or all matches of a pattern replaced by a replacement.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "foo";
      const TAG = 'testPrototypeReplace0001';
      let str1 = str.replace(/(f)/, "$2");
      try {
        expect(str1).assertEqual("$2oo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11300
     * @tc.name      : testPrototypeReplace0002
     * @tc.desc      : The replace() method of String values returns a new string with one, some, or all matches of a pattern replaced by a replacement.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "foo";
      const TAG = 'testPrototypeReplace0002';
      let str1 = str.replace("f", "$1");
      try {
        expect(str1).assertEqual("$1oo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11400
     * @tc.name      : testPrototypeReplace0003
     * @tc.desc      : The replace() method of String values returns a new string with one, some, or all matches of a pattern replaced by a replacement.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeReplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "foo";
      const TAG = 'testPrototypeReplace0003';
      let str1 = str.replace(/(f)|(g)/, "$2");
      try {
        expect(str1).assertEqual("oo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11500
     * @tc.name      : testPrototypeReplaceAll0001
     * @tc.desc      : The replaceAll() method of String values returns a new string with all matches of a pattern replaced by a replacement.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeReplaceAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "aabbcc";
      const TAG = 'testPrototypeReplaceAll0001';
      let str1 = str.replaceAll("b", ".");
      try {
        expect(str1).assertEqual("aa..cc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11600
     * @tc.name      : testPrototypeReplaceAll0002
     * @tc.desc      : The replaceAll() method of String values returns a new string with all matches of a pattern replaced by a replacement.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeReplaceAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "aabbcc";
      const TAG = 'testPrototypeReplaceAll0002';
      let str1 = str.replaceAll(/b/g, ".");
      try {
        expect(str1).assertEqual("aa..cc");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11700
     * @tc.name      : testPrototypeReplaceAll0003
     * @tc.desc      : The replaceAll() method of String values returns a new string with all matches of a pattern replaced by a replacement.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeReplaceAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPrototypeReplaceAll0003';
      try {
        const str = "aabbcc";
        let str1 = str.replaceAll(/b/, ".");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("string.prototype.replaceAll called with a non-global RegExp argument");
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11800
     * @tc.name      : testPrototypeSearch0001
     * @tc.desc      : The search() method of String values executes a search for a match between a regular expression and this string, returning the index of the first match in the string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "hey JudE";
      const TAG = 'testPrototypeSearch0001';
      const re = /[A-Z]/;
      let str1 = str.search(re);
      try {
        expect(str1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_11900
     * @tc.name      : testPrototypeSearch0002
     * @tc.desc      : The search() method of String values executes a search for a match between a regular expression and this string, returning the index of the first match in the string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "hey JudE";
      const TAG = 'testPrototypeSearch0002';
      const reDot = /[.]/;
      let str1 = str.search(reDot);
      try {
        expect(str1).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12000
     * @tc.name      : testPrototypeSlice0001
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0001';
      let str1 = str.slice(1, 8);
      try {
        expect(str1).assertEqual("he morn");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12100
     * @tc.name      : testPrototypeSlice0002
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0002';
      let str1 = str.slice(4, -2);
      try {
        expect(str1).assertEqual("morning is upon u");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12200
     * @tc.name      : testPrototypeSlice0003
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0003';
      let str1 = str.slice(12);
      try {
        expect(str1).assertEqual("is upon us.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12300
     * @tc.name      : testPrototypeSlice0004
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0004';
      let str1 = str.slice(30);
      try {
        expect(str1).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12400
     * @tc.name      : testPrototypeSlice0005
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0005';
      let str1 = str.slice(-3);
      try {
        expect(str1).assertEqual("us.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12500
     * @tc.name      : testPrototypeSlice0006
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0006';
      let str1 = str.slice(-3, -1);
      try {
        expect(str1).assertEqual("us");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12600
     * @tc.name      : testPrototypeSlice0007
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0007';
      let str1 = str.slice(0, -1);
      try {
        expect(str1).assertEqual("The morning is upon us");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12700
     * @tc.name      : testPrototypeSlice0008
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0008';
      let str1 = str.slice(4, -1);
      try {
        expect(str1).assertEqual("morning is upon us");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12800
     * @tc.name      : testPrototypeSlice0009
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0009';
      let str1 = str.slice(-11, 16);
      try {
        expect(str1).assertEqual("is u");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_12900
     * @tc.name      : testPrototypeSlice0010
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0010';
      let str1 = str.slice(-11, -7);
      try {
        expect(str1).assertEqual("is u");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13000
     * @tc.name      : testPrototypeSlice0011
     * @tc.desc      : The slice() method of String values extracts a section of this string and returns it as a new string, without modifying the original string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPrototypeSlice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "The morning is upon us.";
      const TAG = 'testPrototypeSlice0011';
      let str1 = str.slice(-5, -1);
      try {
        expect(str1).assertEqual("n us");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13100
     * @tc.name       : testStringSplit0100
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testStringSplit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0001';
      try {
        const str = 'Hello World. How are you doing?';
        expect(str.split(" ")[0]).assertEqual('Hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13200
     * @tc.name       : testStringSplit0200
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0002';
      try {
        const str = 'Hello World. How are you doing?';
        expect(str.split(" ", 10)[0]).assertEqual('Hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13300
     * @tc.name       : testStringSplit0300
     * @tc.desc       : use str.split(" ",10) Error, out of range
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0003';
      try {
        const str = 'Hello World. How are you doing?';
        expect(str.split(" ", 10)[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13400
     * @tc.name       : testStringSplit0400
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0004';
      try {
        const str = 'Hello World. How are you doing?';
        expect(str.split("")[4]).assertEqual('o');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13500
     * @tc.name       : testStringSplit0500
     * @tc.desc       : use str.split("",3) use str[].split("")[3]Error, out of range
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0005';
      try {
        const str = 'Hello World. How are you doing?';
        expect(str.split("", 3)[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13600
     * @tc.name       : testStringSplit0600
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0006';
      try {
        const str = 'Hello World. How are you doing?';
        expect(str.split("", 3)[2]).assertEqual('l');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13700
     * @tc.name       : testStringSplit0700
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0007';
      try {
        const str = 'Hello World. How are you doing?';
        const result = str.split("", 0);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13800
     * @tc.name       : testStringSplit0800
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSplit0008';
      try {
        const str = 'Hello World. How are you doing?';
        const exp =
          ['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd', '.', ' ', 'H', 'o', 'w', ' ', 'a', 'r', 'e', ' ', 'y',
            'o', 'u', ' ', 'd', 'o', 'i', 'n', 'g', '?'];
        const result = str.split("");
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.toString()).assertEqual(exp.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_13900
     * @tc.name       : testStringSplit0010
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0010";
      try {
        const str = '';
        expect(str.split(" ")).assertContain([""]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14000
     * @tc.name       : testStringSplit0011
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0011";
      try {
        let str = '';
        expect(str.split("a")).assertContain([""]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14100
     * @tc.name       : testStringSplit0012
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0012";
      try {
        const str = "";
        const result = str.split("");
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14200
     * @tc.name       : testStringSplit0014
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0014";
      try {
        const str = '😄😄';
        const result = str.split(/(?:)/);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14300
     * @tc.name       : testStringSplit0015
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0015";
      try {
        const str = '😄😄';
        const result = str.split(/(?:)/u);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14400
     * @tc.name       : testStringSplit0016
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0016";
      try {
        const names = "Harry Trump;Fred Barney;Helen Rigby;Bill Abel;Chris Hand ";
        let result1 = ["Harry Trump", "Fred Barney", "Helen Rigby", "Bill Abel", "Chris Hand", ""];
        let result2 = names.split(/\s*(?:;|$)\s*/);
        expect(result2.toString()).assertEqual(result1.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14500
     * @tc.name       : testStringSplit0017
     * @tc.desc       : Test the function of the Interface split.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSplit0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringSplit0017";
      try {
        const myString = "Hello 1 word. Sentence number 2.";
        let expectedResult = ["Hello ", "1", " word. Sentence number ", "2", "."];
        let result = myString.split(/(\d)/);
        expect(result.toString()).assertEqual(expectedResult.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14600
     * @tc.name       : testStringStartsWith0001
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0001";
      try {
        const str1 = 'Saturday night plans';
        expect(str1.startsWith('Sat')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14700
     * @tc.name       : testStringStartsWith0002
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0002";
      try {
        const str1 = 'Saturday night plans';
        expect(str1.startsWith('sat')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14800
     * @tc.name       : testStringStartsWith0003
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0003";
      try {
        const str1 = 'Saturday night plans';
        expect(str1.startsWith('Sat', 0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_14900
     * @tc.name       : testStringStartsWith0004
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0004";
      try {
        const str1 = 'Saturday night plans';
        expect(str1.startsWith('Sat', 3)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15000
     * @tc.name       : testStringStartsWith0005
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0005";
      try {
        const str1 = 'Saturday night plans';
        expect(str1.startsWith('urday', 3)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15100
     * @tc.name       : testStringStartsWith0009
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0009";
      try {
        const str1 = 'Saturday night plans';
        expect(str1.startsWith('')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15200
     * @tc.name       : testStringStartsWith0010
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartWith0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringWith0010";
      try {
        const str1 = 'undefined Saturday night plans';
        expect(str1.startsWith('undefined')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15300
     * @tc.name       : testStringStartsWith0012
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartWith0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringWith0012";
      try {
        const str1 = 'undefined Saturday night plans';
        expect(str1.startsWith('Undefined')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15400
     * @tc.name       : testStringStartsWith0013
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartWith0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringWith00013";
      try {
        const str1 = 'undefined Saturday night plans';

        expect(str1.startsWith('')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_155000
     * @tc.name       : testStringStartsWith0015
     * @tc.desc       : Test the function of the interface startswith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0015";
      try {
        const str1 = "";
        expect(str1.startsWith('Sat')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_156000
     * @tc.name       : testStringStartsWith0016
     * @tc.desc       : Test the function of the interface startswith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0016";
      try {
        const str1 = "";
        expect(str1.startsWith('Sat', 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_157000
     * @tc.name       : testStringStartsWith0017
     * @tc.desc       : Test the function of the interface startswith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0017";
      try {
        const str1 = "";
        expect(str1.startsWith('Sat', 3)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15800
     * @tc.name       : testStringStartsWith0018
     * @tc.desc       : Test the function of the interface startswith.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0018";
      try {
        const str1 = "";
        expect(str1.startsWith('urday', 3)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_15900
     * @tc.name       : testStringStartsWith0022
     * @tc.desc       : Test the function of the startsWith function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringStartsWith0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringStartsWith0022";
      try {
        const str1 = '';
        expect(str1.startsWith('')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_160000
     * @tc.name       : testStringSubstring0001
     * @tc.desc       : Test the function of the Interface substring.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0001';
      try {
        const str = 'Mozilla';
        expect(str.substring(1, 3)).assertEqual('oz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_161000
     * @tc.name       : testStringSubstring0002
     * @tc.desc       : Test the function of the Interface substring.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0002';
      try {
        const str = 'Mozilla';
        expect(str.substring(2)).assertEqual('zilla');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_162000
     * @tc.name       : testStringSubstring0003
     * @tc.desc       : Test the function of the Interface substring
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0003';
      try {
        const str = 'Mozilla';
        expect(str.substring(2, 2)).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_163000
     * @tc.name       : testStringSubstring0004
     * @tc.desc       : Test the function of the Interface substring.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0004';
      try {
        const str = 'Mozilla';
        expect(str.substring(3, 1)).assertEqual('oz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_164000
     * @tc.name       : testStringSubstring0005
     * @tc.desc       : Test the function of the Interface substring
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0005';
      try {
        const str = 'Mozilla';
        expect(str.substring(-1, 100)).assertEqual('Mozilla');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_165000
     * @tc.name       : testStringSubstring0006
     * @tc.desc       : Test the function of the Interface substring.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0006';
      try {
        const str = 'Mozilla';
        expect(str.substring(0)).assertEqual('Mozilla');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_166000
     * @tc.name       : testStringSubstring0008
     * @tc.desc       : Test the function of the Interface substring.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringSubstring0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringSubstring0008';
      try {
        const str = 'Mozilla';
        expect(str.substring(str.length - 4)).assertEqual('illa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_16700
     * @tc.name       : testStringToLocaleLowerCase0001
     * @tc.desc       :Test the function of the interface toLocaleLowerCase.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringToLocaleLowerCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLocaleLowerCase0001";
      try {
        const dotted = "İSTANBUL";
        const result = dotted.toLocaleLowerCase('en-US');
        expect(result).assertEqual("i̇stanbul");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_16800
     * @tc.name       : testStringToLocaleLowerCase0002
     * @tc.desc       :Test the function of the interface toLocaleLowerCase.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringToLocaleLowerCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringToLocaleLowerCase0002';
      try {
        const dotted = 'İstanbul';
        const lowerCaseDotted = dotted.toLocaleLowerCase('tr');
        console.log(`TR: ${lowerCaseDotted}`);
        expect(lowerCaseDotted).assertEqual('istanbul');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_16900
     * @tc.name       : testStringToLocaleLowerCase0003
     * @tc.desc       :Test the function of the interface toLocaleLowerCase.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringToLocaleLowerCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringToLocaleLowerCase0003';
      try {
        const dotted = '';
        const lowerCaseDotted = dotted.toLocaleLowerCase('en-US');
        console.log(`EN-US: ${lowerCaseDotted}`);
        expect(lowerCaseDotted).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17000
     * @tc.name       : testStringToLocaleLowerCase0004
     * @tc.desc       : Test the function of the interface ToLocaleLowerCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleLowerCase0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLocaleLowerCase0004";
      try {
        const dotted = '';
        expect(`${dotted.toLocaleLowerCase('tr')}`).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17100
     * @tc.name       : testStringToLocaleUpperCase0001
     * @tc.desc       : Test the function of the interface TOLocaleUpperCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleUpperCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLocaleUpperCase0001";
      try {
        const city = 'istanbul';
        expect(city.toLocaleUpperCase('en-US')).assertEqual('ISTANBUL');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17200
     * @tc.name       : testStringToLocaleUpperCase0002
     * @tc.desc       : Test the function of the interface ToLocaleUpperCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleUpperCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLocaleUpperCase0002";
      try {
        const city = 'istanbul';
        expect(city.toLocaleUpperCase('TR')).assertEqual("İSTANBUL");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17300
     * @tc.name       : testStringToLocaleUpperCase0003
     * @tc.desc       : Test the function of the interface ToLocaleUpperCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleUpperCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLocaleUpperCase0003";
      try {
        const city = '';
        expect(city.toLocaleUpperCase('en-US')).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17400
     * @tc.name       : testStringToLocaleUpperCase0004
     * @tc.desc       : Test the function of the interface ToLocaleUpperCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLocaleUpperCase0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLocaleUpperCase0004";
      try {
        const city = '';
        expect(city.toLocaleUpperCase('TR')).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17500
     * @tc.name       : testStringToLowerCase0001
     * @tc.desc       : Test the function of the interface ToLowerCase.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLowerCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLowerCase0001";
      try {
        const sentence = 'The quick brown fox jumps over the lazy dog.';
        expect(sentence.toLowerCase()).assertEqual("the quick brown fox jumps over the lazy dog.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17600
     * @tc.name       : testStringToLowerCase0002
     * @tc.desc       : Test the function of the interface toLowerCase().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToLowerCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToLowerCase0002";
      try {
        const sentence = '';
        let result = sentence.toLowerCase();
        expect(result).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17700
     * @tc.name       : testStringToString0001
     * @tc.desc       : Test the function of the interface toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToString0001";
      try {
        const stringObj = new String('foo');
        expect(stringObj.toString()).assertEqual('foo');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17800
     * @tc.name       : testStringToString0002
     * @tc.desc       : Test the function of the interface toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToString0002";
      try {
        const stringObj = new String('foo');
        let result = stringObj.toString();
        expect(result).assertEqual('foo');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_17900
     * @tc.name       : testStringToString0003
     * @tc.desc       : Test the function of the interface toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToString0003";
      try {
        const stringObj = 123;
        expect(stringObj).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18000
     * @tc.name       : testStringToString0004
     * @tc.desc       : Test the function of the interface toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToString0004";
      try {
        const stringObj = 123;
        let result = stringObj.toString();
        expect(result).assertEqual("123");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18100
     * @tc.name       : testStringToUpperCase0001
     * @tc.desc       : Test the function of the interface toUpperCase().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringToUpperCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringToUpperCase0001";
      try {
        const city = 'istanbul';
        let result = city.toUpperCase();
        expect(result).assertEqual('ISTANBUL');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18200
     * @tc.name       : testStringToUpperCase0002
     * @tc.desc       :Test the function of the constructor function.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringToUpperCase0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringToUpperCase0002';
      try {
        const a = 'abcdef';
        const b = true;
        expect(a.toUpperCase()).assertEqual('ABCDEF');
        expect(b.toString().toUpperCase()).assertEqual('TRUE');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18300
     * @tc.name       : testStringToUpperCase0003
     * @tc.desc       :Test the function of the constructor function.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringToUpperCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringToUpperCase0003';
      try {
        const city = '';
        expect(city.toUpperCase()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18400
     * @tc.name       : testStringTrim0001
     * @tc.desc       :Test the function of the constructor function.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringTrim0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringTrim0001';
      try {
        const greeting = '   Hello world!   ';
        expect(greeting).assertEqual('   Hello world!   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18500
     * @tc.name       : testStringTrim0002
     * @tc.desc       :Test the function of the constructor function.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringTrim0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringTrim0002';
      try {
        const greeting = '   Hello world!   ';
        expect(greeting.trim()).assertEqual('Hello world!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18600
     * @tc.name       : testStringTrim0003
     * @tc.desc       :Test the function of the constructor function.
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringTrim0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringTrim0003';
      try {
        const str = "   foo  ";
        expect(str.trim()).assertEqual('foo');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_187000
     * @tc.name       : testStringtrim0004
     * @tc.desc       :Test the function of the interface trim().
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringtrim0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringtrim0004';
      try {
        const str = "   ";
        expect(str.trim()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_18800
     * @tc.name       : testStringtrimEnd0001
     * @tc.desc       :Test the function of the interface trimEnd().
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringtrimEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringtrimEnd0001';
      try {
        const greeting = ' Hello world! ';
        expect(greeting).assertEqual(" Hello world! ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_189000
     * @tc.name       : testStringtrimEnd0002
     * @tc.desc       :Test the function of the interface trimEnd().
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringtrimEnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringtrimEnd0002';
      try {
        const greeting = ' Hello world! ';
        expect(greeting.trimEnd()).assertEqual(" Hello world!");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_190000
     * @tc.name       : testStringtrimEnd0003
     * @tc.desc       :Test the function of the interface trimEnd().
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringtrimEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringtrimEnd0003';
      try {
        const greeting = '  ';
        expect(greeting).assertEqual("  ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_191000
     * @tc.name       : testStringtrimEnd0004
     * @tc.desc       :Test the function of the interface trimEnd().
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringtrimEnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringtrimEnd0004';
      try {
        const greeting = '  ';
        const result = greeting.trimEnd();
        const result1 = "";
        expect(result.length).assertEqual(result1.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_192000
     * @tc.name       : testStringtrimStart0001
     * @tc.desc       :Test the function of the interface trimStart().
     * @tc.size       :MediumTest
     * @tc.type       :Function
     * @tc.level      :Level 1
     */
    it('testStringtrimStart0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStringtrimStart0001';
      try {
        const greeting = ' Hello world! ';
        expect(greeting).assertEqual(" Hello world! ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_19300
     * @tc.name       : testStringTrimStart0002
     * @tc.desc       : Test the function of the Interface trimStart.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringTrimStart0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStart0002";
      try {
        const greeting = "Hello World!";
        expect(greeting.trimStart()).assertEqual('Hello World!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_19400
     * @tc.name       : testStringTrimStart0003
     * @tc.desc       : Test the function of the Interface trimStart.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringTrimStart0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStart0003";
      try {
        const greeting = " ";
        expect(greeting).assertEqual(' ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_19500
     * @tc.name       : testStringTrimStart0004
     * @tc.desc       : Test the function of the Interface trimStart.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringTrimStart0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringTrimStart0004";
      try {
        const greeting = " ";
        expect(greeting.trimStart()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_19600
     * @tc.name       : testStringValueOf0001
     * @tc.desc       : Test the function of the Interface ValueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOf0001";
      try {
        const stringObject = new String("foo");
        const exp = new String("foo");
        expect(stringObject.toString()).assertEqual(exp.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_19700
     * @tc.name       : testStringValueOf0002
     * @tc.desc       : Test the function of the Interface ValueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringValueOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOf0002";
      try {
        const stringObject = new String("foo");
        expect(stringObject.valueOf()).assertEqual('foo');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_19800
     * @tc.name       : testStringValueOf0003
     * @tc.desc       : Test the function of the Interface ValueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringValueOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringValueOf0003";
      try {
        const stringObject = new String("");
        expect(stringObject.valueOf()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}