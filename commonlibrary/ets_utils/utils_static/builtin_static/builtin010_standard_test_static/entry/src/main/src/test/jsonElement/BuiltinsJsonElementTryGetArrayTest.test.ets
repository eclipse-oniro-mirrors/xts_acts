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

export default function builtinsJsonElementTryGetArrayTest() {
  describe("builtinsJsonElementTryGetArrayTest", () => {
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
     * @tc.name    builtinsJsonElementTryGetArrayTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0001
     * @tc.desc    Test tryGetArray() with undefined and null keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("undefinedKeyValue")])],
          ["null", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("nullKeyValue")])],
          ["", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("emptyKeyValue")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.tryGetArray("undefined");
        expect(result1[0].asString()).assertEqual("undefinedKeyValue");
        const result2 = testObject.tryGetArray("null");
        expect(result2[0].asString()).assertEqual("nullKeyValue");
        const result3 = testObject.tryGetArray("");
        expect(result3[0].asString()).assertEqual("emptyKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0002
     * @tc.desc    Test tryGetArray() with special character keys using loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          testMap.set(chars, jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString(`special_chars_${i}`)
          ]));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          const result = testObject.tryGetArray(chars);
          expect(result.length).assertEqual(1);
          expect(result[0].asString()).assertEqual(`special_chars_${i}`);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0003
     * @tc.desc    Test tryGetArray() with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0123456789", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("digits")])],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("uppercase")])],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("lowercase")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.tryGetArray("0123456789");
        expect(result1.length).assertEqual(1);
        expect(result1[0].asString()).assertEqual("digits");
        const result2 = testObject.tryGetArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        expect(result2.length).assertEqual(1);
        expect(result2[0].asString()).assertEqual("uppercase");
        const result3 = testObject.tryGetArray("abcdefghijklmnopqrstuvwxyz");
        expect(result3.length).assertEqual(1);
        expect(result3[0].asString()).assertEqual("lowercase");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0004
     * @tc.desc    Test tryGetArray() with double special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createArray([jsonx.JsonElement.createInteger(42)])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result = testObject.tryGetArray(doubleSpecial);
        expect(result.length).assertEqual(1);
        expect(result[0].asInteger()).assertEqual(42);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0005
     * @tc.desc    Test tryGetArray() with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testData = [
          ["\\a", "bell"], ["\\b", "backspace"], ["\\f", "formFeed"], ["\\n", "newline"], ["\\r", "carriageReturn"],
          ["\\t", "horizontalTab"], ["\\v", "verticalTab"], ["\\\\", "backslash"], ["\\'", "singleQuote"], ["\\\"", "doubleQuote"],
          ["\\?", "questionMark"], ["\\0", "nullChar"], ["\\141", "octal141"], ["\\x42", "hex42"]
        ];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < testData.length; i++) {
          const data = testData[i];
          const key = data[0];
          const value = data[1];
          const arrayElement = jsonx.JsonElement.createArray([jsonx.JsonElement.createString(value)]);
          testMap.set(key, arrayElement);
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < testData.length; i++) {
          const data = testData[i];
          const key = data[0];
          const expectedValue = data[1];
          const result = testObject.tryGetArray(key);
          expect(result.length).assertEqual(1);
          expect(result[0].asString()).assertEqual(expectedValue);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0006
     * @tc.desc    Test tryGetArray() with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const testValues = [
          jsonx.JsonElement.createDouble(3.14), jsonx.JsonElement.createString("unicodeAngryFace"),
          jsonx.JsonElement.createInteger(100), jsonx.JsonElement.createString("unicodeHundredPoints"),
          jsonx.JsonElement.createString("unicodeSanta"), jsonx.JsonElement.createString("unicodeCatSmile"),
          jsonx.JsonElement.createString("unicodeWrench"), jsonx.JsonElement.createString("unicodeHaircut"),
          jsonx.JsonElement.createString("unicodeWrestling"), jsonx.JsonElement.createString("unicodeOilDrum"),
          jsonx.JsonElement.createString("unicodeMahjong"), jsonx.JsonElement.createString("unicodeBlackFlag")
        ];
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          const arrayElement = jsonx.JsonElement.createArray([testValues[i]]);
          testMap.set(unicodeKeys[i], arrayElement);
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < unicodeKeys.length; i++) {
          const result = testObject.tryGetArray(unicodeKeys[i]);
          expect(result.length).assertEqual(1);
          if (i === 0) {
            expect(result[0].asDouble()).assertEqual(3.14);
          } else if (i === 2) {
            expect(result[0].asInteger()).assertEqual(100);
          } else {
            const expectedValue = testValues[i].asString();
            expect(result[0].asString()).assertEqual(expectedValue);
          }
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0007
     * @tc.desc    Test tryGetArray() with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createArray([jsonx.JsonElement.createUndefined()])],
          ["NaN", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("nanKey")])],
          ["", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("anotherEmptyKey")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.tryGetArray("0");
        expect(result1.length).assertEqual(1);
        expect(result1[0].jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        const result2 = testObject.tryGetArray("NaN");
        expect(result2.length).assertEqual(1);
        expect(result2[0].asString()).assertEqual("nanKey");
        const result3 = testObject.tryGetArray("");
        expect(result3.length).assertEqual(1);
        expect(result3[0].asString()).assertEqual("anotherEmptyKey");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0008
     * @tc.desc    Test tryGetArray() GC behavior with substring keys in multiple loops
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const originalStr = "{k1:value1,k2:value2}";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["{k1:value1,k2:value", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("fullMinus2")])],
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < 50; i++) {
          const result1 = originalStr.substring(0, originalStr.length - 2);
          const array1 = testObject.tryGetArray(result1);
          expect(array1.length).assertEqual(1);
          expect(array1[0].asString()).assertEqual("fullMinus2");
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0009
     * @tc.desc    Test tryGetArray() with memory intensive keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeJsonKey = init(100);
        const normalStringKey = "x".repeat(100);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [treeJsonKey, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("treeJsonValue")])],
          [normalStringKey, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("normalStringValue")])],
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.tryGetArray(treeJsonKey);
        expect(result1.length).assertEqual(1);
        expect(result1[0].asString()).assertEqual("treeJsonValue");
        expect(treeJsonKey.length >= 100).assertTrue();
        const result2 = testObject.tryGetArray(normalStringKey);
        expect(result2.length).assertEqual(1);
        expect(result2[0].asString()).assertEqual("normalStringValue");
        expect(normalStringKey.length).assertEqual(100);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0010
     * @tc.desc    Test tryGetArray() memory with large string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const createAndTest = () => {
          const largeString = "mem".repeat(10000);
          const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
            [largeString, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("largeValue")])]
          ]);
          const testObject = jsonx.JsonElement.createObject(testMap);
          const result = testObject.tryGetArray(largeString);
          expect(result.length).assertEqual(1);
          expect(result[0].asString()).assertEqual("largeValue");
          return largeString.length;
        };
        const length1 = createAndTest();
        const length2 = createAndTest();
        expect(length1).assertEqual(length2);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0011
     * @tc.desc    Test tryGetArray() with extremely large string keys and memory usage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(100000);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [largeString, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("largeStringValue")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result = testObject.tryGetArray(largeString);
        expect(result.length).assertEqual(1);
        expect(result[0].asString()).assertEqual("largeStringValue");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetArrayTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_ARRAY_TEST_0012
     * @tc.desc    Test tryGetArray() with illegal Unicode encoding keys to ensure no crash
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetArrayTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("illegal1")])],
          ["\\ud83d", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("illegal2")])],
          ["\\udff4", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("illegal3")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetArray("\\udc04")[0].asString()).assertEqual("illegal1");
        expect(testObject.tryGetArray("\\ud83d")[0].asString()).assertEqual("illegal2");
        expect(testObject.tryGetArray("\\udff4")[0].asString()).assertEqual("illegal3");
        const nonExistentResult = testObject.tryGetArray("\\ud801");
        expect(nonExistentResult.length).assertEqual(0);
      } catch (error) {
        throw new Error(`Illegal Unicode encoding caused crash: ${error.message}`);
      }
    });
  })
}