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
export default function builtinsJsonElementCreateObjectTest() {
  describe("builtinsJsonElementCreateObjectTest", () => {
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
     * @tc.name    builtinsJsonElementCreateObjectTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0001
     * @tc.desc    Test createObject with undefined and null keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createInteger(100)],
          ["null", jsonx.JsonElement.createNull()],
          ["", jsonx.JsonElement.createDouble(3.14)]
        ]);
        const result = jsonx.JsonElement.createObject(testMap);
        expect(result.$_get("undefined").asInteger()).assertEqual(100);
        expect(result.$_get("null").jsonType).assertEqual(jsonx.JsonType.JsonNull);
        expect(result.$_get("").asDouble()).assertEqual(3.14);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0002
     * @tc.desc    Test createObject with special character keys using loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          if (i % 6 === 0) {
            testMap.set(chars, jsonx.JsonElement.createString(`special_chars_${i}`));
          } else if (i % 6 === 1) {
            testMap.set(chars, jsonx.JsonElement.createInteger(i));
          } else if (i % 6 === 2) {
            testMap.set(chars, jsonx.JsonElement.createDouble(i * 0.1));
          } else if (i % 6 === 3) {
            testMap.set(chars, jsonx.JsonElement.createBoolean(i % 2 === 0));
          } else if (i % 6 === 4) {
            testMap.set(chars, jsonx.JsonElement.createNull());
          } else {
            testMap.set(chars, jsonx.JsonElement.createUndefined());
          }
        }
        const result = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          const value = result.$_get(chars);
          if (i % 6 === 0) {
            expect(value.asString()).assertEqual(`special_chars_${i}`);
          } else if (i % 6 === 1) {
            expect(value.asInteger()).assertEqual(i);
          } else if (i % 6 === 2) {
            expect(value.asDouble()).assertEqual(i * 0.1);
          } else if (i % 6 === 3) {
            expect(value.asBoolean()).assertEqual(i % 2 === 0);
          } else if (i % 6 === 4) {
            expect(value.jsonType).assertEqual(jsonx.JsonType.JsonNull);
          } else {
            expect(value.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
          }
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0003
     * @tc.desc    Test createObject with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["0123456789", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createInteger(1),
            jsonx.JsonElement.createInteger(2),
            jsonx.JsonElement.createInteger(3)
          ])],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createBoolean(true)],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createUndefined()]
        ]);
        const result = jsonx.JsonElement.createObject(testMap);
        const digitsArray = result.$_get("0123456789").asArray();
        expect(digitsArray.length).assertEqual(3);
        expect(digitsArray[0].asInteger()).assertEqual(1);
        expect(digitsArray[1].asInteger()).assertEqual(2);
        expect(digitsArray[2].asInteger()).assertEqual(3);
        expect(result.$_get("ABCDEFGHIJKLMNOPQRSTUVWXYZ").asBoolean()).assertTrue();
        expect(result.$_get("abcdefghijklmnopqrstuvwxyz").jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0004
     * @tc.desc    Test createObject with double special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>([
            ["nestedKey", jsonx.JsonElement.createString("nestedValue")],
            ["nestedNumber", jsonx.JsonElement.createDouble(99.9)]
          ]))]
        ]);
        const result = jsonx.JsonElement.createObject(testMap);
        const nestedObj = result.$_get(doubleSpecial);
        expect(nestedObj.$_get("nestedKey").asString()).assertEqual("nestedValue");
        expect(nestedObj.$_get("nestedNumber").asDouble()).assertEqual(99.9);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0005
     * @tc.desc    Test createObject with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeSequences = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\",
          "\\'", "\\\"", "\\?", "\\0", "\\101", "\\x41"];
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < escapeSequences.length; i++) {
          const key = escapeSequences[i];
          const value = jsonx.JsonElement.createString(`value_${i}`);
          testMap.set(key, value);
        }
        const result = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < escapeSequences.length; i++) {
          const key = escapeSequences[i];
          const value = result.$_get(key);
          expect(value.asString()).assertEqual(`value_${i}`);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0006
     * @tc.desc    Test createObject with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          const key = unicodeKeys[i];
          const value = jsonx.JsonElement.createString(`unicode_value_${i}`);
          testMap.set(key, value);
        }
        const result = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < unicodeKeys.length; i++) {
          const key = unicodeKeys[i];
          const value = result.$_get(key);
          expect(value.asString()).assertEqual(`unicode_value_${i}`);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0007
     * @tc.desc    Test createObject with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createInteger(404)],
          ["\\ud83d", jsonx.JsonElement.createDouble(83.14)],
          ["\\udff4", jsonx.JsonElement.createBoolean(false)]
        ]);
        const result = jsonx.JsonElement.createObject(testMap);
        expect(result.$_get("\\udc04").asInteger()).assertEqual(404);
        expect(result.$_get("\\ud83d").asDouble()).assertEqual(83.14);
        expect(result.$_get("\\udff4").asBoolean()).assertFalse();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0008
     * @tc.desc    Test createObject with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createDouble(0.0)],
          ["NaN", jsonx.JsonElement.createNull()],
          ["", jsonx.JsonElement.createBoolean(true)]
        ]);
        const result = jsonx.JsonElement.createObject(testMap);
        expect(result.$_get("0").asDouble()).assertEqual(0.0);
        expect(result.$_get("NaN").jsonType).assertEqual(jsonx.JsonType.JsonNull);
        expect(result.$_get("").asBoolean()).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0009
     * @tc.desc    Test createObject with treeString type for performance comparison
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeString = init(1000);
        const normalString = "normal_test_string_".repeat(50);
        const testMap = new Map<string, jsonx.JsonElement>([
          ["treeString", jsonx.JsonElement.createString(treeString)],
          ["normalString", jsonx.JsonElement.createString(normalString)]
        ]);

        const result = jsonx.JsonElement.createObject(testMap);

        expect(result.$_get("treeString").asString()).assertEqual(treeString);
        expect(result.$_get("normalString").asString()).assertEqual(normalString);
        expect(result.$_get("treeString").asString().length > 100).assertTrue();
        expect(result.$_get("normalString").asString().length > 100).assertTrue();

      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0010
     * @tc.desc    Test createObject with sliced string stability
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const result = str.substring(0, str.length - 2);
        const testMap = new Map<string, jsonx.JsonElement>([
          ["slicedKey", jsonx.JsonElement.createString(result)]
        ]);
        const jsonObject = jsonx.JsonElement.createObject(testMap);
        const iterations = 10;
        let previousValue: string | undefined = undefined;
        for (let i = 0; i < iterations; i++) {
          const currentValue = jsonObject.$_get("slicedKey").asString();
          if (previousValue === undefined) {
            previousValue = currentValue;
          } else {
            expect(currentValue).assertEqual(previousValue);
          }
          expect(currentValue).assertEqual(result);
          expect(currentValue.length).assertEqual(str.length - 2);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0011
     * @tc.desc    Test memory usage with large string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(1000);
        const testMap = new Map<string, jsonx.JsonElement>([
          ["largeString", jsonx.JsonElement.createString(largeString)]
        ]);
        const jsonObject = jsonx.JsonElement.createObject(testMap);
        const retrievedString = jsonObject.$_get("largeString").asString();
        expect(retrievedString.length).assertEqual(1000);
        expect(retrievedString).assertEqual(largeString);
        for (let i = 0; i < 3; i++) {
          const current = jsonObject.$_get("largeString").asString();
          expect(current).assertEqual(largeString);
        }
        expect(jsonObject.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateObjectTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_OBJECT_TEST_0012
     * @tc.desc    Test GC behavior with large strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateObjectTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "test".repeat(10000);
        const testMap = new Map<string, jsonx.JsonElement>([
          ["largeString", jsonx.JsonElement.createString(largeString)]
        ]);
        let jsonObject = jsonx.JsonElement.createObject(testMap);
        const retrievedString = jsonObject.$_get("largeString").asString();
        expect(retrievedString.length).assertEqual(40000);
        expect(retrievedString).assertEqual(largeString);
        const objects: jsonx.JsonElement[] = [];
        for (let i = 0; i < 10; i++) {
          const tempString = `${i}`.repeat(5000);
          const tempMap = new Map<string, jsonx.JsonElement>([
            [`temp${i}`, jsonx.JsonElement.createString(tempString)]
          ]);
          const tempObject = jsonx.JsonElement.createObject(tempMap);
          objects.push(tempObject);
          expect(tempObject.$_get(`temp${i}`).asString()).assertEqual(tempString);
        }
        jsonObject = new jsonx.JsonElement();
        objects.length = 0;
        const newMap = new Map<string, jsonx.JsonElement>([
          ["newKey", jsonx.JsonElement.createString("newValue")]
        ]);
        const newObject = jsonx.JsonElement.createObject(newMap);
        expect(newObject.$_get("newKey").asString()).assertEqual("newValue");
        expect(newObject.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      } catch (error) {
        throw error;
      }
    });
  })
}
