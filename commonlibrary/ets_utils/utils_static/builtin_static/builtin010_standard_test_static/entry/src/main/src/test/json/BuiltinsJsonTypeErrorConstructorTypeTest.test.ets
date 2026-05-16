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
export default function builtinsJsonTypeErrorConstructorTest() {
  describe("builtinsJsonTypeErrorConstructorTest", () => {
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
     * @tc.name    builtinsJsonTypeErrorConstructorTest0001
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0001
     * @tc.desc    Test JsonTypeError constructor with undefined string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const error = new jsonx.JsonTypeError("undefined");
        expect(error.message).assertEqual("undefined");
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0002
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0002
     * @tc.desc    Test JsonTypeError constructor with null string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const error = new jsonx.JsonTypeError("null");
        expect(error.message).assertEqual("null");
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0003
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0003
     * @tc.desc    Test JsonTypeError constructor with empty string message
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const error = new jsonx.JsonTypeError("");
        expect(error.message).assertEqual("");
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0004
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0004
     * @tc.desc    Test JsonTypeError constructor with all special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const error = new jsonx.JsonTypeError(specialChars);
        expect(error.message).assertEqual(specialChars);
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0005
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0005
     * @tc.desc    Test JsonTypeError constructor with all ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const asciiChars = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        const error = new jsonx.JsonTypeError(asciiChars);
        expect(error.message).assertEqual(asciiChars);
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0006
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0006
     * @tc.desc    Test JsonTypeError constructor with repeated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const repeatedSpecial = " !!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const error = new jsonx.JsonTypeError(repeatedSpecial);
        expect(error.message).assertEqual(repeatedSpecial);
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0007
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0007
     * @tc.desc    Test JsonTypeError constructor with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeChars = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\101\\x41";
        const error = new jsonx.JsonTypeError(escapeChars);
        expect(error.message).assertEqual(escapeChars);
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0008
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0008
     * @tc.desc    Test JsonTypeError constructor with various Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const unicodes = ['\\ud83d\\udc46', '\\ud83d\\udc7f', '\\ud83d\\udc40', '\\ud83d\\udcaf', '\\ud83c\\udf85', '\\ud83d\\ude3c', '\\ud83d\\udd27',
          '\\ud83d\\udc87', '\\ud83e\\udd3c\\u200d\\u2642\\ufe0f', '\\ud83d\\udee2', '\\ud83c\\udc04', '\\ud83c\\udff4'];
        for (let i = 0; i < unicodes.length; i++) {
          const error = new jsonx.JsonTypeError(unicodes[i]);
          expect(error.message).assertEqual(unicodes[i]);
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0009
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0009
     * @tc.desc    Test JsonTypeError constructor with illegal Unicode encodings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const illegalUnicodes = ['\\udc04', '\\ud83d', '\\udff4'];
        for (let i = 0; i < illegalUnicodes.length; i++) {
          const error = new jsonx.JsonTypeError(illegalUnicodes[i]);
          expect(error.message).assertEqual(illegalUnicodes[i]);
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0010
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0010
     * @tc.desc    Test JsonTypeError constructor with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const keywords = ["0", "NaN", ""];
        for (let i = 0; i < keywords.length; i++) {
          const error = new jsonx.JsonTypeError(keywords[i]);
          expect(error.message).assertEqual(keywords[i]);
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0011
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0011
     * @tc.desc    Test JsonTypeError constructor with large tree string vs normal string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const normalString = "test string for comparison";
        const normalStringError = new jsonx.JsonTypeError(normalString);
        expect(normalStringError.message).assertEqual(normalString);
        expect(normalStringError instanceof jsonx.JsonTypeError).assertTrue();
        const treeString = initTreeString(100);
        const treeStringError = new jsonx.JsonTypeError(treeString);
        expect(treeStringError.message).assertEqual(treeString);
        expect(treeStringError instanceof jsonx.JsonTypeError).assertTrue();
        console.info(`Normal string length: ${normalString.length}`);
        console.info(`Tree string length: ${treeString.length}`);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0012
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0012
     * @tc.desc    Test JsonTypeError constructor with sliced string multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const str = "{k1:value1,k2:value2}";
        const result = str.substring(0, str.length - 2);
        for (let i = 0; i < 10; i++) {
          const error = new jsonx.JsonTypeError(result);
          expect(error.message).assertEqual(result);
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0013
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0013
     * @tc.desc    Test JsonTypeError constructor with large string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largeString = "a".repeat(1000);
        const error = new jsonx.JsonTypeError(largeString);
        expect(error.message).assertEqual(largeString);
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
        console.info(`Large string length: ${largeString.length}`);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonTypeErrorConstructorTest0014
     * @tc.number  BUILTINS_JSON_TYPE_ERROR_CONSTRUCTOR_TEST_0014
     * @tc.desc    Test JsonTypeError constructor garbage collection with large strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonTypeErrorConstructorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        {
          const largeString = "x".repeat(10000);
          const error = new jsonx.JsonTypeError(largeString);
          expect(error.message).assertEqual(largeString);
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
        const secondString = "y".repeat(5000);
        const secondError = new jsonx.JsonTypeError(secondString);
        expect(secondError.message).assertEqual(secondString);
        expect(secondError instanceof jsonx.JsonTypeError).assertTrue();
      } catch (error) { throw error; }
    });
  })
}