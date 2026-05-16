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
export default function builtinsJsonElementTryGetStringTest() {
  describe("builtinsJsonElementTryGetStringTest", () => {
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
     * @tc.name    builtinsJsonElementTryGetStringTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0001
     * @tc.desc    Test tryGetString with empty undefined and null string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createString("value_undefined")],
          ["null", jsonx.JsonElement.createString("value_null")],
          ["", jsonx.JsonElement.createString("value_empty")],
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.tryGetString("")).assertEqual("value_empty");
        expect(obj.tryGetString("undefined")).assertEqual("value_undefined");
        expect(obj.tryGetString("null")).assertEqual("value_null");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0002
     * @tc.desc    Test tryGetString with special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const specialCharsArray = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":",
          ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < specialCharsArray.length; i++) {
          entries.push([specialCharsArray[i], jsonx.JsonElement.createString(`special_${i}`)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < specialCharsArray.length; i++) {
          expect(obj.tryGetString(specialCharsArray[i], "fallback")).assertEqual(`special_${i}`);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0003
     * @tc.desc    Test tryGetString with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
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
          entries.push([asciiCharsArray[i], jsonx.JsonElement.createString(`ascii_value_${i}`)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < asciiCharsArray.length; i++) {
          expect(obj.tryGetString(asciiCharsArray[i], "default")).assertEqual(`ascii_value_${i}`);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0004
     * @tc.desc    Test tryGetString with repeated special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const repeatedSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < repeatedSpecial.length; i += 2) {
          const key = repeatedSpecial.substring(i, i + 2);
          entries.push([key, jsonx.JsonElement.createString(`repeat_value_${i/2}`)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < repeatedSpecial.length; i += 2) {
          const key = repeatedSpecial.substring(i, i + 2);
          expect(obj.tryGetString(key, "fallback")).assertEqual(`repeat_value_${i/2}`);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0005
     * @tc.desc    Test tryGetString with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const escapeKeys = [
          "\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\",
          "\\'", "\\\"", "\\?", "\\0", "\\123", "\\x41"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < escapeKeys.length; i++) {
          entries.push([escapeKeys[i], jsonx.JsonElement.createString(`escape_value_${i}`)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < escapeKeys.length; i++) {
          expect(obj.tryGetString(escapeKeys[i], "default_fallback")).assertEqual(`escape_value_${i}`);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0006
     * @tc.desc    Test tryGetString with emoji and Unicode keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const emojiAndUnicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < emojiAndUnicodeKeys.length; i++) {
          entries.push([emojiAndUnicodeKeys[i], jsonx.JsonElement.createString(`emoji_value_${i}`)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < emojiAndUnicodeKeys.length; i++) {
          expect(obj.tryGetString(emojiAndUnicodeKeys[i], "emoji_fallback")).assertEqual(`emoji_value_${i}`);
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0007
     * @tc.desc    Test tryGetString with keyword keys and fallback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createString("zero_value")],
          ["NaN", jsonx.JsonElement.createString("nan_value")],
          ["", jsonx.JsonElement.createString("empty_value")],
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.tryGetString("0", "fallback1")).assertEqual("zero_value");
        expect(obj.tryGetString("NaN", "fallback2")).assertEqual("nan_value");
        expect(obj.tryGetString("", "empty_fallback")).assertEqual("empty_value");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0008
     * @tc.desc    Test tryGetString with invalid Unicode keys and fallback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createString("invalid_unicode1")],
          ["\\ud83d", jsonx.JsonElement.createString("invalid_unicode2")],
          ["\\udff4", jsonx.JsonElement.createString("invalid_unicode3")],
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.tryGetString("\\udc04", "fallback1")).assertEqual("invalid_unicode1");
        expect(obj.tryGetString("\\ud83d", "fallback2")).assertEqual("invalid_unicode2");
        expect(obj.tryGetString("\\udff4", "not_found_fallback")).assertEqual("invalid_unicode3");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0009
     * @tc.desc    Test tryGetString with treeString type key and compare with normal string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const treeStringKey = init(100);
        const normalStringKey = "x".repeat(treeStringKey.length);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(treeStringKey, jsonx.JsonElement.createString("tree_string_value"));
        map.set(normalStringKey, jsonx.JsonElement.createString("normal_string_value"));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        const startTime1 = Date.now();
        const treeStringResult = obj.tryGetString(treeStringKey, "tree_fallback");
        const endTime1 = Date.now();
        const startTime2 = Date.now();
        const normalStringResult = obj.tryGetString(normalStringKey, "normal_fallback");
        const endTime2 = Date.now();
        expect(treeStringResult).assertEqual("tree_string_value");
        expect(normalStringResult).assertEqual("normal_string_value");
        console.log(`tryGetString - treeString: ${endTime1 - startTime1}ms, normalString: ${endTime2 - startTime2}ms`);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0010
     * @tc.desc    Test tryGetString with sliceString type key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const str = "{k1:value1,k2:value2}";
        const sliceStringKey = str.substring(0, str.length - 2);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(sliceStringKey, jsonx.JsonElement.createString("slice_string_value"));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < 5; i++) {
          expect(obj.tryGetString(sliceStringKey, "slice_fallback")).assertEqual("slice_string_value");
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0011
     * @tc.desc    Test tryGetString with large repeated string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const largeStringKey = "a".repeat(1000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(largeStringKey, jsonx.JsonElement.createString("large_string_value"));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.tryGetString(largeStringKey, "large_fallback")).assertEqual("large_string_value");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0012
     * @tc.desc    Test tryGetString fallback mechanism
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["existingKey", jsonx.JsonElement.createString("test_value")]
        ]);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.tryGetString("existingKey", "fallback1")).assertEqual("test_value");
        expect(obj.tryGetString("nonExistingKey")).assertEqual("");
        expect(obj.tryGetString("anotherNonExistingKey", "custom_fallback")).assertEqual("custom_fallback");
        const map2: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["integerKey", jsonx.JsonElement.createInteger(123)]
        ]);
        const obj2: jsonx.JsonElement = jsonx.JsonElement.createObject(map2);
        expect(obj2.tryGetString("integerKey", "not_a_string")).assertEqual("not_a_string");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetStringTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_STRING_TEST_0013
     * @tc.desc    Test tryGetString garbage collection behavior and fallback mechanism
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetStringTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,() => {
      try {
        const tempLargeKey = "test_gc".repeat(100000);
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        map.set(tempLargeKey, jsonx.JsonElement.createString("gc_test_value"));
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        expect(obj.tryGetString(tempLargeKey, "gc_fallback")).assertEqual("gc_test_value");
        expect(obj.tryGetString("nonExistingKey")).assertEqual("");
        expect(obj.tryGetString("anotherNonExistingKey", "custom_fallback")).assertEqual("custom_fallback");
        const map2: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["integerKey", jsonx.JsonElement.createInteger(123)]
        ]);
        const obj2: jsonx.JsonElement = jsonx.JsonElement.createObject(map2);
        expect(obj2.tryGetString("integerKey", "not_a_string")).assertEqual("not_a_string");
        console.log("GC test completed - large string key handled correctly");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

  })
}