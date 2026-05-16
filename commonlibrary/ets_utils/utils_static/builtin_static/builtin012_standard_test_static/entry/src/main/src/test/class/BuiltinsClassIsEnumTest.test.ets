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

enum TestEnum {
  VALUE1,
  VALUE2,
  VALUE3
}
class TestClass {}
export default function BuiltinsClassIsEnumTest(): void {
  describe("BuiltinsClassIsEnumTest", () => {
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
     * @tc.name    BuiltinsClassIsEnumTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0100
     * @tc.desc    Verify isEnum for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsEnumTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(boolClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0200
     * @tc.desc    Verify isEnum for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsEnumTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      expect(numClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0300
     * @tc.desc    Verify isEnum for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsEnumTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      expect(strClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0400
     * @tc.desc    Verify isEnum for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsEnumTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      expect(objClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0500
     * @tc.desc    Verify isEnum for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsEnumTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      expect(arrClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0600
     * @tc.desc    Verify isEnum for enum type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsEnumTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const enumClass = Class.from<TestEnum>();
      expect(enumClass.isEnum()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0700
     * @tc.desc    Verify isEnum for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsEnumTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const testClass = Class.from<TestClass>();
      expect(testClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0800
     * @tc.desc    Verify isEnum for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsEnumTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(byteClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_0900
     * @tc.desc    Verify isEnum for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsEnumTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(shortClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_1000
     * @tc.desc    Verify isEnum for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsEnumTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(intClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_1100
     * @tc.desc    Verify isEnum for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsEnumTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(longClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_1200
     * @tc.desc    Verify isEnum for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsEnumTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.isEnum()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsEnumTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_ENUM_TEST_1300
     * @tc.desc    Verify isEnum for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsEnumTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(doubleClass.isEnum()).assertFalse();
    });

  })
}
