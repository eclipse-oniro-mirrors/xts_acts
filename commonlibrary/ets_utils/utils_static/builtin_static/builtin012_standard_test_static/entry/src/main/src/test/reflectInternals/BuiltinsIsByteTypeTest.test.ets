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

export default function BuiltinsIsByteTypeTest(): void {
  describe('BuiltinsIsByteTypeTest', () => {
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
     * @tc.name    BuiltinsIsByteTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_BYTE is recognized as byte type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsByteTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Byte (Class.from<Byte>()) is recognized as byte type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsByteTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.from<Byte>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_INT is not byte type (int ≠ byte), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsByteTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_SHORT is not byte type (short ≠ byte), returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsByteTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsByteTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_LONG is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_CHAR is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_CHAR);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not byte type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isByteType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isByteType(PRIMITIVE_BYTE) is true, isNumericType(PRIMITIVE_BYTE) should also be true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BYTE);
      expect(isByte).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1300
     * @tc.desc    Cross-validation: PRIMITIVE_BYTE should return false for isIntType (byte ≠ int)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const isInt: boolean = reflect.internals.Types.isIntType(Class.PRIMITIVE_BYTE);
      expect(isByte).assertTrue();
      expect(isInt).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_BYTE should return false for isShortType (byte ≠ short)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsByteTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_BYTE);
      expect(isByte).assertTrue();
      expect(isShort).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_BYTE returns false for both isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BYTE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to PRIMITIVE_BYTE yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const r2: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_BYTE and PRIMITIVE_SHORT are different Class objects with different results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass: Class = Class.PRIMITIVE_BYTE;
      const shortClass: Class = Class.PRIMITIVE_SHORT;
      expect(byteClass === shortClass).assertFalse();
      expect(reflect.internals.Types.isByteType(byteClass)).assertTrue();
      expect(reflect.internals.Types.isByteType(shortClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1800
     * @tc.desc    Verify that all non-byte numeric types (DOUBLE, INT, LONG, FLOAT, SHORT) are not byte types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_BYTE and boxed Byte) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_SHORT,
        Class.from<Byte>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isByteType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_BYTE is true, PRIMITIVE_SHORT is false, user class is false, order does not affect results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_SHORT);
      const r2: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const r3: boolean = reflect.internals.Types.isByteType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_BYTE returns true for isPrimitiveType (isPrimitiveType = isNumericType || isBooleanType, byte belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BYTE);
      expect(isByte).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Byte also returns true for isPrimitiveType (isByteType covers boxed, so isNumericType becomes true)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedByte: Class = Class.from<Byte>();
      const isByte: boolean = reflect.internals.Types.isByteType(boxedByte);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedByte);
      expect(isByte).assertTrue();
      expect(isPrimitive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2300
     * @tc.desc    Verify that PRIMITIVE_BYTE returns true for isNumericType (byte belongs to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_BYTE);
      expect(isByte).assertTrue();
      expect(isNumeric).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2400
     * @tc.desc    Verify that PRIMITIVE_BYTE returns false for isBooleanType and isCharType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BYTE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2500
     * @tc.desc    Verify that PRIMITIVE_BYTE returns false for both isLongType and isDoubleType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsByteTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isLongType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_BYTE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2600
     * @tc.desc    Verify that PRIMITIVE_BYTE returns false for both isFloatType and isIntType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsByteTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isFloatType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_BYTE)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2700
     * @tc.desc    Verify that PRIMITIVE_BYTE and Class.from<Byte>() have different references but both are recognized as byte types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsByteTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primByte: Class = Class.PRIMITIVE_BYTE;
      const boxedByte: Class = Class.from<Byte>();
      expect(primByte === boxedByte).assertFalse();
      expect(reflect.internals.Types.isByteType(primByte)).assertTrue();
      expect(reflect.internals.Types.isByteType(boxedByte)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2800
     * @tc.desc    Verify that all non-byte primitive types (DOUBLE, INT, LONG, FLOAT, SHORT, BOOLEAN, CHAR, VOID) are not byte types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsByteTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_BYTE and boxed Byte) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsByteTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_BYTE,
        Class.from<Byte>(),
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_SHORT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_CHAR
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isByteType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsByteTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_BYTE_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: PRIMITIVE_BYTE satisfies isPrimitiveType and isNumericType; PRIMITIVE_BOOLEAN does not satisfy isByteType, satisfies isPrimitiveType but not isNumericType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsByteTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BYTE)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BYTE)).assertTrue();

      expect(reflect.internals.Types.isByteType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
