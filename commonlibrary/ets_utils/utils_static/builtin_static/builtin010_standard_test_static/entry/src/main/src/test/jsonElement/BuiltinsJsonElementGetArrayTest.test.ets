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
export default function builtinsJsonElementGetArrayTest() {
  describe("builtinsJsonElementGetArrayTest", () => {
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
     * @tc.name    builtinsJsonElementGetArrayTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0001
     * @tc.desc    Test getArray() method with valid array value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["undefined", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("undefinedArrayItem1"),
          ])],
          ["null", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("nullArrayItem1"),
          ])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const undefinedArray = testObject.getArray("undefined");
        expect(undefinedArray[0].asString()).assertEqual("undefinedArrayItem1");
        const nullArray = testObject.getArray("null");
        expect(nullArray[0].asString()).assertEqual("nullArrayItem1");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0002
     * @tc.desc    Test getArray() method with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("emptyKeyValue")
          ])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const array = testObject.getArray("");
        expect(array[0].asString()).assertEqual("emptyKeyValue");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0003
     * @tc.desc    Test getArray() method with special character keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialCharsStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const testMap = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          testMap.set(chars, jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString(`special_chars_${i}`)
          ]));
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < specialCharsStr.length; i++) {
          const chars = specialCharsStr.substring(i, i + 1);
          const array = testObject.getArray(chars);
          expect(array[0].asString()).assertEqual(`special_chars_${i}`);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0004
     * @tc.desc    Test getArray() method with ASCII characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("digits")
          ])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const digitsArray = testObject.getArray("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
        expect(digitsArray[0].asString()).assertEqual("digits");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0005
     * @tc.desc    Test getArray() method with double special characters keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const testMap = new Map<string, jsonx.JsonElement>([
          [doubleSpecial, jsonx.JsonElement.createArray([
            jsonx.JsonElement.createInteger(42)
          ])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const array = testObject.getArray(doubleSpecial);
        expect(array[0].asInteger()).assertEqual(42);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0006
     * @tc.desc    Test getArray() method with escape sequence keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0006', (TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0) as int, () => {
      try {
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        testMap.set("\n", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("newline")]));
        testMap.set("\t", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("tab")]));
        testMap.set("\r", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("carriageReturn")]));
        testMap.set("\\", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("backslash")]));
        testMap.set("\"", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("doubleQuote")]));
        testMap.set("'", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("singleQuote")]));
        testMap.set("\b", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("backspace")]));
        testMap.set("\f", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("formFeed")]));
        testMap.set("\v", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("verticalTab")]));
        testMap.set("\?", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("questionMark")]));
        testMap.set("\0", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("nullChar")]));
        const octalKey = String.fromCharCode((parseInt("101", 8) as number).toInt());
        testMap.set(octalKey, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("octal101")]));
        const hexKey = String.fromCharCode((parseInt("42", 16) as number).toInt());
        testMap.set(hexKey, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("hex41")]));
        const testObject = jsonx.JsonElement.createObject(testMap);
        expect(testObject.getArray("\n")[0].asString()).assertEqual("newline");
        expect(testObject.getArray("\t")[0].asString()).assertEqual("tab");
        const array3 = testObject.getArray("\r");
        expect(array3[0].asString()).assertEqual("carriageReturn");
        expect(testObject.getArray("\\")[0].asString()).assertEqual("backslash");
        expect(testObject.getArray("\"")[0].asString()).assertEqual("doubleQuote");
        expect(testObject.getArray("'")[0].asString()).assertEqual("singleQuote");
        expect(testObject.getArray("\b")[0].asString()).assertEqual("backspace");
        expect(testObject.getArray("\f")[0].asString()).assertEqual("formFeed");
        expect(testObject.getArray("\v")[0].asString()).assertEqual("verticalTab");
        expect(testObject.getArray("\?")[0].asString()).assertEqual("questionMark");
        expect(testObject.getArray("\0")[0].asString()).assertEqual("nullChar");
        const octalChar = String.fromCharCode((parseInt("101", 8) as number).toInt());
        const array12 = testObject.getArray(octalChar);
        expect(array12[0].asString()).assertEqual("octal101");
        expect(octalChar).assertEqual("A");
        const hexChar = String.fromCharCode((parseInt("42", 16) as number).toInt());
        const array13 = testObject.getArray(hexChar);
        expect(array13[0].asString()).assertEqual("hex41");
        expect("\x41").assertEqual("A");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0007
     * @tc.desc    Test getArray() method with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f",
          "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"
        ];
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
        for (let i = 0; i < unicodeKeys.length; i++) {
          if (i === 0) {
            testMap.set(unicodeKeys[i], jsonx.JsonElement.createArray([
              jsonx.JsonElement.createDouble(3.14)
            ]));
          } else {
            testMap.set(unicodeKeys[i], jsonx.JsonElement.createArray([
              jsonx.JsonElement.createString(`unicode_value_${i}`)
            ]));
          }
        }
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let i = 0; i < unicodeKeys.length; i++) {
          const array = testObject.getArray(unicodeKeys[i]);
          if (i === 0) {
            expect(array[0].asDouble()).assertEqual(3.14);
          } else {
            expect(array[0].asString()).assertEqual(`unicode_value_${i}`);
          }
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0008
     * @tc.desc    Test getArray() method with illegal Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["\\udc04", jsonx.JsonElement.createArray([jsonx.JsonElement.createNull()])],
          ["\\ud83d", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("illegalUnicode2")])],
          ["\\udff4", jsonx.JsonElement.createArray([jsonx.JsonElement.createString("illegalUnicode3")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const array1 = testObject.getArray("\\udc04");
        expect(array1[0].jsonType).assertEqual(jsonx.JsonType.JsonNull);
        const array2 = testObject.getArray("\\ud83d");
        expect(array2[0].asString()).assertEqual("illegalUnicode2");
        const array3 = testObject.getArray("\\udff4");
        expect(array3[0].asString()).assertEqual("illegalUnicode3");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0009
     * @tc.desc    Test getArray() method with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["0", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createUndefined()
          ])],
          ["NaN", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("nanKey")
          ])],
          ["", jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("undefinedKey")
          ])],
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const array1 = testObject.getArray("0");
        expect(array1[0].jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        const array2 = testObject.getArray("NaN");
        expect(array2[0].asString()).assertEqual("nanKey");
        const array3 = testObject.getArray("");
        expect(array3[0].asString()).assertEqual("undefinedKey");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0010
     * @tc.desc    Test getArray() method failure test case with try-catch (non-array value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>([
          ["stringKey", jsonx.JsonElement.createString("not an array")],
          ["numberKey", jsonx.JsonElement.createInteger(42)],
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const testKeys = ["stringKey", "numberKey"];
        for (const key of testKeys) {
          let errorCaught = false;
          try {
            testObject.getArray(key);
            expect(false).assertTrue();
          } catch (error) {
            errorCaught = true;
            expect(error instanceof jsonx.JsonTypeError).assertTrue();
            expect(error.message).assertEqual("The value associated with the key is not an array.");
          }
          expect(errorCaught).assertTrue();
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0011
     * @tc.desc    Test getArray() performance with tree structure JSON string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const treeJsonKey = init(100);
        const normalStringKey = "x".repeat(100);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [treeJsonKey, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("treeJsonValue")])],
          [normalStringKey, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("normalStringValue")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const treeJsonArray = testObject.getArray(treeJsonKey);
        expect(treeJsonArray[0].asString()).assertEqual("treeJsonValue");
        expect(treeJsonKey.length >= 100).assertTrue();
        expect(treeJsonKey.startsWith("[")).assertTrue();
        expect(treeJsonKey.endsWith("]")).assertTrue();
        const normalStringArray = testObject.getArray(normalStringKey);
        expect(normalStringArray[0].asString()).assertEqual("normalStringValue");
        expect(normalStringKey.length).assertEqual(100);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0012
     * @tc.desc    Test getArray() with progressive substring keys in loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const result = str.substring(0, str.length - 2);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [result, jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("expected_value")
          ])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        for (let loop = 0; loop < 30; loop++) {
          const array = testObject.getArray(result);
          expect(array[0].asString()).assertEqual("expected_value");
        }
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0013
     * @tc.desc    Test getArray() with extremely large string keys and check memory usage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(10000);
        const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
          [largeString, jsonx.JsonElement.createArray([jsonx.JsonElement.createString("largeStringValue")])]
        ]);
        const testObject = jsonx.JsonElement.createObject(testMap);
        const array = testObject.getArray(largeString);
        expect(array[0].asString()).assertEqual("largeStringValue");
        expect(largeString.length).assertEqual(10000);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementGetArrayTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_GET_ARRAY_TEST_0014
     * @tc.desc    Test memory pressure by creating large strings in nested scopes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetArrayTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const createInScope = (size: number, id: number) => {
        const scopedString: string = "z".repeat(size.toInt()) + id;
          const testMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>([
            [scopedString, jsonx.JsonElement.createArray([jsonx.JsonElement.createString(`scoped${id}`)])]
          ]);
          const testObject = jsonx.JsonElement.createObject(testMap);
          return testObject.getArray(scopedString)[0].asString();
        };
        const sizes: int[] = [1000, 5000, 10000, 20000];
        for (let i = 0; i < sizes.length; i++) {
          const result = createInScope(sizes[i], i);
          expect(result).assertEqual(`scoped${i}`);
        }
      } catch (error) { throw error; }
    });
  })
}