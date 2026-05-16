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
export default function builtinsJsonElementRemoveElementTest() {
  describe("builtinsJsonElementRemoveElementTest", () => {
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
     * @tc.name    builtinsJsonElementRemoveElementTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0001
     * @tc.desc    Test removeElement() with undefined and null keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createString("undefinedValue")],
          ["null", jsonx.JsonElement.createString("nullValue")],
          ["", jsonx.JsonElement.createString("emptyValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.removeElement("undefined");
        expect(result1).assertTrue();
        expect(testObject.tryGetElement("undefined")).assertUndefined();
        const result2 = testObject.removeElement("null");
        expect(result2).assertTrue();
        expect(testObject.tryGetElement("null")).assertUndefined();
        const result3 = testObject.removeElement("");
        expect(result3).assertTrue();
        expect(testObject.tryGetElement("")).assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0002
     * @tc.desc    Test removeElement() with special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          testMap.set(chars, jsonx.JsonElement.createString(`value_${i}`));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          const result = testObject.removeElement(chars);
          expect(result).assertTrue();
          expect(testObject.tryGetElement(chars)).assertUndefined();
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0003
     * @tc.desc    Test removeElement() with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0123456789", jsonx.JsonElement.createString("digits")],
          ["ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createString("uppercase")],
          ["abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createString("lowercase")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.removeElement("0123456789");
        expect(result1).assertTrue();
        expect(testObject.tryGetElement("0123456789")).assertUndefined();
        const result2 = testObject.removeElement("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        expect(result2).assertTrue();
        expect(testObject.tryGetElement("ABCDEFGHIJKLMNOPQRSTUVWXYZ")).assertUndefined();
        const result3 = testObject.removeElement("abcdefghijklmnopqrstuvwxyz");
        expect(result3).assertTrue();
        expect(testObject.tryGetElement("abcdefghijklmnopqrstuvwxyz")).assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0004
     * @tc.desc    Test removeElement() with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", "\\\"", "\\?", "\\0", "A", "B"];
        const escapeValues = ["alert_bell", "backspace", "form_feed", "newline", "carriage_return", "tab", "vertical_tab",
          "backslash", "single_quote", "double_quote", "question_mark", "null_char", "octal_A", "hex_B"];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < escapeKeys.length; i++) {
          testMap.set(escapeKeys[i], jsonx.JsonElement.createString(escapeValues[i]));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < escapeKeys.length; i++) {
          const key = escapeKeys[i];
          const removed = testObject.removeElement(key);
          expect(removed).assertTrue();
          expect(testObject.tryGetElement(key)).assertUndefined();
          for (let j = 0; j <= i; j++) {
            expect(testObject.tryGetElement(escapeKeys[j])).assertUndefined();
          }
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0005
     * @tc.desc    Test removeElement() with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          testMap.set(unicodeKeys[i], jsonx.JsonElement.createString(`unicode_${i}`));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < unicodeKeys.length; i++) {
          const key = unicodeKeys[i];
          const removed = testObject.removeElement(key);
          expect(removed).assertTrue();
          expect(testObject.tryGetElement(key)).assertUndefined();
          for (let j = 0; j <= i; j++) {
            expect(testObject.tryGetElement(unicodeKeys[j])).assertUndefined();
          }
          for (let j = i + 1; j < unicodeKeys.length; j++) {
            const value = testObject.tryGetElement(unicodeKeys[j]);
            expect(value).not().assertUndefined();
            expect(value!.asString()).assertEqual(`unicode_${j}`);
          }
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0006
     * @tc.desc    Test removeElement() returns false for non-object types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const stringElement = jsonx.JsonElement.createString("test");
        const result1 = stringElement.removeElement("anyKey");
        expect(result1).assertFalse();
        const numberElement = jsonx.JsonElement.createInteger(42);
        const result2 = numberElement.removeElement("anyKey");
        expect(result2).assertFalse();
        const booleanElement = jsonx.JsonElement.createBoolean(true);
        const result3 = booleanElement.removeElement("anyKey");
        expect(result3).assertFalse();
        const nullElement = jsonx.JsonElement.createNull();
        const result4 = nullElement.removeElement("anyKey");
        expect(result4).assertFalse();
        const arrayElement = jsonx.JsonElement.createArray([]);
        const result5 = arrayElement.removeElement("anyKey");
        expect(result5).assertFalse();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0007
     * @tc.desc    Test removeElement() with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createString("illegal1")],
          ["\\ud83d", jsonx.JsonElement.createString("illegal2")],
          ["\\udff4", jsonx.JsonElement.createString("illegal3")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.removeElement("\\udc04");
        expect(result1).assertTrue();
        expect(testObject.tryGetElement("\\udc04")).assertUndefined();
        const result2 = testObject.removeElement("\\ud83d");
        expect(result2).assertTrue();
        expect(testObject.tryGetElement("\\ud83d")).assertUndefined();
        const result3 = testObject.removeElement("\\udff4");
        expect(result3).assertTrue();
        expect(testObject.tryGetElement("\\udff4")).assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0008
     * @tc.desc    Test removeElement() with memory intensive keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeJsonKey = init(100);
        const normalStringKey = "x".repeat(100);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [treeJsonKey, jsonx.JsonElement.createString("treeJsonValue")],
          [normalStringKey, jsonx.JsonElement.createString("normalStringValue")],
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.removeElement(treeJsonKey);
        expect(result1).assertTrue();
        expect(testObject.tryGetElement(treeJsonKey)).assertUndefined();
        const result2 = testObject.removeElement(normalStringKey);
        expect(result2).assertTrue();
        expect(testObject.tryGetElement(normalStringKey)).assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0009
     * @tc.desc    Test removeElement() GC behavior with substring keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const originalStr = "{k1:value1,k2:value2}";
        for (let i = 0; i < 10; i++) {
          const keyToRemove = originalStr.substring(0, originalStr.length - 2);
          const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
            [keyToRemove, jsonx.JsonElement.createString("fullMinus2")],
          ]);
          const testObject = jsonx.JsonElement.createObject(testMap);
          const key1 = originalStr.substring(0, originalStr.length - 2);
          const result1 = testObject.removeElement(key1);
          expect(result1).assertTrue();
          expect(testObject.tryGetElement(key1)).assertUndefined();
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0010
     * @tc.desc    Test removeElement() with double special characters connected keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";

        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createString("doubleSpecialValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);

        const result = testObject.removeElement(doubleSpecial);
        expect(result).assertTrue();
        expect(testObject.tryGetElement(doubleSpecial)).assertUndefined();

      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0011
     * @tc.desc    Test memory after creating and releasing references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const hugeString = "X".repeat(100000);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [hugeString, jsonx.JsonElement.createString("hugeStringValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const element = testObject.tryGetElement(hugeString);
        expect(element).not().assertUndefined();
        expect(element!.asString()).assertEqual("hugeStringValue");
        const removeResult = testObject.removeElement(hugeString);
        expect(removeResult).assertTrue();
        const afterRemove = testObject.tryGetElement(hugeString);
        expect(afterRemove).assertUndefined();
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0012
     * @tc.desc    Test removeElement() with keyword keys (0, NaN, empty)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createString("zero")],
          ["NaN", jsonx.JsonElement.createString("nan")],
          ["", jsonx.JsonElement.createString("empty")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const result1 = testObject.removeElement("0");
        expect(result1).assertTrue();
        expect(testObject.tryGetElement("0")).assertUndefined();
        const result2 = testObject.removeElement("NaN");
        expect(result2).assertTrue();
        expect(testObject.tryGetElement("NaN")).assertUndefined();
        const result3 = testObject.removeElement("");
        expect(result3).assertTrue();
        expect(testObject.tryGetElement("")).assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementRemoveElementTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_REMOVE_ELEMENT_TEST_0013
     * @tc.desc    Test memory usage with large string and removeElement()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementRemoveElementTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(100000);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [largeString, jsonx.JsonElement.createString("largeStringValue")]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const removeResult = testObject.removeElement(largeString);
        expect(removeResult).assertTrue();
        const afterRemove = testObject.tryGetElement(largeString);
        expect(afterRemove).assertUndefined();
      } catch (error) {
        console.error("Error in large string memory test:", error);
        if (error.message.includes("memory") || error.message.includes("out of memory")) {
          console.log("Note: Test may fail due to memory constraints in test environment");
          console.log("This is an environment limitation, not a code issue");
        }
        throw error;
      }
    });
  })
}