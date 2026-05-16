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

interface TestInterface {}

export default function BuiltinsClassIsNamespaceTest(): void {
  describe("BuiltinsClassIsNamespaceTest", () => {
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
     * @tc.name    BuiltinsClassIsNamespaceTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0100
     * @tc.desc    Verify isNamespace for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const result = booleanClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0200
     * @tc.desc    Verify isNamespace for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      const result = intClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0300
     * @tc.desc    Verify isNamespace for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const result = doubleClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0400
     * @tc.desc    Verify isNamespace for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsNamespaceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const result = objClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0500
     * @tc.desc    Verify isNamespace for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsNamespaceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      const result = arrClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0600
     * @tc.desc    Verify isNamespace for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsNamespaceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      const result = strClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0700
     * @tc.desc    Verify isNamespace for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsNamespaceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const result = currentClass.isNamespace();
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0800
     * @tc.desc    Verify isNamespace for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsNamespaceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const result = nullClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_0900
     * @tc.desc    Verify isNamespace for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsNamespaceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      const result = testClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1000
     * @tc.desc    Verify isNamespace for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const result = byteClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1100
     * @tc.desc    Verify isNamespace for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const result = charClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1200
     * @tc.desc    Verify isNamespace for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const result = shortClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1300
     * @tc.desc    Verify isNamespace for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const result = longClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1400
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1400
     * @tc.desc    Verify isNamespace for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const result = floatClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1500
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1500
     * @tc.desc    Verify isNamespace for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const result = numberClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1600
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1600
     * @tc.desc    Verify isNamespace for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsNamespaceTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const result = voidClass.isNamespace();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsNamespaceTest1700
     * @tc.number  SUB_BUILTINS_CLASS_IS_NAMESPACE_TEST_1700
     * @tc.desc    Verify isNamespace for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsNamespaceTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      const result = interfaceClass.isNamespace();
      expect(result).assertFalse();
    });

  })
}
