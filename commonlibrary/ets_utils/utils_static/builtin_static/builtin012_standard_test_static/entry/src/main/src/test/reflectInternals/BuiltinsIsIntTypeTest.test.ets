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

export default function BuiltinsIsIntTypeTest(): void {
  describe('BuiltinsIsIntTypeTest', () => {
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
     * @tc.name    BuiltinsIsIntTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_INT is recognized as int type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsIntTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Int (Class.from<Int>()) is recognized as int type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsIntTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.from<Int>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not int type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsIntTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_LONG is not int type (long ≠ int), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsIntTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not int type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsIntTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_CHAR is not int type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not int type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BYTE is not int type (byte ≠ int), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_SHORT is not int type (short ≠ int), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not int type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not int type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isIntType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isIntType(PRIMITIVE_INT) is true, isNumericType(PRIMITIVE_INT) should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT);
      expect(isInt).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_INT should return false for isDoubleType (int ≠ double)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const isDouble: boolean = reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT);
      expect(isInt).assertTrue();
      expect(isDouble).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_INT should return false for isLongType (int ≠ long)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsIntTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_INT);
      expect(isInt).assertTrue();
      expect(isLong).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_INT returns false for both isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_INT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to PRIMITIVE_INT yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const r2: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_INT and PRIMITIVE_LONG are different Class objects with different results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass: Class = Class.PRIMITIVE_INT;
      const longClass: Class = Class.PRIMITIVE_LONG;
      expect(intClass === longClass).assertFalse();
      expect(reflect.internals.Types.isIntType(intClass)).assertTrue();
      expect(reflect.internals.Types.isIntType(longClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1800
     * @tc.desc    Verify that all non-int numeric types (DOUBLE, LONG, FLOAT, BYTE, SHORT) are not int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_INT and boxed Int) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_FLOAT,
        Class.from<Int>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isIntType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_INT is true, PRIMITIVE_LONG is false, user class is false, order does not affect results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG);
      const r2: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const r3: boolean = reflect.internals.Types.isIntType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });
    /**
     * @tc.name    BuiltinsIsIntTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_INT returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType, int belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT);
      expect(isInt).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Int returns true for isPrimitiveType (isIntType covers boxed, so isNumericType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedInt: Class = Class.from<Int>();
      const isInt: boolean = reflect.internals.Types.isIntType(boxedInt);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedInt);
      expect(isInt).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_INT returns true for isNumericType (int belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_INT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT);
      expect(isInt).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_INT returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_INT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_INT returns false for both isLongType and isDoubleType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsIntTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_INT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_INT returns false for isFloatType, isByteType, and isShortType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsIntTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_INT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_INT and Class.from<Int>() have different references, but both are recognized as int types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsIntTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primInt: Class = Class.PRIMITIVE_INT;
      const boxedInt: Class = Class.from<Int>();
      expect(primInt === boxedInt).assertFalse();
      expect(reflect.internals.Types.isIntType(primInt)).assertTrue();
      expect(reflect.internals.Types.isIntType(boxedInt)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2800
     * @tc.desc    Verify that all non-int primitive types (DOUBLE, LONG, FLOAT, BYTE, SHORT, BOOLEAN, CHAR, VOID) are not int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsIntTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_INT and boxed Int) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsIntTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_INT,
        Class.from<Int>(),
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isIntType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsIntTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_INT_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_INT satisfies isPrimitiveType and isNumericType; PRIMITIVE_BOOLEAN does not satisfy isIntType, satisfies isPrimitiveType but not isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsIntTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_INT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_INT)).assertTrue();

      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
