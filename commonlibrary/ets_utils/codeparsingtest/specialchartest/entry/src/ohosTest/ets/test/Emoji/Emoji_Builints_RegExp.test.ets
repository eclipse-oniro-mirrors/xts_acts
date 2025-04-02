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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function Emoji_RegExp() {
  describe('Emoji_RegExp', () => {

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0100
     * @tc.name       : testRegExpConstructorEmoji0001
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0001', 0, () => {
      const TAG = "testRegExpConstructorEmoji0001";
      try {
        const regex1 = /\ud83d\ude0a/;
        const regex2 = new RegExp('\\ud83d\\ude0a');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0200
     * @tc.name       : testRegExpConstructorEmoji0002
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0002', 0, () => {
      const TAG = "testRegExpConstructorEmoji0002";
      try {
        const regex1 = /\ud83d\udc64/;
        const regex2 = new RegExp('\\ud83d\\udc64');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0300
     * @tc.name       : testRegExpConstructorEmoji0003
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0003', 0, () => {
      const TAG = "testRegExpConstructorEmoji0003";
      try {
        const regex1 = /\ud83d\udc6b/;
        const regex2 = new RegExp('\\ud83d\\udc6b');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0400
     * @tc.name       : testRegExpConstructorEmoji0004
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0004', 0, () => {
      const TAG = "testRegExpConstructorEmoji0004";
      try {
        const regex1 = /\u260e/;
        const regex2 = new RegExp('\\u260e');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0500
     * @tc.name       : testRegExpConstructorEmoji0005
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0005', 0, () => {
      const TAG = "testRegExpConstructorEmoji0005";
      try {
        const regex1 = /\ud83d\udc79/;
        const regex2 = new RegExp('\\ud83d\\udc79');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0600
     * @tc.name       : testRegExpConstructorEmoji0006
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0006', 0, () => {
      const TAG = "testRegExpConstructorEmoji0006";
      try {
        const regex1 = /\ud83d\udd5b/;
        const regex2 = new RegExp('\\ud83d\\udd5b');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0700
     * @tc.name       : testRegExpConstructorEmoji0007
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0007', 0, () => {
      const TAG = "testRegExpConstructorEmoji0007";
      try {
        const regex1 = /\ud83c\udf4f/;
        const regex2 = new RegExp('\\ud83c\\udf4f');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0800
     * @tc.name       : testRegExpConstructorEmoji0008
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0008', 0, () => {
      const TAG = "testRegExpConstructorEmoji0008";
      try {
        const regex1 = /\ud83d\udd03/;
        const regex2 = new RegExp('\\ud83d\\udd03');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_0900
     * @tc.name       : testRegExpConstructorEmoji0009
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0009', 0, () => {
      const TAG = "testRegExpConstructorEmoji0009";
      try {
        const regex1 = /\ud83c\udf41/;
        const regex2 = new RegExp('\\ud83c\\udf41');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_1000
     * @tc.name       : testRegExpConstructorEmoji0010
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0010', 0, () => {
      const TAG = "testRegExpConstructorEmoji0010";
      try {
        const regex1 = /\u2666/;
        const regex2 = new RegExp('\\u2666');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_1100
     * @tc.name       : testRegExpConstructorEmoji0011
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0011', 0, () => {
      const TAG = "testRegExpConstructorEmoji0011";
      try {
        const regex1 = /\ud83d\udc48/;
        const regex2 = new RegExp('\\ud83d\\udc48');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EMOJI_1200
     * @tc.name       : testRegExpConstructorEmoji0012
     * @tc.desc       : Testing the RegExp interface Constructor with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpConstructorEmoji0012', 0, () => {
      const TAG = "testRegExpConstructorEmoji0012";
      try {
        const regex1 = /\ud83e\udd3c\u200d\u2642\ufe0f/;
        const regex2 = new RegExp('\\ud83e\\udd3c\\u200d\\u2642\\ufe0f');

        expect(regex1 === regex2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0100
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0001
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0001", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0001";
      try {
        const emoji = "😊";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0200
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0002
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0002", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0002";
      try {
        const emoji = "👤";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0300
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0003
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0003", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0003";
      try {
        const emoji = "👫";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0400
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0004
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0004", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0004";
      try {
        const emoji = "☎";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0500
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0005
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0005", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0005";
      try {
        const emoji = "👹";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0600
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0006
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0006", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0006";
      try {
        const emoji = "🕛";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0700
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0007
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0007", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0007";
      try {
        const emoji = "🍏";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0800
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0008
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0008", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0008";
      try {
        const emoji = "🔃";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_0900
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0009
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0009", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0009";
      try {
        const emoji = "🍁";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_1000
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0010
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0010", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0010";
      try {
        const emoji = "♦";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_1100
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0011
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0011", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0011";
      try {
        const emoji = "👈";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_EXEC_1200
     * @tc.name       : testRegExpPrototypeSymbolMatchAllEmoji0012
     * @tc.desc       : Testing the RegExp.prototype.Symbol.matchAll method with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolMatchAllEmoji0012", 0, () => {
      const TAG = "testRegExpPrototypeSymbolMatchAllEmoji0012";
      try {
        const emoji = "🤼‍♂️";
        const re = /[0-9]+/g;
        const result = emoji.matchAll(re);
        const resultArray = Array.from(result);
        expect(resultArray.length.toString()).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0100
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0001
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0001", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0001";
      try {
        const emoji = "😊";
        const re = emoji.replace(/😊/g, 'hello');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("hello");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0200
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0002
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 👤
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0002", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0002";
      try {
        const emoji = "👤";
        const re = emoji.replace(/👤/g, 'user');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("user");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0300
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0003
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 👫
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0003", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0003";
      try {
        const emoji = "👫";
        const re = emoji.replace(/👫/g, 'couple');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("couple");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0400
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0004
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji ☎
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0004", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0004";
      try {
        const emoji = "☎";
        const re = emoji.replace(/☎/g, 'phone');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("phone");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0500
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0005
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 👹
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0005", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0005";
      try {
        const emoji = "👹";
        const re = emoji.replace(/👹/g, 'monster');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("monster");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0600
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0006
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 🕛
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0006", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0006";
      try {
        const emoji = "🕛";
        const re = emoji.replace(/🕛/g, 'clock');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("clock");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0700
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0007
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 🍏
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0007", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0007";
      try {
        const emoji = "🍏";
        const re = emoji.replace(/🍏/g, 'apple');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("apple");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0800
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0008
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 🔃
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0008", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0008";
      try {
        const emoji = "🔃";
        const re = emoji.replace(/🔃/g, 'refresh');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("refresh");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_0900
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0009
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 🍁
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0009", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0009";
      try {
        const emoji = "🍁";
        const re = emoji.replace(/🍁/g, 'leaf');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("leaf");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_1000
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0010
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji ♦
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0010", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0010";
      try {
        const emoji = "♦";
        const re = emoji.replace(/♦/g, 'diamond');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("diamond");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_1100
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0011
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 👈
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0011", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0011";
      try {
        const emoji = "👈";
        const re = emoji.replace(/👈/g, 'left');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("left");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Replace_1200
     * @tc.name       : testRegExpPrototypeSymbolReplaceEmoji0012
     * @tc.desc       : Testing the RegExp.prototype.Symbol.Replace method with input emoji 🤼‍♂️
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSymbolReplaceEmoji0012", 0, () => {
      const TAG = "testRegExpPrototypeSymbolReplaceEmoji0012";
      try {
        const emoji = "🤼‍♂️";
        const re = emoji.replace(/🤼‍♂️/g, 'wrestler');
        const res = encodeURI(re);
        expect(res.toString()).assertEqual("wrestler");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0100
     * @tc.name       : testRegExpPrototypeTestEmoji0001
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0001', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0001';
      try {
        let s: string = '\ud83d\ude0a';
        let regexp: RegExp = new RegExp('\ud83d\ude0a');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0200
     * @tc.name       : testRegExpPrototypeTestEmoji0002
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 👤
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0002', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0002';
      try {
        let s: string = '\ud83d\udc64';
        let regexp: RegExp = new RegExp('\ud83d\udc64');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0300
     * @tc.name       : testRegExpPrototypeTestEmoji0003
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 👫
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0003', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0003';
      try {
        let s: string = '\ud83d\udc6b';
        let regexp: RegExp = new RegExp('\ud83d\udc6b');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0400
     * @tc.name       : testRegExpPrototypeTestEmoji0004
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji ☎
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0004', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0004';
      try {
        let s: string = '\u260e';
        let regexp: RegExp = new RegExp('\u260e');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0500
     * @tc.name       : testRegExpPrototypeTestEmoji0005
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 👹
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0005', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0005';
      try {
        let s: string = '\ud83d\udc79';
        let regexp: RegExp = new RegExp('\ud83d\udc79');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0600
     * @tc.name       : testRegExpPrototypeTestEmoji0006
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 🕛
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0006', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0006';
      try {
        let s: string = '\ud83d\udd5b';
        let regexp: RegExp = new RegExp('\ud83d\udd5b');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0700
     * @tc.name       : testRegExpPrototypeTestEmoji0007
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 🍏
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0007', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0007';
      try {
        let s: string = '\ud83c\udf4f';
        let regexp: RegExp = new RegExp('\ud83c\udf4f');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0800
     * @tc.name       : testRegExpPrototypeTestEmoji0008
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 🔃
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0008', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0008';
      try {
        let s: string = '\ud83d\udd03';
        let regexp: RegExp = new RegExp('\ud83d\udd03');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_0900
     * @tc.name       : testRegExpPrototypeTestEmoji0009
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 🍁
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0009', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0009';
      try {
        let s: string = '\ud83c\udf41';
        let regexp: RegExp = new RegExp('\ud83c\udf41');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_1000
     * @tc.name       : testRegExpPrototypeTestEmoji0010
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji ♦
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0010', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0010';
      try {
        let s: string = '\u2666';
        let regexp: RegExp = new RegExp('\u2666');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_1100
     * @tc.name       : testRegExpPrototypeTestEmoji0011
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 👈
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0011', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0011';
      try {
        let s: string = '\ud83d\udc48';
        let regexp: RegExp = new RegExp('\ud83d\udc48');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_RegExp_Test_1200
     * @tc.name       : testRegExpPrototypeTestEmoji0012
     * @tc.desc       : Testing the RegExp.prototype.Test method with input emoji 🤼‍♂️
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeTestEmoji0012', 0, () => {
      let TAG = 'testRegExpPrototypeTestEmoji0012';
      try {
        let s: string = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let regexp: RegExp = new RegExp('\ud83e\udd3c\u200d\u2642\ufe0f');
        const res = encodeURI(regexp.test(s).toString());
        expect(res.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0100
     * @tc.name       : testRegExpPrototypeToStringEmoji0001
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0001', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/😊/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0200
     * @tc.name       : testRegExpPrototypeToStringEmoji0002
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0002', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/👤/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0300
     * @tc.name       : testRegExpPrototypeToStringEmoji0003
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0003', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/👫/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0400
     * @tc.name       : testRegExpPrototypeToStringEmoji0004
     * @tc.desc       : Testing the RegExp interface toString with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0004', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0004";
      try {
        let emoji = '\u260e';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/☎/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0500
     * @tc.name       : testRegExpPrototypeToStringEmoji0005
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0005', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/👹/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0600
     * @tc.name       : testRegExpPrototypeToStringEmoji0006
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0006', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/🕛/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0700
     * @tc.name       : testRegExpPrototypeToStringEmoji0007
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0007', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/🍏/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0800
     * @tc.name       : testRegExpPrototypeToStringEmoji0008
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0008', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/🔃/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0900
     * @tc.name       : testRegExpPrototypeToStringEmoji0009
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0009', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/🍁/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1000
     * @tc.name       : testRegExpPrototypeToStringEmoji0010
     * @tc.desc       : Testing the RegExp interface toString with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0010', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0010";
      try {
        let emoji = '\u2666';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/♦/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1100
     * @tc.name       : testRegExpPrototypeToStringEmoji0011
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0011', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/👈/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1200
     * @tc.name       : testRegExpPrototypeToStringEmoji0012
     * @tc.desc       : Testing the RegExp interface toString with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeToStringEmoji0012', 0, () => {
      const TAG = "testRegExpPrototypeToStringEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let myExp = new RegExp(emoji);
        expect(myExp.toString()).assertEqual('/🤼‍♂️/');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0100
     * @tc.name       : testRegExpPrototypeDotAllEmoji0001
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0001', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0200
     * @tc.name       : testRegExpPrototypeDotAllEmoji0002
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0002', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0300
     * @tc.name       : testRegExpPrototypeDotAllEmoji0003
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0003', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0400
     * @tc.name       : testRegExpPrototypeDotAllEmoji0004
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0004', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0004";
      try {
        let emoji = '\u260e';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0500
     * @tc.name       : testRegExpPrototypeDotAllEmoji0005
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0005', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0600
     * @tc.name       : testRegExpPrototypeDotAllEmoji0006
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0006', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0700
     * @tc.name       : testRegExpPrototypeDotAllEmoji0007
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0007', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0800
     * @tc.name       : testRegExpPrototypeDotAllEmoji0008
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0008', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0900
     * @tc.name       : testRegExpPrototypeDotAllEmoji0009
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0009', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1000
     * @tc.name       : testRegExpPrototypeDotAllEmoji0010
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0010', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0010";
      try {
        let emoji = '\u2666';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1100
     * @tc.name       : testRegExpPrototypeDotAllEmoji0011
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0011', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1200
     * @tc.name       : testRegExpPrototypeDotAllEmoji0012
     * @tc.desc       : Testing the RegExp interface dotAll with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeDotAllEmoji0012', 0, () => {
      const TAG = "testRegExpPrototypeDotAllEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let myExp = new RegExp(emoji,'s');
        expect(myExp.dotAll).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0100
     * @tc.name       : testRegExpPrototypeFlagsEmoji0001
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0001', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0200
     * @tc.name       : testRegExpPrototypeFlagsEmoji0002
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0002', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0300
     * @tc.name       : testRegExpPrototypeFlagsEmoji0003
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0003', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0400
     * @tc.name       : testRegExpPrototypeFlagsEmoji0004
     * @tc.desc       : Testing the RegExp interface flags with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0004', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0004";
      try {
        let emoji = '\u260e';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0500
     * @tc.name       : testRegExpPrototypeFlagsEmoji0005
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0005', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0600
     * @tc.name       : testRegExpPrototypeFlagsEmoji0006
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0006', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0700
     * @tc.name       : testRegExpPrototypeFlagsEmoji0007
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0007', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0800
     * @tc.name       : testRegExpPrototypeFlagsEmoji0008
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0008', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0900
     * @tc.name       : testRegExpPrototypeFlagsEmoji0008
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0009', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1000
     * @tc.name       : testRegExpPrototypeFlagsEmoji0010
     * @tc.desc       : Testing the RegExp interface flags with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0010', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0010";
      try {
        let emoji = '\u2666';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1100
     * @tc.name       : testRegExpPrototypeFlagsEmoji0011
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0011', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1200
     * @tc.name       : testRegExpPrototypeFlagsEmoji0012
     * @tc.desc       : Testing the RegExp interface flags with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeFlagsEmoji0012', 0, () => {
      const TAG = "testRegExpPrototypeFlagsEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let myExp = new RegExp(emoji,'gim');
        expect(myExp.flags).assertEqual('gim');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0100
     * @tc.name       : testRegExpPrototypeGlobalEmoji0001
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0001', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0200
     * @tc.name       : testRegExpPrototypeGlobalEmoji0002
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0002', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0300
     * @tc.name       : testRegExpPrototypeGlobalEmoji0003
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0003', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0400
     * @tc.name       : testRegExpPrototypeGlobalEmoji0004
     * @tc.desc       : Testing the RegExp interface global with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0004', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0004";
      try {
        let emoji = '\u260e';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0500
     * @tc.name       : testRegExpPrototypeGlobalEmoji0005
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0005', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0600
     * @tc.name       : testRegExpPrototypeGlobalEmoji0006
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0006', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0700
     * @tc.name       : testRegExpPrototypeGlobalEmoji0007
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0007', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0800
     * @tc.name       : testRegExpPrototypeGlobalEmoji0008
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0008', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_0900
     * @tc.name       : testRegExpPrototypeGlobalEmoji0009
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0009', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1000
     * @tc.name       : testRegExpPrototypeGlobalEmoji0010
     * @tc.desc       : Testing the RegExp interface global with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0010', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0010";
      try {
        let emoji = '\u2666';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1100
     * @tc.name       : testRegExpPrototypeGlobalEmoji0011
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0011', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP__EMOJI_1200
     * @tc.name       : testRegExpPrototypeGlobalEmoji0012
     * @tc.desc       : Testing the RegExp interface global with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegExpPrototypeGlobalEmoji0012', 0, () => {
      const TAG = "testRegExpPrototypeGlobalEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let myExp = new RegExp(emoji,'g');
        expect(myExp.global).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0100
     * @tc.name       : testStringPrototypeHasIndicesEmoji0001
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0001', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        const regex = /\ud83d\ude0a/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0200
     * @tc.name       : testStringPrototypeHasIndicesEmoji0002
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0002', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        const regex = /\ud83d\udc64/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0300
     * @tc.name       : testStringPrototypeHasIndicesEmoji0003
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0003', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        const regex = /\ud83d\udc6b/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0400
     * @tc.name       : testStringPrototypeHasIndicesEmoji0004
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0004', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0004";
      try {
        const emoji = '\u260e';
        const regex = /\u260e/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0500
     * @tc.name       : testStringPrototypeHasIndicesEmoji0005
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0005', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        const regex = /\ud83d\udc79/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0600
     * @tc.name       : testStringPrototypeHasIndicesEmoji0006
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0006', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        const regex = /\ud83d\udd5b/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0700
     * @tc.name       : testStringPrototypeHasIndicesEmoji0007
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0007', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        const regex = /\ud83c\udf4f/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0800
     * @tc.name       : testStringPrototypeHasIndicesEmoji0008
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0008', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        const regex = /\ud83d\udd03/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0900
     * @tc.name       : testStringPrototypeHasIndicesEmoji0009
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0009', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        const regex = /\ud83c\udf41/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1000
     * @tc.name       : testStringPrototypeHasIndicesEmoji0010
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0010', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0010";
      try {
        const emoji = '\u2666';
        const regex = /\u2666/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1100
     * @tc.name       : testStringPrototypeHasIndicesEmoji0011
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0011', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        const regex = /\ud83d\udc48/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1200
     * @tc.name       : testStringPrototypeHasIndicesEmoji0012
     * @tc.desc       : Testing the String interface PrototypeHasIndices with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeHasIndicesEmoji0012', 0, () => {
      const TAG = "testStringPrototypeHasIndicesEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        const regex = /\ud83e\udd3c\u200d\u2642\ufe0f/g.flags;
        expect(regex.includes('g')).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0100
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0001
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0001', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0200
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0002
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0002', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0300
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0003
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0003', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0400
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0004
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0004', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0004";
      try {
        const emoji = '\u260e';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0500
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0005
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0005', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0600
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0006
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0006', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0700
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0007
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0007', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0800
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0008
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0008', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0900
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0009
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0009', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1000
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0010
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0010', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0010";
      try {
        const emoji = '\u2666';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1100
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0011
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0011', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1200
     * @tc.name       : testStringPrototypeIgnoreCaseEmoji0012
     * @tc.desc       : Testing the String interface PrototypeIgnoreCase with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeIgnoreCaseEmoji0012', 0, () => {
      const TAG = "testStringPrototypeIgnoreCaseEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let regex = new RegExp(emoji, "i");
        expect(regex.ignoreCase).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0100
     * @tc.name       : testStringPrototypeMultilineEmoji0001
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0001', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0200
     * @tc.name       : testStringPrototypeMultilineEmoji0002
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0002', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0300
     * @tc.name       : testStringPrototypeMultilineEmoji0003
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0003', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0400
     * @tc.name       : testStringPrototypeMultilineEmoji0004
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0004', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0004";
      try {
        const emoji = '\u260e';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0500
     * @tc.name       : testStringPrototypeMultilineEmoji0005
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0005', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0600
     * @tc.name       : testStringPrototypeMultilineEmoji0006
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0006', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0700
     * @tc.name       : testStringPrototypeMultilineEmoji0007
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0007', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0800
     * @tc.name       : testStringPrototypeMultilineEmoji0008
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0008', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_0900
     * @tc.name       : testStringPrototypeMultilineEmoji0009
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0009', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1000
     * @tc.name       : testStringPrototypeMultilineEmoji0010
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0010', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0010";
      try {
        const emoji = '\u2666';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1100
     * @tc.name       : testStringPrototypeMultilineEmoji0011
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0011', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_EMOJI_1200
     * @tc.name       : testStringPrototypeMultilineEmoji0012
     * @tc.desc       : Testing the String interface PrototypeMultiline with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringPrototypeMultilineEmoji0012', 0, () => {
      const TAG = "testStringPrototypeMultilineEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let regex = new RegExp(emoji, "m");
        expect(regex.multiline).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0100
     * @tc.name       : testRegExpPrototypeSourceEmoji0001
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0001", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0001";
      try {
        const new1 = new RegExp('\ud83d\ude0a').source;
        expect(new1).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0200
     * @tc.name       : testRegExpPrototypeSourceEmoji0002
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0002", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0002";
      try {
        const new1 = new RegExp('\ud83d\udc64').source;
        expect(new1).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0300
     * @tc.name       : testRegExpPrototypeSourceEmoji0003
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0003", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0003";
      try {
        const new1 = new RegExp('\ud83d\udc6b').source;
        expect(new1).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0400
     * @tc.name       : testRegExpPrototypeSourceEmoji0004
     * @tc.desc       : Test the Uri interface Source with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0004", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0004";
      try {
        const new1 = new RegExp('\u260e').source;
        expect(new1).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0500
     * @tc.name       : testRegExpPrototypeSourceEmoji0005
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0005", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0005";
      try {
        const new1 = new RegExp('\ud83d\udc79').source;
        expect(new1).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0600
     * @tc.name       : testRegExpPrototypeSourceEmoji0006
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0006", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0006";
      try {
        const new1 = new RegExp('\ud83d\udd5b').source;
        expect(new1).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0700
     * @tc.name       : testRegExpPrototypeSourceEmoji0007
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0007", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0007";
      try {
        const new1 = new RegExp('\ud83c\udf4f').source;
        expect(new1).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0800
     * @tc.name       : testRegExpPrototypeSourceEmoji0008
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0008", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0008";
      try {
        const new1 = new RegExp('\ud83d\udd03').source;
        expect(new1).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0900
     * @tc.name       : testRegExpPrototypeSourceEmoji0009
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0009", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0009";
      try {
        const new1 = new RegExp('\ud83c\udf41').source;
        expect(new1).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1000
     * @tc.name       : testRegExpPrototypeSourceEmoji0010
     * @tc.desc       : Test the Uri interface Source with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0010", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0010";
      try {
        const new1 = new RegExp('\u2666').source;
        expect(new1).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1100
     * @tc.name       : testRegExpPrototypeSourceEmoji0011
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0011", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0011";
      try {
        const new1 = new RegExp('\ud83d\udc48').source;
        expect(new1).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1200
     * @tc.name       : testRegExpPrototypeSourceEmoji0012
     * @tc.desc       : Test the Uri interface Source with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeSourceEmoji0012", 0, () => {
      const TAG = "testRegExpPrototypeSourceEmoji0012";
      try {
        const new1 = new RegExp('\ud83e\udd3c\u200d\u2642\ufe0f').source;
        expect(new1).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0100
     * @tc.name       : testRegExpPrototypeStickyEmoji0001
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0001", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0001";
      try {
        const escape = encodeURI('\ud83d\ude0a');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0200
     * @tc.name       : testRegExpPrototypeStickyEmoji0002
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0002", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0002";
      try {
        const escape = encodeURI('\ud83d\udc64');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0300
     * @tc.name       : testRegExpPrototypeStickyEmoji0003
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0003", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0003";
      try {
        const escape = encodeURI('\ud83d\udc6b');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0400
     * @tc.name       : testRegExpPrototypeStickyEmoji0004
     * @tc.desc       : Test the Uri interface Sticky with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0004", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0004";
      try {
        const escape = encodeURI('\u260e');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0500
     * @tc.name       : testRegExpPrototypeStickyEmoji0005
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0005", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0005";
      try {
        const escape = encodeURI('\ud83d\udc79');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0600
     * @tc.name       : testRegExpPrototypeStickyEmoji0006
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0006", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0006";
      try {
        const escape = encodeURI('\ud83d\udd5b');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0700
     * @tc.name       : testRegExpPrototypeStickyEmoji0007
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0007", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0007";
      try {
        const escape = encodeURI('\ud83c\udf4f');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0800
     * @tc.name       : testRegExpPrototypeStickyEmoji0008
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0008", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0008";
      try {
        const escape = encodeURI('\ud83d\udd03');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0900
     * @tc.name       : testRegExpPrototypeStickyEmoji0009
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0009", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0009";
      try {
        const escape = encodeURI('\ud83c\udf41');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1000
     * @tc.name       : testRegExpPrototypeStickyEmoji0010
     * @tc.desc       : Test the Uri interface Sticky with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0010", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0010";
      try {
        const escape = encodeURI('\u2666');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1100
     * @tc.name       : testRegExpPrototypeStickyEmoji0011
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0011", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0011";
      try {
        const escape = encodeURI('\ud83d\udc48');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1200
     * @tc.name       : testRegExpPrototypeStickyEmoji0012
     * @tc.desc       : Test the Uri interface Sticky with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeStickyEmoji0012", 0, () => {
      const TAG = "testRegExpPrototypeStickyEmoji0012";
      try {
        const escape = encodeURI('\ud83e\udd3c\u200d\u2642\ufe0f');
        const re = new RegExp(escape, 'y');
        let result = re.sticky
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0100
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0001
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0001", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0001";
      try {
        const regex = new RegExp("\ud83d\ude0a");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0200
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0002
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0002", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0002";
      try {
        const regex = new RegExp("\ud83d\udc64");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0300
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0003
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0003", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0003";
      try {
        const regex = new RegExp("\ud83d\udc6b");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0400
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0004
     * @tc.desc       : Test the Uri interface Unicode with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0004", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0004";
      try {
        const regex = new RegExp("\u260e");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0500
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0005
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0005", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0005";
      try {
        const regex = new RegExp("\ud83d\udc79");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0600
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0006
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0006", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0006";
      try {
        const regex = new RegExp("\ud83d\udd5b");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0700
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0007
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0007", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0007";
      try {
        const regex = new RegExp("\ud83c\udf4f");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0800
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0008
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0008", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0008";
      try {
        const regex = new RegExp("\ud83d\udd03");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_0900
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0009
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0009", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0009";
      try {
        const regex = new RegExp("\ud83c\udf41");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1000
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0010
     * @tc.desc       : Test the Uri interface Unicode with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0010", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0010";
      try {
        const regex = new RegExp("\u2666");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1100
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0011
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0011", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0011";
      try {
        const regex = new RegExp("\ud83d\udc48");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_REGEXP_EMOJI_1200
     * @tc.name       : testRegExpPrototypeUnicodeEmoji0012
     * @tc.desc       : Test the Uri interface Unicode with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testRegExpPrototypeUnicodeEmoji0012", 0, () => {
      const TAG = "testRegExpPrototypeUnicodeEmoji0012";
      try {
        const regex = new RegExp("\ud83e\udd3c\u200d\u2642\ufe0f");
        expect(regex.unicode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


  })
}