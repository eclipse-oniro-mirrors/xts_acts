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

export default function BuiltinsIsCharTypeTest(): void {
  describe('BuiltinsIsCharTypeTest', () => {
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
     * @tc.name    BuiltinsIsCharTypeTest0100
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0100
     * @tc.desc    Verify that PRIMITIVE_CHAR is recognized as char type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsCharTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0200
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0200
     * @tc.desc    Verify that boxed Char (Class.from<Char>()) is recognized as char type, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsCharTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.from<Char>());
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0300
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0300
     * @tc.desc    Verify that PRIMITIVE_BOOLEAN is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsCharTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0400
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0400
     * @tc.desc    Verify that PRIMITIVE_INT is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsCharTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_INT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0500
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0500
     * @tc.desc    Verify that PRIMITIVE_DOUBLE is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsCharTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_DOUBLE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0600
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0600
     * @tc.desc    Verify that PRIMITIVE_LONG is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_LONG);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0700
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0700
     * @tc.desc    Verify that PRIMITIVE_FLOAT is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_FLOAT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0800
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0800
     * @tc.desc    Verify that PRIMITIVE_BYTE is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_BYTE);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest0900
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_0900
     * @tc.desc    Verify that PRIMITIVE_SHORT is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_SHORT);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1000
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1000
     * @tc.desc    Verify that PRIMITIVE_VOID is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_VOID);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1100
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1100
     * @tc.desc    Verify that user-defined class is not char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls: Class = Class.of(new SampleClass(1) as Object);
      const result: boolean = reflect.internals.Types.isCharType(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1200
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1200
     * @tc.desc    Cross-validation: When isCharType(PRIMITIVE_CHAR) is true, isNumericType(PRIMITIVE_CHAR) should be false (char does not belong to numeric types)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isNumeric: boolean = reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isNumeric).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1300
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1300
     * @tc.desc    Cross-validation: When isCharType(PRIMITIVE_CHAR) is true, isBooleanType(PRIMITIVE_CHAR) should be false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isBool).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1400
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1400
     * @tc.desc    Cross-validation: PRIMITIVE_BOOLEAN returns true for isBooleanType and false for isCharType (mutually exclusive)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsCharTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isBool: boolean = reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN);
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN);
      expect(isBool).assertTrue();
      expect(isChar).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1500
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1500
     * @tc.desc    Cross-validation: PRIMITIVE_CHAR returns false for both isDoubleType and isIntType
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR)).assertTrue();
      expect(reflect.internals.Types.isDoubleType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isIntType(Class.PRIMITIVE_CHAR)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1600
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1600
     * @tc.desc    Verify that multiple calls to PRIMITIVE_CHAR yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const r1: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const r2: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1700
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1700
     * @tc.desc    Verify that PRIMITIVE_CHAR and PRIMITIVE_BOOLEAN are different Class objects with different results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const charClass: Class = Class.PRIMITIVE_CHAR;
      const boolClass: Class = Class.PRIMITIVE_BOOLEAN;
      expect(charClass === boolClass).assertFalse();
      expect(reflect.internals.Types.isCharType(charClass)).assertTrue();
      expect(reflect.internals.Types.isCharType(boolClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1800
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1800
     * @tc.desc    Verify that all numeric types (DOUBLE, INT, LONG, FLOAT, BYTE, SHORT) are not char types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_SHORT)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest1900
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_1900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_CHAR and boxed Char) return true from multiple types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_CHAR,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_BYTE,
        Class.from<Char>()
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isCharType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2000
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2000
     * @tc.desc    Comprehensive verification: PRIMITIVE_CHAR is true, PRIMITIVE_BOOLEAN is false, user class is false, order does not affect results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const userCls: Class = Class.of(new SampleClass(99) as Object);
      const r1: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN);
      const r2: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const r3: boolean = reflect.internals.Types.isCharType(userCls);
      expect(r1).assertFalse();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2100
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2100
     * @tc.desc    Verify that PRIMITIVE_CHAR returns false for isPrimitiveType (isPrimitiveType only covers numeric types and boolean, not char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isPrimitive).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2200
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2200
     * @tc.desc    Verify that boxed Char returns false for isPrimitiveType (boxed types are not primitive)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const boxedChar: Class = Class.from<Char>();
      const isChar: boolean = reflect.internals.Types.isCharType(boxedChar);
      const isPrimitive: boolean = reflect.internals.Types.isPrimitiveType(boxedChar);
      expect(isChar).assertTrue();
      expect(isPrimitive).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2300
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2300
     * @tc.desc    Verify that isCharType and isLongType results for PRIMITIVE_CHAR are mutually exclusive
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isLong: boolean = reflect.internals.Types.isLongType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isLong).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2400
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2400
     * @tc.desc    Verify that isCharType and isShortType results for PRIMITIVE_CHAR are mutually exclusive (char ≠ short)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isShort: boolean = reflect.internals.Types.isShortType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isShort).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2500
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2500
     * @tc.desc    Verify that isCharType and isByteType results for PRIMITIVE_CHAR are mutually exclusive (char ≠ byte)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsCharTypeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isByte: boolean = reflect.internals.Types.isByteType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isByte).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2600
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2600
     * @tc.desc    Verify that isCharType and isFloatType results for PRIMITIVE_CHAR are mutually exclusive (char ≠ float)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsCharTypeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const isChar: boolean = reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR);
      const isFloat: boolean = reflect.internals.Types.isFloatType(Class.PRIMITIVE_CHAR);
      expect(isChar).assertTrue();
      expect(isFloat).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2700
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2700
     * @tc.desc    Verify that Class object reference of PRIMITIVE_CHAR is different from Class.from<Char>(), but both are recognized as char types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsCharTypeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const primitiveChar: Class = Class.PRIMITIVE_CHAR;
      const boxedChar: Class = Class.from<Char>();
      expect(primitiveChar === boxedChar).assertFalse();
      expect(reflect.internals.Types.isCharType(primitiveChar)).assertTrue();
      expect(reflect.internals.Types.isCharType(boxedChar)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2800
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2800
     * @tc.desc    Verify that all non-char primitive types (BOOLEAN, INT, DOUBLE, LONG, FLOAT, BYTE, SHORT, VOID) return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsCharTypeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_INT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_DOUBLE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_LONG)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_FLOAT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BYTE)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_SHORT)).assertFalse();
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_VOID)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest2900
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_2900
     * @tc.desc    Verify that exactly 2 types (PRIMITIVE_CHAR and boxed Char) return true from 9 types, and the remaining 7 return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsCharTypeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let trueCount: number = 0;
      let falseCount: number = 0;
      const types: Array<Class> = [
        Class.PRIMITIVE_CHAR,
        Class.from<Char>(),
        Class.PRIMITIVE_BOOLEAN,
        Class.PRIMITIVE_INT,
        Class.PRIMITIVE_DOUBLE,
        Class.PRIMITIVE_LONG,
        Class.PRIMITIVE_FLOAT,
        Class.PRIMITIVE_BYTE,
        Class.PRIMITIVE_SHORT
      ];
      for (let i = 0; i < types.length; i++) {
        if (reflect.internals.Types.isCharType(types[i])) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsIsCharTypeTest3000
     * @tc.number  SUB_BUILTINS_IS_CHAR_TYPE_TEST_3000
     * @tc.desc    Comprehensive verification: char does not belong to isPrimitiveType or numeric; boolean belongs to isPrimitiveType but not numeric; the two types are mutually exclusive
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('BuiltinsIsCharTypeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_CHAR)).assertTrue();
      expect(reflect.internals.Types.isPrimitiveType(Class.PRIMITIVE_CHAR)).assertFalse();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_CHAR)).assertFalse();

      expect(reflect.internals.Types.isCharType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
      expect(reflect.internals.Types.isBooleanType(Class.PRIMITIVE_BOOLEAN)).assertTrue();
      expect(reflect.internals.Types.isNumericType(Class.PRIMITIVE_BOOLEAN)).assertFalse();
    });
  });
}
