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

class SampleClass {
  val: number;
  constructor(val: number) {
    this.val = val;
  }
}

export default function BuiltinsIsLongTypeTest(): void {
  describe('BuiltinsIsLongTypeTest', () => {
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
     * @tc.name    BuiltinsIsLongTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_LONG is recognized as long type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsLongTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Long (Class.from<Long>()) is recognized as long type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsLongTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.from<Long>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_INT is not long type (int ≠ long), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsLongTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not long type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsLongTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not long type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsLongTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_CHAR is not long type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not long type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BYTE is not long type (byte ≠ long), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_SHORT is not long type (short ≠ long), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not long type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not long type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isLongType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isLongType(PRIMITIVE_LONG) is true, isNumericType(PRIMITIVE_LONG) should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_LONG);
      expect(isLong).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_LONG should return false for isIntType (long ≠ int)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG);
      expect(isLong).assertTrue();
      expect(isInt).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_LONG should return false for isDoubleType (long ≠ double)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsLongTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_LONG);
      expect(isLong).assertTrue();
      expect(isDouble).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_LONG returns false for both isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_LONG)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to PRIMITIVE_LONG yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const r2: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_LONG and PRIMITIVE_INT are different Class objects with different results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass: Class = Class.PRIMITIVE_LONG;
      const intClass: Class = Class.PRIMITIVE_INT;
      expect(longClass === intClass).assertFalse();
      expect(reflect.internals.Types.isLongType(longClass)).assertTrue();
      expect(reflect.internals.Types.isLongType(intClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1800
     * @tc.desc    Verify that all non-long numeric types (DOUBLE, INT, FLOAT, BYTE, SHORT) are not long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_LONG and boxed Long) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_FLOAT,
        Class.from<Long>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isLongType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_LONG is true, PRIMITIVE_INT is false, user class is false, order does not affect results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_INT);
      const r2: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const r3: boolean = reflect.internals.Types.isLongType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });
    /**
     * @tc.name    BuiltinsIsLongTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_LONG returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType, long belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_LONG);
      expect(isLong).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Long returns true for isPrimitiveType (isLongType covers boxed, so isNumericType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedLong: Class = Class.from<Long>();
      const isLong: boolean = reflect.internals.Types.isLongType(boxedLong);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedLong);
      expect(isLong).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_LONG returns true for isNumericType (long belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_LONG);
      expect(isLong).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_LONG returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_LONG)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_LONG returns false for both isIntType and isDoubleType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsLongTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_LONG)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_LONG returns false for isFloatType, isByteType, and isShortType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsLongTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_LONG)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_LONG and Class.from<Long>() have different references, but both are recognized as long types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsLongTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primLong: Class = Class.PRIMITIVE_LONG;
      const boxedLong: Class = Class.from<Long>();
      expect(primLong === boxedLong).assertFalse();
      expect(reflect.internals.Types.isLongType(primLong)).assertTrue();
      expect(reflect.internals.Types.isLongType(boxedLong)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2800
     * @tc.desc    Verify that all non-long primitive types (DOUBLE, INT, FLOAT, BYTE, SHORT, BOOLEAN, CHAR, VOID) are not long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsLongTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_LONG and boxed Long) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsLongTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_LONG,
        Class.from<Long>(),
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isLongType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsLongTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_LONG_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_LONG satisfies isPrimitiveType and isNumericType; PRIMITIVE_BOOLEAN does not satisfy isLongType, satisfies isPrimitiveType but not isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsLongTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_LONG)).assertTrue();

      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
