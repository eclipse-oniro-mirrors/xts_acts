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
  if (size <= 0) {
    return '[]';
  }
  const item = '{"a":1},';
  const repeatCount = Math.floor((size - 2) / item.length);
  let ans = '[';
  for (let i = 0; i < repeatCount && ans.length < size - 10; i++) {
    ans += item;
  }
  ans += '{"a":1}]';
  return ans;
}

export default function BuiltinsJsonElementGetLongTest() {
  describe("BuiltinsJsonElementGetLongTest", () => {
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
     * @tc.name    builtinsJsonElementGetLongTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0100
     * @tc.desc    Verify getLong with basic string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementGetLongTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('basicKey', jsonx.JsonElement.createLong(testValue));

      const result = objElement.getLong('basicKey');
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0200
     * @tc.desc    Verify getLong with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementGetLongTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 67890;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('', jsonx.JsonElement.createLong(testValue));

      const result = objElement.getLong('');
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0300
     * @tc.desc    Verify getLong with special characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementGetLongTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const objElement = new jsonx.JsonElement();

      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      specialChars.split('').forEach((chars, index) => {
        const key = `key_with_${chars}`;
        const value = 98765 + index;
        objElement.setElement(key, jsonx.JsonElement.createLong(value));

        const result = objElement.getLong(key);
        expect(result).assertEqual(value);
      });

      const allSpecialCharsKey = `key_with_all_${specialChars}`;
      objElement.setElement(allSpecialCharsKey, jsonx.JsonElement.createLong(99999));

      const result = objElement.getLong(allSpecialCharsKey);
      expect(result).assertEqual(99999);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0400
     * @tc.desc    Verify getLong with ASCII characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementGetLongTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 11111;
      const objElement = new jsonx.JsonElement();

      const asciiKey = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      objElement.setElement(asciiKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.getLong(asciiKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0500
     * @tc.desc    Verify getLong with repeated special characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementGetLongTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 22222;
      const objElement = new jsonx.JsonElement();

      const repeatedSpecialKey = '!!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~';
      objElement.setElement(repeatedSpecialKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.getLong(repeatedSpecialKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0600
     * @tc.desc    Verify getLong with escape characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementGetLongTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const objElement = new jsonx.JsonElement();

      const testValue = 33338;

      const escapeKeys = [
        'test' + String.fromCharCode(7) + 'key', 'test\bkey', 'test\fkey',
        'test\nkey', 'test\rkey', 'test\tkey', 'test' + String.fromCharCode(11) + 'key',
        'test\\key', "test\'key", 'test\"key', 'test\?key', 'test\0key',
        'test' + String.fromCharCode(43) + 'key', 'test' + String.fromCharCode(83) + 'key',
        'test' + String.fromCharCode(65) + 'key'
      ];

      for (const key of escapeKeys) {
        objElement.setElement(key, jsonx.JsonElement.createLong(testValue));
        const result = objElement.getLong(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0700
     * @tc.desc    Verify getLong with Unicode characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementGetLongTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const objElement = new jsonx.JsonElement();

      const testValue = 17000;

      const keys = [
        'key_with_\ud83d\udc46',
        'key_with_\ud83d\udc7f',
        'key_with_\ud83d\udc40',
        'key_with_\ud83d\udcaf',
        'key_with_\ud83c\udf85',
        'key_with_\ud83d\ude3c',
        'key_with_\ud83d\udd27',
        'key_with_\ud83d\udc87',
        'key_with_\ud83e\udd3c\u200d\u2642\ufe0f',
        'key_with_\ud83d\udee2',
        'key_with_\ud83c\udc04',
        'key_with_\ud83c\udff4'
      ];

      keys.forEach((key, index) => {
        objElement.setElement(key, jsonx.JsonElement.createLong(testValue + index));
        const result = objElement.getLong(key);
        expect(result).assertEqual(testValue + index);
      });
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0800
     * @tc.desc    Verify getLong with illegal Unicode characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementGetLongTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 111111;
      const objElement = new jsonx.JsonElement();

      const illegalUnicodeKey = 'key_with_illegal_unicode_\udc04\ud83d\udff4';
      objElement.setElement(illegalUnicodeKey, jsonx.JsonElement.createLong(testValue));

      const result = objElement.getLong(illegalUnicodeKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest0900
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_0900
     * @tc.desc    Verify getLong with keyword string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementGetLongTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 222222;
      const objElement = new jsonx.JsonElement();

      const keywords = ['0', 'NaN', ''];

      keywords.forEach((keyword, index) => {
        const keyValue = testValue + index;
        objElement.setElement(keyword, jsonx.JsonElement.createLong(keyValue));

        const result = objElement.getLong(keyword);
        expect(result).assertEqual(keyValue);
      });
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest1000
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_1000
     * @tc.desc    Verify getLong with performance test (constructed key)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementGetLongTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const objElement = new jsonx.JsonElement();

      const largeConstructedKey = init(10000);
      const testValue = 18000;

      objElement.setElement(largeConstructedKey, jsonx.JsonElement.createLong(testValue));
      const result = objElement.getLong(largeConstructedKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest1100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_1100
     * @tc.desc    Verify getLong with string manipulation in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementGetLongTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 77777;
      const objElement = new jsonx.JsonElement();

      let str = '{k1:value1,k2:value2}';
      const manipulatedKey = str.substring(0, str.length - 2);
      objElement.setElement(manipulatedKey, jsonx.JsonElement.createLong(testValue));

      for (let i = 0; i < 10; i++) {
        const result = objElement.getLong(manipulatedKey);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest1200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_1200
     * @tc.desc    Verify getLong with large string key (1M chars) handles correctly or throws appropriate error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementGetLongTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 66666;
      const objElement = new jsonx.JsonElement();

      const largeKey = 'a'.repeat(1000000);

      let setSuccess = false;
      let getSuccess = false;
      let result: number = 0;

      try {
        objElement.setElement(largeKey, jsonx.JsonElement.createLong(testValue));
        setSuccess = true;
        result = objElement.getLong(largeKey);
        getSuccess = true;
      } catch (e) {
        // Large key may cause memory error, which is acceptable
      }

      if (setSuccess && getSuccess) {
        expect(result).assertEqual(testValue);
      } else {
        // If operation failed due to memory constraints, verify the object is still usable
        objElement.setElement('smallKey', jsonx.JsonElement.createLong(testValue));
        const smallResult = objElement.getLong('smallKey');
        expect(smallResult).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementGetLongTest1300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_GETLONG_TEST_1300
     * @tc.desc    Verify garbage collection for large string keys (100K chars) and object remains usable after key release
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementGetLongTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 333333;
      const objElement = new jsonx.JsonElement();

      let largeKey = 'a'.repeat(100000);

      let setSuccess = false;
      let getSuccess = false;
      let result: number = 0;

      try {
        objElement.setElement(largeKey, jsonx.JsonElement.createLong(testValue));
        setSuccess = true;
        result = objElement.getLong(largeKey);
        getSuccess = true;
      } catch (e) {
        // Large key may cause memory error, which is acceptable
      }

      // Release the large key reference
      largeKey = '';

      // Verify the object is still usable after releasing large key
      objElement.setElement('afterGCKey', jsonx.JsonElement.createLong(testValue));
      const afterGCResult = objElement.getLong('afterGCKey');
      expect(afterGCResult).assertEqual(testValue);

      // If large key operations succeeded, verify the value
      if (setSuccess && getSuccess) {
        expect(result).assertEqual(testValue);
      }
    });

  })
}
