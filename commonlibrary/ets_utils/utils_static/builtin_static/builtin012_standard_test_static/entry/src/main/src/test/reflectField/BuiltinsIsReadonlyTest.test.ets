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

class TestClass {
  name: string = "ArkTS";
  readonly readonlyField: string = "readonly";
  static staticField: number = 42;
  static readonly staticReadonlyField: number = 99;
}

class AnotherTestClass {
  value: number = 0;
  readonly fixedValue: number = 42;
}

class SingleFieldClass {
  readonly onlyField: string = "only";
}

class MixedFieldClass {
  regular: string = "regular";
  readonly readOnly: string = "readonly";
  static staticReg: number = 1;
  static readonly staticReadonly: number = 2;
}

export default function BuiltinsIsReadonlyTest(): void {
  describe('BuiltinsIsReadonlyTest', () => {
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
     * @tc.name    BuiltinsIsReadonlyTest0100
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0100
     * @tc.desc    Verify non-readonly instance field returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsReadonlyTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClass>().getInstanceField("name");
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0200
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0200
     * @tc.desc    Verify readonly instance field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsReadonlyTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClass>().getInstanceField("readonlyField");
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0300
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0300
     * @tc.desc    Verify non-readonly static field returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsReadonlyTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClass>().getStaticField("staticField");
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0400
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0400
     * @tc.desc    Verify readonly static field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsReadonlyTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClass>().getStaticField("staticReadonlyField");
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0500
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0500
     * @tc.desc    Verify different fields in same class have correct readonly status
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsReadonlyTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClass>();
      const regularField = cls.getInstanceField("name");
      const readonlyField = cls.getInstanceField("readonlyField");
      expect(regularField!.isReadonly()).assertFalse();
      expect(readonlyField!.isReadonly()).assertTrue();
      expect(regularField!.isReadonly() !== readonlyField!.isReadonly()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0600
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0600
     * @tc.desc    Verify readonly status consistency across multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsReadonlyTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClass>().getInstanceField("readonlyField");
      const result1 = field!.isReadonly();
      const result2 = field!.isReadonly();
      const result3 = field!.isReadonly();
      expect(result1).assertTrue();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0700
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0700
     * @tc.desc    Verify readonly status for fields in different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsReadonlyTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClass>().getInstanceField("readonlyField");
      const field2 = Class.from<AnotherTestClass>().getInstanceField("fixedValue");
      expect(field1!.isReadonly()).assertTrue();
      expect(field2!.isReadonly()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0800
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0800
     * @tc.desc    Verify single readonly field in class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsReadonlyTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<SingleFieldClass>().getInstanceField("onlyField");
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest0900
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_0900
     * @tc.desc    Verify mixed readonly and non-readonly fields in same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsReadonlyTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<MixedFieldClass>();
      const regular = cls.getInstanceField("regular");
      const readOnly = cls.getInstanceField("readOnly");
      const staticReg = cls.getStaticField("staticReg");
      const staticReadonly = cls.getStaticField("staticReadonly");

      expect(regular!.isReadonly()).assertFalse();
      expect(readOnly!.isReadonly()).assertTrue();
      expect(staticReg!.isReadonly()).assertFalse();
      expect(staticReadonly!.isReadonly()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsReadonlyTest1000
     * @tc.number  SUB_BUILTINS_IS_READONLY_TEST_1000
     * @tc.desc    Verify isReadonly returns non-undefined for fields retrieved via getInstanceFields iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsReadonlyTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MixedFieldClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        const isReadonly = fields[i].isReadonly();
        expect(isReadonly !== undefined).assertTrue();
      }
    });
  });
}