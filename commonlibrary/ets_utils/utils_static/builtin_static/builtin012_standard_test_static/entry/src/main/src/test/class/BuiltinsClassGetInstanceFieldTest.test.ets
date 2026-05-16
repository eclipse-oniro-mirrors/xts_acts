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

class TestClassWithInstanceFields {
  instanceField1: string = 'value1';
  instanceField2: number = 42;
  instanceField3: boolean = true;

  static staticField: string = 'static';

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

export default function BuiltinsClassGetInstanceFieldTest(): void {
  describe("BuiltinsClassGetInstanceFieldTest", () => {
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
     * @tc.name    BuiltinsClassGetInstanceFieldTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0100
     * @tc.desc    Verify getInstanceField with undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField("undefined");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0200
     * @tc.desc    Verify getInstanceField with null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField("null");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0300
     * @tc.desc    Verify getInstanceField with empty string name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField('');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0400
     * @tc.desc    Verify getInstanceField with special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const specialChars = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      for (let i = 0; i < specialChars.length; i++) {
        const chars = specialChars[i];
        const field = testClass.getInstanceField(chars);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0500
     * @tc.desc    Verify getInstanceField with ASCII characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      for (let i = 32; i <= 126; i++) {
        if (i !== 9) {
          const chars = String.fromCharCode(i);
          const field = testClass.getInstanceField(chars);
          expect(field).assertEqual(undefined);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0600
     * @tc.desc    Verify getInstanceField with repeated special characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const repeatedSpecialChars = ' !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[]]\\\\^^__``{{||}}~~';
      const field = testClass.getInstanceField(repeatedSpecialChars);
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0700
     * @tc.desc    Verify getInstanceField with escape characters name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const escapeChars = [
        '\\a', '\\b', '\\f', '\\n', '\\r', '\\t', '\\v',
        '\\\\', "\\'", '\\"', '\\?', '\\0',
        '\\123', '\\x41'
      ];
      for (let i = 0; i < escapeChars.length; i++) {
        const chars = escapeChars[i];
        const field = testClass.getInstanceField(chars);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0800
     * @tc.desc    Verify getInstanceField with Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
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
        const field = testClass.getInstanceField(unicode);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_0900
     * @tc.desc    Verify getInstanceField with invalid Unicode escape sequences name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const invalidUnicode = [
        '\udc04',
        '\ud83d',
        '\udff4'
      ];
      for (const unicode of invalidUnicode) {
        const field = testClass.getInstanceField(unicode);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1000
     * @tc.desc    Verify getInstanceField with keyword name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const keywords = ['0', 'NaN', ''];
      for (const keyword of keywords) {
        const field = testClass.getInstanceField(keyword);
        expect(field).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1100
     * @tc.desc    Verify getInstanceField with treeString name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      let treeString = '[';
      while (treeString.length < 1000) {
        treeString += '{"a":1},';
      }
      treeString += '{"a":1}]';

      const field = testClass.getInstanceField(treeString);
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1200
     * @tc.desc    Verify getInstanceField with sliceString name parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);

      for (let i = 0; i < 10; i++) {
        const field = testClass.getInstanceField(result);
        expect(field).assertEqual(undefined);
        if (result.length > 2) {
          result = result.substring(0, result.length - 1);
        }
      }
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1300
     * @tc.desc    Verify getInstanceField with valid field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceFieldTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField('instanceField1');
      expect(field !== null).assertTrue();
      expect(field).not().assertEqual(undefined);
      expect(field!.getName()).assertEqual('instanceField1');
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1400
     * @tc.desc    Verify getInstanceField with another valid field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceFieldTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField('instanceField2');
      expect(field !== null).assertTrue();
      expect(field).not().assertEqual(undefined);
      expect(field!.getName()).assertEqual('instanceField2');
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1500
     * @tc.desc    Verify getInstanceField with non-existent field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField('nonExistentField');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1600
     * @tc.desc    Verify getInstanceField with static field name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField('staticField');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1700
     * @tc.desc    Verify getInstanceField with method name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const field = testClass.getInstanceField('instanceMethod');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1800
     * @tc.desc    Verify getInstanceField performance comparison with normal string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInstanceFieldTest1800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();

      const normalName = 'instanceField1';
      const longName = buildLongString(1000);

      const normalField = testClass.getInstanceField(normalName);
      const longField = testClass.getInstanceField(longName);

      expect(normalField !== null).assertTrue();
      expect(longField).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest1900
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_1900
     * @tc.desc    Verify getInstanceField with sliceString multiple calls value changes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceFieldTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);
      let previousField: reflect.InstanceField | undefined = undefined;

      for (let i = 0; i < 10; i++) {
        const field = testClass.getInstanceField(result);
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
     * @tc.name    BuiltinsClassGetInstanceFieldTest2000
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_2000
     * @tc.desc    Verify getInstanceField with huge string memory usage
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInstanceFieldTest2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const hugeString = 'a'.repeat(100000);

      const field = testClass.getInstanceField(hugeString);
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceFieldTest2100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_FIELD_TEST_2100
     * @tc.desc    Verify garbage collection handles huge string correctly
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInstanceFieldTest2100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();

      const createAndRelease = () => {
        const hugeString = 'a'.repeat(100000);
        const field = testClass.getInstanceField(hugeString);
        expect(field).assertEqual(undefined);
      };

      for (let i = 0; i < 5; i++) {
        createAndRelease();
      }
    });
  })
}
