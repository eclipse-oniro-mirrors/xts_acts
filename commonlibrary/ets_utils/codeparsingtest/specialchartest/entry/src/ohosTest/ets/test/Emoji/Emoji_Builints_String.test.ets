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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function Emoji_String() {
  describe('Emoji_String', () => {

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringConstructorEmoji0001
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0001";
      try {
        const a = new String("\ud83d\ude0a");
        const b = String("\ud83d\ude0a");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringConstructorEmoji0002
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0002";
      try {
        const a = new String("\ud83d\udc64");
        const b = String("\ud83d\udc64");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringConstructorEmoji0003
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0003";
      try {
        const a = new String("\ud83d\udc6b");
        const b = String("\ud83d\udc6b");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringConstructorEmoji0004
     * @tc.desc       : Testing the String interface Constructor with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0004";
      try {
        const a = new String("\u260e");
        const b = String("\u260e");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringConstructorEmoji0005
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0005";
      try {
        const a = new String("\ud83d\udc79");
        const b = String("\ud83d\udc79");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringConstructorEmoji0006
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0006";
      try {
        const a = new String("\ud83d\udd5b");
        const b = String("\ud83d\udd5b");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringConstructorEmoji0007
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0007";
      try {
        const a = new String("\ud83c\udf4f");
        const b = String("\ud83c\udf4f");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringConstructorEmoji0008
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0008";
      try {
        const a = new String("\ud83d\udd03");
        const b = String("\ud83d\udd03");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringConstructorEmoji0009
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0009";
      try {
        const a = new String("\ud83c\udf41");
        const b = String("\ud83c\udf41");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringConstructorEmoji0010
     * @tc.desc       : Testing the String interface Constructor with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0010";
      try {
        const a = new String("\u2666");
        const b = String("\u2666");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringConstructorEmoji0011
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0011";
      try {
        const a = new String("\ud83d\udc48");
        const b = String("\ud83d\udc48");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringConstructorEmoji0012
     * @tc.desc       : Testing the String interface Constructor with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringConstructorEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringConstructorEmoji0012";
      try {
        const a = new String("\ud83e\udd3c\u200d\u2642\ufe0f");
        const b = String("\ud83e\udd3c\u200d\u2642\ufe0f");
        expect(typeof a).assertEqual("object");
        expect(typeof b).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringRowEmoji0001
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0001";
      try {
        const emoji = String.raw`\ud83d\ude0a`;
        expect(emoji).assertEqual("\\ud83d\\ude0a");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringRowEmoji0002
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0002";
      try {
        const emoji = String.raw`\ud83d\udc64`;
        expect(emoji).assertEqual("\\ud83d\\udc64");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringRowEmoji0003
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0003";
      try {
        const emoji = String.raw`\ud83d\udc6b`;
        expect(emoji).assertEqual("\\ud83d\\udc6b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringRowEmoji0004
     * @tc.desc       : Testing the String interface Row with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0004";
      try {
        const emoji = String.raw`\u260e`;
        expect(emoji).assertEqual("\\u260e");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringRowEmoji0005
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0005";
      try {
        const emoji = String.raw`\ud83d\udc79`;
        expect(emoji).assertEqual("\\ud83d\\udc79");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringRowEmoji0006
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0006";
      try {
        const emoji = String.raw`\ud83d\udd5b`;
        expect(emoji).assertEqual("\\ud83d\\udd5b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringRowEmoji0007
     * @tc.desc       : Testing the String interface Row with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0007";
      try {
        const emoji = String.raw`\ud83c\udf4f`;
        expect(emoji).assertEqual("\\ud83c\\udf4f");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringRowEmoji0008
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0008";
      try {
        const emoji = String.raw`\ud83d\udd03`;
        expect(emoji).assertEqual("\\ud83d\\udd03");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringRowEmoji0009
     * @tc.desc       : Testing the String interface Row with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0009";
      try {
        const emoji = String.raw`\ud83c\udf41`;
        expect(emoji).assertEqual("\\ud83c\\udf41");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringRowEmoji0010
     * @tc.desc       : Testing the String interface Row with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0010";
      try {
        const emoji = String.raw`\u2666`;
        expect(emoji).assertEqual("\\u2666");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringRowEmoji0011
     * @tc.desc       : Testing the String interface Row with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0011";
      try {
        const emoji = String.raw`\ud83d\udc48`;
        expect(emoji).assertEqual("\\ud83d\\udc48");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringRowEmoji0012
     * @tc.desc       : Testing the String interface Row with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringRowEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringRowEmoji0012";
      try {
        const emoji = String.raw`\ud83e\udd3c\u200d\u2642\ufe0f`;
        expect(emoji).assertEqual("\\ud83e\\udd3c\\u200d\\u2642\\ufe0f");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0001
     * @tc.desc       : Testing the String interface PrototypeCharAt with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringPrototypeCharCodeAtEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0001";
      try {
        const sentence1 = '\ud83d\ude0a';
        const index = 1;
        expect(sentence1.charCodeAt(index)).assertEqual(56842);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0002
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringPrototypeCharCodeAtEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0002";
      try {
        const sentence2 = '\ud83d\udc64';
        const index = 1;
        expect(sentence2.charCodeAt(index)).assertEqual(56420);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0003
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringPrototypeCharCodeAtEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0003";
      try {
        const sentence3 = '\ud83d\udc6b';
        const index = 1;
        expect(sentence3.charCodeAt(index)).assertEqual(56427);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0004
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringPrototypeCharCodeAtEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0004";
      try {
        const sentence4 = '\u260e';
        const index = 1;
        expect(sentence4.charCodeAt(index).toString()).assertEqual("NaN")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0005
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringPrototypeCharCodeAtEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0005";
      try {
        const sentence5 = '\ud83d\udc79';
        const index = 1;
        expect(sentence5.charCodeAt(index)).assertEqual(56441);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0006
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testStringPrototypeCharCodeAtEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0006";
      try {
        const sentence6 = '\ud83d\udd5b';
        const index = 1;
        expect(sentence6.charCodeAt(index)).assertEqual(56667);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0007
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeCharCodeAtEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0007";
      try {
        const sentence7 = '\ud83c\udf4f';
        const index = 1;
        expect(sentence7.charCodeAt(index)).assertEqual(57167);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0008
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeCharCodeAtEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0008";
      try {
        const sentence8 = '\ud83d\udd03';
        const index = 1;
        expect(sentence8.charCodeAt(index)).assertEqual(56579);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0009
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeCharCodeAtEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0009";
      try {
        const sentence9 = '\ud83c\udf41';
        const index = 1;
        expect(sentence9.charCodeAt(index)).assertEqual(57153);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0010
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeCharCodeAtEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0010";
      try {
        const sentence10 = '\u2666';
        const index = 1;
        expect(sentence10.charCodeAt(index).toString()).assertEqual("NaN")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0011
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeCharCodeAtEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0011";
      try {
        const sentence11 = '\ud83d\udc48';
        const index = 1;
        expect(sentence11.charCodeAt(index)).assertEqual(56392);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeCharCodeAtEmoji0012
     * @tc.desc       : Testing the String interface PrototypeCharCodeAt with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeCharCodeAtEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeCharCodeAtEmoji0012";
      try {
        const sentence12 = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const index = 1;
        expect(sentence12.charCodeAt(index)).assertEqual(56636);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testString.prototype.codePointAtEmoji0001
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        expect(emoji.codePointAt(0)).assertEqual(128522);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testString.prototype.codePointAtEmoji0002
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        expect(emoji.codePointAt(0)).assertEqual(128100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testString.prototype.codePointAtEmoji0003
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        expect(emoji.codePointAt(0)).assertEqual(128107);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testString.prototype.codePointAtEmoji0004
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0004";
      try {
        let emoji = '\u260e';
        expect(emoji.codePointAt(0)).assertEqual(9742);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testString.prototype.codePointAtEmoji0005
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        expect(emoji.codePointAt(0)).assertEqual(128121);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testString.prototype.codePointAtEmoji0006
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        expect(emoji.codePointAt(0)).assertEqual(128347);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testString.prototype.codePointAtEmoji0007
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        expect(emoji.codePointAt(0)).assertEqual(127823);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testString.prototype.codePointAtEmoji0008
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        expect(emoji.codePointAt(0)).assertEqual(128259);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testString.prototype.codePointAtEmoji0009
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        expect(emoji.codePointAt(0)).assertEqual(127809);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testString.prototype.codePointAtEmoji0010
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0010";
      try {
        let emoji = '\u2666';
        expect(emoji.codePointAt(0)).assertEqual(9830);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testString.prototype.codePointAtEmoji0011
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        expect(emoji.codePointAt(0)).assertEqual(128072);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testString.prototype.codePointAtEmoji0012
     * @tc.desc       : Testing the Uri interface codePointAt with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.codePointAtEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.codePointAtEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        expect(emoji.codePointAt(0)).assertEqual(129340);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testString.prototype.concatEmoji0001
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testString.prototype.concatEmoji0002
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testString.prototype.concatEmoji0003
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testString.prototype.concatEmoji0004
     * @tc.desc       : Testing the Uri interface concat with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0004";
      try {
        let emoji = '\u260e';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello ☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testString.prototype.concatEmoji0005
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testString.prototype.concatEmoji0006
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testString.prototype.concatEmoji0007
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testString.prototype.concatEmoji0008
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testString.prototype.concatEmoji0009
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testString.prototype.concatEmoji0010
     * @tc.desc       : Testing the Uri interface concat with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0010";
      try {
        let emoji = '\u2666';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello ♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testString.prototype.concatEmoji0011
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testString.prototype.concatEmoji0012
     * @tc.desc       : Testing the Uri interface concat with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.concatEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.concatEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let str = 'Hello';
        expect(str.concat(' ', emoji)).assertEqual('Hello 🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testString.prototype.endsWithEmoji0001
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('😊')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testString.prototype.endsWithEmoji0002
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('👤')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testString.prototype.endsWithEmoji0003
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('👫')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testString.prototype.endsWithEmoji0004
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0004";
      try {
        let emoji = '\u260e';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('☎')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testString.prototype.endsWithEmoji0005
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('👹')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testString.prototype.endsWithEmoji0006
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('🕛')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testString.prototype.endsWithEmoji0007
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('🍏')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testString.prototype.endsWithEmoji0008
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('🔃')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    }) /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testString.prototype.endsWithEmoji0009
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('🍁')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testString.prototype.endsWithEmoji0010
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0010";
      try {
        let emoji = '\u2666';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('♦')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testString.prototype.endsWithEmoji0011
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('👈')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testString.prototype.endsWithEmoji0012
     * @tc.desc       : Testing the Uri interface endsWith with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.endsWithEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.endsWithEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.endsWith('🤼‍♂️')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testString.prototype.includesEmoji0001
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('😊')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testString.prototype.includesEmoji0002
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('👤')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testString.prototype.includesEmoji0003
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('👫')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testString.prototype.includesEmoji0004
     * @tc.desc       : Testing the Uri interface includes with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0004";
      try {
        let emoji = '\u260e';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('☎')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testString.prototype.includesEmoji0005
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('👹')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testString.prototype.includesEmoji0006
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('🕛')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testString.prototype.includesEmoji0007
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('🍏')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testString.prototype.includesEmoji0008
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('🔃')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    }) /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testString.prototype.includesEmoji0009
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('🍁')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testString.prototype.includesEmoji0010
     * @tc.desc       : Testing the Uri interface includes with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0010";
      try {
        let emoji = '\u2666';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('♦')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testString.prototype.includesEmoji0011
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('👈')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testString.prototype.includesEmoji0012
     * @tc.desc       : Testing the Uri interface includes with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testString.prototype.includesEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testString.prototype.includesEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let str = 'Hello';
        let result = str.concat(' ', emoji);
        expect(result.includes('🤼‍♂️')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeIndexOfEmoji0001
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0001";
      try {
        const paragraph = "this is emoji \ud83d\ude0a";
        const searchTerm = "😊";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeIndexOfEmoji0002
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0002";
      try {
        const paragraph = "this is emoji \ud83d\udc64";
        const searchTerm = "👤";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeIndexOfEmoji0003
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0003";
      try {
        const paragraph = "this is emoji \ud83d\udc6b";
        const searchTerm = "👫";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeIndexOfEmoji0004
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0004";
      try {
        const paragraph = "this is emoji \u260e";
        const searchTerm = "☎";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeIndexOfEmoji0005
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0005";
      try {
        const paragraph = "this is emoji \ud83d\udc79";
        const searchTerm = "👹";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeIndexOfEmoji0006
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0006";
      try {
        const paragraph = "this is emoji \ud83d\udd5b";
        const searchTerm = "🕛";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeIndexOfEmoji0007
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0007";
      try {
        const paragraph = "this is emoji \ud83c\udf4f";
        const searchTerm = "🍏";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeIndexOfEmoji0008
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0008";
      try {
        const paragraph = "this is emoji \ud83d\udd03";
        const searchTerm = "🔃";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeIndexOfEmoji0009
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0009";
      try {
        const paragraph = "this is emoji \ud83c\udf41";
        const searchTerm = "🍁";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_10000
     * @tc.name       : testStringPrototypeIndexOfEmoji0010
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0010";
      try {
        const paragraph = "this is emoji \u2666";
        const searchTerm = "♦";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeIndexOfEmoji0011
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0011";
      try {
        const paragraph = "this is emoji \ud83d\udc48";
        const searchTerm = "👈";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeIndexOfEmoji0012
     * @tc.desc       : Testing the String interface PrototypeIndexOf with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIndexOfEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeIndexOfEmoji0012";
      try {
        const paragraph = "this is emoji \ud83e\udd3c\u200d\u2642\ufe0f";
        const searchTerm = "🤼‍♂️";
        const indexOf = paragraph.indexOf(searchTerm);
        expect(indexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0001
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0001";
      try {
        const paragraph = "this is emoji \ud83d\ude0a";
        const searchTerm = "😊";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0002
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0002";
      try {
        const paragraph = "this is emoji \ud83d\udc64";
        const searchTerm = "👤";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0003
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0003";
      try {
        const paragraph = "this is emoji \ud83d\udc6b";
        const searchTerm = "👫";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0004
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0004";
      try {
        const paragraph = "this is emoji \u260e";
        const searchTerm = "☎";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0005
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0005";
      try {
        const paragraph = "this is emoji \ud83d\udc79";
        const searchTerm = "👹";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0006
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0006";
      try {
        const paragraph = "this is emoji \ud83d\udd5b";
        const searchTerm = "🕛";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0007
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0007";
      try {
        const paragraph = "this is emoji \ud83c\udf4f";
        const searchTerm = "🍏";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0008
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0008";
      try {
        const paragraph = "this is emoji \ud83d\udd03";
        const searchTerm = "🔃";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0009
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0009";
      try {
        const paragraph = "this is emoji \ud83c\udf41";
        const searchTerm = "🍁";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0010
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0010";
      try {
        const paragraph = "this is emoji \u2666";
        const searchTerm = "♦";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0011
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0011";
      try {
        const paragraph = "this is emoji \ud83d\udc48";
        const searchTerm = "👈";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeLastIndexOfEmoji0012
     * @tc.desc       : Testing the String interface PrototypeLastIndexOf with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLastIndexOfEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLastIndexOfEmoji0012";
      try {
        const paragraph = "this is emoji \ud83e\udd3c\u200d\u2642\ufe0f";
        const searchTerm = "🤼‍♂️";
        const lastIndexOf = paragraph.lastIndexOf(searchTerm);
        expect(lastIndexOf).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0100
     * @tc.name       : testStringPrototypeLocalCompareEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0001";
      try {
        const a = '\ud83d\ude0a';
        const b = '😊';
        expect(a.localeCompare(b)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0200
     * @tc.name       : testStringPrototypeLocalCompareEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0002";
      try {
        const a = '\ud83d\udc64';
        const b = '👤';
        expect(a.localeCompare(b)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0300
     * @tc.name       : testStringPrototypeLocalCompareEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0003";
      try {
        const a = '\ud83d\udc6b';
        const b = '👨‍👩‍👧‍👦';
        expect(a.localeCompare(b)).assertEqual(1);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0400
     * @tc.name       : testStringPrototypeLocalCompareEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0004";
      try {
        const a = '\u260e';
        const b = '☎';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0500
     * @tc.name       : testStringPrototypeLocalCompareEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0005";
      try {
        const a = '\ud83d\udc79';
        const b = '👹';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0600
     * @tc.name       : testStringPrototypeLocalCompareEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0006";
      try {
        const a = '\ud83d\udd5b';
        const b = '🕛';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0700
     * @tc.name       : testStringPrototypeLocalCompareEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0007";
      try {
        const a = '\ud83c\udf4f';
        const b = '🍏';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0800
     * @tc.name       : testStringPrototypeLocalCompareEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0008";
      try {
        const a = '\ud83d\udd03';
        const b = '🔃';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare0900
     * @tc.name       : testStringPrototypeLocalCompareEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0009";
      try {
        const a = '\ud83c\udf41';
        const b = '🍁';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare1000
     * @tc.name       : testStringPrototypeLocalCompareEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0010";
      try {
        const a = '\u2666';
        const b = '♦';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare1100
     * @tc.name       : testStringPrototypeLocalCompareEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0011";
      try {
        const a = '\ud83d\udc48';
        const b = '👈';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Compare1200
     * @tc.name       : testStringPrototypeLocalCompareEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeLocalCompareEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeLocalCompareEmoji0012";
      try {
        const a = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const b = '🤼‍♂️';
        expect(a.localeCompare(b)).assertEqual(0);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0100
     * @tc.name       : testStringPrototypeMatchEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0001";
      try {
        const paragraph = '\ud83d\ude0a';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0200
     * @tc.name       : testStringPrototypeMatchEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0002";
      try {
        const paragraph = '\ud83d\udc64';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0300
     * @tc.name       : testStringPrototypeMatchEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0003";
      try {
        const paragraph = '\ud83d\udc6b';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0400
     * @tc.name       : testStringPrototypeMatchEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0004";
      try {
        const paragraph = '\u260e';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0500
     * @tc.name       : testStringPrototypeMatchEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0005";
      try {
        const paragraph = '\ud83d\udc79';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0600
     * @tc.name       : testStringPrototypeMatchEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0006";
      try {
        const paragraph = '\ud83d\udd5b';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0700
     * @tc.name       : testStringPrototypeMatchEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0007";
      try {
        const paragraph = '\ud83c\udf4f';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0800
     * @tc.name       : testStringPrototypeMatchEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0008";
      try {
        const paragraph = '\ud83d\udd03';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match0900
     * @tc.name       : testStringPrototypeMatchEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0009";
      try {
        const paragraph = '\ud83c\udf41';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match1000
     * @tc.name       : testStringPrototypeMatchEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0010";
      try {
        const paragraph = '\u2666';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match1100
     * @tc.name       : testStringPrototypeMatchEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0011";
      try {
        const paragraph = '\ud83d\udc48';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Match1200
     * @tc.name       : testStringPrototypeMatchEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchEmoji0012";
      try {
        const paragraph = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const regex = /[A-Z]/g;
        const found = paragraph.match(regex);
        expect(found?.toString()).assertEqual(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0100
     * @tc.name       : testStringPrototypeMatchAllEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0001";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\ude0a';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        expect(results[1]).assertDeepEquals(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0200
     * @tc.name       : testStringPrototypeMatchAllEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0002";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\udc64';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0300
     * @tc.name       : testStringPrototypeMatchAllEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0003";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\udc6b';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0400
     * @tc.name       : testStringPrototypeMatchAllEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0004";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\u260e';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0500
     * @tc.name       : testStringPrototypeMatchAllEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0005";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\udc79';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0600
     * @tc.name       : testStringPrototypeMatchAllEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0006";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\udd5b';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0700
     * @tc.name       : testStringPrototypeMatchAllEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0007";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83c\udf4f';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0800
     * @tc.name       : testStringPrototypeMatchAllEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0008";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\udd03';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll0900
     * @tc.name       : testStringPrototypeMatchAllEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0009";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83c\udf41';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll1000
     * @tc.name       : testStringPrototypeMatchAllEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0010";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\u2666';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll1100
     * @tc.name       : testStringPrototypeMatchAllEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0011";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83d\udc48';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_MatchAll1200
     * @tc.name       : testStringPrototypeMatchAllEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMatchAllEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeMatchAllEmoji0012";
      try {
        const regexp = /t(e)(st(\d?))/g;
        const str = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const iterator = str.matchAll(regexp);
        const results = Array.from(iterator);
        expect(results[0]).assertDeepEquals(undefined);
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0100
     * @tc.name       : testStringPrototypeNormalizeEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0001";
      try {
        const str = "\ud83d\ude0a";
        expect(str.normalize("NFC")).assertEqual('\ud83d\ude0a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0200
     * @tc.name       : testStringPrototypeNormalizeEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0002";
      try {
        const str = "\ud83d\udc64";
        expect(str.normalize("NFC")).assertEqual('\ud83d\udc64');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0300
     * @tc.name       : testStringPrototypeNormalizeEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0003";
      try {
        const str = "\ud83d\udc6b";
        expect(str.normalize("NFC")).assertEqual('\ud83d\udc6b');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0400
     * @tc.name       : testStringPrototypeNormalizeEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0004";
      try {
        const str = "\u260e";
        expect(str.normalize("NFC")).assertEqual('\u260e');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0500
     * @tc.name       : testStringPrototypeNormalizeEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0005";
      try {
        const str = "\ud83d\udc79";
        expect(str.normalize("NFC")).assertEqual('\ud83d\udc79');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0600
     * @tc.name       : testStringPrototypeNormalizeEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0006";
      try {
        const str = "\ud83d\udd5b";
        expect(str.normalize("NFC")).assertEqual('\ud83d\udd5b');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0700
     * @tc.name       : testStringPrototypeNormalizeEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0007";
      try {
        const str = "\ud83c\udf4f";
        expect(str.normalize("NFC")).assertEqual('\ud83c\udf4f');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0800
     * @tc.name       : testStringPrototypeNormalizeEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0008";
      try {
        const str = "\ud83d\udd03";
        expect(str.normalize("NFC")).assertEqual('\ud83d\udd03');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize0900
     * @tc.name       : testStringPrototypeNormalizeEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0009";
      try {
        const str = "\ud83c\udf41";
        expect(str.normalize("NFC")).assertEqual('\ud83c\udf41');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize1000
     * @tc.name       : testStringPrototypeNormalizeEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0010";
      try {
        const str = "\u2666";
        expect(str.normalize("NFC")).assertEqual('\u2666');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize1100
     * @tc.name       : testStringPrototypeNormalizeEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0011";
      try {
        const str = "\ud83d\udc48";
        expect(str.normalize("NFC")).assertEqual('\ud83d\udc48');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_Normalize1200
     * @tc.name       : testStringPrototypeNormalizeEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeNormalizeEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeNormalizeEmoji0012";
      try {
        const str = "\ud83e\udd3c\u200d\u2642\ufe0f";
        expect(str.normalize("NFC")).assertEqual('\ud83e\udd3c\u200d\u2642\ufe0f');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypePadEndEmoji0001
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0001";
      try {
        const result = "\ud83d\ude0a".padEnd(20, "foo");
        expect(result).assertEqual("😊foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypePadEndEmoji0002
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0002";
      try {
        const result = "\ud83d\udc64".padEnd(20, "foo");
        expect(result).assertEqual("👤foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypePadEndEmoji0003
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0003";
      try {
        const result = "\ud83d\udc6b".padEnd(20, "foo");
        expect(result).assertEqual("👫foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypePadEndEmoji0004
     * @tc.desc       : Testing the String interface PadEnd with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0004";
      try {
        const result = "\u260e".padEnd(20, "foo");
        expect(result).assertEqual("☎foofoofoofoofoofoof");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypePadEndEmoji0005
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0005";
      try {
        const result = "\ud83d\udc79".padEnd(20, "foo");
        expect(result).assertEqual("👹foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypePadEndEmoji0006
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0006";
      try {
        const result = "\ud83d\udd5b".padEnd(20, "foo");
        expect(result).assertEqual("🕛foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypePadEndEmoji0007
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0007";
      try {
        const result = "\ud83c\udf4f".padEnd(20, "foo");
        expect(result).assertEqual("🍏foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypePadEndEmoji0008
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0008";
      try {
        const result = "\ud83d\udd03".padEnd(20, "foo");
        expect(result).assertEqual("🔃foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypePadEndEmoji0009
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0009";
      try {
        const result = "\ud83c\udf41".padEnd(20, "foo");
        expect(result).assertEqual("🍁foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypePadEndEmoji0010
     * @tc.desc       : Testing the String interface PadEnd with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0010";
      try {
        const result = "\u2666".padEnd(20, "foo");
        expect(result).assertEqual("♦foofoofoofoofoofoof");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypePadEndEmoji0011
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0011";
      try {
        const result = "\ud83d\udc48".padEnd(20, "foo");
        expect(result).assertEqual("👈foofoofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypePadEndEmoji0012
     * @tc.desc       : Testing the String interface PadEnd with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadEndEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadEndEmoji0012";
      try {
        const result = "\ud83e\udd3c\u200d\u2642\ufe0f".padEnd(20, "foo");
        expect(result).assertEqual("🤼‍♂️foofoofoofoofoo");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypePadStartEmoji0001
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0001";
      try {
        const result = "\ud83d\ude0a".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo😊");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypePadStartEmoji0002
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0002";
      try {
        const result = "\ud83d\udc64".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo👤");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypePadStartEmoji0003
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0003";
      try {
        const result = "\ud83d\udc6b".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo👫");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypePadStartEmoji0004
     * @tc.desc       : Testing the String interface PadStart with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0004";
      try {
        const result = "\u260e".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoof☎");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypePadStartEmoji0005
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0005";
      try {
        const result = "\ud83d\udc79".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo👹");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypePadStartEmoji0006
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0006";
      try {
        const result = "\ud83d\udd5b".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo🕛");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypePadStartEmoji0007
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0007";
      try {
        const result = "\ud83c\udf4f".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo🍏");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypePadStartEmoji0008
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0008";
      try {
        const result = "\ud83d\udd03".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo🔃");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypePadStartEmoji0009
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0009";
      try {
        const result = "\ud83c\udf41".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo🍁");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypePadStartEmoji0010
     * @tc.desc       : Testing the String interface PadStart with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0010";
      try {
        const result = "\u2666".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoof♦");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypePadStartEmoji0011
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0011";
      try {
        const result = "\ud83d\udc48".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoofoo👈");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypePadStartEmoji0012
     * @tc.desc       : Testing the String interface PadStart with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypePadStartEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypePadStartEmoji0012";
      try {
        const result = "\ud83e\udd3c\u200d\u2642\ufe0f".padStart(20, "foo");
        expect(result).assertEqual("foofoofoofoofoo🤼‍♂️");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeRepeatEmoji0001
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0001";
      try {
        const result = "\ud83d\ude0a".repeat(2);
        expect(result).assertEqual("\ud83d\ude0a\ud83d\ude0a");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeRepeatEmoji0002
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0002";
      try {
        const result = "\ud83d\udc64".repeat(2);
        expect(result).assertEqual("\ud83d\udc64\ud83d\udc64");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeRepeatEmoji0003
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0003";
      try {
        const result = "\ud83d\udc6b".repeat(2);
        expect(result).assertEqual("\ud83d\udc6b\ud83d\udc6b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeRepeatEmoji0004
     * @tc.desc       : Testing the String interface Repeat with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0004";
      try {
        const result = "\u260e".repeat(2);
        expect(result).assertEqual("\u260e\u260e");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeRepeatEmoji0005
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0005";
      try {
        const result = "\ud83d\udc79".repeat(2);
        expect(result).assertEqual("\ud83d\udc79\ud83d\udc79");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeRepeatEmoji0006
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0006";
      try {
        const result = "\ud83d\udd5b".repeat(2);
        expect(result).assertEqual("\ud83d\udd5b\ud83d\udd5b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeRepeatEmoji0007
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0007";
      try {
        const result = "\ud83c\udf4f".repeat(2);
        expect(result).assertEqual("\ud83c\udf4f\ud83c\udf4f");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeRepeatEmoji0008
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0008";
      try {
        const result = "\ud83d\udd03".repeat(2);
        expect(result).assertEqual("\ud83d\udd03\ud83d\udd03");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeRepeatEmoji0009
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0009";
      try {
        const result = "\ud83c\udf41".repeat(2);
        expect(result).assertEqual("\ud83c\udf41\ud83c\udf41");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeRepeatEmoji0010
     * @tc.desc       : Testing the String interface Repeat with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0010";
      try {
        const result = "\u2666".repeat(2);
        expect(result).assertEqual("\u2666\u2666");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeRepeatEmoji0011
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0011";
      try {
        const result = "\ud83d\udc48".repeat(2);
        expect(result).assertEqual("\ud83d\udc48\ud83d\udc48");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeRepeatEmoji0012
     * @tc.desc       : Testing the String interface Repeat with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //正向用例
    it('testStringPrototypeRepeatEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeRepeatEmoji0012";
      try {
        const result = "\ud83e\udd3c\u200d\u2642\ufe0f".repeat(2);
        expect(result).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f\ud83e\udd3c\u200d\u2642\ufe0f");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeReplaceEmoji0001
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0001";
      try {
        const originalString = "Hello, world! \ud83d\ude0a";
        const replacedString = originalString.replace("\ud83d\ude0a", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeReplaceEmoji0002
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0002";
      try {
        const originalString = "Hello, world! \ud83d\udc64";
        const replacedString = originalString.replace("\ud83d\udc64", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeReplaceEmoji0003
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0003";
      try {
        const originalString = "Hello, world! \ud83d\udc6b";
        const replacedString = originalString.replace("\ud83d\udc6b", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeReplaceEmoji0004
     * @tc.desc       : Testing the String interface Replace with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0004";
      try {
        const originalString = "Hello, world! \u260e";
        const replacedString = originalString.replace("\u260e", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeReplaceEmoji0005
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0005";
      try {
        const originalString = "Hello, world! \ud83d\udc79";
        const replacedString = originalString.replace("\ud83d\udc79", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeReplaceEmoji0006
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0006";
      try {
        const originalString = "Hello, world! \ud83d\udd5b";
        const replacedString = originalString.replace("\ud83d\udd5b", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeReplaceEmoji0007
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0007";
      try {
        const originalString = "Hello, world! \ud83c\udf4f";
        const replacedString = originalString.replace("\ud83c\udf4f", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeReplaceEmoji0008
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0008";
      try {
        const originalString = "Hello, world! \ud83d\udd03";
        const replacedString = originalString.replace("\ud83d\udd03", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeReplaceEmoji0009
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0009";
      try {
        const originalString = "Hello, world! \ud83c\udf41";
        const replacedString = originalString.replace("\ud83c\udf41", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeReplaceEmoji0010
     * @tc.desc       : Testing the String interface Replace with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0010";
      try {
        const originalString = "Hello, world! \u2666";
        const replacedString = originalString.replace("\u2666", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeReplaceEmoji0011
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0011";
      try {
        const originalString = "Hello, world! \ud83d\udc48";
        const replacedString = originalString.replace("\ud83d\udc48", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeReplaceEmoji0012
     * @tc.desc       : Testing the String interface Replace with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceEmoji0012";
      try {
        const originalString = "Hello, world! \ud83e\udd3c\u200d\u2642\ufe0f";
        const replacedString = originalString.replace("\ud83e\udd3c\u200d\u2642\ufe0f", "replaced");
        expect(replacedString).assertEqual("Hello, world! replaced");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeReplaceAllEmoji0001
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeReplaceAllEmoji0002
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeReplaceAllEmoji0003
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeReplaceAllEmoji0004
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0004";
      try {
        const emoji = '\u260e';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeReplaceAllEmoji0005
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeReplaceAllEmoji0006
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeReplaceAllEmoji0007
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeReplaceAllEmoji0008
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeReplaceAllEmoji0009
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeReplaceAllEmoji0010
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0010";
      try {
        const emoji = '\u2666';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeReplaceAllEmoji0011
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeReplaceAllEmoji0012
     * @tc.desc       : Testing the String interface PrototypeReplaceAll with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeReplaceAllEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeReplaceAllEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const replacement = '0';
        expect(emoji.replaceAll(emoji, replacement)).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeSearchEmoji0001
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const re = /[\ud83d\ude0a]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /*
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeSearchEmoji0002
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const re = /[\ud83d\udc64]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeSearchEmoji0003
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const re = /[\ud83d\udc6b]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeSearchEmoji0004
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0004";
      try {
        const emoji = '\u260e';
        const re = /[\u260e]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeSearchEmoji0005
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const re = /[\ud83d\udc79]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeSearchEmoji0006
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const re = /[\ud83d\udd5b]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeSearchEmoji0007
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const re = /[\ud83c\udf4f]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeSearchEmoji0008
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const re = /[\ud83d\udd03]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeSearchEmoji0009
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const re = /[\ud83c\udf41]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeSearchEmoji0010
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0010";
      try {
        const emoji = '\u2666';
        const re = /[\u2666]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeSearchEmoji0011
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const re = /[\ud83d\udc48]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeSearchEmoji0012
     * @tc.desc       : Testing the String interface PrototypeSearch with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSearchEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSearchEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const re = /[\ud83e\udd3c\u200d\u2642\ufe0f]/;
        const reDot = /[.]/;
        expect(emoji.search(re)).assertEqual(0);
        expect(emoji.search(reDot)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeSliceEmoji0001
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0025";
      try {
        const emoji = '\ud83d\ude0a';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('😊');
        expect(str.slice(-2)).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeSliceEmoji0002
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('👤');
        expect(str.slice(-2)).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeSliceEmoji0003
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('👫');
        expect(str.slice(-2)).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeSliceEmoji0004
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0004";
      try {
        const emoji = '\u260e';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 7)).assertEqual('☎');
        expect(str.slice(-1)).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeSliceEmoji0005
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('👹');
        expect(str.slice(-2)).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeSliceEmoji0006
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('🕛');
        expect(str.slice(-2)).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeSliceEmoji0007
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('🍏');
        expect(str.slice(-2)).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeSliceEmoji0008
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('🔃');
        expect(str.slice(-2)).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeSliceEmoji0009
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('🍁');
        expect(str.slice(-2)).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeSliceEmoji0010
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0010";
      try {
        const emoji = '\u2666';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 7)).assertEqual('♦');
        expect(str.slice(-1)).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeSliceEmoji0011
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 8)).assertEqual('👈');
        expect(str.slice(-2)).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeSliceEmoji0012
     * @tc.desc       : Testing the String interface PrototypeSlice with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSliceEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSliceEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const str = `It is ${emoji}`;
        expect(str.slice(6, 11)).assertEqual('🤼‍♂️');
        expect(str.slice(-5)).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeSplitEmoji0001
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\ude0a");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeSplitEmoji0002
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\udc64");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeSplitEmoji0003
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\udc6b");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeSplitEmoji0004
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0004";
      try {
        const emoji = '\u260e';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\u260e");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeSplitEmoji0005
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\udc79");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeSplitEmoji0006
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\udd5b");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeSplitEmoji0007
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83c,\udf4f");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeSplitEmoji0008
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\udd03");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeSplitEmoji0009
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83c,\udf41");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeSplitEmoji0010
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0010";
      try {
        const emoji = '\u2666';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\u2666");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeSplitEmoji0011
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83d,\udc48");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeSplitEmoji0012
     * @tc.desc       : Testing the String interface PrototypeSplit with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSplitEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSplitEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        expect(emoji.split(/(?:)/).toString()).assertEqual("\ud83e,\udd3c,\u200d,\u2642,\ufe0f");
        expect(emoji.split(/(?:)/u).toString()).assertEqual('🤼,‍,♂,️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testStringPrototypeStartsWithEmoji0001
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji";
      try {
        let emoji = '\ud83d\ude0a';
        expect(emoji.startsWith("😊")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testStringPrototypeStartsWithEmoji0002
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        expect(emoji.startsWith("👤")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testStringPrototypeStartsWithEmoji0003
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        expect(emoji.startsWith("👫")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testStringPrototypeStartsWithEmoji0004
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0004";
      try {
        let emoji = '\u260e';
        expect(emoji.startsWith("☎")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testStringPrototypeStartsWithEmoji0005
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        expect(emoji.startsWith("👹")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testStringPrototypeStartsWithEmoji0006
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        expect(emoji.startsWith("🕛")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testStringPrototypeStartsWithEmoji0007
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        expect(emoji.startsWith("🍏")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testStringPrototypeStartsWithEmoji0008
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        expect(emoji.startsWith("🔃")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testStringPrototypeStartsWithEmoji0009
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        expect(emoji.startsWith("🍁")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testStringPrototypeStartsWithEmoji0010
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0010";
      try {
        let emoji = '\u2666';
        expect(emoji.startsWith("♦")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testStringPrototypeStartsWithEmoji0011
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        expect(emoji.startsWith("👈")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testStringPrototypeStartsWithEmoji0012
     * @tc.desc       : Testing the Uri interface startsWith with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeStartsWithEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeStartsWithEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        expect(emoji.startsWith("🤼‍♂️")).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testStringPrototypeSubstringEmoji0001
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        expect(emoji.substring(0)).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testStringPrototypeSubstringEmoji0002
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        expect(emoji.substring(0)).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testStringPrototypeSubstringEmoji0003
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        expect(emoji.substring(0)).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testStringPrototypeSubstringEmoji0004
     * @tc.desc       : Testing the Uri interface substring with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0004";
      try {
        let emoji = '\u260e';
        expect(emoji.substring(0)).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testStringPrototypeSubstringEmoji0005
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        expect(emoji.substring(0)).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testStringPrototypeSubstringEmoji0006
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        expect(emoji.substring(0)).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testStringPrototypeSubstringEmoji0007
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        expect(emoji.substring(0)).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testStringPrototypeSubstringEmoji0008
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        expect(emoji.substring(0)).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testStringPrototypeSubstringEmoji0009
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        expect(emoji.substring(0)).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testStringPrototypeSubstringEmoji0010
     * @tc.desc       : Testing the Uri interface substring with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0010";
      try {
        let emoji = '\u2666';
        expect(emoji.substring(0)).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testStringPrototypeSubstringEmoji0011
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        expect(emoji.substring(0)).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testStringPrototypeSubstringEmoji0012
     * @tc.desc       : Testing the Uri interface substring with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSubstringEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSubstringEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        expect(emoji.substring(0)).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0100
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0001
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0200
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0002
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0300
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0003
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0400
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0004
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0004";
      try {
        let emoji = '\u260e';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0500
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0005
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0600
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0006
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0700
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0007
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0800
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0008
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_0900
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0009
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1000
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0010
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0010";
      try {
        let emoji = '\u2666';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1100
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0011
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STRING_EMOJI_1200
     * @tc.name       : testStringPrototypeSymbolIteratorEmoji0012
     * @tc.desc       : Testing the Uri interface Symbol.iterator with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeSymbolIteratorEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeSymbolIteratorEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let result = emoji[Symbol.iterator]();
        expect(result.next().value.toString('utf-8')).assertEqual('🤼');
        expect(result.next().value.toString('utf-8')).assertEqual('\u200d');
        expect(result.next().value.toString('utf-8')).assertEqual('♂');
        expect(result.next().value.toString('utf-8')).assertEqual('\ufe0f');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0100
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0200
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('👤');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0400
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0004";
      try {
        const emoji = '\u260e';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('☎');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0500
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('👹');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0600
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('🕛');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0700
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('🍏');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0800
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('🔃');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase0900
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('🍁');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase1000
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0010";
      try {
        const emoji = '\u2666';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('♦');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase1100
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('👈');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_LowerCase1200
     * @tc.name       : testStringPrototypeToLocaleLowerCaseEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleLowerCaseEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleLowerCaseEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        expect(emoji.toLocaleLowerCase('en-US')).assertEqual('🤼‍♂️');
        console.info(`${TAG} passed.`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1300
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1400
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0002";
      try {
        const emoji = '\ud83d\udc64'; // 👤
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1500
     * @tc.name       : ttestStringPrototypeToLocaleUpperCaseEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0003";
      try {
        const emoji = '\ud83d\udc6b'; // 👫
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1600
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0004";
      try {
        const emoji = '\u260e'; // ☎
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1700
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0005";
      try {
        const emoji = '\ud83d\udc79'; // 👹
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1800
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0006";
      try {
        const emoji = '\ud83d\udd5b'; // ⚗ (Alembic)
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase1900
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0007";
      try {
        const emoji = '\ud83c\udf4f'; // 🍏
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase2000
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0008";
      try {
        const emoji = '\ud83d\udd03'; // 🔃
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase2100
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0009";
      try {
        const emoji = '\ud83c\udf41'; // 🍁
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase2200
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0010";
      try {
        const emoji = '\u2666'; // ♦
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase2300
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0011";
      try {
        const emoji = '\ud83d\udc48'; // 👈
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_UpperCase2400
     * @tc.name       : testStringPrototypeToLocaleUpperCaseEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLocaleUpperCaseEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLocaleUpperCaseEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f'; // 🤼‍♂️
        expect(emoji.toLocaleUpperCase('en-US')).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase2500
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        expect(emoji.toLowerCase()).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase2600
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0002";
      try {
        const emoji = '\ud83d\udc64'; // 👤
        expect(emoji.toLowerCase()).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase2700
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0003";
      try {
        const emoji = '\ud83d\udc6b'; // 👫
        expect(emoji.toLowerCase()).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase2800
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0004";
      try {
        const emoji = '\u260e'; // ☎
        expect(emoji.toLowerCase()).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase2900
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0005";
      try {
        const emoji = '\ud83d\udc79'; // 👹
        expect(emoji.toLowerCase()).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3000
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0006";
      try {
        const emoji = '\ud83d\udd5b'; // ⚗ (Alembic)
        expect(emoji.toLowerCase()).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3100
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0007";
      try {
        const emoji = '\ud83c\udf4f'; // 🍏
        expect(emoji.toLowerCase()).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3200
     * @tc.name       :testStringPrototypeToLowerCaseEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0008";
      try {
        const emoji = '\ud83d\udd03'; // 🔃
        expect(emoji.toLowerCase()).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3300
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0009";
      try {
        const emoji = '\ud83c\udf41'; // 🍁
        expect(emoji.toLowerCase()).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3400
     * @tc.name       :testStringPrototypeToLowerCaseEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0010";
      try {
        const emoji = '\u2666'; // ♦
        expect(emoji.toLowerCase()).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3500
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0011";
      try {
        const emoji = '\ud83d\udc48'; // 👈
        expect(emoji.toLowerCase()).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLowerCase3600
     * @tc.name       : testStringPrototypeToLowerCaseEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToLowerCaseEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToLowerCaseEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f'; // 🤼‍♂️
        expect(emoji.toLowerCase()).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString3700
     * @tc.name       : testStringPrototypeToStringEmoji0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        expect(emoji.toString()).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString3800
     * @tc.name       : testStringPrototypeToStringEmoji0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0002";
      try {
        const emoji = '\ud83d\udc64'; // 👤
        expect(emoji.toString()).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString3900
     * @tc.name       : testStringPrototypeToStringEmoji0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0003";
      try {
        const emoji = '\ud83d\udc6b'; // 👫
        expect(emoji.toString()).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4000
     * @tc.name       : testStringPrototypeToStringEmoji0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0004";
      try {
        const emoji = '\u260e'; // ☎
        expect(emoji.toString()).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4100
     * @tc.name       : testStringPrototypeToStringEmoji0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0005";
      try {
        const emoji = '\ud83d\udc79'; // 👹
        expect(emoji.toString()).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4200
     * @tc.name       : testStringPrototypeToStringEmoji0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0006";
      try {
        const emoji = '\ud83d\udd5b'; // ⚗ (Alembic)
        expect(emoji.toString()).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4300
     * @tc.name       : testStringPrototypeToStringEmoji0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0007";
      try {
        const emoji = '\ud83c\udf4f'; // 🍏
        expect(emoji.toString()).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4400
     * @tc.name       : testStringPrototypeToStringEmoji0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0008";
      try {
        const emoji = '\ud83d\udd03'; // 🔃
        expect(emoji.toString()).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4500
     * @tc.name       : testStringPrototypeToStringEmoji0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0009";
      try {
        const emoji = '\ud83c\udf41'; // 🍁
        expect(emoji.toString()).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4400
     * @tc.name       : testStringPrototypeToStringEmoji0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0010";
      try {
        const emoji = '\u2666'; // ♦
        expect(emoji.toString()).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4500
     * @tc.name       : testStringPrototypeToStringEmoji0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0011";
      try {
        const emoji = '\ud83d\udc48'; // 👈
        expect(emoji.toString()).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_EMOJI_ToLString4600
     * @tc.name       : testStringPrototypeToStringEmoji0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToStringEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToStringEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f'; // 🤼‍♂️
        expect(emoji.toString()).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0100
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0001
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0200
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0002
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0300
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0003
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0400
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0004
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0004";
      try {
        const emoji = '\u260e';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS ☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0500
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0005
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0600
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0006
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0700
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0007
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0800
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0008
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_0900
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0009
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1000
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0010
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0010";
      try {
        const emoji = '\u2666';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS ♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1100
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0011
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1200
     * @tc.name       : testStringPrototypeToUpperCaseEmoji0012
     * @tc.desc       : Testing the String interface PrototypeToUpperCase with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeToUpperCaseEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeToUpperCaseEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const str = `It is ${emoji}`;
        expect(str.toUpperCase()).assertEqual('IT IS 🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1300
     * @tc.name       : testStringPrototypeTrimEmoji0001
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1400
     * @tc.name       : testStringPrototypeTrimEmoji0002
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1500
     * @tc.name       : testStringPrototypeTrimEmoji0003
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji  \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0003";
      try {
        const emoji = ' \ud83d\udc6b';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1600
     * @tc.name       : testStringPrototypeTrimEmoji0004
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0004";
      try {
        const emoji = '\u260e';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1700
     * @tc.name       : testStringPrototypeTrimEmoji0005
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1800
     * @tc.name       : testStringPrototypeTrimEmoji0006
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_1900
     * @tc.name       : testStringPrototypeTrimEmoji0007
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2000
     * @tc.name       : testStringPrototypeTrimEmoji0008
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2100
     * @tc.name       : testStringPrototypeTrimEmoji0009
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2200
     * @tc.name       : testStringPrototypeTrimEmoji0010
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0010";
      try {
        const emoji = '\u2666';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2300
     * @tc.name       : testStringPrototypeTrimEmoji0011
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2400
     * @tc.name       : testStringPrototypeTrimEmoji0012
     * @tc.desc       : Testing the String interface PrototypeTrim with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const str = `   ${emoji}   `;
        expect(str.trim()).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2500
     * @tc.name       : testStringPrototypeTrimEndEmoji0001
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2600
     * @tc.name       : testStringPrototypeTrimEndEmoji0002
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2700
     * @tc.name       : testStringPrototypeTrimEndEmoji0003
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2800
     * @tc.name       : testStringPrototypeTrimEndEmoji0004
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0004";
      try {
        const emoji = '\u260e';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   ☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_2900
     * @tc.name       : testStringPrototypeTrimEndEmoji0005
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3000
     * @tc.name       : testStringPrototypeTrimEndEmoji0006
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3100
     * @tc.name       : testStringPrototypeTrimEndEmoji0007
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3200
     * @tc.name       : testStringPrototypeTrimEndEmoji0008
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3300
     * @tc.name       : testStringPrototypeTrimEndEmoji0009
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3400
     * @tc.name       : testStringPrototypeTrimEndEmoji0010
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0010";
      try {
        const emoji = '\u2666';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   ♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3500
     * @tc.name       : testStringPrototypeTrimEndEmoji0011
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3600
     * @tc.name       : testStringPrototypeTrimEndEmoji0012
     * @tc.desc       : Testing the String interface PrototypeTrimEnd with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimEndEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimEndEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const str = `   ${emoji}   `;
        expect(str.trimEnd()).assertEqual('   🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3700
     * @tc.name       : testStringPrototypeTrimStartEmoji0001
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('😊   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3800
     * @tc.name       : testStringPrototypeTrimStartEmoji0002
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('👤   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_3900
     * @tc.name       : testStringPrototypeTrimStartEmoji0003
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('👫   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4000
     * @tc.name       : testStringPrototypeTrimStartEmoji0004
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0004";
      try {
        const emoji = '\u260e';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('☎   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4100
     * @tc.name       : testStringPrototypeTrimStartEmoji0005
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('👹   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4200
     * @tc.name       : testStringPrototypeTrimStartEmoji0006
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('🕛   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4300
     * @tc.name       : testStringPrototypeTrimStartEmoji0007
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('🍏   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4400
     * @tc.name       : testStringPrototypeTrimStartEmoji0008
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('🔃   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4500
     * @tc.name       : testStringPrototypeTrimStartEmoji0009
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('🍁   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4600
     * @tc.name       : testStringPrototypeTrimStartEmoji0010
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0010";
      try {
        const emoji = '\u2666';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('♦   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4700
     * @tc.name       : testStringPrototypeTrimStartEmoji0011
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('👈   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4800
     * @tc.name       : testStringPrototypeTrimStartEmoji0012
     * @tc.desc       : Testing the String interface PrototypeTrimStart with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeTrimStartEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeTrimStartEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const str = `   ${emoji}   `;
        expect(str.trimStart()).assertEqual('🤼‍♂️   ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_4900
     * @tc.name       : testStringPrototypeValueOfEmoji0001
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5000
     * @tc.name       : testStringPrototypeValueOfEmoji0002
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5100
     * @tc.name       : testStringPrototypeValueOfEmoji0003
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5200
     * @tc.name       : testStringPrototypeValueOfEmoji0004
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0004";
      try {
        const emoji = '\u260e';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5300
     * @tc.name       : testStringPrototypeValueOfEmoji0005
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5400
     * @tc.name       : testStringPrototypeValueOfEmoji0006
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji000v6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5500
     * @tc.name       : testStringPrototypeValueOfEmoji0007
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5600
     * @tc.name       : testStringPrototypeValueOfEmoji0008
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5700
     * @tc.name       : testStringPrototypeValueOfEmoji0009
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5800
     * @tc.name       : testStringPrototypeValueOfEmoji0010
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0010";
      try {
        const emoji = '\u2666';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_5900
     * @tc.name       : testStringPrototypeValueOfEmoji0011
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_String_EMOJI_6000
     * @tc.name       : testStringPrototypeValueOfEmoji0012
     * @tc.desc       : Testing the String interface PrototypeValueOf with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeValueOfEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringPrototypeValueOfEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const str = new String(emoji);
        expect(str.valueOf()).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

  })
}