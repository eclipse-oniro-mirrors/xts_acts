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

class TestClass {}

export default function BuiltinsClassIsFixedArrayTest(): void {
  describe("BuiltinsClassIsFixedArrayTest", () => {
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
     * @tc.name    BuiltinsClassIsFixedArrayTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0100
     * @tc.desc    Verify isFixedArray for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsFixedArrayTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(boolClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0200
     * @tc.desc    Verify isFixedArray for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsFixedArrayTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      expect(numClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0300
     * @tc.desc    Verify isFixedArray for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsFixedArrayTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      expect(strClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0400
     * @tc.desc    Verify isFixedArray for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      expect(objClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0500
     * @tc.desc    Verify isFixedArray for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      expect(arrClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0600
     * @tc.desc    Verify isFixedArray for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      expect(testClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0700
     * @tc.desc    Verify isFixedArray for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsFixedArrayTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(byteClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0800
     * @tc.desc    Verify isFixedArray for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsFixedArrayTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(shortClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_0900
     * @tc.desc    Verify isFixedArray for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsFixedArrayTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(intClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1000
     * @tc.desc    Verify isFixedArray for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsFixedArrayTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(longClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1100
     * @tc.desc    Verify isFixedArray for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsFixedArrayTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1200
     * @tc.desc    Verify isFixedArray for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsFixedArrayTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(doubleClass.isFixedArray()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1300
     * @tc.desc    Verify isFixedArray for fixed array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fixedArray: FixedArray<number> = [1, 2, 3];
      const fixedArrayClass = Class.of(fixedArray);
      expect(fixedArrayClass.isFixedArray()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1400
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1400
     * @tc.desc    Verify isFixedArray for string fixed array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fixedArray: FixedArray<string> = ['a', 'b', 'c'];
      const fixedArrayClass = Class.of(fixedArray);
      expect(fixedArrayClass.isFixedArray()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1500
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1500
     * @tc.desc    Verify isFixedArray for boolean fixed array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fixedArray: FixedArray<boolean> = [true, false, true];
      const fixedArrayClass = Class.of(fixedArray);
      expect(fixedArrayClass.isFixedArray()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1600
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1600
     * @tc.desc    Verify isFixedArray for object fixed array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1 = new Object();
      const obj2 = new Object();
      const fixedArray: FixedArray<Object> = [obj1, obj2];
      const fixedArrayClass = Class.of(fixedArray);
      expect(fixedArrayClass.isFixedArray()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1700
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1700
     * @tc.desc    Verify isFixedArray for empty fixed array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fixedArray: FixedArray<number> = [];
      const fixedArrayClass = Class.of(fixedArray);
      expect(fixedArrayClass.isFixedArray()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsFixedArrayTest1800
     * @tc.number  SUB_BUILTINS_CLASS_IS_FIXED_ARRAY_TEST_1800
     * @tc.desc    Verify that regular Array is not reported as FixedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsFixedArrayTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const regularArray: Array<number> = [1, 2, 3];
      const regularArrayClass = Class.of(regularArray);
      expect(regularArrayClass.isFixedArray()).assertFalse();
    });

  })
}
