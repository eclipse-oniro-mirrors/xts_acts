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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { ArkTSUtils, JSON, lang } from '@kit.ArkTS';

export default function demoEscapeUtilJsonTest() {
  describe('demoEscapeUtilJsonTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0100
     * @tc.name       : testParseEscape0001
     * @tc.desc       : Test the Utils interface parse with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0001", 0, () => {
      const TAG = "testParseEscape0001";
      try {
        const escape = 'aaa\b';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0200
     * @tc.name       : testParseEscape0002
     * @tc.desc       : Test the Utils interface parse with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0002", 0, () => {
      const TAG = "testParseEscape0002";
      try {
        const escape = 'aaa\f';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0300
     * @tc.name       : testParseEscape0003
     * @tc.desc       : Test the Utils interface parse with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0003", 0, () => {
      const TAG = "testParseEscape0003";
      try {
        const escape = 'aaa\n';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0400
     * @tc.name       : testParseEscape0004
     * @tc.desc       : Test the Utils interface parse with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0004", 0, () => {
      const TAG = "testParseEscape0004";
      try {
        const escape = 'aaa\r';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0500
     * @tc.name       : testParseEscape0005
     * @tc.desc       : Test the Utils interface parse with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0005", 0, () => {
      const TAG = "testParseEscape0005";
      try {
        const escape = 'aaa\t';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0600
     * @tc.name       : testParseEscape0006
     * @tc.desc       : Test the Utils interface parse with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0006", 0, () => {
      const TAG = "testParseEscape0006";
      try {
        const escape = 'aaa\v';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0700
     * @tc.name       : testParseEscape0007
     * @tc.desc       : Test the Utils interface parse with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0007", 0, () => {
      const TAG = "testParseEscape0007";
      try {
        const escape = 'aaa\x24';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual("aaa$");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0800
     * @tc.name       : testParseEscape0008
     * @tc.desc       : Test the Utils interface parse with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0008", 0, () => {
      const TAG = "testParseEscape0008";
      try {
        const escape = '\开';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual("开");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_0900
     * @tc.name       : testParseEscape0009
     * @tc.desc       : Test the Utils interface parse with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0009", 0, () => {
      const TAG = "testParseEscape0009";
      try {
        const escape = '\😊';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect((obj as object)?.["name"]).assertEqual("😊");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_1000
     * @tc.name       : testParseEscape0010
     * @tc.desc       : Test the Utils interface parse with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0010", 0, () => {
      const TAG = "testParseEscape0010";
      try {
        const escape = '\0';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_ESCAPE_1100
     * @tc.name       : testParseEscape0011
     * @tc.desc       : Test the Utils interface parse with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testParseEscape0011", 0, () => {
      const TAG = "testParseEscape0011";
      try {
        const escape = '\b';
        type ISendable = lang.ISendable;
        let jsonText = `{"name": "${escape}"}`;
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        console.info((obj as object)?.["name"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Unexpected end Text in JSON");
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1200
     * @tc.name       : testUtilJsonHasEscape0001
     * @tc.desc       : Test the function of the Interface escape  \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0001", 0, () => {
      const TAG = "testUtilJsonHasEscape0001";
      try {
        const escape = encodeURI('\b')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Emoji_1300
     * @tc.name       : testUtilJsonHasEmoji0002
     * @tc.desc       : Test the function of the Interface escape  \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0002", 0, () => {
      const TAG = "testUtilJsonHasEscape0002";
      try {
        const escape = encodeURI('\f')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1400
     * @tc.name       : testUtilJsonHasEscape0003
     * @tc.desc       : Test the function of the Interface escape  \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEmoji0003", 0, () => {
      const TAG = "testUtilJsonHasEmoji0003";
      try {
        const escape = encodeURI('\n')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1500
     * @tc.name       : testUtilJsonHasEscape0004
     * @tc.desc       : Test the function of the Interface escape  \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0004", 0, () => {
      const TAG = "testUtilJsonHasEscape0004";
      try {
        const escape = encodeURI('\r')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1600
     * @tc.name       : testUtilJsonHasEscape0005
     * @tc.desc       : Test the function of the Interface escape  \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0005", 0, () => {
      const TAG = "testUtilJsonHasEscape0005";
      try {
        const escape = encodeURI('\t')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1700
     * @tc.name       : testUtilJsonHasEscape0006
     * @tc.desc       : Test the function of the Interface escape  \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0006", 0, () => {
      const TAG = "testUtilJsonHasEscape0006";
      try {
        const escape = encodeURI('\v')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1800
     * @tc.name       : testUtilJsonHasEscape0007
     * @tc.desc       : Test the function of the Interface escape  \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0007", 0, () => {
      const TAG = "testUtilJsonHasEscape0007";
      try {
        const escape = encodeURI('\x24')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_1900
     * @tc.name       : testUtilJsonHasEscape0008
     * @tc.desc       : Test the function of the Interface escape  \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0008", 0, () => {
      const TAG = "testUtilJsonHasEscape0008";
      try {
        const escape = encodeURI('\开')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_2000
     * @tc.name       : testUtilJsonHasEscape0009
     * @tc.desc       : Test the function of the Interface escape  \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0009", 0, () => {
      const TAG = "testUtilJsonHasEscape0009";
      try {
        const escape = encodeURI('\😊')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_2100
     * @tc.name       : testUtilJsonHasEscape0010
     * @tc.desc       : Test the function of the Interface escape  \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0010", 0, () => {
      const TAG = "testUtilJsonHasEmoji0010";
      try {
        const escape = encodeURI('\0')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonHas_Escape_2200
     * @tc.name       : testUtilJsonHasEscape0011
     * @tc.desc       : Test the function of the Interface escape  \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonHasEscape0011", 0, () => {
      const TAG = "testUtilJsonHasEscape0011";
      try {
        const escape = encodeURI('\\b')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_2300
     * @tc.name       : testUtilJsonRemoveEscape0001
     * @tc.desc       : Test the function of the Interface escape  \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0001", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0001";
      try {
        const escape = encodeURI('\b')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Emoji_2400
     * @tc.name       : testUtilJsonRemoveEmoji0002
     * @tc.desc       : Test the function of the Interface escape  \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0002", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0002";
      try {
        const escape = encodeURI('\f')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_2500
     * @tc.name       : testUtilJsonRemoveEscape0003
     * @tc.desc       : Test the function of the Interface escape  \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEmoji0003", 0, () => {
      const TAG = "testUtilJsonRemoveEmoji0003";
      try {
        const escape = encodeURI('\n')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_2600
     * @tc.name       : testUtilJsonRemoveEscape0004
     * @tc.desc       : Test the function of the Interface escape  \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0004", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0004";
      try {
        const escape = encodeURI('\r')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_2700
     * @tc.name       : testUtilJsonRemoveEscape0005
     * @tc.desc       : Test the function of the Interface escape  \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0005", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0005";
      try {
        const escape = encodeURI('\t')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_2800
     * @tc.name       : testUtilJsonRemoveEscape0006
     * @tc.desc       : Test the function of the Interface escape  \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0006", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0006";
      try {
        const escape = encodeURI('\v')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_2900
     * @tc.name       : testUtilJsonRemoveEscape0007
     * @tc.desc       : Test the function of the Interface escape  \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0007", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0007";
      try {
        const escape = encodeURI('\x24')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_3000
     * @tc.name       : testUtilJsonRemoveEscape0008
     * @tc.desc       : Test the function of the Interface escape  \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0008", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0008";
      try {
        const escape = encodeURI('\开')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_3100
     * @tc.name       : testUtilJsonRemoveEscape0009
     * @tc.desc       : Test the function of the Interface escape  \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0009", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0009";
      try {
        const escape = encodeURI('\😊')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_3200
     * @tc.name       : testUtilJsonRemoveEscape0010
     * @tc.desc       : Test the function of the Interface escape  \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0010", 0, () => {
      const TAG = "testUtilJsonRemoveEmoji0010";
      try {
        const escape = encodeURI('\0')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UtilJsonRemove_Escape_3300
     * @tc.name       : testUtilJsonRemoveEscape0011
     * @tc.desc       : Test the function of the Interface escape  \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testUtilJsonRemoveEscape0011", 0, () => {
      const TAG = "testUtilJsonRemoveEscape0011";
      try {
        const escape = encodeURI('aaa\b')
        const escapeObj = JSON.parse(`{"${escape}":0}`)
        JSON.remove(escapeObj,escape)
        let result = JSON.has(escapeObj, escape)
        expect(result).assertFalse();
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
  })
}