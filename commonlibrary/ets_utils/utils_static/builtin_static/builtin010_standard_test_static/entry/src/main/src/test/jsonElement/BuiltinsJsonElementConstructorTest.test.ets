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

export default function builtinsJsonElementConstructorTest() {
  describe("builtinsJsonElementConstructorTest", () => {
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
     * @tc.name    builtinsJsonElementConstructorTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0001
     * @tc.desc    Test JsonElement default parameterless constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = new jsonx.JsonElement();
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        expect(element.jsonKey).assertEqual("");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0002
     * @tc.desc    Test multiple JsonElement default constructor instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element1 = new jsonx.JsonElement();
        const element2 = new jsonx.JsonElement();
        const element3 = new jsonx.JsonElement();
        expect(element1.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        expect(element2.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        expect(element3.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0003
     * @tc.desc    Test JsonElement default constructor creates independent instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element1 = new jsonx.JsonElement();
        const element2 = new jsonx.JsonElement();
        element1.setString("test");
        expect(element1.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element2.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0004
     * @tc.desc    Test JsonElement default constructor after modification and reset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = new jsonx.JsonElement();
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        element.setString("test");
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        element.setUndefined();
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0005
     * @tc.desc    Test JsonElement default constructor instance properties
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = new jsonx.JsonElement();
        expect(element instanceof jsonx.JsonElement).assertTrue();
        expect(typeof element.setString).assertEqual("function");
        expect(typeof element.setInteger).assertEqual("function");
        expect(typeof element.setUndefined).assertEqual("function");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0006
     * @tc.desc    Test JsonElement default constructor with no parameters required
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = new jsonx.JsonElement();
        expect(element).not().assertNull();
        expect(element).not().assertUndefined();
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0007
     * @tc.desc    Test JsonElement copy constructor with string element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = jsonx.JsonElement.createString("test");
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(copy.asString()).assertEqual("test");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0008
     * @tc.desc    Test JsonElement copy constructor with integer element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = jsonx.JsonElement.createInteger(123);
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(copy.asInteger()).assertEqual(123);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0009
     * @tc.desc    Test JsonElement copy constructor with double element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = jsonx.JsonElement.createDouble(123.456);
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(copy.asDouble()).assertEqual(123.456);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0010
     * @tc.desc    Test JsonElement copy constructor with boolean element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = jsonx.JsonElement.createBoolean(true);
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
        expect(copy.asBoolean()).assertTrue();
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0011
     * @tc.desc    Test JsonElement copy constructor with undefined element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = jsonx.JsonElement.createUndefined();
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0012
     * @tc.desc    Test JsonElement copy constructor with array element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const array = [
          jsonx.JsonElement.createString("item1"),
          jsonx.JsonElement.createInteger(2)
        ];
        const original = jsonx.JsonElement.createArray(array);
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        expect(copy.asArray().length).assertEqual(2);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0013
     * @tc.desc    Test JsonElement copy constructor independence (modify original)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = jsonx.JsonElement.createString("original");
        const copy = new jsonx.JsonElement(original);
        original.setString("modified");
        expect(copy.asString()).assertEqual("original");
        expect(original.asString()).assertEqual("modified");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0014
     * @tc.desc    Test JsonElement copy constructor with nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const nestedArray = [
          jsonx.JsonElement.createArray([
            jsonx.JsonElement.createString("nested")
          ])
        ];
        const original = jsonx.JsonElement.createArray(nestedArray);
        const copy = new jsonx.JsonElement(original);
        expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        expect(copy.asArray().length).assertEqual(1);
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0015
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0015
     * @tc.desc    Test JsonElement copy constructor chain copying
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element1 = jsonx.JsonElement.createString("level1");
        const element2 = new jsonx.JsonElement(element1);
        const element3 = new jsonx.JsonElement(element2);
        expect(element1.asString()).assertEqual("level1");
        expect(element2.asString()).assertEqual("level1");
        expect(element3.asString()).assertEqual("level1");
      } catch (error) {
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0016
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0016
     * @tc.desc    Test JsonElement copy constructor with object element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map = new Map<string, jsonx.JsonElement>();
      map.set("name", jsonx.JsonElement.createString("John"));
      map.set("age", jsonx.JsonElement.createInteger(30));
      const original = jsonx.JsonElement.createObject(map);
      const copy = new jsonx.JsonElement(original);
      expect(copy.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      expect(copy.getString("name")).assertEqual("John");
      expect(copy.getInteger("age")).assertEqual(30);
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0017
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0017
     * @tc.desc    Test JsonElement constructor with undefined key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "undefined": jsonx.JsonElement.createString("test_undefined"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement("undefined").asString()).assertEqual("test_undefined");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0018
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0018
     * @tc.desc    Test JsonElement constructor with null key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "null": jsonx.JsonElement.createString("test_null"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement("null").asString()).assertEqual("test_null");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0019
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0019
     * @tc.desc    Test JsonElement constructor with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "": jsonx.JsonElement.createString("test_empty"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement("").asString()).assertEqual("test_empty");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0020
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0020
     * @tc.desc    Test JsonElement constructor with special characters key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~": jsonx.JsonElement.createString("test_special"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~").asString()).assertEqual("test_special");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0021
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0021
     * @tc.desc    Test JsonElement constructor with full ASCII key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~":
          jsonx.JsonElement.createString("test_ascii"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~")
          .asString()).assertEqual("test_ascii");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0022
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0022
     * @tc.desc    Test JsonElement constructor with special characters double key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~":
          jsonx.JsonElement.createString("test_special_double"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement(" !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~")
          .asString()).assertEqual("test_special_double");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0023
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0023
     * @tc.desc    Test JsonElement constructor with escape sequence keys (as one test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeKeys = [
          "\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v",
          "\\\\", "\\'", "\\\"", "\\?", "\\0", "\\141", "\\x42"
        ];
        const record: Record<string, jsonx.JsonElement> = {};
        escapeKeys.forEach((key, index) => {
          record[key] = jsonx.JsonElement.createString(`test_${index}`);
        });
        const element = new jsonx.JsonElement(record);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        escapeKeys.forEach((key, index) => {
          expect(element.getElement(key).asString()).assertEqual(`test_${index}`);
        });
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0024
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0024
     * @tc.desc    Test JsonElement constructor with Unicode encoding keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodeKeys = [
          "\ud83d\udc46", "\ud83d\udc7f", "\ud83d\udc40", "\ud83d\udcaf",
          "\ud83c\udf85", "\ud83d\ude3c", "\ud83d\udd27", "\ud83d\udc87",
          "\ud83e\udd3c\u200d\u2642\ufe0f", "\ud83d\udee2", "\ud83c\udc04", "\ud83c\udff4"
        ];
        const record: Record<string, jsonx.JsonElement> = {};
        unicodeKeys.forEach((key, index) => {
          record[key] = jsonx.JsonElement.createString(`test_unicode_${index}`);
        });
        const element = new jsonx.JsonElement(record);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        unicodeKeys.forEach((key, index) => {
          expect(element.getElement(key).asString()).assertEqual(`test_unicode_${index}`);
        });
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0025
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0025
     * @tc.desc    Test JsonElement constructor with invalid Unicode keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "\udc04": jsonx.JsonElement.createString("test_invalid1"),
          "\ud83d": jsonx.JsonElement.createString("test_invalid2"),
          "\udff4": jsonx.JsonElement.createString("test_invalid3"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);

        expect(element.getElement("\udc04").asString()).assertEqual("test_invalid1");
        expect(element.getElement("\ud83d").asString()).assertEqual("test_invalid2");
        expect(element.getElement("\udff4").asString()).assertEqual("test_invalid3");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0026
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0026
     * @tc.desc    Test JsonElement constructor with keyword keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const record: Record<string, jsonx.JsonElement> = {
          "0": jsonx.JsonElement.createString("test_zero"),
          "NaN": jsonx.JsonElement.createString("test_nan"),
          "": jsonx.JsonElement.createString("test_empty_string"),
        };
        const element = new jsonx.JsonElement(record);

        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);

        expect(element.getElement("0").asString()).assertEqual("test_zero");
        expect(element.getElement("NaN").asString()).assertEqual("test_nan");
        expect(element.getElement("").asString()).assertEqual("test_empty_string");
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0027
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0027
     * @tc.desc    Test JsonElement constructor with treeString type key and performance comparison
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const createTreeString = (size: number): string => {
        let result = '[';
        while (result.length < size) {
          result += '{"a":1},';
        }
        result += '{"a":1}]';
        return result;
      };
      try {
        const treeString = createTreeString(100);
        const normalString = "normal_string_key";
        const iterations = 100;
        let treeStartTime = Date.now();
        for (let i = 0; i < iterations; i++) {
          let tempRecord: Record<string, jsonx.JsonElement> = {};
          tempRecord[treeString] = jsonx.JsonElement.createString("test_tree_string");
          let tempElement = new jsonx.JsonElement(tempRecord);
          expect(tempElement.getElement(treeString).asString()).assertEqual("test_tree_string");
        }
        let treeEndTime = Date.now();
        let treeDuration = treeEndTime - treeStartTime;
        let normalStartTime = Date.now();
        for (let i = 0; i < iterations; i++) {
          let tempRecord: Record<string, jsonx.JsonElement> = {};
          tempRecord[normalString] = jsonx.JsonElement.createString("test_normal_string");
          let tempElement = new jsonx.JsonElement(tempRecord);
          expect(tempElement.getElement(normalString).asString()).assertEqual("test_normal_string");
        }
        let normalEndTime = Date.now();
        let normalDuration = normalEndTime - normalStartTime;
        console.info(`Tree string performance test (${iterations} iterations):`);
        console.info(`  Tree string duration: ${treeDuration}ms`);
        console.info(`  Normal string duration: ${normalDuration}ms`);
        console.info(`  Performance difference: ${treeDuration - normalDuration}ms`);
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0028
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0028
     * @tc.desc    Test JsonElement constructor with sliceString type key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const original = "{k1:value1,k2:value2}";
        const sliced = original.substring(0, original.length - 2);
        expect(sliced).assertEqual("{k1:value1,k2:value");
        const elements: jsonx.JsonElement[] = [];
        for (let i = 0; i < 10; i++) {
          const record: Record<string, jsonx.JsonElement> = {};
          const value = "test_value_" + i;
          record[sliced] = jsonx.JsonElement.createString(value);
          const element = new jsonx.JsonElement(record);
          expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
          expect(element.getElement(sliced).asString()).assertEqual(value);
        }} catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0029
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0029
     * @tc.desc    Test JsonElement constructor with large string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(100000);
        const record: Record<string, jsonx.JsonElement> = {};
        record[largeString] = jsonx.JsonElement.createString("test_large_string_key");
        const element = new jsonx.JsonElement(record);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(element.getElement(largeString).asString()).assertEqual("test_large_string_key");
        expect(largeString.length).assertEqual(100000);
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementConstructorTest0030
     * @tc.number  BUILTINS_JSON_ELEMENT_CONSTRUCTOR_TEST_0030
     * @tc.desc    Test JsonElement constructor with GC behavior for large strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementConstructorTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const elements: jsonx.JsonElement[] = [];
        for (let i = 0; i < 3; i++) {
          const largeString = "test_large_" + i + "_".repeat(800);
          const record: Record<string, jsonx.JsonElement> = {};
          record[largeString] = jsonx.JsonElement.createString("value_" + i);
          elements.push(new jsonx.JsonElement(record));
        }
        expect(elements.length).assertEqual(3);
        elements.length = 0;
        const finalLargeString = "final_large_string_".repeat(50);
        const finalRecord: Record<string, jsonx.JsonElement> = {};
        finalRecord[finalLargeString] = jsonx.JsonElement.createString("final_test_value");
        const finalElement = new jsonx.JsonElement(finalRecord);
        expect(finalElement.getElement(finalLargeString).asString()).assertEqual("final_test_value");
      } catch (error) {
        expect(false).assertTrue();
      }
    });
  })
}