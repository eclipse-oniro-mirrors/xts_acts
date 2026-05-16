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

class TestClassWithStaticFields {
  static staticField1: string = 'value1';
  static staticField2: number = 42;
  static staticField3: boolean = true;

  instanceField: string = 'instance';

  instanceMethod(): void {}
  static staticMethod(): void {}
}

function buildLongString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

export default function BuiltinsClassGetStaticFieldTest(): void {
  describe("BuiltinsClassGetStaticFieldTest", () => {
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
     * @tc.name    BuiltinsClassGetStaticFieldTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0100
     * @tc.desc    Verify getStaticField with undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField("undefined");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0200
     * @tc.desc    Verify getStaticField with null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();

      const field = testClass.getStaticField("null");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0300
     * @tc.desc    Verify getStaticField with empty string name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField('');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0400
     * @tc.desc    Verify getStaticField with special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const specialChars = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      for (let i = 0; i < specialChars.length; i++) {
        const chars = specialChars[i];
        const field = testClass.getStaticField(chars);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0500
     * @tc.desc    Verify getStaticField with ASCII characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      for (let i = 32; i <= 126; i++) {
        const chars = String.fromCharCode(i);
        const field = testClass.getStaticField(chars);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0600
     * @tc.desc    Verify getStaticField with repeated special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const repeatedSpecialChars = ' !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[]]\\\\^^__``{{||}}~~';
      const field = testClass.getStaticField(repeatedSpecialChars);
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0700
     * @tc.desc    Verify getStaticField with escape characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const escapeChars = [
        '\\a', '\\b', '\\f', '\\n', '\\r', '\\t', '\\v',
        '\\\\', "\\'", '\\"', '\\?', '\\0',
        '\\123', '\\x41'
      ];
      for (let i = 0; i < escapeChars.length; i++) {
        const chars = escapeChars[i];
        const field = testClass.getStaticField(chars);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0800
     * @tc.desc    Verify getStaticField with Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
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
        const field = testClass.getStaticField(unicode);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_0900
     * @tc.desc    Verify getStaticField with invalid Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const invalidUnicode = [
        '\udc04',
        '\ud83d',
        '\udff4'
      ];
      for (const unicode of invalidUnicode) {
        const field = testClass.getStaticField(unicode);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1000
     * @tc.desc    Verify getStaticField with keyword name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const keywords = ['0', 'NaN', ''];
      for (const keyword of keywords) {
        const field = testClass.getStaticField(keyword);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1100
     * @tc.desc    Verify getStaticField performance comparison with normal string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldTest1100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticFields>();

      const normalName = 'staticField1';
      const longName = buildLongString(1000);

      const normalField = testClass.getStaticField(normalName);
      const longField = testClass.getStaticField(longName);

      expect(normalField).not().assertEqual(undefined);
      expect(longField).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1200
     * @tc.desc    Verify getStaticField with sliceString name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);

      for (let i = 0; i < 10; i++) {
        const field = testClass.getStaticField(result);
        expect(field).assertEqual(undefined);
        if (result.length > 2) {
          result = result.substring(0, result.length - 1);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1300
     * @tc.desc    Verify getStaticField with valid static field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticFieldTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField('staticField1');
      expect(field).not().assertEqual(undefined);
      expect(field!.getName()).assertEqual('staticField1');
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1400
     * @tc.desc    Verify getStaticField with another valid static field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticFieldTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField('staticField2');
      expect(field).not().assertEqual(undefined);
      expect(field!.getName()).assertEqual('staticField2');
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1500
     * @tc.desc    Verify getStaticField with non-existent field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField('nonExistentField');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1600
     * @tc.desc    Verify getStaticField with instance field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField('instanceField');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1700
     * @tc.desc    Verify getStaticField with method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const field = testClass.getStaticField('staticMethod');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1800
     * @tc.desc    Verify getStaticField with sliceString multiple calls value changes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);
      let previousField: reflect.StaticField | undefined = undefined;

      for (let i = 0; i < 10; i++) {
        const field = testClass.getStaticField(result);
        expect(field).assertEqual(undefined);
        if (previousField !== undefined) {
          expect(field).assertEqual(previousField);
        }
        previousField = field;
        if (result.length > 2) {
          result = result.substring(0, result.length - 1);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest1900
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_1900
     * @tc.desc    Verify getStaticField with huge string memory usage
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldTest1900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticFields>();
      const hugeString = 'a'.repeat(1000000);

      const field = testClass.getStaticField(hugeString);
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldTest2000
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELD_TEST_2000
     * @tc.desc    Verify garbage collection handles huge string correctly
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldTest2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithStaticFields>();

      const createAndRelease = () => {
        const hugeString = 'a'.repeat(100000);
        const field = testClass.getStaticField(hugeString);
        expect(field).assertEqual(undefined);
      };

      for (let i = 0; i < 5; i++) {
        createAndRelease();
      }
    });

  })
}
