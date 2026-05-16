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
  let ans: string = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}
export default function builtinsJsonElementTryGetDoubleTest() {
  describe("builtinsJsonElementTryGetDoubleTest", () => {
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
     * @tc.name    builtinsJsonElementTryGetDoubleTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0001
     * @tc.desc    Test tryGetDouble() with basic string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createDouble(1.0)],
          ["null", jsonx.JsonElement.createDouble(2.0)],
          ["", jsonx.JsonElement.createDouble(3.0)],
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble("undefined")).assertEqual(1.0);
        expect(testObject.tryGetDouble("null")).assertEqual(2.0);
        expect(testObject.tryGetDouble("")).assertEqual(3.0);
        expect(testObject.tryGetDouble("nonExistent")).assertUndefined();
        expect(testObject.tryGetDouble("nonExistent", 999.999)).assertEqual(999.999);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0002
     * @tc.desc    Test tryGetDouble() with special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < specialChars.length; i++) {
          const chars = specialChars.substring(i, i + 1);
          testMap.set(chars, jsonx.JsonElement.createDouble(i + 1.0));
        }
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialChars.length; i++) {
          const chars = specialChars.substring(i, i + 1);
          expect(testObject.tryGetDouble(chars)).assertEqual(i + 1.0);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0003
     * @tc.desc    Test tryGetDouble() with ASCII character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0123456789", jsonx.JsonElement.createDouble(123.456)],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createDouble(456.789)],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createDouble(789.012)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble("0123456789")).assertEqual(123.456);
        expect(testObject.tryGetDouble("ABCDEFGHIJKLMNOPQRSTUVWXYZ")).assertEqual(456.789);
        expect(testObject.tryGetDouble("abcdefghijklmnopqrstuvwxyz")).assertEqual(789.012);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0004
     * @tc.desc    Test tryGetDouble() with double special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial: string = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createDouble(3.141592653589793)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble(doubleSpecial)).assertEqual(3.141592653589793);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0005
     * @tc.desc    Test tryGetDouble() with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", "\\\"", "\\?", "\\0", "A", "B"];
        const escapeValues = [7.0, 8.0, 12.0, 10.0, 13.0, 9.0, 11.0, 92.0, 39.0, 34.0, 63.0, 0.0, 65.0, 66.0];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < escapeKeys.length; i++) {
          testMap.set(escapeKeys[i], jsonx.JsonElement.createDouble(escapeValues[i]));
        }
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < escapeKeys.length; i++) {
          expect(testObject.tryGetDouble(escapeKeys[i])).assertEqual(escapeValues[i]);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0006
     * @tc.desc    Test tryGetDouble() with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const unicodeValues = [
          1.0, 2.0, 3.0, 4.0, 5.0, 6.0,
          7.0, 8.0, 9.0, 10.0, 11.0, 12.0
        ];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          testMap.set(unicodeKeys[i], jsonx.JsonElement.createDouble(unicodeValues[i]));
        }
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < unicodeKeys.length; i++) {
          expect(testObject.tryGetDouble(unicodeKeys[i])).assertEqual(unicodeValues[i]);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0007
     * @tc.desc    Test tryGetDouble() with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createDouble(1.0)],
          ["\\ud83d", jsonx.JsonElement.createDouble(2.0)],
          ["\\udff4", jsonx.JsonElement.createDouble(3.0)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble("\\udc04")).assertEqual(1.0);
        expect(testObject.tryGetDouble("\\ud83d")).assertEqual(2.0);
        expect(testObject.tryGetDouble("\\udff4")).assertEqual(3.0);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0008
     * @tc.desc    Test tryGetDouble() with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createDouble(0.0)],
          ["NaN", jsonx.JsonElement.createDouble(NaN)],
          ["", jsonx.JsonElement.createDouble(Infinity)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble("0")).assertEqual(0.0);
        const nanValue: double | undefined = testObject.tryGetDouble("NaN");
        expect(nanValue).not().assertUndefined();
        expect(isNaN(nanValue!)).assertTrue();
        expect(testObject.tryGetDouble("")).assertEqual(Infinity);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0009
     * @tc.desc    Test tryGetDouble() fallback behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["validKey", jsonx.JsonElement.createDouble(42.0)],
          ["stringValue", jsonx.JsonElement.createString("not a number")],
          ["", jsonx.JsonElement.createDouble(0.0)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble("undefined")).assertUndefined();
        expect(testObject.tryGetDouble("undefined", 666.0)).assertEqual(666.0);
        expect(testObject.tryGetDouble("null")).assertUndefined();
        expect(testObject.tryGetDouble("null", 555.0)).assertEqual(555.0);
        expect(testObject.tryGetDouble("nonExistent", Infinity)).assertEqual(Infinity);
        const nanResult: double | undefined = testObject.tryGetDouble("nonExistent", NaN);
        expect(isNaN(nanResult!)).assertTrue();
        expect(testObject.tryGetDouble("nonExistent", undefined)).assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0010
     * @tc.desc    Test tryGetDouble() with treeString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeJsonKey: string = init(100);
        const normalStringKey: string = "x".repeat(100);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [treeJsonKey, jsonx.JsonElement.createDouble(123.456)],
          [normalStringKey, jsonx.JsonElement.createDouble(789.012)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble(treeJsonKey)).assertEqual(123.456);
        expect(testObject.tryGetDouble(treeJsonKey, 999.999)).assertEqual(123.456);
        expect(testObject.tryGetDouble(normalStringKey)).assertEqual(789.012);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0011
     * @tc.desc    Test tryGetDouble() with sliceString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const originalStr: string = "{k1:value1,k2:value2}";
        for (let iteration: number = 0; iteration < 5; iteration++) {
          const sliceKey: string = originalStr.substring(0, originalStr.length - 2);
          const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
            [sliceKey, jsonx.JsonElement.createDouble(iteration * 10.0)]
          ]);
          const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
          const getKey: string = originalStr.substring(0, originalStr.length - 2);
          expect(testObject.tryGetDouble(getKey)).assertEqual(iteration * 10.0);
          expect(testObject.tryGetDouble(getKey, 999.0)).assertEqual(iteration * 10.0);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0012
     * @tc.desc    Test tryGetDouble() with large memory keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeKey: string = "a".repeat(50000);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [largeKey, jsonx.JsonElement.createDouble(123456.789)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.tryGetDouble(largeKey)).assertEqual(123456.789);
        expect(testObject.tryGetDouble(largeKey, 999.999)).assertEqual(123456.789);
      } catch (error) {
        console.error("Error in large string test:", error);
        if (error.message.includes("memory") || error.message.includes("out of memory")) {
          console.log("Note: Test may fail due to memory constraints in test environment");
        }
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetDoubleTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_GET_DOUBLE_TEST_0013
     * @tc.desc    Test tryGetDouble() GC behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetDoubleTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        for (let i: number = 0; i < 3; i++) {
          const hugeKey: string = "key_".repeat(10000);
          const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
            [hugeKey, jsonx.JsonElement.createDouble(3.14159)]
          ]);
          const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
          expect(testObject.tryGetDouble(hugeKey)).assertEqual(3.14159);
          expect(testObject.tryGetDouble(hugeKey, 999.0)).assertEqual(3.14159);
          const nonExistentKey: string = "other_".repeat(10000);
          expect(testObject.tryGetDouble(nonExistentKey)).assertUndefined();
          expect(testObject.tryGetDouble(nonExistentKey, 888.0)).assertEqual(888.0);
        }
      } catch (error) {
        console.error("Error in GC test:", error);
        if (error.message.includes("memory") || error.message.includes("out of memory")) {
          console.log("Possible GC issue with large strings");
        }
        throw error;
      }
    });

  })
}