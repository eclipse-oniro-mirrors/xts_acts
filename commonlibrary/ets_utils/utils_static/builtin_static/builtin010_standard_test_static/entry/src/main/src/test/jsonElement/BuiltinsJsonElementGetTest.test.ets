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
export default function builtinsJsonElementGetTest() {
  describe("builtinsJsonElement$_getTest", () => {
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
     * @tc.name    builtinsJsonElementGetTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0001
     * @tc.desc    Test $_get method with index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [jsonx.JsonElement.createInteger(123)];
        const element = jsonx.JsonElement.createArray(array);
        const result = element.$_get(0);
        expect(result.asInteger()).assertEqual(123);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0002
     * @tc.desc    Test $_get method with index 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [
          jsonx.JsonElement.createInteger(1),
          jsonx.JsonElement.createInteger(2)
        ];
        const element = jsonx.JsonElement.createArray(array);
        const result = element.$_get(1);
        expect(result.asInteger()).assertEqual(2);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0003
     * @tc.desc    Test $_get method with negative index -1 (should throw RangeError)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [jsonx.JsonElement.createInteger(123)];
        const element = jsonx.JsonElement.createArray(array);
        element.$_get(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0004
     * @tc.desc    Test $_get method with out of bounds index 1 (should throw RangeError)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [jsonx.JsonElement.createInteger(123)];
        const element = jsonx.JsonElement.createArray(array);
        element.$_get(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0005
     * @tc.desc    Test $_get method on non-array element (should throw JsonTypeError)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createString("test");
        element.$_get(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0006
     * @tc.desc    Test $_get method with index 2147483647 (max int positive)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [jsonx.JsonElement.createInteger(999)];
        const element = jsonx.JsonElement.createArray(array);
        element.$_get(2147483647);
        expect(false).assertTrue();
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0007
     * @tc.desc    Test $_get method with index -2147483648 (min int negative)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [jsonx.JsonElement.createInteger(999)];
        const element = jsonx.JsonElement.createArray(array);
        element.$_get(-2147483648);
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0008
     * @tc.desc    Test $_get method with empty array (should throw RangeError for any index)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createArray([]);
        element.$_get(0);
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0009
     * @tc.desc    Test $_get method with undefined key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createString("undefinedKeyValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testData);
        const result = testObject.$_get("undefined");
        expect(result.asString()).assertEqual("undefinedKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0010
     * @tc.desc    Test $_get method with null key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = new Map<string, jsonx.JsonElement>([
          ["null", jsonx.JsonElement.createString("nullKeyValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testData);
        const result = testObject.$_get("null");
        expect(result.asString()).assertEqual("nullKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0011
     * @tc.desc    Test $_get method with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = new Map<string, jsonx.JsonElement>([
          ["", jsonx.JsonElement.createString("emptyKeyValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testData);
        const result = testObject.$_get("");
        expect(result.asString()).assertEqual("emptyKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0012
     * @tc.desc    Test $_get method with special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testData = new Map<string, jsonx.JsonElement>();
        const charsArray = specialChars.split('');
        charsArray.forEach((c: string) => {
          const charCode = c.charCodeAt(0);
          testData.set(c, jsonx.JsonElement.createString(`key_${charCode}`));
        });
        const testObject = jsonx.JsonElement.createObject(testData);
        charsArray.forEach((c: string) => {
          const value = testObject.$_get(c);
          const expectedCode = c.charCodeAt(0);
          expect(value.asString()).assertEqual(`key_${expectedCode}`);
        });
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0013
     * @tc.desc    Test $_get method with full ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = new Map<string, jsonx.JsonElement>([
          ["!\"#$%&'()*+,-./", jsonx.JsonElement.createString("specialGroup1")],
          ["0123456789", jsonx.JsonElement.createString("digits")],
          [":;<=>?@", jsonx.JsonElement.createString("specialGroup2")],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createString("uppercase")],
          ["[\\]^_`", jsonx.JsonElement.createString("specialGroup3")],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createString("lowercase")],
          ["{|}~", jsonx.JsonElement.createString("specialGroup4")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testData);
        expect(testObject.$_get("!\"#$%&'()*+,-./").asString()).assertEqual("specialGroup1");
        expect(testObject.$_get("0123456789").asString()).assertEqual("digits");
        expect(testObject.$_get(":;<=>?@").asString()).assertEqual("specialGroup2");
        expect(testObject.$_get("ABCDEFGHIJKLMNOPQRSTUVWXYZ").asString()).assertEqual("uppercase");
        expect(testObject.$_get("[\\]^_`").asString()).assertEqual("specialGroup3");
        expect(testObject.$_get("abcdefghijklmnopqrstuvwxyz").asString()).assertEqual("lowercase");
        expect(testObject.$_get("{|}~").asString()).assertEqual("specialGroup4");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0014
     * @tc.desc    Test $_get method with double special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testData = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createString("doubleSpecialKeyValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testData);
        const result = testObject.$_get(doubleSpecial);
        expect(result.asString()).assertEqual("doubleSpecialKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0015
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0015
     * @tc.desc    Test $_get method with escape sequence keys in single test case
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeyValuePairs = new Map<string, string>([
          ["\\a", "bell"], ["\\b", "backspace"], ["\\f", "formFeed"], ["\\n", "newline"],
          ["\\r", "carriageReturn"], ["\\t", "horizontalTab"], ["\\v", "verticalTab"],
          ["\\\\", "backslash"], ["\\'", "singleQuote"], ["\\\"", "doubleQuote"],
          ["\\?", "questionMark"], ["\\0", "nullChar"], ["\\101", "octal101"], ["\\x41", "hex41"]
        ]);
        const testData = new Map<string, jsonx.JsonElement>();
        escapeKeyValuePairs.forEach((value: string, key: string) => {
          testData.set(key, jsonx.JsonElement.createString(value));
        });
        const testObject = jsonx.JsonElement.createObject(testData);
        escapeKeyValuePairs.forEach((expectedValue: string, key: string) => {
          const result = testObject.$_get(key);
          expect(result.asString()).assertEqual(expectedValue);
        });
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0016
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0016
     * @tc.desc    Test $_get method with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const unicodeValues = [
          "unicodeBackhandIndex", "unicodeAngryFace", "unicodeEyes", "unicodeHundredPoints", "unicodeSanta", "unicodeCatSmile",
          "unicodeWrench", "unicodeHaircut", "unicodeWrestling", "unicodeOilDrum", "unicodeMahjong", "unicodeBlackFlag"
        ];
        const testData = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          const key = unicodeKeys[i];
          const value = unicodeValues[i];
          testData.set(key, jsonx.JsonElement.createString(value));
        }
        const testObject = jsonx.JsonElement.createObject(testData);
        for (let i = 0; i < unicodeKeys.length; i++) {
          const key = unicodeKeys[i];
          const expectedValue = unicodeValues[i];
          expect(testObject.$_get(key).asString()).assertEqual(expectedValue);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0017
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0017
     * @tc.desc    Test $_get method with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createString("illegalUnicode1")],
          ["\\ud83d", jsonx.JsonElement.createString("illegalUnicode2")],
          ["\\udff4", jsonx.JsonElement.createString("illegalUnicode3")]
        ]);

        const testObject = jsonx.JsonElement.createObject(testData);

        expect(testObject.$_get("\\udc04").asString()).assertEqual("illegalUnicode1");
        expect(testObject.$_get("\\ud83d").asString()).assertEqual("illegalUnicode2");
        expect(testObject.$_get("\\udff4").asString()).assertEqual("illegalUnicode3");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0018
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0018
     * @tc.desc    Test $_get method with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createString("zeroKey")],
          ["NaN", jsonx.JsonElement.createString("nanKey")],
          ["", jsonx.JsonElement.createString("emptyKey")]
        ]);

        const testObject = jsonx.JsonElement.createObject(testData);

        expect(testObject.$_get("0").asString()).assertEqual("zeroKey");
        expect(testObject.$_get("NaN").asString()).assertEqual("nanKey");
        expect(testObject.$_get("").asString()).assertEqual("emptyKey");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0019
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0019
     * @tc.desc    Test $_get method with treeString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeJsonKey = init(100);
        const normalStringKey = "x".repeat(100);

        const testData = new Map<string, jsonx.JsonElement>([
          [treeJsonKey, jsonx.JsonElement.createString("treeJsonValue")],
          [normalStringKey, jsonx.JsonElement.createString("normalStringValue")]
        ]);

        const testObject = jsonx.JsonElement.createObject(testData);

        expect(testObject.$_get(treeJsonKey).asString()).assertEqual("treeJsonValue");
        expect(testObject.$_get(normalStringKey).asString()).assertEqual("normalStringValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0020
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0020
     * @tc.desc    Test $_get method with sliceString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const originalStr = "{k1:value1,k2:value2}";
        const keyToRemove = originalStr.substring(0, originalStr.length - 2);

        const testData = new Map<string, jsonx.JsonElement>([
          [keyToRemove, jsonx.JsonElement.createString("sliceStringValue")]
        ]);

        const testObject = jsonx.JsonElement.createObject(testData);

        const key = originalStr.substring(0, originalStr.length - 2);
        const result = testObject.$_get(key);
        expect(result.asString()).assertEqual("sliceStringValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0021
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0021
     * @tc.desc    Test $_get method with large memory intensive keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const hugeString = "X".repeat(100000);

        const testData = new Map<string, jsonx.JsonElement>([
          [hugeString, jsonx.JsonElement.createString("hugeStringValue")]
        ]);

        const testObject = jsonx.JsonElement.createObject(testData);
        const element = testObject.$_get(hugeString);
        expect(element.asString()).assertEqual("hugeStringValue");
      } catch (error) {
        console.error("Error in large string memory test:", error);
        if (error.message.includes("memory") || error.message.includes("out of memory")) {
          console.log("Note: Test may fail due to memory constraints in test environment");
          console.log("This is an environment limitation, not a code issue");
        }
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetTest0022
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_TEST_0022
     * @tc.desc    Test $_get method error conditions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nonObjectElements = [
        jsonx.JsonElement.createString("string"),
        jsonx.JsonElement.createInteger(123),
        jsonx.JsonElement.createDouble(3.14),
        jsonx.JsonElement.createBoolean(true),
        jsonx.JsonElement.createBoolean(false),
        jsonx.JsonElement.createNull(),
        jsonx.JsonElement.createArray([]),
        new jsonx.JsonElement()
      ];
      for (let i = 0; i < nonObjectElements.length; i++) {
        const element = nonObjectElements[i];
        try {
          element.$_get("anyKey");
        } catch (error) {
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
      }
      const testMap = new Map<string, jsonx.JsonElement>([
        ["existingKey", jsonx.JsonElement.createString("value")]
      ]);
      const objectElement = jsonx.JsonElement.createObject(testMap);
      try {
        objectElement.$_get("nonExistingKey");
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
      const emptyObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
      try {
        emptyObject.$_get("anyKey");
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
      const retrievedValue = objectElement.$_get("existingKey").asString();
      expect(retrievedValue).assertEqual("value");
    });

  })
}