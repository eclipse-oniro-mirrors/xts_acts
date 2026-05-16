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

class Parent {}
class Child extends Parent {}
class TestClass {}

export default function BuiltinsClassIsSubtypeOfTest(): void {
  describe("BuiltinsClassIsSubtypeOfTest", () => {
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
     * @tc.name    BuiltinsClassIsSubtypeOfTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0100
     * @tc.desc    Verify isSubtypeOf with same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsSubtypeOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(objClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0200
     * @tc.desc    Verify isSubtypeOf with object class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      expect(arrClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0300
     * @tc.desc    Verify isSubtypeOf with string class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const str = 'test';
      const strClass = Class.of(str);
      expect(strClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0400
     * @tc.desc    Verify isSubtypeOf with primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const intClass = Class.PRIMITIVE_INT;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(intClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0500
     * @tc.desc    Verify isSubtypeOf with double primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const numberClass = Class.PRIMITIVE_NUMBER;
      expect(doubleClass.isSubtypeOf(numberClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0600
     * @tc.desc    Verify isSubtypeOf with boolean primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(booleanClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0700
     * @tc.desc    Verify isSubtypeOf with custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(testClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0800
     * @tc.desc    Verify isSubtypeOf with null class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsSubtypeOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(nullClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_0900
     * @tc.desc    Verify isSubtypeOf with byte primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(byteClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1000
     * @tc.desc    Verify isSubtypeOf with char primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(charClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1100
     * @tc.desc    Verify isSubtypeOf with short primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(shortClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1200
     * @tc.desc    Verify isSubtypeOf with long primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(longClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1300
     * @tc.desc    Verify isSubtypeOf with float primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(floatClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1400
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1400
     * @tc.desc    Verify isSubtypeOf with number primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(numberClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1500
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1500
     * @tc.desc    Verify isSubtypeOf with void primitive type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(voidClass.isSubtypeOf(objClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1600
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1600
     * @tc.desc    Verify isSubtypeOf with inheritance hierarchy
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parentObj = new Parent();
      const parentClass = Class.of(parentObj);
      const childObj = new Child();
      const childClass = Class.of(childObj);
      expect(childClass.isSubtypeOf(parentClass)).assertTrue();
      expect(parentClass.isSubtypeOf(childClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1700
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1700
     * @tc.desc    Verify isSubtypeOf with array of strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsSubtypeOfTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const strArr = new Array<string>();
      const strArrClass = Class.of(strArr);
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(strArrClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsSubtypeOfTest1800
     * @tc.number  SUB_BUILTINS_CLASS_IS_SUBTYPE_OF_TEST_1800
     * @tc.desc    Verify isSubtypeOf with nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsSubtypeOfTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nestedArr = new Array<Array<number>>();
      const nestedArrClass = Class.of(nestedArr);
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(nestedArrClass.isSubtypeOf(objClass)).assertTrue();
    });

  })
}
