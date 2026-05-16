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

class TestClassWithStaticMethods {
  static staticMethod1(): void {}
  static staticMethod2(param: string): string { return param; }
  static staticMethod3(param1: string, param2: number): number { return param2; }
  static staticMethod4(param: boolean): boolean { return param; }
  static overloadedMethod(param: string): string { return param; }
  static overloadedMethod(param: number): number { return param; }
  static overloadedMethod(param1: string, param2: number): string { return param1 + param2; }

  instanceField: string = 'instance';

  instanceMethod(): void {}
}

function buildLongString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

export default function BuiltinsClassGetStaticMethodTest(): void {
  describe("BuiltinsClassGetStaticMethodTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    BuiltinsClassGetStaticMethodTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0100
     * @tc.desc    Verify getStaticMethod with non-existent method name "undefined"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const field = testClass.getStaticMethod("undefined");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0200
     * @tc.desc    Verify getStaticMethod with non-existent method name "null"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const field = testClass.getStaticMethod("null");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0300
     * @tc.desc    Verify getStaticMethod with non-existent method name empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const field = testClass.getStaticMethod('');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0400
     * @tc.desc    Verify getStaticMethod with non-existent method name containing special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const specialChars = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      for (let i = 0; i < specialChars.length; i++) {
        const specialChar = specialChars[i];
        const field = testClass.getStaticMethod(specialChar);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0500
     * @tc.desc    Verify getStaticMethod with non-existent method name containing ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      for (let i = 32; i <= 126; i++) {
        const asciiChar = String.fromCharCode(i);
        const field = testClass.getStaticMethod(asciiChar);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0600
     * @tc.desc    Verify getStaticMethod with repeated special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const repeatedSpecialChars = ' !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[]]\\\\^^__``{{||}}~~';
      const field = testClass.getStaticMethod(repeatedSpecialChars);
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0700
     * @tc.desc    Verify getStaticMethod with escape characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const escapeChars = [
        '\\a', '\\b', '\\f', '\\n', '\\r', '\\t', '\\v',
        '\\\\', "\\'", '\\"', '\\?', '\\0',
        '\\123', '\\x41'
      ];
      for (let i = 0; i < escapeChars.length; i++) {
        const escapeChar = escapeChars[i];
        const field = testClass.getStaticMethod(escapeChar);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0800
     * @tc.desc    Verify getStaticMethod with Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const unicodeEscapes = [
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
      for (const unicode of unicodeEscapes) {
        const field = testClass.getStaticMethod(unicode);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_0900
     * @tc.desc    Verify getStaticMethod with invalid Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const invalidUnicode = [
        '\udc04',
        '\ud83d',
        '\udff4'
      ];
      for (const unicode of invalidUnicode) {
        const field = testClass.getStaticMethod(unicode);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1000
     * @tc.desc    Verify getStaticMethod with keyword name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const keywords = ['class', 'function', 'return', 'if', 'else', 'while', 'for'];
      for (const keyword of keywords) {
        const field = testClass.getStaticMethod(keyword);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1100
     * @tc.desc    Verify getStaticMethod performance comparison with normal string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodTest1100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();

      const normalName = 'staticMethod1';
      const longName = buildLongString(1000);

      const normalMethod = testClass.getStaticMethod(normalName);
      const longMethod = testClass.getStaticMethod(longName);

      expect(normalMethod !== null).assertTrue();
      expect(longMethod).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1200
     * @tc.desc    Verify getStaticMethod with sliceString name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);

      for (let i = 0; i < 10; i++) {
        const field = testClass.getStaticMethod(result);
        expect(field).assertEqual(undefined);
        if (result.length > 2) {
          result = result.substring(0, result.length - 1);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1300
     * @tc.desc    Verify getStaticMethod with valid method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const method = testClass.getStaticMethod('staticMethod1');
      expect(method !== null).assertTrue();
      expect(method).not().assertEqual(undefined);
      expect(method!.getName()).assertEqual('staticMethod1');
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1400
     * @tc.desc    Verify getStaticMethod with valid method name and signature
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const stringClass = Class.from<string>();

      const method = testClass.getStaticMethod('staticMethod2', [stringClass]);
      expect(method !== null).assertTrue();
      expect(method).not().assertEqual(undefined);
      expect(method!.getName()).assertEqual('staticMethod2');
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1500
     * @tc.desc    Verify getStaticMethod with valid method name and wrong signature
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const numberClass = Class.PRIMITIVE_NUMBER;

      const method = testClass.getStaticMethod('staticMethod2', [numberClass]);
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1600
     * @tc.desc    Verify getStaticMethod with non-existent method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const method = testClass.getStaticMethod('nonExistentMethod');
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1700
     * @tc.desc    Verify getStaticMethod with instance method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const method = testClass.getStaticMethod('instanceMethod');
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1800
     * @tc.desc    Verify getStaticMethod with sliceString multiple calls value changes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);
      let previousMethod: reflect.StaticMethod | undefined = undefined;

      for (let i = 0; i < 10; i++) {
        const method = testClass.getStaticMethod(result);
        expect(method).assertEqual(undefined);
        if (previousMethod !== undefined) {
          expect(method).assertEqual(previousMethod);
        }
        previousMethod = method;
        if (result.length > 2) {
          result = result.substring(0, result.length - 1);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest1900
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_1900
     * @tc.desc    Verify getStaticMethod with huge string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodTest1900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const hugeString = 'a'.repeat(1000000);
      const method = testClass.getStaticMethod(hugeString);
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest2000
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_2000
     * @tc.desc    Verify getStaticMethod with huge string release
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodTest2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();

      const createAndRelease = () => {
        const hugeString = 'a'.repeat(100000);
        const method = testClass.getStaticMethod(hugeString);
        expect(method).assertEqual(undefined);
      };

      for (let i = 0; i < 5; i++) {
        createAndRelease();
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodTest2100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHOD_TEST_2100
     * @tc.desc    Verify getStaticMethod throws when signature is omitted and multiple overloads exist
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();

      expect(() => {
        testClass.getStaticMethod('overloadedMethod');
      }).assertThrow('Found two methods with the same name \'overloadedMethod\'. Please specify signature.');
    });

  })
}
