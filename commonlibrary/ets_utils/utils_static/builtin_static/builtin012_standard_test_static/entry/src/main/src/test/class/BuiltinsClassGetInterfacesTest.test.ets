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

interface SingleInterface {
  method(): void;
}
class TestClass implements SingleInterface {
  method(): void {}
}

export default function BuiltinsClassGetInterfacesTest(): void {
  describe("BuiltinsClassGetInterfacesTest", () => {
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
     * @tc.name    BuiltinsClassGetInterfacesTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0100
     * @tc.desc    Verify getInterfaces for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const interfaces = booleanClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0200
     * @tc.desc    Verify getInterfaces for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      const interfaces = intClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0300
     * @tc.desc    Verify getInterfaces for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const interfaces = doubleClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0400
     * @tc.desc    Verify getInterfaces for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInterfacesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const interfaces = objClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0500
     * @tc.desc    Verify getInterfaces for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInterfacesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      const interfaces = arrClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0600
     * @tc.desc    Verify getInterfaces for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInterfacesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      const interfaces = strClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0700
     * @tc.desc    Verify getInterfaces for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInterfacesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const interfaces = currentClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0800
     * @tc.desc    Verify getInterfaces for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInterfacesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const interfaces = nullClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_0900
     * @tc.desc    Verify getInterfaces for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInterfacesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      const interfaces = testClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1000
     * @tc.desc    Verify getInterfaces for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const interfaces = byteClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1100
     * @tc.desc    Verify getInterfaces for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const interfaces = charClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1200
     * @tc.desc    Verify getInterfaces for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const interfaces = shortClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1300
     * @tc.desc    Verify getInterfaces for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const interfaces = longClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1400
     * @tc.desc    Verify getInterfaces for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const interfaces = floatClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1500
     * @tc.desc    Verify getInterfaces for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const interfaces = numberClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInterfacesTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INTERFACES_TEST_1600
     * @tc.desc    Verify getInterfaces for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInterfacesTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const interfaces = voidClass.getInterfaces();
      expect(interfaces !== null).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

  })
}
