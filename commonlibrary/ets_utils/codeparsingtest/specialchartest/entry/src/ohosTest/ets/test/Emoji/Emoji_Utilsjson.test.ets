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
import { ArkTSUtils, JSON, lang } from '@kit.ArkTS';

export default function demoEmojiUtilJsonTest() {
  describe('demoEmojiUtilJsonTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0100
     * @tc.name       : testparseEmoji0001
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0200
     * @tc.name       : testparseEmoji0002
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0300
     * @tc.name       : testparseEmoji0003
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0400
     * @tc.name       : testparseEmoji0004
     * @tc.desc       : Test the Utils interface parse with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0004";
      try {
        const emoji = '\u260e';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0500
     * @tc.name       : testparseEmoji0005
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0600
     * @tc.name       : testparseEmoji0006
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0700
     * @tc.name       : testparseEmoji0007
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0800
     * @tc.name       : testparseEmoji0008
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_0900
     * @tc.name       : testparseEmoji0009
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_1000
     * @tc.name       : testparseEmoji0010
     * @tc.desc       : Test the Utils interface parse with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0010";
      try {
        const emoji = '\u2666';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_1100
     * @tc.name       : testparseEmoji0011
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_EMOJI_1200
     * @tc.name       : testparseEmoji0012
     * @tc.desc       : Test the Utils interface parse with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testparseEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testparseEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${emoji}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual(emoji);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1300
     * @tc.name       : testUtilJsonRemoveEmoji0001
     * @tc.desc       : Test the function of the Interface emoji  😊  \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0001";
      try {
        const emojiObj = JSON.parse('{"\ud83d\ude0a":0}')
        JSON.remove(emojiObj, '😊')
        let result = JSON.has(emojiObj, '😊')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1400
     * @tc.name       : testUtilJsonRemoveEmoji0002
     * @tc.desc       : Test the function of the Interface emoji  👤  \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0002";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc64":0}')
        JSON.remove(emojiObj, '👤')
        let result = JSON.has(emojiObj, '👤')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1500
     * @tc.name       : testUtilJsonRemoveEmoji0003
     * @tc.desc       : Test the function of the Interface emoji  👫  \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0003";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc6b":0}')
        JSON.remove(emojiObj, '👫')
        let result = JSON.has(emojiObj, '👫')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1600
     * @tc.name       : testUtilJsonRemoveEmoji0004
     * @tc.desc       : Test the function of the Interface emoji  ☎  \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0004";
      try {
        const emojiObj = JSON.parse('{"\u260e":0}')
        JSON.remove(emojiObj, '☎')
        let result = JSON.has(emojiObj, '☎')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1700
     * @tc.name       : testUtilJsonRemoveEmoji0005
     * @tc.desc       : Test the function of the Interface emoji  👹  \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0005";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc79":0}')
        JSON.remove(emojiObj, '👹')
        let result = JSON.has(emojiObj, '👹')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1800
     * @tc.name       : testUtilJsonRemoveEmoji0006
     * @tc.desc       : Test the function of the Interface emoji  🕛  \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0006";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udd5b":0}')
        JSON.remove(emojiObj, '🕛')
        let result = JSON.has(emojiObj, '🕛')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_1900
     * @tc.name       : testUtilJsonRemoveEmoji0007
     * @tc.desc       : Test the function of the Interface emoji  🍏  \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0007";
      try {
        const emojiObj = JSON.parse('{"\ud83c\udf4f":0}')
        JSON.remove(emojiObj, '🍏')
        let result = JSON.has(emojiObj, '🍏')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_2000
     * @tc.name       : testUtilJsonRemoveEmoji0008
     * @tc.desc       : Test the function of the Interface emoji  🔃  \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0008";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udd03":0}')
        JSON.remove(emojiObj, '🔃')
        let result = JSON.has(emojiObj, '🔃')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_2100
     * @tc.name       : testUtilJsonRemoveEmoji0009
     * @tc.desc       : Test the function of the Interface emoji  🍁  \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0009";
      try {
        const emojiObj = JSON.parse('{"\ud83c\udf41":0}')
        JSON.remove(emojiObj, '🍁')
        let result = JSON.has(emojiObj, '🍁')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_2200
     * @tc.name       : testUtilJsonRemoveEmoji0010
     * @tc.desc       : Test the function of the Interface emoji  ♦   \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0010";
      try {
        const emojiObj = JSON.parse('{"\u2666":0}')
        JSON.remove(emojiObj, '♦')
        let result = JSON.has(emojiObj, '♦')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_2300
     * @tc.name       : testUtilJsonRemoveEmoji0011
     * @tc.desc       : Test the function of the Interface emoji  👈  \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0011";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc48":0}')
        JSON.remove(emojiObj, '👈')
        let result = JSON.has(emojiObj, '👈')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_2400
     * @tc.name       : testUtilJsonRemoveEmoji0012
     * @tc.desc       : Test the function of the Interface emoji  🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveEmoji0012";
      try {
        const emojiObj = JSON.parse('{"\ud83e\udd3c\u200d\u2642\ufe0f":0}')
        JSON.remove(emojiObj, '🤼‍♂️')
        let result = JSON.has(emojiObj, '🤼‍♂️')
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_2500
     * @tc.name       : testUtilJsonHasEmoji0001
     * @tc.desc       : Test the function of the Interface emoji  😊  \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0001";
      try {
        const emojiObj = JSON.parse('{"\ud83d\ude0a":0}')
        let result = JSON.has(emojiObj, '😊')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_2600
     * @tc.name       : testUtilJsonHasEmoji0002
     * @tc.desc       : Test the function of the Interface emoji  👤  \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0002";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc64":0}')
        let result = JSON.has(emojiObj, '👤')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_2700
     * @tc.name       : testUtilJsonHasEmoji0003
     * @tc.desc       : Test the function of the Interface emoji  👫  \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0003";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc6b":0}')
        let result = JSON.has(emojiObj, '👫')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_2800
     * @tc.name       : testUtilJsonHasEmoji0004
     * @tc.desc       : Test the function of the Interface emoji  ☎  \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0004";
      try {
        const emojiObj = JSON.parse('{"\u260e":0}')
        let result = JSON.has(emojiObj, '☎')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_2900
     * @tc.name       : testUtilJsonHasEmoji0005
     * @tc.desc       : Test the function of the Interface emoji  👹  \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0005";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc79":0}')
        let result = JSON.has(emojiObj, '👹')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3000
     * @tc.name       : testUtilJsonHasEmoji0006
     * @tc.desc       : Test the function of the Interface emoji  🕛  \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0006";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udd5b":0}')
        let result = JSON.has(emojiObj, '🕛')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3100
     * @tc.name       : testUtilJsonHasEmoji0007
     * @tc.desc       : Test the function of the Interface emoji  🍏  \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0007";
      try {
        const emojiObj = JSON.parse('{"\ud83c\udf4f":0}')
        let result = JSON.has(emojiObj, '🍏')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3200
     * @tc.name       : testUtilJsonHasEmoji0008
     * @tc.desc       : Test the function of the Interface emoji  🔃  \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0008";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udd03":0}')
        let result = JSON.has(emojiObj, '🔃')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3300
     * @tc.name       : testUtilJsonHasEmoji0009
     * @tc.desc       : Test the function of the Interface emoji  🍁  \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0009";
      try {
        const emojiObj = JSON.parse('{"\ud83c\udf41":0}')
        let result = JSON.has(emojiObj, '🍁')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3400
     * @tc.name       : testUtilJsonHasEmoji0010
     * @tc.desc       : Test the function of the Interface emoji  ♦   \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0010";
      try {
        const emojiObj = JSON.parse('{"\u2666":0}')
        let result = JSON.has(emojiObj, '♦')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3500
     * @tc.name       : testUtilJsonHasEmoji0011
     * @tc.desc       : Test the function of the Interface emoji  👈  \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0011";
      try {
        const emojiObj = JSON.parse('{"\ud83d\udc48":0}')
        let result = JSON.has(emojiObj, '👈')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_3600
     * @tc.name       : testUtilJsonHasEmoji0012
     * @tc.desc       : Test the function of the Interface emoji  🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasEmoji0012";
      try {
        const emojiObj = JSON.parse('{"\ud83e\udd3c\u200d\u2642\ufe0f":0}')
        let result = JSON.has(emojiObj, '🤼‍♂️')
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
  })
}