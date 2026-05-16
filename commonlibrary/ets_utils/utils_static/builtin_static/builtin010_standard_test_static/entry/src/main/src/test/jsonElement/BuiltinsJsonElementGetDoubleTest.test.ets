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
export default function builtinsJsonElementGetDoubleTest() {
  describe("builtinsJsonElementGetDoubleTest", () => {
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
     * @tc.name    builtinsJsonElementGetDoubleTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0001
     * @tc.desc    Test getDouble() with basic string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createDouble(1.0)],
          ["null", jsonx.JsonElement.createDouble(2.0)],
          ["", jsonx.JsonElement.createDouble(3.0)],
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble("undefined")).assertEqual(1.0);
        expect(testObject.getDouble("null")).assertEqual(2.0);
        expect(testObject.getDouble("")).assertEqual(3.0);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0002
     * @tc.desc    Test getDouble() with special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i: int = 0; i < specialChars.length; i++) {
          const chars: string = specialChars.substring(i, i + 1);
          const doubleValue: double = i * 1.0 + 0.5;
          testMap.set(chars, jsonx.JsonElement.createDouble(doubleValue));
        }
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        for (let i: int = 0; i < specialChars.length; i++) {
          const chars: string = specialChars.substring(i, i + 1);
          const expectedValue: double = i * 1.0 + 0.5;
          expect(testObject.getDouble(chars)).assertEqual(expectedValue);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0003
     * @tc.desc    Test getDouble() with ASCII character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0123456789", jsonx.JsonElement.createDouble(123.456)],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createDouble(456.789)],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createDouble(789.012)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble("0123456789")).assertEqual(123.456);
        expect(testObject.getDouble("ABCDEFGHIJKLMNOPQRSTUVWXYZ")).assertEqual(456.789);
        expect(testObject.getDouble("abcdefghijklmnopqrstuvwxyz")).assertEqual(789.012);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0004
     * @tc.desc    Test getDouble() with double special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial: string = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createDouble(3.141592653589793)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble(doubleSpecial)).assertEqual(3.141592653589793);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0005
     * @tc.desc    Test getDouble() with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeSequences = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", '\\"', "\\?", "\\0"];
        const expectedValues = [7.0, 8.0, 12.0, 10.0, 13.0, 9.0, 11.0, 92.0, 39.0, 34.0, 63.0, 0.0];
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < escapeSequences.length; i++) {
          testMap.set(escapeSequences[i], jsonx.JsonElement.createDouble(expectedValues[i]));
        }
        testMap.set("\\101", jsonx.JsonElement.createDouble(65.0));
        testMap.set("\\x41", jsonx.JsonElement.createDouble(65.0));
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < escapeSequences.length; i++) {
          expect(testObject.getDouble(escapeSequences[i])).assertEqual(expectedValues[i]);
        }
        expect(testObject.getDouble("\\101")).assertEqual(65.0);
        expect(testObject.getDouble("\\x41")).assertEqual(65.0);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0006
     * @tc.desc    Test getDouble() with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const unicodeValues = [
          128054.0, 128127.0, 128064.0, 128175.0,
          127877.0, 128572.0, 128295.0, 128135.0,
          129340.0, 128738.0, 126980.0, 127988.0
        ];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          testMap.set(unicodeKeys[i], jsonx.JsonElement.createDouble(unicodeValues[i]));
        }
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < unicodeKeys.length; i++) {
          expect(testObject.getDouble(unicodeKeys[i])).assertEqual(unicodeValues[i]);
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0007
     * @tc.desc    Test getDouble() with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createDouble(0.0)],
          ["NaN", jsonx.JsonElement.createDouble(NaN)],
          ["", jsonx.JsonElement.createDouble(Infinity)],
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble("0")).assertEqual(0.0);
        expect(isNaN(testObject.getDouble("NaN"))).assertTrue();
        expect(testObject.getDouble("")).assertEqual(Infinity);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0008
     * @tc.desc    Test getDouble() with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createDouble(1.0)],
          ["\\ud83d", jsonx.JsonElement.createDouble(2.0)],
          ["\\udff4", jsonx.JsonElement.createDouble(3.0)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble("\\udc04")).assertEqual(1.0);
        expect(testObject.getDouble("\\ud83d")).assertEqual(2.0);
        expect(testObject.getDouble("\\udff4")).assertEqual(3.0);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0009
     * @tc.desc    Test getDouble() with treeString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeJsonKey: string = init(100);
        const normalStringKey: string = "x".repeat(100);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [treeJsonKey, jsonx.JsonElement.createDouble(123.456)],
          [normalStringKey, jsonx.JsonElement.createDouble(789.012)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble(treeJsonKey)).assertEqual(123.456);
        expect(testObject.getDouble(normalStringKey)).assertEqual(789.012);
        const startTime1: number = Date.now();
        for (let i: number = 0; i < 1000; i++) {
          testObject.getDouble(treeJsonKey);
        }
        const treeStringTime: number = Date.now() - startTime1;
        const startTime2: number = Date.now();
        for (let i: number = 0; i < 1000; i++) {
          testObject.getDouble(normalStringKey);
        }
        const normalStringTime: number = Date.now() - startTime2;
        console.log(`TreeString access time: ${treeStringTime}ms`);
        console.log(`Normal string access time: ${normalStringTime}ms`);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0010
     * @tc.desc    Test getDouble() with sliceString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const originalStr: string = "{k1:value1,k2:value2}";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let iteration: number = 0; iteration < 10; iteration++) {
          const keyToRemove: string = originalStr.substring(0, originalStr.length - 2);
          testMap.set(keyToRemove, jsonx.JsonElement.createDouble(iteration * 10.0));
          const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
          const getKey: string = originalStr.substring(0, originalStr.length - 2);
          const value: double = testObject.getDouble(getKey);
          expect(value).assertEqual(iteration * 10.0);
          testMap.clear();
        }
        const stableKey: string = originalStr.substring(0, originalStr.length - 2);
        const testMap2: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [stableKey, jsonx.JsonElement.createDouble(999.999)]
        ]);
        const testObject2: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap2);
        for (let i: number = 0; i < 5; i++) {
          const getKey: string = originalStr.substring(0, originalStr.length - 2);
          expect(testObject2.getDouble(getKey)).assertEqual(999.999);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0011
     * @tc.desc    Test getDouble() with large memory intensive keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeStringKey: string = "a".repeat(100000);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [largeStringKey, jsonx.JsonElement.createDouble(123456.789)]
        ]);
        const testObject: jsonx.JsonElement = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getDouble(largeStringKey)).assertEqual(123456.789);
        testObject.setElement(largeStringKey, jsonx.JsonElement.createDouble(987654.321));
        expect(testObject.getDouble(largeStringKey)).assertEqual(987654.321);
        const removeResult: boolean = testObject.removeElement(largeStringKey);
        expect(removeResult).assertTrue();
        try {
          testObject.getDouble(largeStringKey);
        } catch (error) {
          expect(error instanceof RangeError).assertTrue();
        }
      } catch (error) {
        if (error.message.includes("memory") || error.message.includes("out of memory")) {
          console.log("Note: Test may fail due to memory constraints in test environment");
        }
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetDoubleTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_DOUBLE_TEST_0012
     * @tc.desc    Test getDouble() GC behavior with large string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetDoubleTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const createLargeObject = (): jsonx.JsonElement => {
          const hugeKey: string = "key_".repeat(25000);
          const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
            [hugeKey, jsonx.JsonElement.createDouble(3.14159)]
          ]);
          return jsonx.JsonElement.createObject(testMap);
        };
        for (let i: number = 0; i < 5; i++) {
          const obj: jsonx.JsonElement = createLargeObject();
          const hugeKey: string = "key_".repeat(25000);
          expect(obj.getDouble(hugeKey)).assertEqual(3.14159);
        }
        const smallTestMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["small", jsonx.JsonElement.createDouble(42.0)]
        ]);
        const smallObject: jsonx.JsonElement = jsonx.JsonElement.createObject(smallTestMap);
        expect(smallObject.getDouble("small")).assertEqual(42.0);
      } catch (error) {
        if (error.message.includes("memory") || error.message.includes("out of memory")) {
          console.log("Possible GC issue with large strings");
        }
        throw error;
      }
    });
  })
}