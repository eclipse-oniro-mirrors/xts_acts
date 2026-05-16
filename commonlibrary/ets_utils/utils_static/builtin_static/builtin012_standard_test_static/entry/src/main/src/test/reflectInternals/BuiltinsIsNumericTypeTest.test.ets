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

export default function BuiltinsIsNumericTypeTest(): void {
  describe('BuiltinsIsNumericTypeTest', () => {
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
     * @tc.name    BuiltinsIsNumericTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns true for isNumericType (via isDoubleType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0200
     * @tc.desc    Verify that PRIMITIVE_INT returns true for isNumericType (via isIntType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_LONG returns true for isNumericType (via isLongType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_LONG);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_BYTE returns true for isNumericType (via isByteType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BYTE);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_SHORT returns true for isNumericType (via isShortType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_SHORT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns true for isNumericType (via isFloatType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns false for isNumericType (boolean is not a numeric type)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_CHAR returns false for isNumericType (char is not a numeric type)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsNumericTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_VOID returns false for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1000
     * @tc.desc    Verify that user-defined class returns false for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isNumericType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1100
     * @tc.desc    Verify that boxed Double (Class.from<Double>()) returns true for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.from<Double>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1200
     * @tc.desc    Verify that boxed Int (Class.from<Int>()) returns true for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isNumericType(Class.from<Int>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_DOUBLE satisfies isNumericType and isPrimitiveType, but does not satisfy isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_DOUBLE);
      const isBoolean: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_DOUBLE);
      expect(isNumeric).assertTrue();
      expect(isPrimitive).assertTrue();
      expect(isBoolean).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_BOOLEAN returns false for isNumericType, true for isPrimitiveType, and true for isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN);
      const isBoolean: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      expect(isNumeric).assertFalse();
      expect(isPrimitive).assertTrue();
      expect(isBoolean).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_CHAR returns false for isNumericType, isPrimitiveType, and isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsNumericTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR);
      const isBoolean: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR);
      expect(isNumeric).assertFalse();
      expect(isPrimitive).assertFalse();
      expect(isBoolean).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to isNumericType on the same type yield consistent results (idempotency)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT);
      const r2: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_INT and PRIMITIVE_DOUBLE are different Class objects, but both return true for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass: Class = Class.PRIMITIVE_INT;
      const doubleClass: Class = Class.PRIMITIVE_DOUBLE;
      expect(intClass === doubleClass).assertFalse();
      expect(reflect.internals.Types.isNumericType(intClass)).assertTrue();
      expect(reflect.internals.Types.isNumericType(doubleClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1800
     * @tc.desc    Verify that all 6 numeric primitive types (DOUBLE, INT, LONG, FLOAT, BYTE, SHORT) return true for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_SHORT)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_1900
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN, PRIMITIVE_CHAR, PRIMITIVE_VOID, and user-defined class all return false for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(0) as Object);
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isNumericType(userCls)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2000
     * @tc.desc    Statistical verification: Exactly 6 types (6 numeric types) return true from 8 types, BOOLEAN and CHAR each return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isNumericType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(6);
      expect(falseCount).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns true for isPrimitiveType and isNumericType (numeric types satisfy isPrimitive)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_DOUBLE);
      expect(isNumeric).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Double returns true for isNumericType, and boxed Boolean returns false for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedDouble: Class = Class.from<Double>();
      const boxedBool: Class = Class.from<Boolean>();
      expect(reflect.internals.Types.isNumericType(boxedDouble)).assertTrue();
      expect(reflect.internals.Types.isNumericType(boxedBool)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_INT returns true for isNumericType, and false for isDoubleType and isFloatType (type exclusivity)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_INT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_LONG returns true for isNumericType, and false for isIntType, isByteType, and isShortType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsNumericTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_LONG)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2500
     * @tc.desc    Verify that boxed Float and boxed Long both return true for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsNumericTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isNumericType(Class.from<Float>())).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.from<Long>())).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_VOID returns false for isNumericType, isPrimitiveType, and isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsNumericTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_FLOAT and Class.from<Float>() have different references, but both return true for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsNumericTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primFloat: Class = Class.PRIMITIVE_FLOAT;
      const boxedFloat: Class = Class.from<Float>();
      expect(primFloat === boxedFloat).assertFalse();
      expect(reflect.internals.Types.isNumericType(primFloat)).assertTrue();
      expect(reflect.internals.Types.isNumericType(boxedFloat)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2800
     * @tc.desc    Verify that all non-numeric types (BOOLEAN, CHAR, VOID, user-defined class) return false for isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsNumericTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isNumericType(userCls)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_2900
     * @tc.desc    Statistical verification: Exactly 6 numeric primitive types return true from 9 types, BOOLEAN, CHAR, and VOID return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsNumericTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_VOID
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isNumericType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(6);
      expect(falseCount).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsIsNumericTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_NUMERIC_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_INT (isNumeric=true, isPrimitive=true, isBoolean=false); PRIMITIVE_BOOLEAN (isNumeric=false, isPrimitive=true, isBoolean=true); PRIMITIVE_CHAR (isNumeric=false, isPrimitive=false, isBoolean=false)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsNumericTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT)).assertFalse();

      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN)).assertTrue();

      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR)).assertFalse();
    });
  });
}
