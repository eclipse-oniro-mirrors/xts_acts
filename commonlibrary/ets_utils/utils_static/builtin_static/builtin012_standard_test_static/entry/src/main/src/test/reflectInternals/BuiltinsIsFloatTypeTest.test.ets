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

export default function BuiltinsIsFloatTypeTest(): void {
  describe('BuiltinsIsFloatTypeTest', () => {
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
     * @tc.name    BuiltinsIsFloatTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_FLOAT is recognized as float type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFloatTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Float (Class.from<Float>()) is recognized as float type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFloatTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.from<Float>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not float type (double ≠ float), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFloatTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_INT is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFloatTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_LONG is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFloatTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_CHAR is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BYTE is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_SHORT is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not float type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isFloatType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isFloatType(PRIMITIVE_FLOAT) is true, isNumericType(PRIMITIVE_FLOAT) should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT);
      expect(isFloat).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_FLOAT should return false for isDoubleType (float ≠ double)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_FLOAT);
      expect(isFloat).assertTrue();
      expect(isDouble).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_FLOAT should return false for isIntType (float ≠ int)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFloatTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_FLOAT);
      expect(isFloat).assertTrue();
      expect(isInt).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_FLOAT returns false for both isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_FLOAT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to PRIMITIVE_FLOAT yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const r2: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_FLOAT and PRIMITIVE_DOUBLE are different Class objects with different results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass: Class = Class.PRIMITIVE_FLOAT;
      const doubleClass: Class = Class.PRIMITIVE_DOUBLE;
      expect(floatClass === doubleClass).assertFalse();
      expect(reflect.internals.Types.isFloatType(floatClass)).assertTrue();
      expect(reflect.internals.Types.isFloatType(doubleClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1800
     * @tc.desc    Verify that all non-float numeric types (DOUBLE, INT, LONG, BYTE, SHORT) are not float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_FLOAT and boxed Float) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_LONG,
        Class.from<Float>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isFloatType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_FLOAT is true, PRIMITIVE_DOUBLE is false, user class is false, order does not affect results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_DOUBLE);
      const r2: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const r3: boolean = reflect.internals.Types.isFloatType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType, float belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_FLOAT);
      expect(isFloat).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Float returns true for isPrimitiveType (isFloatType covers boxed, so isNumericType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedFloat: Class = Class.from<Float>();
      const isFloat: boolean = reflect.internals.Types.isFloatType(boxedFloat);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedFloat);
      expect(isFloat).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns true for isNumericType (float belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT);
      expect(isFloat).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_FLOAT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns false for both isLongType and isByteType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFloatTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_FLOAT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns false for isShortType, isIntType, and isDoubleType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsFloatTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_FLOAT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_FLOAT and Class.from<Float>() have different references, but both are recognized as float types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsFloatTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primFloat: Class = Class.PRIMITIVE_FLOAT;
      const boxedFloat: Class = Class.from<Float>();
      expect(primFloat === boxedFloat).assertFalse();
      expect(reflect.internals.Types.isFloatType(primFloat)).assertTrue();
      expect(reflect.internals.Types.isFloatType(boxedFloat)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2800
     * @tc.desc    Verify that all non-float primitive types (DOUBLE, INT, LONG, BYTE, SHORT, BOOLEAN, CHAR, VOID) are not float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsFloatTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_FLOAT and boxed Float) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsFloatTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_FLOAT,
        Class.from<Float>(),
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isFloatType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsFloatTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_FLOAT_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_FLOAT satisfies isPrimitiveType and isNumericType; PRIMITIVE_BOOLEAN does not satisfy isFloatType, satisfies isPrimitiveType but not isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsFloatTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT)).assertTrue();

      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
