/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}
export default function builtinsJsonElementGetIntegerTest() {
  describe("builtinsJsonElementGetIntegerTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsJsonElementGetIntegerTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0001
     * @tc.desc    Test getInteger with "undefined" string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createInteger(123)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger("undefined")).assertEqual(123);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0002
     * @tc.desc    Test getInteger with "null" string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["null", jsonx.JsonElement.createInteger(456)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger("null")).assertEqual(456);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0003
     * @tc.desc    Test getInteger with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["", jsonx.JsonElement.createInteger(789)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger("")).assertEqual(789);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0004
     * @tc.desc    Test getInteger with special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsArray = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < specialCharsArray.length; i++) {
          entries.push([specialCharsArray[i], jsonx.JsonElement.createInteger(i + 1)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < specialCharsArray.length; i++) {
          expect(obj.getInteger(specialCharsArray[i])).assertEqual(i + 1);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0005
     * @tc.desc    Test getInteger with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const asciiCharsArray = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/",
          "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
          ":", ";", "<", "=", ">", "?", "@",
          "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
          "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
          "[", "\\", "]", "^", "_", "`",
          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
          "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
          "{", "|", "}", "~"];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < asciiCharsArray.length; i++) {
          entries.push([asciiCharsArray[i], jsonx.JsonElement.createInteger(i + 1)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < asciiCharsArray.length; i++) {
          expect(obj.getInteger(asciiCharsArray[i])).assertEqual(i + 1);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0006
     * @tc.desc    Test getInteger with repeated special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const repeatedSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < repeatedSpecial.length; i += 2) {
          const key = repeatedSpecial.substring(i, i + 2);
          entries.push([key, jsonx.JsonElement.createInteger(i / 2 + 1)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < repeatedSpecial.length; i += 2) {
          const key = repeatedSpecial.substring(i, i + 2);
          expect(obj.getInteger(key)).assertEqual(i / 2 + 1);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0007
     * @tc.desc    Test getInteger with escape sequence keys (all in one test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = [
          "\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v",
          "\\\\", "\\'", "\\\"", "\\?", "\\0", "\\123", "\\x41"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < escapeKeys.length; i++) {
          entries.push([escapeKeys[i], jsonx.JsonElement.createInteger(i + 100)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < escapeKeys.length; i++) {
          expect(obj.getInteger(escapeKeys[i])).assertEqual(i + 100);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0008
     * @tc.desc    Test getInteger with emoji and Unicode keys (all in one test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emojiAndUnicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < emojiAndUnicodeKeys.length; i++) {
          entries.push([emojiAndUnicodeKeys[i], jsonx.JsonElement.createInteger(i + 200)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < emojiAndUnicodeKeys.length; i++) {
          expect(obj.getInteger(emojiAndUnicodeKeys[i])).assertEqual(i + 200);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0009
     * @tc.desc    Test getInteger with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createInteger(777)],
          ["NaN", jsonx.JsonElement.createInteger(888)],
          ["", jsonx.JsonElement.createInteger(999)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);

        expect(obj.getInteger("0")).assertEqual(777);
        expect(obj.getInteger("NaN")).assertEqual(888);
        expect(obj.getInteger("")).assertEqual(999);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0010
     * @tc.desc    Test getInteger with invalid Unicode keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const invalidUnicodeKeys = ["\\udc04", "\\ud83d", "\\udff4"];
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createInteger(300)],
          ["\\ud83d", jsonx.JsonElement.createInteger(301)],
          ["\\udff4", jsonx.JsonElement.createInteger(302)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger("\\udc04")).assertEqual(300);
        expect(obj.getInteger("\\ud83d")).assertEqual(301);
        expect(obj.getInteger("\\udff4")).assertEqual(302);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0011
     * @tc.desc    Test getInteger with treeString type key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeStringKey = init(1000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(treeStringKey, jsonx.JsonElement.createInteger(999));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger(treeStringKey)).assertEqual(999);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0012
     * @tc.desc    Test getInteger with sliceString type key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const sliceStringKey = str.substring(0, str.length - 2);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(sliceStringKey, jsonx.JsonElement.createInteger(888));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < 10; i++) {
          expect(obj.getInteger(sliceStringKey)).assertEqual(888);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0013
     * @tc.desc    Test getInteger with large repeated string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeStringKey = "a".repeat(100000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(largeStringKey, jsonx.JsonElement.createInteger(777));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger(largeStringKey)).assertEqual(777);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetIntegerTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_INTEGER_TEST_0014
     * @tc.desc    Test getInteger with GC behavior check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetIntegerTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const tempLargeKey = "test".repeat(10000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(tempLargeKey, jsonx.JsonElement.createInteger(666));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getInteger(tempLargeKey)).assertEqual(666);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });
  })
}