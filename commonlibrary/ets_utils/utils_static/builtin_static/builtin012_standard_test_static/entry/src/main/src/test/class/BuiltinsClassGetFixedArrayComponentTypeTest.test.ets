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

class TestClass {}

export default function BuiltinsClassGetFixedArrayComponentTypeTest(): void {
  describe("BuiltinsClassGetFixedArrayComponentTypeTest", () => {
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
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0100
     * @tc.desc    Verify getFixedArrayComponentType for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const componentType = booleanClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0200
     * @tc.desc    Verify getFixedArrayComponentType for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      const componentType = intClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0300
     * @tc.desc    Verify getFixedArrayComponentType for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const componentType = doubleClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0400
     * @tc.desc    Verify getFixedArrayComponentType for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const componentType = objClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0500
     * @tc.desc    Verify getFixedArrayComponentType for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      const componentType = arrClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0600
     * @tc.desc    Verify getFixedArrayComponentType for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      const componentType = strClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0700
     * @tc.desc    Verify getFixedArrayComponentType for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const componentType = currentClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0800
     * @tc.desc    Verify getFixedArrayComponentType for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const componentType = nullClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_0900
     * @tc.desc    Verify getFixedArrayComponentType for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      const componentType = testClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1000
     * @tc.desc    Verify getFixedArrayComponentType for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const componentType = byteClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1100
     * @tc.desc    Verify getFixedArrayComponentType for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const componentType = charClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1200
     * @tc.desc    Verify getFixedArrayComponentType for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const componentType = shortClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1300
     * @tc.desc    Verify getFixedArrayComponentType for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const componentType = longClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1400
     * @tc.desc    Verify getFixedArrayComponentType for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const componentType = floatClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1500
     * @tc.desc    Verify getFixedArrayComponentType for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const componentType = numberClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1600
     * @tc.desc    Verify getFixedArrayComponentType for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const componentType = voidClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1700
     * @tc.desc    Verify getFixedArrayComponentType returns component type for FixedArray with PRIMITIVE_DOUBLE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fixedArr = reflect.internals.createFixedArray(Class.PRIMITIVE_DOUBLE, 10 as int);
      const arrClass = Class.of(fixedArr);
      const componentType = arrClass.getFixedArrayComponentType();

      expect(componentType !== undefined).assertTrue();
      expect(componentType).assertEqual(Class.PRIMITIVE_DOUBLE);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1800
     * @tc.desc    Verify getFixedArrayComponentType returns component type for FixedArray<string>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fixedArr = new FixedArray<string>(5);
      const arrClass = Class.of(fixedArr);
      const componentType = arrClass.getFixedArrayComponentType();
      const stringClass = Class.of('');

      expect(componentType !== undefined).assertTrue();
      expect(componentType).assertEqual(stringClass);
    });

    /**
     * @tc.name    BuiltinsClassGetFixedArrayComponentTypeTest1900
     * @tc.number  SUB_BUILTINS_CLASS_GET_FIXED_ARRAY_COMPONENT_TYPE_TEST_1900
     * @tc.desc    Verify getFixedArrayComponentType returns component type for FixedArray of custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetFixedArrayComponentTypeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fixedArr = new FixedArray<TestClass>(3);
      const arrClass = Class.of(fixedArr);
      const componentType = arrClass.getFixedArrayComponentType();

      expect(componentType !== undefined).assertTrue();
      expect(componentType).assertEqual(Class.of(new TestClass()));
    });

  })
}
