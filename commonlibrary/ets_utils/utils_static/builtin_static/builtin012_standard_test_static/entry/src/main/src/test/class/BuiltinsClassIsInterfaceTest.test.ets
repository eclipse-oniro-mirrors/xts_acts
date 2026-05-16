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

interface TestInterface {
  method(): void;
}

class TestClass implements TestInterface {
  method(): void {}
}

export default function BuiltinsClassIsInterfaceTest(): void {
  describe("BuiltinsClassIsInterfaceTest", () => {
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
     * @tc.name    BuiltinsClassIsInterfaceTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0100
     * @tc.desc    Verify isInterface for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsInterfaceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(boolClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0200
     * @tc.desc    Verify isInterface for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsInterfaceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      expect(numClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0300
     * @tc.desc    Verify isInterface for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsInterfaceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      expect(strClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0400
     * @tc.desc    Verify isInterface for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsInterfaceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      expect(objClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0500
     * @tc.desc    Verify isInterface for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsInterfaceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      expect(arrClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0600
     * @tc.desc    Verify isInterface for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsInterfaceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      expect(testClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0700
     * @tc.desc    Verify isInterface for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsInterfaceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      expect(interfaceClass.isInterface()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0800
     * @tc.desc    Verify isInterface for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsInterfaceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(byteClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_0900
     * @tc.desc    Verify isInterface for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsInterfaceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(shortClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_1000
     * @tc.desc    Verify isInterface for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsInterfaceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(intClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_1100
     * @tc.desc    Verify isInterface for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsInterfaceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(longClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_1200
     * @tc.desc    Verify isInterface for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsInterfaceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.isInterface()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsInterfaceTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_INTERFACE_TEST_1300
     * @tc.desc    Verify isInterface for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsInterfaceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(doubleClass.isInterface()).assertFalse();
    });

  })
}
