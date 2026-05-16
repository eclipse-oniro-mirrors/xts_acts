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

class CustomTestClass {}

interface CustomTestInterface {}

export default function BuiltinsClassGetNameTest(): void {
  describe("BuiltinsClassGetNameTest", () => {
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
     * @tc.name    BuiltinsClassGetNameTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0100
     * @tc.desc    Verify getName for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const name = booleanClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('u1');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0200
     * @tc.desc    Verify getName for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const name = byteClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('i8');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0300
     * @tc.desc    Verify getName for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const name = charClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('u16');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0400
     * @tc.desc    Verify getName for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const name = shortClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('i16');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0500
     * @tc.desc    Verify getName for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      const name = intClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('i32');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0600
     * @tc.desc    Verify getName for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const name = longClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('i64');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0700
     * @tc.desc    Verify getName for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const name = floatClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('f32');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0800
     * @tc.desc    Verify getName for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const name = doubleClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('f64');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_0900
     * @tc.desc    Verify getName for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const name = numberClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('f64');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1000
     * @tc.desc    Verify getName for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNameTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const name = voidClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('void');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1100
     * @tc.desc    Verify getName for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const name = objClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1200
     * @tc.desc    Verify getName for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      const name = arrClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('std.core.Array');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1300
     * @tc.desc    Verify getName for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      const name = strClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('std.core.String');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1400
     * @tc.desc    Verify getName for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const name = currentClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name.length).assertLarger(0);
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1500
     * @tc.desc    Verify getName for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetNameTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const name = nullClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name).assertEqual('std.core.Null');
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1600
     * @tc.desc    Verify getName lazy loading behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<Object>();
      const firstCallName = testClass.getName();
      expect(firstCallName.length).assertLarger(0);
      const secondCallName = testClass.getName();
      expect(secondCallName).assertEqual(firstCallName);
      const thirdCallName = testClass.getName();
      expect(thirdCallName).assertEqual(firstCallName);
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1700
     * @tc.desc    Verify getName for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const customClass = Class.from<CustomTestClass>();
      const name = customClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name.length).assertLarger(0);
    });

    /**
     * @tc.name    BuiltinsClassGetNameTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAME_TEST_1800
     * @tc.desc    Verify getName for custom interface
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNameTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<CustomTestInterface>();
      const name = interfaceClass.getName();
      expect(typeof name).assertEqual('string');
      expect(name.length).assertLarger(0);
    });

  })
}
