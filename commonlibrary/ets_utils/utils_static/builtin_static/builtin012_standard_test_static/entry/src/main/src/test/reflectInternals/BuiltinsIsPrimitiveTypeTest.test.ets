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

export default function BuiltinsIsPrimitiveTypeTest(): void {
  describe('BuiltinsIsPrimitiveTypeTest', () => {
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
     * @tc.name    BuiltinsIsPrimitiveTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns true for isPrimitiveType (via isBooleanType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0200
     * @tc.desc    Verify that PRIMITIVE_DOUBLE returns true for isPrimitiveType (via isNumericType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_INT returns true for isPrimitiveType (via isNumericType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_LONG returns true for isPrimitiveType (via isNumericType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_LONG);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns true for isPrimitiveType (via isNumericType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_FLOAT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_BYTE returns true for isPrimitiveType (via isNumericType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BYTE);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_SHORT returns true for isPrimitiveType (via isNumericType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_SHORT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_CHAR returns false for isPrimitiveType (char is neither numeric nor boolean)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrimitiveTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_VOID returns false for isPrimitiveType (void is neither numeric nor boolean)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1000
     * @tc.desc    Verify that user-defined class returns false for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isPrimitiveType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1100
     * @tc.desc    Verify that boxed Boolean (Class.from<Boolean>()) returns true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.from<Boolean>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1200
     * @tc.desc    Verify that boxed Double (Class.from<Double>()) returns true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isPrimitiveType(Class.from<Double>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_BOOLEAN satisfies isPrimitiveType but not isNumericType (boolean uses isBooleanType branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN);
      const isBoolean: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      expect(isPrimitive).assertTrue();
      expect(isNumeric).assertFalse();
      expect(isBoolean).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_INT satisfies isPrimitiveType and isNumericType, but not isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT);
      const isBoolean: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT);
      expect(isPrimitive).assertTrue();
      expect(isNumeric).assertTrue();
      expect(isBoolean).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_CHAR returns false for isPrimitiveType, isNumericType, and isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrimitiveTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR);
      const isBoolean: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR);
      expect(isPrimitive).assertFalse();
      expect(isNumeric).assertFalse();
      expect(isBoolean).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to isPrimitiveType on the same type yield consistent results (idempotency)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT);
      const r2: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN and PRIMITIVE_INT are different Class objects, but both return true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boolClass: Class = Class.PRIMITIVE_BOOLEAN;
      const intClass: Class = Class.PRIMITIVE_INT;
      expect(boolClass === intClass).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(boolClass)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(intClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1800
     * @tc.desc    Verify that all 6 numeric types (DOUBLE, INT, LONG, FLOAT, BYTE, SHORT) return true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_DOUBLE)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_LONG)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_SHORT)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_1900
     * @tc.desc    Verify that PRIMITIVE_CHAR, PRIMITIVE_VOID, and user-defined class return false for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(0) as Object);
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(userCls)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2000
     * @tc.desc    Comprehensive statistics: 7 types (BOOLEAN + 6 numeric types) return true, CHAR returns false (total 1 false)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isPrimitiveType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(6);
      expect(falseCount).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns true for isPrimitiveType, and boxed Boolean also returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const primBool: Class = Class.PRIMITIVE_BOOLEAN;
      const boxedBool: Class = Class.from<Boolean>();
      expect(primBool === boxedBool).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(primBool)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(boxedBool)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Int (Class.from<Int>()) returns true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedInt: Class = Class.from<Int>();
      const result: boolean = reflect.internals.Types.isPrimitiveType(boxedInt);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_FLOAT returns true for isPrimitiveType, true for isNumericType, and false for isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_FLOAT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_FLOAT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_CHAR returns false for isPrimitiveType, isNumericType, and isBooleanType (char doesn't satisfy any branch)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrimitiveTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2500
     * @tc.desc    Verify that boxed Float and boxed Long return true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsPrimitiveTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isPrimitiveType(Class.from<Float>())).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.from<Long>())).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_VOID returns false for isPrimitiveType, isNumericType, and isBooleanType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsPrimitiveTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_DOUBLE and Class.from<Double>() have different references, but both return true for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsPrimitiveTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primDouble: Class = Class.PRIMITIVE_DOUBLE;
      const boxedDouble: Class = Class.from<Double>();
      expect(primDouble === boxedDouble).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(primDouble)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(boxedDouble)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2800
     * @tc.desc    Verify that all non-primitive types (CHAR, VOID, user-defined class) return false for isPrimitiveType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsPrimitiveTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_VOID)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(userCls)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_2900
     * @tc.desc    Statistical verification: Exactly 7 types (BOOLEAN + 6 numeric primitives) return true from 9 types, CHAR and VOID each return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsPrimitiveTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_VOID
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isPrimitiveType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(7);
      expect(falseCount).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsIsPrimitiveTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_PRIMITIVE_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_BOOLEAN (isPrimitive=true, isNumeric=false); PRIMITIVE_INT (isPrimitive=true, isNumeric=true); PRIMITIVE_CHAR (isPrimitive=false, isNumeric=false)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsPrimitiveTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();

      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT)).assertTrue();

      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR)).assertFalse();
    });
  });
}
