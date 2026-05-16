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

export default function BuiltinsIsBooleanTypeTest(): void {
  describe('BuiltinsIsBooleanTypeTest', () => {
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
     * @tc.name    BuiltinsIsBooleanTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is recognized as boolean type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsBooleanTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Boolean (Class.from<Boolean>()) is recognized as boolean type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsBooleanTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.from<Boolean>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsBooleanTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_INT is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsBooleanTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_CHAR is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsBooleanTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_LONG is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BYTE is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_SHORT is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isBooleanType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isBooleanType(PRIMITIVE_BOOLEAN) is true, isPrimitiveType should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN);
      expect(isBool).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1300
     * @tc.desc    Cross-validation: isBooleanType(PRIMITIVE_BOOLEAN) is true, isNumericType(PRIMITIVE_BOOLEAN) is false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN);
      expect(isBool).assertTrue();
      expect(isNumeric).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_DOUBLE returns true for isDoubleType and false for isBooleanType (mutually exclusive)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsBooleanTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_DOUBLE);
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_DOUBLE);
      expect(isDouble).assertTrue();
      expect(isBool).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1500
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns false for both isCharType and isDoubleType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to PRIMITIVE_BOOLEAN yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const r2: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN and PRIMITIVE_DOUBLE are different Class objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boolClass: Class = Class.PRIMITIVE_BOOLEAN;
      const doubleClass: Class = Class.PRIMITIVE_DOUBLE;
      expect(boolClass === doubleClass).assertFalse();
      expect(reflect.internals.Types.isBooleanType(boolClass)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(doubleClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1800
     * @tc.desc    Verify that all numeric types (DOUBLE, INT, LONG, FLOAT, BYTE, SHORT) are not boolean types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_BOOLEAN and boxed Boolean) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.from<Boolean>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isBooleanType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_BOOLEAN is true, PRIMITIVE_INT is false, user class is false, results are not affected by call order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(42) as Object);
      const r1: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT);
      const r2: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const r3: boolean = reflect.internals.Types.isBooleanType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });
    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN);
      expect(isBool).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Boolean returns true for isPrimitiveType (isBooleanType covers boxed, so isPrimitiveType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedBool: Class = Class.from<Boolean>();
      const isBool: boolean = reflect.internals.Types.isBooleanType(boxedBool);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedBool);
      expect(isBool).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns false for isNumericType (boolean does not belong to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN);
      expect(isBool).assertTrue();
      expect(isNumeric).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns false for isCharType (boolean ≠ char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN);
      expect(isBool).assertTrue();
      expect(isChar).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns false for both isDoubleType and isLongType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsBooleanTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN returns false for isFloatType, isByteType, and isShortType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsBooleanTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN and Class.from<Boolean>() have different references but both are recognized as boolean types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsBooleanTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primBool: Class = Class.PRIMITIVE_BOOLEAN;
      const boxedBool: Class = Class.from<Boolean>();
      expect(primBool === boxedBool).assertFalse();
      expect(reflect.internals.Types.isBooleanType(primBool)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(boxedBool)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2800
     * @tc.desc    Verify that all numeric types (DOUBLE, INT, LONG, FLOAT, BYTE, SHORT) and CHAR, VOID are not boolean types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsBooleanTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_BOOLEAN and boxed Boolean) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsBooleanTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_BOOLEAN,
        Class.from<Boolean>(),
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isBooleanType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsBooleanTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_BOOLEAN_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_BOOLEAN satisfies isPrimitiveType but not isNumericType; PRIMITIVE_INT does not satisfy isBooleanType but satisfies isPrimitiveType and isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsBooleanTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();

      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT)).assertTrue();
    });
  });
}
