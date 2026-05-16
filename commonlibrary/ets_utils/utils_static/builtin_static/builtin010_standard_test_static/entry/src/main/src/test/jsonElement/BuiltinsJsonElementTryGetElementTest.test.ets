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
export default function builtinsJsonElementTryGetElementTest() {
  describe("builtinsJsonElementTryGetElementTest", () => {
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
     * @tc.name    builtinsJsonElementTryGetElementTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0001
     * @tc.desc    Test tryGetElement with undefined and null keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createString("undefinedValue")],
          ["null", jsonx.JsonElement.createString("nullValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.tryGetElement("undefined");
        expect(result1 != undefined).assertTrue();
        expect(result1!.asString()).assertEqual("undefinedValue");
        const result2 = testObject.tryGetElement("null");
        expect(result2 != undefined).assertTrue();
        expect(result2!.asString()).assertEqual("nullValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0002
     * @tc.desc    Test tryGetElement with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createString('ws');
        const result = testObject.tryGetElement("");
        expect(result == undefined).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0003
     * @tc.desc    Test tryGetElement with special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < specialChars.length; i++) {
          const chars = specialChars.substring(i, i + 1);
          testMap.set(chars, jsonx.JsonElement.createInteger(i));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialChars.length; i++) {
          const chars = specialChars.substring(i, i + 1);
          const result = testObject.tryGetElement(chars);
          expect(result != undefined).assertTrue();
          expect(result!.asInteger()).assertEqual(i);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0004
     * @tc.desc    Test tryGetElement with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["!\"#$%&'()*+,-./", jsonx.JsonElement.createString("specialGroup1")],
          ["0123456789", jsonx.JsonElement.createString("digits")],
          [":;<=>?@", jsonx.JsonElement.createString("specialGroup2")],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createString("uppercase")],
          ["[\\]^_`", jsonx.JsonElement.createString("specialGroup3")],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createString("lowercase")],
          ["{|}~", jsonx.JsonElement.createString("specialGroup4")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const testKeys = [
          "!\"#$%&'()*+,-./", "0123456789", ":;<=>?@", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "[\\]^_`", "abcdefghijklmnopqrstuvwxyz", "{|}~"
        ];
        const expectedValues = ["specialGroup1", "digits", "specialGroup2", "uppercase", "specialGroup3", "lowercase", "specialGroup4"];
        for (let i = 0; i < testKeys.length; i++) {
          const result = testObject.tryGetElement(testKeys[i]);
          expect(result != undefined).assertTrue();
          expect(result!.asString()).assertEqual(expectedValues[i]);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0005
     * @tc.desc    Test tryGetElement with double special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createString("doubleSpecialValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result = testObject.tryGetElement(doubleSpecial);
        expect(result != undefined).assertTrue();
        expect(result!.asString()).assertEqual("doubleSpecialValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0006
     * @tc.desc    Test tryGetElement with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = [
          "\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v",
          "\\\\", "\\'", "\\\"", "\\?", "\\0", "\\101", "\\x41"
        ];
        const testMap = new Map<string, jsonx.JsonElement>([
          ["\\a", jsonx.JsonElement.createString("bell")],
          ["\\b", jsonx.JsonElement.createString("backspace")],
          ["\\f", jsonx.JsonElement.createString("formFeed")],
          ["\\n", jsonx.JsonElement.createString("newline")],
          ["\\r", jsonx.JsonElement.createString("carriageReturn")],
          ["\\t", jsonx.JsonElement.createString("horizontalTab")],
          ["\\v", jsonx.JsonElement.createString("verticalTab")],
          ["\\\\", jsonx.JsonElement.createString("backslash")],
          ["\\'", jsonx.JsonElement.createString("singleQuote")],
          ["\\\"", jsonx.JsonElement.createString("doubleQuote")],
          ["\\?", jsonx.JsonElement.createString("questionMark")],
          ["\\0", jsonx.JsonElement.createString("nullChar")],
          ["\\101", jsonx.JsonElement.createString("octal101")],
          ["\\x41", jsonx.JsonElement.createString("hex41")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (const key of escapeKeys) {
          const result = testObject.tryGetElement(key);
          expect(result != undefined).assertTrue();
          expect(result!.jsonType).assertEqual(jsonx.JsonType.JsonString);
        }
        expect(testObject.tryGetElement("\\n")!.asString()).assertEqual("newline");
        expect(testObject.tryGetElement("\\t")!.asString()).assertEqual("horizontalTab");
        expect(testObject.tryGetElement("\\\\")!.asString()).assertEqual("backslash");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0007
     * @tc.desc    Test tryGetElement with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40",
          "\\ud83d\\udcaf", "\\ud83c\\udf85", "\\ud83d\\ude3c",
          "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const testMap = new Map<string, jsonx.JsonElement>();
        unicodeKeys.forEach((unicode, index) => {
          testMap.set(unicode, jsonx.JsonElement.createString(`unicode_${index}`));
        });
        const testObject = jsonx.JsonElement.createObject(testMap);
        unicodeKeys.forEach((unicode, index) => {
          const result = testObject.tryGetElement(unicode);
          expect(result != undefined).assertTrue();
          expect(result!.asString()).assertEqual(`unicode_${index}`);
        });
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0008
     * @tc.desc    Test tryGetElement with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const illegalUnicodeKeys = ["\\udc04", "\\ud83d", "\\udff4"];
        const testMap = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createString("illegal1")],
          ["\\ud83d", jsonx.JsonElement.createInteger(42)],
          ["\\udff4", jsonx.JsonElement.createBoolean(true)]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        illegalUnicodeKeys.forEach(key => {
          const result = testObject.tryGetElement(key);
          expect(result != undefined).assertTrue();
        });
        expect(testObject.tryGetElement("\\udc04")!.asString()).assertEqual("illegal1");
        expect(testObject.tryGetElement("\\ud83d")!.asInteger()).assertEqual(42);
        expect(testObject.tryGetElement("\\udff4")!.asBoolean()).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0009
     * @tc.desc    Test tryGetElement with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createString("zero")],
          ["NaN", jsonx.JsonElement.createString("nan")],
          ["", jsonx.JsonElement.createString("empty")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetElement("0")!.asString()).assertEqual("zero");
        expect(testObject.tryGetElement("NaN")!.asString()).assertEqual("nan");
        expect(testObject.tryGetElement("")!.asString()).assertEqual("empty");
        const nonExistentKeys = ["Infinity", "true", "false", "undefined", "null"];
        nonExistentKeys.forEach(key => {
          const result = testObject.tryGetElement(key);
          expect(result == undefined).assertTrue();
        });
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0010
     * @tc.desc    Test tryGetElement with treeString for performance comparison
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeString = init(500);
        const normalString = "test_string_".repeat(40);
        const entries: Array<[string, jsonx.JsonElement]> = [
          ["treeString", jsonx.JsonElement.createString(treeString)],
          ["normalString", jsonx.JsonElement.createString(normalString)]
        ];
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>(entries));
        expect(testObject.tryGetElement("treeString")!.asString()).assertEqual(treeString);
        expect(testObject.tryGetElement("normalString")!.asString()).assertEqual(normalString);
        for (let i = 0; i < 10; i++) {
          expect(testObject.tryGetElement("treeString")!.asString()).assertEqual(treeString);
          expect(testObject.tryGetElement("normalString")!.asString()).assertEqual(normalString);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0011
     * @tc.desc    Test tryGetElement with sliced string for value stability
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const expectedResult = "{k1:value1,k2:value";
        const result = str.substring(0, str.length - 2);
        const testObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["slicedString", jsonx.JsonElement.createString(result)]
          ])
        );
        for (let i = 0; i < 30; i++) {
          const value = testObject.tryGetElement("slicedString")!.asString();
          expect(value).assertEqual(expectedResult);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0012
     * @tc.desc    Test tryGetElement with large string memory usage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(1000);
        const testObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["largeString", jsonx.JsonElement.createString(largeString)],
            ["smallString", jsonx.JsonElement.createString("small")]
          ])
        );
        const retrievedLarge = testObject.tryGetElement("largeString")!.asString();
        expect(retrievedLarge).assertEqual(largeString);
        expect(retrievedLarge.length).assertEqual(1000);
        for (let i = 0; i < 5; i++) {
          const value = testObject.tryGetElement("largeString")!.asString();
          expect(value).assertEqual(largeString);
        }
        expect(testObject.tryGetElement("smallString")!.asString()).assertEqual("small");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetElementTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ELEMENT_TEST_0013
     * @tc.desc    Test tryGetElement GC behavior and non-existent keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetElementTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "test_".repeat(10000);
        let largeObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["data", jsonx.JsonElement.createString(largeString)]
          ])
        );
        expect(largeObject.tryGetElement("data")!.asString()).assertEqual(largeString);
        expect(largeObject.tryGetElement("nonExistentKey")).assertUndefined();
        largeObject = new jsonx.JsonElement();
        const newObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["key", jsonx.JsonElement.createString("value")]
          ])
        );
        expect(newObject.tryGetElement("key")!.asString()).assertEqual("value");
        const stringElement = jsonx.JsonElement.createString("test");
        expect(stringElement.tryGetElement("anyKey")).assertUndefined();
      } catch (error) {
        throw error;
      }
    });
  })
}