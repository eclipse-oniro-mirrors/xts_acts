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
export default function builtinsJsonElementGetBooleanTest() {
  describe("builtinsJsonElementGetBooleanTest", () => {
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
     * @tc.name    builtinsJsonElementGetBooleanTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0001
     * @tc.desc    Test getBoolean with "undefined" string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createBoolean(true)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean("undefined")).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0002
     * @tc.desc    Test getBoolean with "null" string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["null", jsonx.JsonElement.createBoolean(false)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean("null")).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0003
     * @tc.desc    Test getBoolean with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["", jsonx.JsonElement.createBoolean(true)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean("")).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0004
     * @tc.desc    Test getBoolean with special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsArray = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":",
          ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < specialCharsArray.length; i++) {
          entries.push([specialCharsArray[i], jsonx.JsonElement.createBoolean(i % 2 === 0)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < specialCharsArray.length; i++) {
          if (i % 2 === 0) {
            expect(obj.getBoolean(specialCharsArray[i])).assertTrue();
          } else {
            expect(obj.getBoolean(specialCharsArray[i])).assertFalse();
          }
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0005
     * @tc.desc    Test getBoolean with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
          entries.push([asciiCharsArray[i], jsonx.JsonElement.createBoolean(i < 5)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < asciiCharsArray.length; i++) {
          if (i < 5) {
            expect(obj.getBoolean(asciiCharsArray[i])).assertTrue();
          } else {
            expect(obj.getBoolean(asciiCharsArray[i])).assertFalse();
          }
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0006
     * @tc.desc    Test getBoolean with repeated special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const repeatedSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < repeatedSpecial.length; i += 2) {
          const key = repeatedSpecial.substring(i, i + 2);
          entries.push([key, jsonx.JsonElement.createBoolean((i / 2) % 2 === 0)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < repeatedSpecial.length; i += 2) {
          const key = repeatedSpecial.substring(i, i + 2);
          if ((i / 2) % 2 === 0) {
            expect(obj.getBoolean(key)).assertTrue();
          } else {
            expect(obj.getBoolean(key)).assertFalse();
          }
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0007
     * @tc.desc    Test getBoolean with escape sequence keys (all in one test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = [
          "\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\",
          "\\'", "\\\"", "\\?", "\\0", "\\123", "\\x41"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < escapeKeys.length; i++) {
          entries.push([escapeKeys[i], jsonx.JsonElement.createBoolean(i < escapeKeys.length / 2)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < escapeKeys.length; i++) {
          if (i < escapeKeys.length / 2) {
            expect(obj.getBoolean(escapeKeys[i])).assertTrue();
          } else {
            expect(obj.getBoolean(escapeKeys[i])).assertFalse();
          }
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0008
     * @tc.desc    Test getBoolean with emoji and Unicode keys (all in one test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emojiAndUnicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < emojiAndUnicodeKeys.length; i++) {
          const isEmoji = i < 12;
          entries.push([emojiAndUnicodeKeys[i], jsonx.JsonElement.createBoolean(isEmoji)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < emojiAndUnicodeKeys.length; i++) {
          const isEmoji = i < 12;
          if (isEmoji) {
            expect(obj.getBoolean(emojiAndUnicodeKeys[i])).assertTrue();
          } else {
            expect(obj.getBoolean(emojiAndUnicodeKeys[i])).assertFalse();
          }
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0009
     * @tc.desc    Test getBoolean with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createBoolean(false)],
          ["NaN", jsonx.JsonElement.createBoolean(true)],
          ["", jsonx.JsonElement.createBoolean(false)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean("0")).assertFalse();
        expect(obj.getBoolean("NaN")).assertTrue();
        expect(obj.getBoolean("")).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0010
     * @tc.desc    Test getBoolean with invalid Unicode keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createBoolean(true)],
          ["\\ud83d", jsonx.JsonElement.createBoolean(false)],
          ["\\udff4", jsonx.JsonElement.createBoolean(true)]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean("\\udc04")).assertTrue();
        expect(obj.getBoolean("\\ud83d")).assertFalse();
        expect(obj.getBoolean("\\udff4")).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0011
     * @tc.desc    Test getBoolean with treeString type key and compare with normal string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeStringKey = init(100);
        const normalStringKey = "x".repeat(treeStringKey.length);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(treeStringKey, jsonx.JsonElement.createBoolean(true));
        map.set(normalStringKey, jsonx.JsonElement.createBoolean(false));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        const startTime1 = Date.now();
        const treeStringResult = obj.getBoolean(treeStringKey);
        const endTime1 = Date.now();
        const startTime2 = Date.now();
        const normalStringResult = obj.getBoolean(normalStringKey);
        const endTime2 = Date.now();
        expect(treeStringResult).assertTrue();
        expect(normalStringResult).assertFalse();
        console.log(`getBoolean - treeString: ${endTime1 - startTime1}ms, normalString: ${endTime2 - startTime2}ms`);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0012
     * @tc.desc    Test getBoolean with sliceString type key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const sliceStringKey = str.substring(0, str.length - 2);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(sliceStringKey, jsonx.JsonElement.createBoolean(true));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < 10; i++) {
          expect(obj.getBoolean(sliceStringKey)).assertTrue();
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0013
     * @tc.desc    Test getBoolean with large repeated string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeStringKey = "a".repeat(1000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(largeStringKey, jsonx.JsonElement.createBoolean(false));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean(largeStringKey)).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetBooleanTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_BOOLEAN_TEST_0014
     * @tc.desc    Test getBoolean GC behavior and error handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetBooleanTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const tempLargeKey = "gc_test_key".repeat(100000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(tempLargeKey, jsonx.JsonElement.createBoolean(true));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.getBoolean(tempLargeKey)).assertTrue();
        let hasRangeError = false;
        try {
          obj.getBoolean("nonExistingKey");
        } catch (e) {
          hasRangeError = true;
        }
        expect(hasRangeError).assertTrue();
        const map2: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["stringKey", jsonx.JsonElement.createString("not_a_boolean")]
        ]);
        const obj2: jsonx.JsonElement = jsonx.JsonElement.createObject(map2);
        let hasTypeError = false;
        try {
          obj2.getBoolean("stringKey");
        } catch (e) {
          hasTypeError = true;
        }
        expect(hasTypeError).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });
  })
}