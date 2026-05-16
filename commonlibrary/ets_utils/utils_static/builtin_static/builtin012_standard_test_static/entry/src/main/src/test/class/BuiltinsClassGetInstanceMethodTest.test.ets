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

class TestClassWithInstanceMethods {
  instanceMethod1(): void {}
  instanceMethod2(param: string): string { return param; }
  instanceMethod3(param1: string, param2: number): number { return param2; }
  instanceMethod4(param: boolean): boolean { return param; }

  static staticMethod(): void {}
  static staticField: string = 'static';
  instanceField: string = 'instance';
}

function buildLongString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

export default function BuiltinsClassGetInstanceMethodTest(): void {
  describe("BuiltinsClassGetInstanceMethodTest", () => {
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
     * @tc.name    BuiltinsClassGetInstanceMethodTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0100
     * @tc.desc    Verify getInstanceMethod with undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const method = testClass.getInstanceMethod("undefined");
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0200
     * @tc.desc    Verify getInstanceMethod with null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const method = testClass.getInstanceMethod("null");
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0300
     * @tc.desc    Verify getInstanceMethod with empty string name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const method = testClass.getInstanceMethod('');
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0400
     * @tc.desc    Verify getInstanceMethod with special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const specialChars = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      for (let i = 0; i < specialChars.length; i++) {
        const chars = specialChars[i];
        const method = testClass.getInstanceMethod(chars);
        expect(method).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0500
     * @tc.desc    Verify getInstanceMethod with ASCII characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      for (let i = 32; i <= 126; i++) {
        const chars = String.fromCharCode(i);
        const method = testClass.getInstanceMethod(chars);
        expect(method).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0600
     * @tc.desc    Verify getInstanceMethod with repeated special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const repeatedSpecialChars = ' !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[]]\\\\^^__``{{||}}~~';
      const method = testClass.getInstanceMethod(repeatedSpecialChars);
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0700
     * @tc.desc    Verify getInstanceMethod with escape characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const escapeChars = [
        '\\a', '\\b', '\\f', '\\n', '\\r', '\\t', '\\v',
        '\\\\', "\\'", '\\"', '\\?', '\\0',
        '\\123', '\\x41'
      ];
      for (const chars of escapeChars) {
        const method = testClass.getInstanceMethod(chars);
        expect(method).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0800
     * @tc.desc    Verify getInstanceMethod with Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
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
        const method = testClass.getInstanceMethod(unicode);
        expect(method).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_0900
     * @tc.desc    Verify getInstanceMethod with invalid Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const invalidUnicode = [
        '\udc04',
        '\ud83d',
        '\udff4'
      ];
      for (const unicode of invalidUnicode) {
        const method = testClass.getInstanceMethod(unicode);
        expect(method).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1000
     * @tc.desc    Verify getInstanceMethod with keyword name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const keywords = ['0', 'NaN', ''];
      for (const keyword of keywords) {
        const method = testClass.getInstanceMethod(keyword);
        expect(method).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1100
     * @tc.desc    Verify getInstanceMethod with treeString name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();

      const normalName = "normalMethod";
      const longName = buildLongString(1000);

      const normalMethod = testClass.getInstanceMethod(normalName);
      const longMethod = testClass.getInstanceMethod(longName);

      expect(normalMethod).assertEqual(undefined);
      expect(longMethod).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1200
     * @tc.desc    Verify getInstanceMethod with sliceString name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);

      for (let i = 0; i < 10; i++) {
        const method = testClass.getInstanceMethod(result);
        expect(method).assertEqual(undefined);
        if (result.length > 2) {
          result = result.substring(0, result.length - 1);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1300
     * @tc.desc    Verify getInstanceMethod with valid method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceMethodTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const method = testClass.getInstanceMethod('instanceMethod1');
      expect(method !== null).assertTrue();
      expect(method!.getName()).assertEqual('instanceMethod1');
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1400
     * @tc.desc    Verify getInstanceMethod with valid method name and signature
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceMethodTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const stringClass = Class.from<string>();

      const method = testClass.getInstanceMethod('instanceMethod2', [stringClass]);
      expect(method !== null).assertTrue();
      expect(method!.getName()).assertEqual('instanceMethod2');
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1500
     * @tc.desc    Verify getInstanceMethod with valid method name and wrong signature
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const numberClass = Class.PRIMITIVE_NUMBER;

      const method = testClass.getInstanceMethod('instanceMethod2', [numberClass]);
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1600
     * @tc.desc    Verify getInstanceMethod with non-existent method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const method = testClass.getInstanceMethod('nonExistentMethod');
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1700
     * @tc.desc    Verify getInstanceMethod with huge string memory usage
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInstanceMethodTest1700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();
      const hugeString = 'a'.repeat(100000);

      const method = testClass.getInstanceMethod(hugeString);
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHOD_TEST_1800
     * @tc.desc    Verify garbage collection handles huge string correctly
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInstanceMethodTest1800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithInstanceMethods>();

      const createAndRelease = () => {
        let hugeString: string | null = 'a'.repeat(1000);
        const method = testClass.getInstanceMethod(hugeString);
        expect(method).assertEqual(undefined);
        hugeString = null;
      };

      for (let i = 0; i < 5; i++) {
        createAndRelease();
      }
    });

  })
}
