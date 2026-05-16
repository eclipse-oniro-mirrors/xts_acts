/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
export default function builtinsJsonElementSetElementTest() {
  describe("builtinsJsonElementSetElementTest", () => {
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
     * @tc.name    builtinsJsonElementSetElementTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0001
     * @tc.desc    Test setElement() with undefined and null keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        testObject.setElement("undefined", jsonx.JsonElement.createString("undefinedValue"));
        expect(testObject.tryGetElement("undefined")!.asString()).assertEqual("undefinedValue");
        testObject.setElement("null", jsonx.JsonElement.createString("nullValue"));
        expect(testObject.tryGetElement("null")!.asString()).assertEqual("nullValue");
        testObject.setElement("", jsonx.JsonElement.createString("emptyValue"));
        expect(testObject.tryGetElement("")!.asString()).assertEqual("emptyValue");
        expect(testObject.tryGetElement("undefined")).not().assertUndefined();
        expect(testObject.tryGetElement("null")).not().assertUndefined();
        expect(testObject.tryGetElement("")).not().assertUndefined();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0002
     * @tc.desc    Test setElement() with special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          if (i % 4 === 0) {
            testObject.setElement(chars, jsonx.JsonElement.createString(`str_${i}`));
          } else if (i % 4 === 1) {
            testObject.setElement(chars, jsonx.JsonElement.createInteger(i));
          } else if (i % 4 === 2) {
            testObject.setElement(chars, jsonx.JsonElement.createBoolean(i % 2 === 0));
          } else {
            testObject.setElement(chars, jsonx.JsonElement.createDouble(i * 0.5));
          }
        }
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          const value = testObject.tryGetElement(chars);
          expect(value).not().assertUndefined();
          if (i % 4 === 0) {
            expect(value!.asString()).assertEqual(`str_${i}`);
          } else if (i % 4 === 1) {
            expect(value!.asInteger()).assertEqual(i);
          } else if (i % 4 === 2) {
            expect(value!.asBoolean()).assertEqual(i % 2 === 0);
          } else {
            expect(value!.asDouble()).assertEqual(i * 0.5);
          }
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0003
     * @tc.desc    Test setElement() with ASCII character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        testObject.setElement("0123456789", jsonx.JsonElement.createString("digits"));
        expect(testObject.tryGetElement("0123456789")!.asString()).assertEqual("digits");
        testObject.setElement("ABCDEFGHIJKLMNOPQRSTUVWXYZ", jsonx.JsonElement.createString("uppercase"));
        expect(testObject.tryGetElement("ABCDEFGHIJKLMNOPQRSTUVWXYZ")!.asString()).assertEqual("uppercase");
        testObject.setElement("abcdefghijklmnopqrstuvwxyz", jsonx.JsonElement.createString("lowercase"));
        expect(testObject.tryGetElement("abcdefghijklmnopqrstuvwxyz")!.asString()).assertEqual("lowercase");
        const fullAscii = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        testObject.setElement(fullAscii, jsonx.JsonElement.createString("fullAscii"));
        expect(testObject.tryGetElement(fullAscii)!.asString()).assertEqual("fullAscii");
        const mixedAscii = "!\"#ABC123def$%&";
        testObject.setElement(mixedAscii, jsonx.JsonElement.createInteger(12345));
        expect(testObject.tryGetElement(mixedAscii)!.asInteger()).assertEqual(12345);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0004
     * @tc.desc    Test setElement() with double special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        testObject.setElement(doubleSpecial, jsonx.JsonElement.createString("doubleSpecialString"));
        expect(testObject.tryGetElement(doubleSpecial)!.asString()).assertEqual("doubleSpecialString");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0005
     * @tc.desc    Test setElement() with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        const octalChar = String.fromCharCode((parseInt("101", 8) as number).toInt());
        testObject.setElement(octalChar, jsonx.JsonElement.createString("octal101"));
        expect(testObject.tryGetElement(octalChar)!.asString()).assertEqual("octal101");
        const hexChar = "\x42";
        testObject.setElement(hexChar, jsonx.JsonElement.createString("hex42"));
        expect(testObject.tryGetElement(hexChar)!.asString()).assertEqual("hex42");
        const escapeSequences = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", '\\"', "\\?", "\\0"];
        const expectedValues = ["响铃", "退格", "换页", "换行", "回车", "水平制表", "垂直制表", "反斜杠", "单引号", "双引号", "问号", "空字符"];
        for (let i = 0; i < escapeSequences.length; i++) {
          testObject.setElement(escapeSequences[i], jsonx.JsonElement.createString(expectedValues[i]));
          expect(testObject.tryGetElement(escapeSequences[i])!.asString()).assertEqual(expectedValues[i]);
        }
        const octalStr = "\\123";
        testObject.setElement(octalStr, jsonx.JsonElement.createInteger(123));
        expect(testObject.tryGetElement(octalStr)!.asInteger()).assertEqual(123);
        const hexStr = "\\x41";
        testObject.setElement(hexStr, jsonx.JsonElement.createString("letterA"));
        expect(testObject.tryGetElement(hexStr)!.asString()).assertEqual("letterA");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0006
     * @tc.desc    Test setElement() with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        const illegalUnicodes = ["\\udc04", "\\ud83d", "\\udff4"];
        for (let i = 0; i < illegalUnicodes.length; i++) {
          const illegal = illegalUnicodes[i];
          testObject.setElement(illegal, jsonx.JsonElement.createString(`illegal_${i}`));
          expect(testObject.tryGetElement(illegal)!.asString()).assertEqual(`illegal_${i}`);
          testObject.setElement(illegal, jsonx.JsonElement.createInteger(1000 + i));
          expect(testObject.tryGetElement(illegal)!.asInteger()).assertEqual(1000 + i);
          testObject.setElement(illegal, jsonx.JsonElement.createBoolean(i % 2 === 0));
          expect(testObject.tryGetElement(illegal)!.asBoolean()).assertEqual(i % 2 === 0);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0007
     * @tc.desc    Test setElement() with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        testObject.setElement("0", jsonx.JsonElement.createString("zero"));
        expect(testObject.tryGetElement("0")!.asString()).assertEqual("zero");
        testObject.setElement("NaN", jsonx.JsonElement.createDouble(NaN));
        const nanValue = testObject.tryGetElement("NaN");
        expect(nanValue).not().assertUndefined();
        expect(isNaN(nanValue!.asDouble())).assertTrue();
        testObject.setElement("", jsonx.JsonElement.createBoolean(true));
        expect(testObject.tryGetElement("")!.asBoolean()).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0008
     * @tc.desc    Test setElement() with treeString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        const treeJsonKey = init(100);
        const normalStringKey = "x".repeat(100);
        testObject.setElement(treeJsonKey, jsonx.JsonElement.createString("treeJsonValue"));
        expect(testObject.tryGetElement(treeJsonKey)!.asString()).assertEqual("treeJsonValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0009
     * @tc.desc    Test setElement() with sliceString type keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const originalStr = "{k1:value1,k2:value2}";
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        for (let i = 0; i < 10; i++) {
          const keyToRemove = originalStr.substring(0, originalStr.length - 2);
          testObject.setElement(keyToRemove, jsonx.JsonElement.createString(`iteration_${i}`));
          expect(testObject.tryGetElement(keyToRemove)!.asString()).assertEqual(`iteration_${i}`);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0010
     * @tc.desc    Test setElement() with large memory intensive keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        const hugeString = "X".repeat(100000);
        testObject.setElement(hugeString, jsonx.JsonElement.createString("hugeStringValue"));
        const element = testObject.tryGetElement(hugeString);
        expect(element).not().assertUndefined();
        expect(element!.asString()).assertEqual("hugeStringValue");
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
     * @tc.name    builtinsJsonElementSetElementTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0011
     * @tc.desc    Test setElement() method GC behavior with large strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const createAndRelease = () => {
          const largeStringKey = "a".repeat(10000);
          const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
          testObject.setElement(largeStringKey, jsonx.JsonElement.createString("largeValue"));
          const value = testObject.$_get(largeStringKey);
          expect(value.asString()).assertEqual("largeValue");
          testObject.removeElement(largeStringKey);
          expect(testObject.tryGetElement(largeStringKey)).assertUndefined();
          return testObject;
        };
        for (let i = 0; i < 5; i++) {
          const obj = createAndRelease();
          expect(obj).not().assertUndefined();
        }
        const finalObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        finalObject.setElement("finalKey", jsonx.JsonElement.createString("finalValue"));
        expect(finalObject.$_get("finalKey").asString()).assertEqual("finalValue");
      } catch (error) {
        console.error("Error in setElement GC test:", error);
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementSetElementTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_SET_ELEMENT_TEST_0012
     * @tc.desc    Test setElement() method with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetElementTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        for (let i = 0; i < unicodeKeys.length; i++) {
          testObject.setElement(unicodeKeys[i], jsonx.JsonElement.createString(`unicode_value_${i}`));
        }
        for (let i = 0; i < unicodeKeys.length; i++) {
          const value = testObject.$_get(unicodeKeys[i]).asString();
          expect(value).assertEqual(`unicode_value_${i}`);
        }
        testObject.setElement("\\ud83d\\udc46", jsonx.JsonElement.createString("modified_value"));
        expect(testObject.$_get("\\ud83d\\udc46").asString()).assertEqual("modified_value");
      } catch (error) {
        throw error;
      }
    });
  })
}