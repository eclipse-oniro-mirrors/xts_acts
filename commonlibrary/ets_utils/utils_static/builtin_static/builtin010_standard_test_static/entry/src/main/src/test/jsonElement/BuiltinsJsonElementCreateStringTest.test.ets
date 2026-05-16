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
function initTreeString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}
export default function builtinsJsonElementCreateStringTest() {
  describe("builtinsJsonElementCreateStringTest", () => {
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
     * @tc.name    builtinsJsonElementCreateStringTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0001
     * @tc.desc    Test JsonElement.createString with undefined string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createString("undefined");
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual("undefined");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0002
     * @tc.desc    Test JsonElement.createString with null string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createString("null");
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual("null");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0003
     * @tc.desc    Test JsonElement.createString with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createString("");
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual("");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0004
     * @tc.desc    Test JsonElement.createString with all special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const element = jsonx.JsonElement.createString(specialChars);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual(specialChars);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0005
     * @tc.desc    Test JsonElement.createString with all ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const asciiChars = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        const element = jsonx.JsonElement.createString(asciiChars);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual(asciiChars);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0006
     * @tc.desc    Test JsonElement.createString with repeated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const repeatedSpecial = " !!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const element = jsonx.JsonElement.createString(repeatedSpecial);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual(repeatedSpecial);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0007
     * @tc.desc    Test JsonElement.createString with all escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeChars = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\101\\x41";
        const element = jsonx.JsonElement.createString(escapeChars);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString()).assertEqual(escapeChars);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0008
     * @tc.desc    Test JsonElement.createString with Unicode emoji and their codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const codes = ["\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf", "\\ud83c\\udf85",
          "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87", "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"];
        for (let i = 0; i < codes.length; i++) {
          const element = jsonx.JsonElement.createString(codes[i]);
          expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
          expect(element.asString()).assertEqual(codes[i]);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0009
     * @tc.desc    Test JsonElement.createString with illegal Unicode encodings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const illegalCodes = ["\\udc04", "\\ud83d", "\\udff4"];
        for (let i = 0; i < illegalCodes.length; i++) {
          const element = jsonx.JsonElement.createString(illegalCodes[i]);
          expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
          expect(element.asString()).assertEqual(illegalCodes[i]);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0010
     * @tc.desc    Test JsonElement.createString with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const keywords = ["0", "NaN", ""];
        for (let i = 0; i < keywords.length; i++) {
          const element = jsonx.JsonElement.createString(keywords[i]);
          expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
          expect(element.asString()).assertEqual(keywords[i]);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0011
     * @tc.desc    Test JsonElement.createString with tree string vs normal string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const normalString = "normal test string";
        const normalElement = jsonx.JsonElement.createString(normalString);
        expect(normalElement.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(normalElement.asString()).assertEqual(normalString);
        const treeString = initTreeString(100);
        const treeElement = jsonx.JsonElement.createString(treeString);
        expect(treeElement.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(treeElement.asString()).assertEqual(treeString);
        console.info(`Normal string length: ${normalString.length}`);
        console.info(`Tree string length: ${treeString.length}`);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0012
     * @tc.desc    Test JsonElement.createString with sliced string multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const result = str.substring(0, str.length - 2);
        for (let i = 0; i < 10; i++) {
          const element = jsonx.JsonElement.createString(result);
          expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
          expect(element.asString()).assertEqual(result);
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0013
     * @tc.desc    Test JsonElement.createString with very large string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(1000);
        const element = jsonx.JsonElement.createString(largeString);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(element.asString().length).assertEqual(1000);
        expect(element.asString()).assertEqual(largeString);
        console.info(`Large string length: ${largeString.length}`);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateStringTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_STRING_TEST_0014
     * @tc.desc    Test JsonElement.createString garbage collection with large strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateStringTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        {
          const largeString = "x".repeat(10000);
          const element = jsonx.JsonElement.createString(largeString);
          expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
          expect(element.asString()).assertEqual(largeString);
        }
        const secondString = "y".repeat(5000);
        const secondElement = jsonx.JsonElement.createString(secondString);
        expect(secondElement.jsonType).assertEqual(jsonx.JsonType.JsonString);
        expect(secondElement.asString()).assertEqual(secondString);
        console.info("String creation and garbage collection test completed");
      } catch (error) { throw error; }
    });
  })
}