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

export default function BuiltinsIsDoubleTypeTest(): void {
  describe('BuiltinsIsDoubleTypeTest', () => {
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
     * @tc.name    BuiltinsIsDoubleTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is recognized as double type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0200
     * @tc.desc    Verify that PRIMITIVE_INT is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not double type (float ≠ double), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_CHAR is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_LONG is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_BYTE is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_SHORT is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_VOID is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1000
     * @tc.desc    Verify that user-defined class is not double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isDoubleType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1100
     * @tc.desc    Verify that boxed Double (Class.from<Double>()) is recognized as double type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isDoubleType(Class.from<Double>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1200
     * @tc.desc    Verify that multiple calls to PRIMITIVE_DOUBLE yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      const r2: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1300
     * @tc.desc    Verify that both PRIMITIVE_DOUBLE and Class.from<Double>() return true (both are double types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let count: number = 0;
      if (reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE)) {
        count++;
      }
      if (reflect.internals.Types.isDoubleType(Class.from<Double>())) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1400
     * @tc.desc    Verify that neither PRIMITIVE_INT nor PRIMITIVE_FLOAT is double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intResult: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT);
      const floatResult: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_FLOAT);
      expect(intResult).assertFalse();
      expect(floatResult).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1500
     * @tc.desc    Verify that multiple non-double primitive types (LONG, BYTE, SHORT) all return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longResult: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_LONG);
      const byteResult: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BYTE);
      const shortResult: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_SHORT);
      expect(longResult).assertFalse();
      expect(byteResult).assertFalse();
      expect(shortResult).assertFalse();
    });
    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1600
     * @tc.desc    Verify that four primitive types (INT, BOOLEAN, CHAR, LONG) are not double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_LONG)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1700
     * @tc.desc    Verify that two consecutive calls to Class.from<Double>() yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsDoubleTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const r1: boolean = reflect.internals.Types.isDoubleType(Class.from<Double>());
      const r2: boolean = reflect.internals.Types.isDoubleType(Class.from<Double>());
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1800
     * @tc.desc    Cross-validation: When isDoubleType(PRIMITIVE_DOUBLE) is true, isNumericType(PRIMITIVE_DOUBLE) should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE);
      expect(isDouble).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_1900
     * @tc.desc    Cross-validation: PRIMITIVE_DOUBLE should return false for isFloatType (double is not float)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsDoubleTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_DOUBLE);
      expect(isDouble).assertTrue();
      expect(isFloat).assertFalse();
    });
    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2000
     * @tc.desc    Verify that isDoubleType returns false for user class and PRIMITIVE_INT, regardless of calling order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isDoubleType(userCls);
      const r2: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT);
      const r3: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(r3).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType, double belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_DOUBLE);
      expect(isDouble).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Double returns true for isPrimitiveType (isDoubleType covers boxed, so isNumericType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedDouble: Class = Class.from<Double>();
      const isDouble: boolean = reflect.internals.Types.isDoubleType(boxedDouble);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedDouble);
      expect(isDouble).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns true for isNumericType (double belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE);
      expect(isDouble).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_DOUBLE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns false for both isIntType and isLongType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_DOUBLE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns false for isFloatType, isByteType, and isShortType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsDoubleTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_DOUBLE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_DOUBLE and Class.from<Double>() have different references, but both are recognized as double types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsDoubleTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primDouble: Class = Class.PRIMITIVE_DOUBLE;
      const boxedDouble: Class = Class.from<Double>();
      expect(primDouble === boxedDouble).assertFalse();
      expect(reflect.internals.Types.isDoubleType(primDouble)).assertTrue();
      expect(reflect.internals.Types.isDoubleType(boxedDouble)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2800
     * @tc.desc    Verify that all non-double primitive types (INT, LONG, FLOAT, BYTE, SHORT, BOOLEAN, CHAR, VOID) are not double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsDoubleTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_DOUBLE and boxed Double) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsDoubleTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_DOUBLE,
        Class.from<Double>(),
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isDoubleType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsDoubleTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_DOUBLE_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_DOUBLE satisfies isPrimitiveType and isNumericType; PRIMITIVE_BOOLEAN does not satisfy isDoubleType, satisfies isPrimitiveType but not isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsDoubleTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_DOUBLE)).assertTrue();

      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
