/*
* Copyright (c) 2026 RKH Corp.
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

export default function BuiltinsJsonElementTryGetLongTest() {
  describe("BuiltinsJsonElementTryGetLongTest", () => {
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
     * @tc.name    builtinsJsonElementTryGetLongTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0100
     * @tc.desc    Verify tryGetLong with basic string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetLongTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('basicKey', jsonx.JsonElement.createLong(testValue));

      const result = objElement.tryGetLong('basicKey');
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0200
     * @tc.desc    Verify tryGetLong with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 67890;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('', jsonx.JsonElement.createLong(testValue));

      const result = objElement.tryGetLong('');
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0300
     * @tc.desc    Verify tryGetLong with special characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 98765;
      const objElement = new jsonx.JsonElement();

      const specialKey = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      objElement.setElement(specialKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.tryGetLong(specialKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0400
     * @tc.desc    Verify tryGetLong with repeated special characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 22222;
      const objElement = new jsonx.JsonElement();

      const repeatedSpecialKey = '!!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~';
      objElement.setElement(repeatedSpecialKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.tryGetLong(repeatedSpecialKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0500
     * @tc.desc    Verify tryGetLong with ASCII characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 11111;
      const objElement = new jsonx.JsonElement();

      const asciiKey = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      objElement.setElement(asciiKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.tryGetLong(asciiKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0600
     * @tc.desc    Verify tryGetLong with backslash in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 33333;
      const objElement = new jsonx.JsonElement();

      const escapeKeys = [
        'test' + String.fromCharCode(7) + 'key', 'test\bkey', 'test\fkey', 'test\nkey',
        'test\rkey', 'test\tkey', 'test' + String.fromCharCode(11) + 'key', 'test\\key',
        "test\'key", 'test\"key', 'test\?key', 'test\0key', 'test' + String.fromCharCode(43) + 'key',
        'test' + String.fromCharCode(83) + 'key', 'test' + String.fromCharCode(65) + 'key'
      ];

      for (const key of escapeKeys) {
        objElement.setElement(key, jsonx.JsonElement.createLong(testValue));
        const result = objElement.tryGetLong(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0700
     * @tc.desc    Verify tryGetLong with emoji characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 55555;
      const objElement = new jsonx.JsonElement();

      const emojiKeys = [
        '\ud83d\udc46',
        '\ud83d\udc7f',
        '\ud83d\udc40',
        '\ud83d\udcaf',
        '\ud83c\udf85',
        '\ud83d\ude3c',
        '\ud83d\udd27',
        '\ud83d\udc87',
        '\ud83e\udd3c\u200d\u2642\ufe0f',
        '\ud83d\udee2',
        '\ud83c\udc04',
        '\ud83c\udff4'
      ];

      for (const key of emojiKeys) {
        objElement.setElement(key, jsonx.JsonElement.createLong(testValue));
        const result = objElement.tryGetLong(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0800
     * @tc.desc    Verify tryGetLong with illegal Unicode characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementTryGetLongTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 44444;
      const objElement = new jsonx.JsonElement();

      const illegalUnicodeKeys = [
        '\udc04',
        '\ud83d',
        '\udff4'
      ];

      for (const key of illegalUnicodeKeys) {
        objElement.setElement(key, jsonx.JsonElement.createLong(testValue));
        const result = objElement.tryGetLong(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest0900
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_0900
     * @tc.desc    Verify tryGetLong with keyword string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 77777;
      const objElement = new jsonx.JsonElement();

      const keywordKeys = ['0', 'NaN', ''];

      for (const key of keywordKeys) {
        objElement.setElement(key, jsonx.JsonElement.createLong(testValue));
        const result = objElement.tryGetLong(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest1000
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_1000
     * @tc.desc    Verify performance comparison between constructed and normal strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryGetLongTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 33333;
      const objElement = new jsonx.JsonElement();

      const constructedKey = init(1000);
      const normalKey = 'a'.repeat(constructedKey.length);

      const startTime1 = Date.now();
      objElement.setElement(constructedKey, jsonx.JsonElement.createLong(testValue));
      const result1 = objElement.tryGetLong(constructedKey);
      const endTime1 = Date.now();
      const constructedTime = endTime1 - startTime1;

      const startTime2 = Date.now();
      objElement.setElement(normalKey, jsonx.JsonElement.createLong(testValue));
      const result2 = objElement.tryGetLong(normalKey);
      const endTime2 = Date.now();
      const normalTime = endTime2 - startTime2;

      expect(result1).assertEqual(testValue);
      expect(result2).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest1100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_1100
     * @tc.desc    Verify tryGetLong with string manipulation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 67890;
      const objElement = new jsonx.JsonElement();

      let str = "{k1:value1,k2:value2}";
      let resultStr = str.substring(0, str.length - 2);
      objElement.setElement(resultStr, jsonx.JsonElement.createLong(testValue));

      for (let i = 0; i < 10; i++) {
        const result = objElement.tryGetLong(resultStr);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest1200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_1200
     * @tc.desc    Verify tryGetLong with large string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryGetLongTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 55555;
      const objElement = new jsonx.JsonElement();

      const largeKey = 'a'.repeat(1000000);
      objElement.setElement(largeKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.tryGetLong(largeKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest1300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_1300
     * @tc.desc    Verify garbage collection for large string keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryGetLongTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 22222;

      let largeKey = 'a'.repeat(10000000);
      const objElement = new jsonx.JsonElement();
      objElement.setElement(largeKey, jsonx.JsonElement.createLong(testValue));

      const result1 = objElement.tryGetLong(largeKey);
      expect(result1).assertEqual(testValue);

      largeKey = '';
    });

    /**
     * @tc.name    builtinsJsonElementTryGetLongTest1400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETLONG_TEST_1400
     * @tc.desc    Verify tryGetLong with different fallback values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetLongTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objElement = new jsonx.JsonElement();

      const result1 = objElement.tryGetLong('nonExistentKey');
      expect(result1).assertEqual(0);

      const result2 = objElement.tryGetLong('nonExistentKey', 0);
      expect(result2).assertEqual(0);

      const result3 = objElement.tryGetLong('nonExistentKey', -12345);
      expect(result3).assertEqual(-12345);
    });

  })
}
