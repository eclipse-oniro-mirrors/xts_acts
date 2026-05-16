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

export default function BuiltinsIsShortTypeTest(): void {
  describe('BuiltinsIsShortTypeTest', () => {
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
     * @tc.name    BuiltinsIsShortTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_SHORT is recognized as short type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsShortTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Short (Class.from<Short>()) is recognized as short type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsShortTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.from<Short>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_INT is not short type (int ≠ short), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsShortTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_BYTE is not short type (byte ≠ short), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsShortTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsShortTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_LONG is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_CHAR is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not short type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isShortType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isShortType(PRIMITIVE_SHORT) is true, isNumericType(PRIMITIVE_SHORT) should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_SHORT);
      expect(isShort).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_SHORT should return false for isIntType (short ≠ int)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_SHORT);
      expect(isShort).assertTrue();
      expect(isInt).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_SHORT should return false for isByteType (short ≠ byte)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsShortTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_SHORT);
      expect(isShort).assertTrue();
      expect(isByte).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_SHORT returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to isShortType on PRIMITIVE_SHORT yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const r2: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_SHORT and PRIMITIVE_BYTE are different Class objects with different results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass: Class = Class.PRIMITIVE_SHORT;
      const byteClass: Class = Class.PRIMITIVE_BYTE;
      expect(shortClass === byteClass).assertFalse();
      expect(reflect.internals.Types.isShortType(shortClass)).assertTrue();
      expect(reflect.internals.Types.isShortType(byteClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1800
     * @tc.desc    Verify that all non-short numeric types (DOUBLE, INT, LONG, FLOAT, BYTE) are not short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_BYTE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_SHORT and boxed Short) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_BYTE,
        Class.from<Short>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isShortType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_SHORT is true, PRIMITIVE_BYTE is false, user class is false, order doesn't affect results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_BYTE);
      const r2: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const r3: boolean = reflect.internals.Types.isShortType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_SHORT returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType, short is numeric type)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_SHORT);
      expect(isShort).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Short also returns true for isPrimitiveType (isShortType covers boxed, isNumericType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedShort: Class = Class.from<Short>();
      const isShort: boolean = reflect.internals.Types.isShortType(boxedShort);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedShort);
      expect(isShort).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_SHORT returns true for isNumericType (short is numeric type)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_SHORT);
      expect(isShort).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_SHORT returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_SHORT returns false for isIntType and isDoubleType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsShortTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT)).assertTrue();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_SHORT returns false for isLongType, isFloatType, and isByteType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsShortTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT)).assertTrue();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_SHORT and Class.from<Short>() have different references, but both are recognized as short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsShortTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primShort: Class = Class.PRIMITIVE_SHORT;
      const boxedShort: Class = Class.from<Short>();
      expect(primShort === boxedShort).assertFalse();
      expect(reflect.internals.Types.isShortType(primShort)).assertTrue();
      expect(reflect.internals.Types.isShortType(boxedShort)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2800
     * @tc.desc    Verify that all non-short primitive types (DOUBLE, INT, LONG, FLOAT, BYTE, BOOLEAN, CHAR, VOID) are not short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsShortTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_SHORT and boxed Short) return true from 9 types, the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsShortTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_SHORT,
        Class.from<Short>(),
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isShortType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsShortTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_SHORT_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_SHORT satisfies isPrimitiveType and isNumericType; PRIMITIVE_BOOLEAN doesn't satisfy isShortType, satisfies isPrimitiveType but not isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsShortTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_SHORT)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_SHORT)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_SHORT)).assertTrue();

      expect(reflect.internals.Types.isShortType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
