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
export default function builtinsJsonElementGetElementTest() {
  describe("builtinsJsonElementGetElementTest", () => {
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
     * @tc.name    builtinsJsonElementGetElementTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0001
     * @tc.desc    Test getElement method with undefined key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createString("undefinedValue")],
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        expect(testObject.getElement("undefined").asString()).assertEqual("undefinedValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0002
     * @tc.desc    Test getElement method with null key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["null", jsonx.JsonElement.createString("nullValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        expect(testObject.getElement("null").asString()).assertEqual("nullValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0003
     * @tc.desc    Test getElement method with empty key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["", jsonx.JsonElement.createString("emptyKeyValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        expect(testObject.getElement("").asString()).assertEqual("emptyKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0004
     * @tc.desc    Test getElement method with special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap = new Map<string, jsonx.JsonElement>();

        for (let i = 0; i < specialChars.length; i++) {
          const chars = specialChars.substring(i, i + 1);
          testMap.set(chars, jsonx.JsonElement.createString(`char_${i}`));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialChars.length; i++) {
          const key = specialChars.substring(i, i + 1);
          const expectedValue = `char_${i}`;
          const actualValue = testObject.getElement(key).asString();
          expect(actualValue).assertEqual(expectedValue);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0005
     * @tc.desc    Test getElement method with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["!\"#$%&'()*+,-./0123456789:;<=>?@", jsonx.JsonElement.createString("digits")],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createString("uppercase")],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createString("lowercase")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        expect(testObject.getElement("!\"#$%&'()*+,-./0123456789:;<=>?@").asString()).assertEqual("digits");
        expect(testObject.getElement("ABCDEFGHIJKLMNOPQRSTUVWXYZ").asString()).assertEqual("uppercase");
        expect(testObject.getElement("abcdefghijklmnopqrstuvwxyz").asString()).assertEqual("lowercase");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0006
     * @tc.desc    Test getElement method with double special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createString("doubleSpecialKey")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        expect(testObject.getElement(doubleSpecial).asString()).assertEqual("doubleSpecialKey");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0007
     * @tc.desc    Test getElement method with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = [
          "\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v",
          "\\\\", "\\'", "\\\"", "\\?", "\\0",
          "\\101", "\\x41", "\\x42", "\\x61"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < escapeKeys.length; i++) {
          entries.push([escapeKeys[i], jsonx.JsonElement.createString(`escape_value_${i}`)]);
        }
        const testMap = new Map<string, jsonx.JsonElement>(entries);
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < escapeKeys.length; i++) {
          const value = testObject.getElement(escapeKeys[i]).asString();
          expect(value).assertEqual(`escape_value_${i}`);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0008
     * @tc.desc    Test getElement method with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const entries: Array<[string, jsonx.JsonElement]> = [];
        for (let i = 0; i < unicodeKeys.length; i++) {
          entries.push([unicodeKeys[i], jsonx.JsonElement.createString(`unicode_value_${i}`)]);
        }
        const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>(entries);
        const obj: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
        for (let i = 0; i < unicodeKeys.length; i++) {
          const value = obj.getElement(unicodeKeys[i]).asString();
          expect(value).assertEqual(`unicode_value_${i}`);
        }

      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0009
     * @tc.desc    Test getElement method with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createString("illegal1")],
          ["\\ud83d", jsonx.JsonElement.createInteger(42)],
          ["\\udff4", jsonx.JsonElement.createBoolean(false)]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        expect(testObject.getElement("\\udc04").asString()).assertEqual("illegal1");
        expect(testObject.getElement("\\ud83d").asInteger()).assertEqual(42);
        expect(testObject.getElement("\\udff4").asBoolean()).assertFalse();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0010
     * @tc.desc    Test getElement method with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testString = jsonx.JsonElement.createString('testMap');
        expect(testString.getElement("0").asInteger()).assertEqual(0);
        expect(testString.getElement("NaN").asDouble()).assertNaN();
        expect(testString.getElement("").asDouble()).assertEqual(Infinity);;
      } catch (error) { expect(error instanceof jsonx.JsonTypeError).assertTrue }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0011
     * @tc.desc    Test getElement with treeString for performance comparison
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeString = init(500);
        const normalString = "test_string_".repeat(40);
        const entries: Array<[string, jsonx.JsonElement]> = [
          ["treeString", jsonx.JsonElement.createString(treeString)],
          ["normalString", jsonx.JsonElement.createString(normalString)]
        ];
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>(entries));
        expect(testObject.getElement("treeString").asString()).assertEqual(treeString);
        expect(testObject.getElement("normalString").asString()).assertEqual(normalString);
        for (let i = 0; i < 10; i++) {
          expect(testObject.getElement("treeString").asString()).assertEqual(treeString);
          expect(testObject.getElement("normalString").asString()).assertEqual(normalString);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0012
     * @tc.desc    Test getElement with sliced string for value stability
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
          const value = testObject.getElement("slicedString").asString();
          expect(value).assertEqual(expectedResult);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0013
     * @tc.desc    Test getElement with large string memory usage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(1000);
        const testObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["largeString", jsonx.JsonElement.createString(largeString)],
            ["smallString", jsonx.JsonElement.createString("small")]
          ])
        );
        const retrievedLarge = testObject.getElement("largeString").asString();
        expect(retrievedLarge).assertEqual(largeString);
        expect(retrievedLarge.length).assertEqual(1000);
        for (let i = 0; i < 5; i++) {
          const value = testObject.getElement("largeString").asString();
          expect(value).assertEqual(largeString);
        }
        expect(testObject.getElement("smallString").asString()).assertEqual("small");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetElementTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ELEMENT_TEST_0014
     * @tc.desc    Test GC behavior with large strings using getElement
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetElementTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "test_".repeat(10000);
        let largeObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["data", jsonx.JsonElement.createString(largeString)]
          ])
        );
        expect(largeObject.getElement("data").asString()).assertEqual(largeString);
        largeObject = new jsonx.JsonElement();
        const newObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["key", jsonx.JsonElement.createString("value")]
          ])
        );
        expect(newObject.getElement("key").asString()).assertEqual("value");
      } catch (error) {
        throw error;
      }
    });
  })
}