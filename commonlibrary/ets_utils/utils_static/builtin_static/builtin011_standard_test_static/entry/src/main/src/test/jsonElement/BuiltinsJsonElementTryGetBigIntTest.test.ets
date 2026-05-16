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

export default function BuiltinsJsonElementTryGetBigIntTest() {
  describe("BuiltinsJsonElementTryGetBigIntTest", () => {
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
     * @tc.name    builtinsJsonElementTryGetBigIntTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0100
     * @tc.desc    Verify tryGetBigInt with normal string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryGetBigIntTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345n;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('testKey', jsonx.JsonElement.createBigInt(testValue));

      const result = objElement.tryGetBigInt('testKey');
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0200
     * @tc.desc    Verify tryGetBigInt with empty string key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objElement = new jsonx.JsonElement();

      const result = objElement.tryGetBigInt('');
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0300
     * @tc.desc    Verify tryGetBigInt with special characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 98765n;
      const objElement = new jsonx.JsonElement();

      const specialCharKey = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      objElement.setElement(specialCharKey, jsonx.JsonElement.createBigInt(testValue));

      const result = objElement.tryGetBigInt(specialCharKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0400
     * @tc.desc    Verify tryGetBigInt with ASCII characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 11111n;
      const objElement = new jsonx.JsonElement();

      const asciiKey = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      objElement.setElement(asciiKey, jsonx.JsonElement.createBigInt(testValue));

      const result = objElement.tryGetBigInt(asciiKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0500
     * @tc.desc    Verify tryGetBigInt with repeated special characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 22222n;
      const objElement = new jsonx.JsonElement();

      const repeatedSpecialKey = '!!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~';
      objElement.setElement(repeatedSpecialKey, jsonx.JsonElement.createBigInt(testValue));

      const result = objElement.tryGetBigInt(repeatedSpecialKey);
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0600
     * @tc.desc    Verify tryGetBigInt with escape characters in key
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 33333n;
      const objElement = new jsonx.JsonElement();

      const escapeKeys = [
        'test' + String.fromCharCode(7) + 'key', 'test\bkey', 'test\fkey', 'test\nkey',
        'test\rkey', 'test\tkey', 'test' + String.fromCharCode(11) + 'key', 'test\\key',
        "test\'key", 'test\"key', 'test\?key', 'test\0key', 'test' + String.fromCharCode(43) + 'key',
        'test' + String.fromCharCode(83) + 'key', 'test' + String.fromCharCode(65) + 'key'
      ];

      for (const key of escapeKeys) {
        objElement.setElement(key, jsonx.JsonElement.createBigInt(testValue));
        const result = objElement.tryGetBigInt(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0700
     * @tc.desc    Verify tryGetBigInt with keyword-like keys
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objElement = new jsonx.JsonElement();

      objElement.setElement('0', jsonx.JsonElement.createBigInt(55555n));
      objElement.setElement('NaN', jsonx.JsonElement.createBigInt(66666n));
      objElement.setElement('', jsonx.JsonElement.createBigInt(77777n));

      expect(objElement.tryGetBigInt('0')).assertEqual(55555n);
      expect(objElement.tryGetBigInt('NaN')).assertEqual(66666n);
      expect(objElement.tryGetBigInt('')).assertEqual(77777n);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0800
     * @tc.desc    Verify tryGetBigInt with fallback value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objElement = new jsonx.JsonElement();
      const fallbackValue = 99999n;

      const result = objElement.tryGetBigInt('nonExistentKey', fallbackValue);
      expect(result).assertEqual(fallbackValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest0900
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_0900
     * @tc.desc    Verify tryGetBigInt with different types of values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objElement = new jsonx.JsonElement();

      objElement.setElement('stringKey', jsonx.JsonElement.createString('test'));
      objElement.setElement('numberKey', jsonx.JsonElement.createInteger(123));
      objElement.setElement('booleanKey', jsonx.JsonElement.createBoolean(true));

      expect(objElement.tryGetBigInt('stringKey')).assertEqual(0n);
      expect(objElement.tryGetBigInt('numberKey')).assertEqual(123n);
      expect(objElement.tryGetBigInt('booleanKey')).assertEqual(0n);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest1000
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_1000
     * @tc.desc    Verify tryGetBigInt with string manipulation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 67890n;
      const objElement = new jsonx.JsonElement();

      let str = "{k1:value1,k2:value2}";
      let resultStr = str.substring(0, str.length - 2);
      objElement.setElement(resultStr, jsonx.JsonElement.createBigInt(testValue));

      for (let i = 0; i < 10; i++) {
        const result = objElement.tryGetBigInt(resultStr);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest1100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_1100
     * @tc.desc    Verify tryGetBigInt with complex unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryGetBigIntTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 54321n;
      const objElement = new jsonx.JsonElement();

      const unicodeKeys = [
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

      for (const key of unicodeKeys) {
        objElement.setElement(key, jsonx.JsonElement.createBigInt(testValue));
        const result = objElement.tryGetBigInt(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest1200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_1200
     * @tc.desc    Verify tryGetBigInt with illegal unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementTryGetBigIntTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 11111n;
      const objElement = new jsonx.JsonElement();

      const illegalUnicodeKeys = [
        '\udc04',
        '\ud83d',
        '\udff4'
      ];

      for (const key of illegalUnicodeKeys) {
        objElement.setElement(key, jsonx.JsonElement.createBigInt(testValue));
        const result = objElement.tryGetBigInt(key);
        expect(result).assertEqual(testValue);
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest1300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_1300
     * @tc.desc    Verify garbage collection for big strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryGetBigIntTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 22222n;

      const largeString = 'a'.repeat(1000000);
      const objElement = new jsonx.JsonElement();
      objElement.setElement(largeString, jsonx.JsonElement.createBigInt(testValue));

      const result1 = objElement.tryGetBigInt(largeString);
      expect(result1).assertEqual(testValue);

      let largeStringRef = largeString;
      largeStringRef = '';

      const result2 = objElement.tryGetBigInt(largeString);
      expect(result2).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryGetBigIntTest1400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYGETBIGINT_TEST_1400
     * @tc.desc    Verify performance comparison between constructed and normal strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryGetBigIntTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 33333n;
      const objElement = new jsonx.JsonElement();

      const constructedKey = init(1000);

      const normalKey = 'a'.repeat(constructedKey.length);

      const startTime1 = Date.now();
      objElement.setElement(constructedKey, jsonx.JsonElement.createBigInt(testValue));
      const result1 = objElement.tryGetBigInt(constructedKey);
      const endTime1 = Date.now();
      const constructedTime = endTime1 - startTime1;

      const startTime2 = Date.now();
      objElement.setElement(normalKey, jsonx.JsonElement.createBigInt(testValue));
      const result2 = objElement.tryGetBigInt(normalKey);
      const endTime2 = Date.now();
      const normalTime = endTime2 - startTime2;

      expect(result1).assertEqual(testValue);
      expect(result2).assertEqual(testValue);

    });

  })
}
