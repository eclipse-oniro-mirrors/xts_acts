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

class ParentClass {
  public parentPublicMethod(): void {}
  protected parentProtectedMethod(): void {}
  private parentPrivateMethod(): void {}
}

class TestClass extends ParentClass {
  public method1(): void {}
  public method2(param: string): string { return param; }
  public method3(): number { return 42; }

  protected parentProtectedMethod(): void {}

  protected ownProtectedMethod(): void {}

  private ownPrivateMethod(): void {}
}

abstract class DefaultMethodBaseClass {
  abstract interfaceMethod(): void;
  defaultMethod(): string {
    return "default implementation";
  }
}

class TestClassWithDefaultMethod extends DefaultMethodBaseClass {
  public interfaceMethod(): void {}
}

class EmptyClass {}

export default function BuiltinsClassGetInstanceMethodsTest(): void {
  describe("BuiltinsClassGetInstanceMethodsTest", () => {
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
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0100
     * @tc.desc    Verify getInstanceMethods for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceMethodsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      const methods = boolClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0200
     * @tc.desc    Verify getInstanceMethods for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceMethodsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      const methods = numClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0300
     * @tc.desc    Verify getInstanceMethods for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetInstanceMethodsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      const methods = strClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length > 0).assertTrue();

      let hasToString = false;
      for (let method of methods) {
        if (method.getName() === 'toString') {
          hasToString = true;
          break;
        }
      }
      expect(hasToString).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0400
     * @tc.desc    Verify getInstanceMethods for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      const methods = objClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length > 0).assertTrue();

      let hasToString = false;
      let hasEquals = false;

      for (let method of methods) {
        const methodName = method.getName();
        if (methodName === 'toString') {
          hasToString = true;
        } else if (methodName === 'equals') {
          hasEquals = true;
        }
      }

      expect(hasToString).assertTrue();
      expect(hasEquals).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0500
     * @tc.desc    Verify getInstanceMethods for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      const methods = arrClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length > 0).assertTrue();

      let hasPop = false;
      for (let method of methods) {
        if (method.getName() === 'pop') {
          hasPop = true;
          break;
        }
      }
      expect(hasPop).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0600
     * @tc.desc    Verify getInstanceMethods for abstract base class with default method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const baseClass = Class.from<DefaultMethodBaseClass>();
      const methods = baseClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length > 0).assertTrue();

      let hasInterfaceMethod = false;
      for (let method of methods) {
        if (method.getName() === 'interfaceMethod') {
          hasInterfaceMethod = true;
          break;
        }
      }
      expect(hasInterfaceMethod).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0700
     * @tc.desc    Verify getInstanceMethods for class extending abstract base class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClassWithDefaultMethod = Class.from<TestClassWithDefaultMethod>();
      const methods = testClassWithDefaultMethod.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length > 0).assertTrue();

      let hasInterfaceMethod = false;
      let hasDefaultMethod = false;

      for (let method of methods) {
        const methodName = method.getName();
        if (methodName === 'interfaceMethod') {
          hasInterfaceMethod = true;
        } else if (methodName === 'defaultMethod') {
          hasDefaultMethod = true;
        }
      }

      expect(hasInterfaceMethod).assertTrue();
      expect(hasDefaultMethod).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0800
     * @tc.desc    Verify getInstanceMethods for empty class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetInstanceMethodsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emptyClass = Class.from<EmptyClass>();
      const methods = emptyClass.getInstanceMethods();
      expect(methods !== null).assertTrue();
      expect(methods.length >= 1).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassGetInstanceMethodsTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_INSTANCE_METHODS_TEST_0900
     * @tc.desc    Verify getInstanceMethods excludes parent private methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetInstanceMethodsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClass>();
      const methods = testClass.getInstanceMethods();

      let hasParentPrivateMethod = false;
      for (let method of methods) {
        if (method.getName() === 'parentPrivateMethod' && method.toString().includes('private')) {
          hasParentPrivateMethod = true;
        }
      }
      expect(hasParentPrivateMethod).assertFalse();
    });

  })
}
