/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

class TestClass1 {
  field1: int = 0;
  field2: string = "";
}

class TestClass2 {
  field1: int = 0;
}

class ParentClass {
  parentField: int = 0;
}

class ChildClass extends ParentClass {
  childField: string = "";
}

class EmptyClass {
}

class StaticFieldClass {
  static staticField: int = 0;
  instanceField: int = 0;
}

interface TestInterface {
  interfaceMethod(): void;
}

class TestClassWithInterface implements TestInterface {
  interfaceMethod(): void {
  }
}

interface InterfaceA {}

interface InterfaceB {}

class TestClass3 implements InterfaceA, InterfaceB {
}

class TestClass4 {
}

interface ParentInterface {}

interface ChildInterface extends ParentInterface {}

class TestClass implements ChildInterface {
}

class TestClass5 {
  testMethod(): void {
  }
}

class ParentClass1 {
  parentMethod(): void {
  }
}

class ChildClass1 extends ParentClass1 {
  childMethod(): void {
  }
}

class TestBasic {
  method1() {
  }

  method2(a: int) {
  }
}

class TestClass6 {
  method1(): void {
  }

  method2(): void {
  }

  static staticMethod(): void {
  }
}

class GenericClass1<T> {
}

class GenericClass2<T, U> {
}

class TestClass7 {
  constructor() {
  }

  constructor(arg1: int) {
  }

  constructor(arg1: int, arg2: string) {
  }
}

class ClassWithoutEmptyConstructor {
  constructor(arg: string) {
  }
}

class ParentClass2 {
}

class ChildClass2 extends ParentClass2 {
}


class TestClassWithArgs {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class TestClassMultipleCtors {
  constructor(a: Object) {
  }

  constructor(a: string) {
  }
}

class TestClassAmbiguousCtors {
  constructor(a: string, b: number) {
  }

  constructor(a: string, b: string) {
  }
}

interface TestInterface1 {}

class TestClass8 implements TestInterface1 {
}

class Interface1 {
  static readonly isInterface = true;
}

class TestClass9 {
  interface1Method(): void {
  }
}

class ParentClass3 {
  parentMethod1(): void {
  }

  parentMethod2(): void {
  }
}

class ChildClass3 extends ParentClass3 {
  childMethod1(): void {
  }

  childMethod2(): void {
  }
}

class ClassWithStatic {
  static staticMethod(): void {
  }

  instanceMethod(): void {
  }
}

class GrandParentClass {
  grandParentMethod(): void {
  }
}

class ParentClass4 extends GrandParentClass {
  parentMethod(): void {
  }
}

class ChildClass4 extends ParentClass4 {
  childMethod(): void {
  }
}

interface TestInterface3 {
  interfaceMethod(): void;
}

class ImplementClass implements TestInterface3 {
  interfaceMethod(): void {
  }

  classMethod(): void {
  }
}

class TestInterface4<T> {
  value?: T;
}

class TestInterface5<T, U> {
  value1?: T;
  value2?: U;
}

class TestInterfaceImpl1 {
  testMethod(): void {
  }
}

class TestInterfaceImpl2 {
  testMethod(): void {
  }
}

class FirstInterfaceImpl {
  firstMethod(): void {
  }
}

class SecondInterfaceImpl {
  secondMethod(): void {
  }
}

export default function type_03Test() {
  describe('type_03Test', (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_BASE_ERROR_ARGUMENTSUNDERAPPLICATION_0100
     * @tc.name    testTypeArgumentsUnderapplicationError0001
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with default parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeArgumentsUnderapplicationError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testTypeArgumentsUnderapplicationError0001";
      try {
        const error = new ArgumentsUnderapplicationError();
        expect(error.name).assertEqual("ArgumentsUnderapplicationError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARGUMENTSUNDER_0200
     * @tc.name    testDataArgumentsUnderapplicationError0002
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with a custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDataArgumentsUnderapplicationError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testDataArgumentsUnderapplicationError0002";
      try {
        const customMessage = "Insufficient arguments";
        const error = new ArgumentsUnderapplicationError(customMessage);
        expect(error.name).assertEqual("ArgumentsUnderapplicationError");
        expect(error.message).assertEqual(customMessage);
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_ERROR_ARGUMENTSUNDERAPPLICATION_0300
     * @tc.name    testBaseArgumentsUnderapplicationError0003
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with ErrorOptions including cause.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBaseArgumentsUnderapplicationError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBaseArgumentsUnderapplicationError0003";
      try {
        const cause = new Error("Root cause");
        const error = new ArgumentsUnderapplicationError("Custom message", { cause });
        expect(error.name).assertEqual("ArgumentsUnderapplicationError");
        expect(error.message).assertEqual("Custom message");
        expect(error.cause).assertEqual(cause);
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARGUMENTSUNDERAPPLICATION_0400
     * @tc.name    testArgumentsUnderapplicationError0004
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with an empty string as message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArgumentsUnderapplicationError0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testArgumentsUnderapplicationError0004";
      try {
        const error1 = new ArgumentsUnderapplicationError("");
        const error2 = new ArgumentsUnderapplicationError();
        expect(error1.message).assertEqual("");
        expect(error2.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_EXCEPTIONININITIALIZER_0100
     * @tc.name    testExceptionInInitializerError0001
     * @tc.desc    Test instantiation of ExceptionInInitializerError with default parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExceptionInInitializerError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testExceptionInInitializerError0001";
      try {
        const error = new ExceptionInInitializerError();
        expect(error.name).assertEqual("ExceptionInInitializerError");
        expect(error.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_EXCEPTIONININITIALIZER_0200
     * @tc.name    testExceptionInInitializerError0002
     * @tc.desc    Test instantiation of ExceptionInInitializerError with a custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExceptionInInitializerError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testExceptionInInitializerError0002";
      try {
        const msg = "Initializer execution failed";
        const error = new ExceptionInInitializerError(msg);
        expect(error.message).assertEqual(msg);
        expect(error.stack).not().assertUndefined();
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_EXCEPTIONININITIALIZER_0300
     * @tc.name    testExceptionInInitializerError0003
     * @tc.desc    Test chaining root cause in ExceptionInInitializerError constructor.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExceptionInInitializerError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testExceptionInInitializerError0003";
      try {
        const rootCause = new TypeError("Type mismatch");
        const error = new ExceptionInInitializerError("Initialization failed", { cause: rootCause });
        expect(error.cause).assertEqual(rootCause);
        expect(error.toString()).assertContain("ExceptionInInitializerError");
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_NEGATIVEARRAYSIZE_0100
     * @tc.name    testNegativeArraySizeError0001
     * @tc.desc    Test instantiation of NegativeArraySizeError with default parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNegativeArraySizeError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNegativeArraySizeError0001";
      try {
        const error = new NegativeArraySizeError();
        expect(error.name).assertEqual("NegativeArraySizeError");
        expect(error.message).assertEqual("");
        expect(error.stack).not().assertUndefined();
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_NEGATIVEARRAYSIZE_0200
     * @tc.name    testNegativeArraySizeError0002
     * @tc.desc    Test instantiation of NegativeArraySizeError with a custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNegativeArraySizeError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNegativeArraySizeError0002";
      try {
        const error = new NegativeArraySizeError("Array size cannot be negative");
        expect(error.name).assertEqual("NegativeArraySizeError");
        expect(error.message).assertEqual("Array size cannot be negative");
        expect(error.stack).not().assertUndefined();
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARRAYSTORE_0100
     * @tc.name    testArrayStoreError0001
     * @tc.desc    Test instantiation of ArrayStoreError with default parameters.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArrayStoreError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testArrayStoreError0001";
      try {
        const error = new ArrayStoreError();
        expect(error.name).assertEqual("ArrayStoreError");
        expect(error.message).assertEqual("");
        expect(error.stack).not().assertUndefined();
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARRAYSTORE_0200
     * @tc.name    testArrayStoreError0002
     * @tc.desc    Test instantiation of ArrayStoreError with a custom message and options.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArrayStoreError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testArrayStoreError0002";
      try {
        const customMessage = "Invalid array store operation";
        const customOptions: ErrorOptions = {
          cause: "Attempted to store a string in a number array"
        };
        const error = new ArrayStoreError(customMessage, customOptions);

        expect(error.name).assertEqual("ArrayStoreError");
        expect(error.message).assertEqual(customMessage);
        expect(error.cause).assertEqual(customOptions.cause);
        expect(error.stack).not().assertUndefined();
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARGUMENTSUNDERAPPLICATION_0100
     * @tc.name    testArgumentsUnderapplicationError0001
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with a custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArgumentsUnderapplicationError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testArgumentsUnderapplicationError0001";
      try {
        const customMessage = "Insufficient arguments provided";
        const error = new ArgumentsUnderapplicationError(customMessage);
        expect(error.name).assertEqual("ArgumentsUnderapplicationError");
        expect(error.message).assertEqual(customMessage);
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARGUMENTSUNDERAPPLICATION_0200
     * @tc.name    testArgumentsUnderapplicationError0002
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with ErrorOptions including cause.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArgumentsUnderapplicationError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testArgumentsUnderapplicationError0002";
      try {
        const cause = new Error("Root cause of argument shortage");
        const error = new ArgumentsUnderapplicationError("Custom message", { cause });
        expect(error.name).assertEqual("ArgumentsUnderapplicationError");
        expect(error.message).assertEqual("Custom message");
        expect(error.cause).assertEqual(cause);
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARGUMENTSUNDERAPPLICATION_0300
     * @tc.name    testArgumentsUnderapplicationError0003
     * @tc.desc    Test instantiation of ArgumentsUnderapplicationError with an empty string message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArgumentsUnderapplicationError0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let TAG = "testArgumentsUnderapplicationError0003";
      try {
        const error1 = new ArgumentsUnderapplicationError("");
        const error2 = new ArgumentsUnderapplicationError();
        expect(error1.message).assertEqual("");
        expect(error2.message).assertEqual("");
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARRAYINDEX_0400
     * @tc.name    testArrayIndexOutOfBoundsError0004
     * @tc.desc    Test instantiation of ArrayIndexOutOfBoundsError with a custom message.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArrayIndexOutOfBoundsError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testArrayIndexOutOfBoundsError0004";
      try {
        const customMessage = "Array index out of bounds: attempted index 10 (length 5)";
        const error = new ArrayIndexOutOfBoundsError(customMessage);
        expect(error.name).assertEqual("ArrayIndexOutOfBoundsError");
        expect(error.message).assertEqual(customMessage);
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARRAYINDEX_0500
     * @tc.name    testArrayIndexOutOfBoundsError0005
     * @tc.desc    Test instantiation of ArrayIndexOutOfBoundsError with ErrorOptions including cause.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArrayIndexOutOfBoundsError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testArrayIndexOutOfBoundsError0005";
      try {
        const cause = new Error("Original array access error");
        const error = new ArrayIndexOutOfBoundsError("Index out of bounds", { cause });
        expect(error.name).assertEqual("ArrayIndexOutOfBoundsError");
        expect(error.message).assertEqual("Index out of bounds");
        expect(error.cause).assertEqual(cause);
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARRAYINDEX_0600
     * @tc.name    testArrayIndexOutOfBoundsError0006
     * @tc.desc    Verify inheritance relationship from Error base class.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArrayIndexOutOfBoundsError0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let TAG = "testArrayIndexOutOfBoundsError0006";
      try {
        const error = new ArrayIndexOutOfBoundsError();
        expect(error instanceof Error).assertTrue();
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ERROR_ARRAYINDEX_0700
     * @tc.name    testArrayIndexOutOfBoundsError0007
     * @tc.desc    Verify that the error object contains stack information.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testArrayIndexOutOfBoundsError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testArrayIndexOutOfBoundsError0007";
      try {
        const error = new ArrayIndexOutOfBoundsError();
        expect(error.stack).not().assertUndefined();
        expect(typeof error.stack).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} test failed, error info: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETINTERFACESNUM_0100
     * @tc.name    testGetInterfacesNum0001
     * @tc.desc    Testing getInterfacesNum with class implementing one interface.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetInterfacesNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetInterfacesNum0001";
      try {
        let classType = Type.of(new TestClass8()) as ClassType;
        let interfacesNum = classType.getInterfacesNum();
        expect(interfacesNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETINTERFACESNUM_0200
     * @tc.name    testGetInterfacesNum0002
     * @tc.desc    Testing getInterfacesNum with class implementing interface through method declaration.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetInterfacesNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetInterfacesNum0002";
      try {
        let classType = Type.of(new TestClass9()) as ClassType;
        let interfacesNum = classType.getInterfacesNum();
        expect(interfacesNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETINTERFACESNUM_0300
     * @tc.name    testGetInterfacesNum0003
     * @tc.desc    Testing getInterfacesNum with class implementing no interfaces.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetInterfacesNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetInterfacesNum0003";
      try {
        let classType = Type.of(new TestClass4()) as ClassType;
        let interfacesNum = classType.getInterfacesNum();
        expect(interfacesNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETMETHOD_0200
     * @tc.name    testGetMethod0002
     * @tc.desc    Testing getMethod with inherited methods.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetMethod0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetMethod0002";
      try {
        let classType = Type.of(new ChildClass1()) as ClassType;
        let foundParentMethod = false;
        for (let i = 0; i < classType.getMethodsNum(); i++) {
          let method = classType.getMethod(i);
          if (method.getName() === "parentMethod1") {
            foundParentMethod = true;
            break;
          }
        }
        expect(foundParentMethod).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETMETHODSNUM_0100
     * @tc.name    testGetMethodsNum0001
     * @tc.desc    Testing getMethodsNum returns correct count including inherited methods.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetMethodsNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetMethodsNum0001";
      try {
        let classType = Type.of(new ChildClass3()) as ClassType;
        let methodsNum = classType.getMethodsNum();
        expect(methodsNum >= 4).assertTrue();
        let hasParentMethod1 = false;
        let hasParentMethod2 = false;
        let hasChildMethod1 = false;
        let hasChildMethod2 = false;
        for (let i = 0; i < methodsNum; i++) {
          let method = classType.getMethod(i);
          let methodName = method.getName();
          if (methodName === "parentMethod1") {
            hasParentMethod1 = true;
          }
          if (methodName === "parentMethod2") {
            hasParentMethod2 = true;
          }
          if (methodName === "childMethod1") {
            hasChildMethod1 = true;
          }
          if (methodName === "childMethod2") {
            hasChildMethod2 = true;
          }
        }
        expect(hasParentMethod1).assertTrue();
        expect(hasParentMethod2).assertTrue();
        expect(hasChildMethod1).assertTrue();
        expect(hasChildMethod2).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETMETHODSNUM_0200
     * @tc.name    testGetMethodsNum0002
     * @tc.desc    Testing getMethodsNum on empty class returns at least Object methods.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetMethodsNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetMethodsNum0002";
      try {
        let classType = Type.of(new EmptyClass()) as ClassType;
        let methodsNum = classType.getMethodsNum();
        expect(methodsNum > 0).assertTrue();
        let hasToString = false;
        for (let i = 0; i < methodsNum; i++) {
          let method = classType.getMethod(i);
          if (method.getName() === "toString") {
            hasToString = true;
            break;
          }
        }
        expect(hasToString).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETMETHODSNUM_0300
     * @tc.name    testGetMethodsNum0003
     * @tc.desc    Testing getMethodsNum includes static methods.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetMethodsNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetMethodsNum0003";
      try {
        let classType = Type.of(new ClassWithStatic()) as ClassType;
        let methodsNum = classType.getMethodsNum();
        expect(methodsNum >= 2).assertTrue();
        let hasStaticMethod = false;
        let hasInstanceMethod = false;
        for (let i = 0; i < methodsNum; i++) {
          let method = classType.getMethod(i);
          if (method.getName() === "staticMethod") {
            hasStaticMethod = true;
          }
          if (method.getName() === "instanceMethod") {
            hasInstanceMethod = true;
          }
        }
        expect(hasStaticMethod).assertTrue();
        expect(hasInstanceMethod).assertTrue();

      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETMETHODSNUM_0400
     * @tc.name    testGetMethodsNum0004
     * @tc.desc    Testing getMethodsNum with multi-level inheritance.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetMethodsNum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testGetMethodsNum0004";
      try {
        let classType = Type.of(new ChildClass4()) as ClassType;
        let methodsNum = classType.getMethodsNum();
        expect(methodsNum >= 3).assertTrue();
        let hasGrandParentMethod = false;
        let hasParentMethod = false;
        let hasChildMethod = false;
        for (let i = 0; i < methodsNum; i++) {
          let method = classType.getMethod(i);
          if (method.getName() === "grandParentMethod") {
            hasGrandParentMethod = true;
          }
          if (method.getName() === "parentMethod") {
            hasParentMethod = true;
          }
          if (method.getName() === "childMethod") {
            hasChildMethod = true;
          }
        }
        expect(hasGrandParentMethod).assertTrue();
        expect(hasParentMethod).assertTrue();
        expect(hasChildMethod).assertTrue();

      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETMETHODSNUM_0500
     * @tc.name    testGetMethodsNum0005
     * @tc.desc    Testing getMethodsNum on class implementing interface.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetMethodsNum0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testGetMethodsNum0005";
      try {
        let classType = Type.of(new ImplementClass()) as ClassType;
        let methodsNum = classType.getMethodsNum();
        expect(methodsNum >= 2).assertTrue();
        let hasInterfaceMethod = false;
        let hasClassMethod = false;
        for (let i = 0; i < methodsNum; i++) {
          let method = classType.getMethod(i);
          if (method.getName() === "interfaceMethod") {
            hasInterfaceMethod = true;
          }
          if (method.getName() === "classMethod") {
            hasClassMethod = true;
          }
        }
        expect(hasInterfaceMethod).assertTrue();
        expect(hasClassMethod).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_EQUALS_0100
     * @tc.name    testInterfaceTypeEquals0001
     * @tc.desc    Testing equals method with same InterfaceType instances.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeEquals0001";
      try {
        let obj1 = new EmptyClass();
        let obj2 = new EmptyClass();
        let type1 = Type.of(obj1);
        let type2 = Type.of(obj2);
        expect(type1.equals(type2)).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_GETLITERAL_0100
     * @tc.name    testInterfaceTypeGetLiteral0001
     * @tc.desc    Testing getLiteral method returns expected string for InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeGetLiteral0001";
      try {
        let testObj = new TestClass5();
        let type = Type.of(testObj);
        expect(type.getLiteral()).assertEqual("class{...}");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_GETLITERAL_0200
     * @tc.name    testInterfaceTypeGetLiteral0002
     * @tc.desc    Testing getLiteral method consistency for same InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeGetLiteral0002";
      try {
        let type1 = Type.of(new TestInterfaceImpl1());
        let type2 = Type.of(new TestInterfaceImpl2());
        expect(type1.getLiteral()).assertEqual(type2.getLiteral());
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_GETLITERAL_0300
     * @tc.name    testInterfaceTypeGetLiteral0003
     * @tc.desc    Testing getLiteral method for different InterfaceTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeGetLiteral0003";
      try {
        let firstType = Type.of(new FirstInterfaceImpl());
        let secondType = Type.of(new SecondInterfaceImpl());
        expect(firstType.getLiteral()).assertEqual(secondType.getLiteral());
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_GETNAME_0100
     * @tc.name    testInterfaceTypeGetName0001
     * @tc.desc    Testing getName method returns expected name for InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeGetName0001";
      try {
        let testObj = new TestClass5();
        let type = Type.of(testObj);
        let className = Class.of(testObj).getName();
        expect(type.getName()).assertEqual(className);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_GETNAME_0200
     * @tc.name    testInterfaceTypeGetName0002
     * @tc.desc    Testing getName method for different InterfaceTypes returns different names.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeGetName0002";
      try {
        let firstType = Type.of(new FirstInterfaceImpl());
        let secondType = Type.of(new SecondInterfaceImpl());
        expect(firstType.getName() === secondType.getName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_HASNAME_0100
     * @tc.name    testInterfaceTypeHasName0001
     * @tc.desc    Testing hasName method always returns true for InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeHasName0001";
      try {
        let testObj = new TestClass5();
        let type = Type.of(testObj);
        expect(type.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_HASNAME_0200
     * @tc.name    testInterfaceTypeHasName0002
     * @tc.desc    Testing hasName method consistency for different InterfaceTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeHasName0002";
      try {
        let firstType = Type.of(new FirstInterfaceImpl());
        let secondType = Type.of(new SecondInterfaceImpl());
        expect(firstType.hasName()).assertTrue();
        expect(secondType.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_ISPRIMITIVE_0100
     * @tc.name    testInterfaceTypeIsPrimitive0001
     * @tc.desc    Testing isPrimitive method always returns false for InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeIsPrimitive0001";
      try {
        let testObj = new TestClass5();
        let type = Type.of(testObj);
        expect(type.isPrimitive()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_ISPRIMITIVE_0200
     * @tc.name    testInterfaceTypeIsPrimitive0002
     * @tc.desc    Testing isPrimitive consistency for different InterfaceTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeIsPrimitive0002";
      try {
        let firstType = Type.of(new FirstInterfaceImpl());
        let secondType = Type.of(new SecondInterfaceImpl());
        expect(firstType.isPrimitive()).assertFalse();
        expect(secondType.isPrimitive()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_ISPRIMITIVE_0300
     * @tc.name    testInterfaceTypeIsPrimitive0003
     * @tc.desc    Testing isPrimitive returns false compared to primitive type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeIsPrimitive0003";
      try {
        let interfaceType = Type.of(new TestClass5());
        let primitiveType = Type.of(123);
        expect(interfaceType.isPrimitive()).assertFalse();
        expect(primitiveType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_ISREFERENCE_0100
     * @tc.name    testInterfaceTypeIsReference0001
     * @tc.desc    Testing isReference method returns true for InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeIsReference0001";
      try {
        let testObj = new TestClass5();
        let type = Type.of(testObj);
        expect(type.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_ISREFERENCE_0200
     * @tc.name    testInterfaceTypeIsReference0002
     * @tc.desc    Testing isReference method consistency for same InterfaceType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeIsReference0002";
      try {
        let type1 = Type.of(new TestInterfaceImpl1());
        let type2 = Type.of(new TestInterfaceImpl2());
        expect(type1.isReference()).assertEqual(type2.isReference());
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_INTERFACETYPE_ISREFERENCE_0300
     * @tc.name    testInterfaceTypeIsReference0003
     * @tc.desc    Testing isReference method returns true for different InterfaceTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testInterfaceTypeIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testInterfaceTypeIsReference0003";
      try {
        let firstType = Type.of(new FirstInterfaceImpl());
        let secondType = Type.of(new SecondInterfaceImpl());
        expect(firstType.isReference()).assertTrue();
        expect(secondType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETFIELD_0100
     * @tc.name    testClassTypeGetField0001
     * @tc.desc    Testing ClassType.getField with valid index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetField0001";
      try {
        const testClassType = Type.of(new TestClass1()) as ClassType;
        const field = testClassType.getField(0);
        expect(field.getName()).assertEqual("field1");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETFIELD_0300
     * @tc.name    testClassTypeGetField0003
     * @tc.desc    Testing ClassType.getField with inherited fields.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetField0003";
      try {
        const childClassType = Type.of(new ChildClass()) as ClassType;
        const parentField = childClassType.getField(0);
        const childField = childClassType.getField(1);
        expect(parentField.getName()).assertEqual("parentField");
        expect(childField.getName()).assertEqual("childField");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETFIELDBYNAME_0100
     * @tc.name    testClassTypeGetFieldByName0001
     * @tc.desc    Testing ClassType.getFieldByName with valid field name.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetFieldByName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetFieldByName0001";
      try {
        const testClassType = Type.of(new TestClass1()) as ClassType;
        const field = testClassType.getFieldByName("field1");
        expect(field.getName()).assertEqual("field1");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETFIELDSNUM_0100
     * @tc.name    testClassTypeGetFieldsNum0001
     * @tc.desc    Testing ClassType.getFieldsNum with inheritance hierarchy.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetFieldsNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetFieldsNum0001";
      try {
        const childClassType = Type.of(new ChildClass()) as ClassType;
        expect(childClassType.getFieldsNum() >= 2).assertTrue();
        expect(childClassType.getOwnFieldsNum()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETFIELDSNUM_0200
     * @tc.name    testClassTypeGetFieldsNum0002
     * @tc.desc    Testing ClassType.getFieldsNum with class without fields.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetFieldsNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetFieldsNum0002";
      try {
        const emptyClassType = Type.of(new EmptyClass()) as ClassType;
        expect(emptyClassType.getFieldsNum() >= 0).assertTrue();
        expect(emptyClassType.getOwnFieldsNum()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETFIELDSNUM_0300
     * @tc.name    testClassTypeGetFieldsNum0003
     * @tc.desc    Testing ClassType.getFieldsNum with static fields.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetFieldsNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetFieldsNum0003";
      try {
        const staticClassType = Type.of(new StaticFieldClass()) as ClassType;
        expect(staticClassType.getFieldsNum() >= 2).assertTrue();
        expect(staticClassType.getOwnFieldsNum()).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETINTERFACE_0100
     * @tc.name    testClassTypeGetInterface0001
     * @tc.desc    Testing ClassType.getInterface with valid index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetInterface0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetInterface0001";
      try {
        const testClassType = Type.of(new TestClassWithInterface()) as ClassType;
        const interfaceCount = testClassType.getInterfacesNum();
        expect(interfaceCount).assertEqual(1);
        const interfaceType = testClassType.getInterface(0);
        expect(interfaceType instanceof InterfaceType).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETINTERFACESNUM_0100
     * @tc.name    testClassTypeGetInterfacesNum0001
     * @tc.desc    Testing ClassType.getInterfacesNum with class implementing multiple interfaces.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetInterfacesNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetInterfacesNum0001";
      try {
        const testClassType = Type.of(new TestClass3()) as ClassType;
        const interfaceCount = testClassType.getInterfacesNum();
        expect(interfaceCount).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETINTERFACESNUM_0200
     * @tc.name    testClassTypeGetInterfacesNum0002
     * @tc.desc    Testing ClassType.getInterfacesNum with class implementing no interfaces.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetInterfacesNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetInterfacesNum0002";
      try {
        const testClassType = Type.of(new TestClass4()) as ClassType;
        const interfaceCount = testClassType.getInterfacesNum();
        expect(interfaceCount).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETINTERFACESNUM_0300
     * @tc.name    testClassTypeGetInterfacesNum0003
     * @tc.desc    Testing ClassType.getInterfacesNum with inherited interfaces.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetInterfacesNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetInterfacesNum0003";
      try {
        const testClassType = Type.of(new TestClass()) as ClassType;
        const interfaceCount = testClassType.getInterfacesNum();
        expect(interfaceCount).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHOD_0100
     * @tc.name    testClassTypeGetMethod0001
     * @tc.desc    Testing ClassType.getMethod with basic class method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetMethod0001";
      try {
        const classType = Type.of(new TestClass5()) as ClassType;
        const method = classType.getMethod(0);
        expect(method !== undefined).assertTrue();
        expect(method.getName().length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHOD_0200
     * @tc.name    testClassTypeGetMethod0002
     * @tc.desc    Testing ClassType.getMethod with invalid index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethod0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testClassTypeGetMethod0002";
      try {
        const classType = Type.of(new TestClass5()) as ClassType;
        let hasError = false;
        try {
          classType.getMethod(999);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHOD_0300
     * @tc.name    testClassTypeGetMethod0003
     * @tc.desc    Testing ClassType.getMethod with inherited methods
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethod0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetMethod0003";
      try {
        const classType = Type.of(new ChildClass1()) as ClassType;
        let foundParentMethod = false;
        for (let i = 0; i < classType.getMethodsNum(); i++) {
          if (classType.getMethod(i).getName() === "parentMethod") {
            foundParentMethod = true;
            break;
          }
        }
        expect(foundParentMethod).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHODSNUM_0100
     * @tc.name    testClassTypeGetMethodsNum0001
     * @tc.desc    Testing ClassType.getMethodsNum with basic class methods
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethodsNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetMethodsNum0001";
      try {
        const classType = Type.of(new TestBasic()) as ClassType;
        expect(classType.getMethodsNum() >= 2).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHODSNUM_0200
     * @tc.name    testClassTypeGetMethodsNum0002
     * @tc.desc    Testing ClassType.getMethodsNum with inherited methods
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethodsNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetMethodsNum0002";
      try {
        const classType = Type.of(new ChildClass1()) as ClassType;
        expect(classType.getMethodsNum() >= 2).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHODSNUM_0300
     * @tc.name    testClassTypeGetMethodsNum0003
     * @tc.desc    Testing ClassType.getMethodsNum with a class containing methods.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethodsNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetMethodsNum0003";
      try {
        const testClassType = Type.of(new TestClass6()) as ClassType;
        const methodsNum = testClassType.getMethodsNum();
        expect(methodsNum >= 3).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHODSNUM_0400
     * @tc.name    testClassTypeGetMethodsNum0004
     * @tc.desc    Testing ClassType.getMethodsNum with empty class
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethodsNum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetMethodsNum0004";
      try {
        const classType = Type.of(new EmptyClass()) as ClassType;
        expect(classType.getMethodsNum() > 0).assertTrue(); // Should at least have Object methods
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASSTYPE_GETMETHODSNUM_0500
     * @tc.name    testClassTypeGetMethodsNum0005
     * @tc.desc    Testing ClassType.getMethodsNum with interface implementation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetMethodsNum0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testClassTypeGetMethodsNum0005";
      try {
        const classType = Type.of(new TestClassWithInterface()) as ClassType;
        expect(classType.getMethodsNum() >= 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETBASETYPE_0100
     * @tc.name    testGetBaseType0001
     * @tc.desc    Testing getBaseType with class that has a base class.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetBaseType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetBaseType0001";
      try {
        const derivedType = Type.of(new ChildClass1()) as ClassType;
        const baseType = Type.of(new ParentClass1()) as ClassType;
        const actualBaseType = derivedType.getBaseType();
        expect(actualBaseType.equals(baseType)).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETBASETYPE_0200
     * @tc.name    testGetBaseType0002
     * @tc.desc    Testing getBaseType with Object class (no base class).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetBaseType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetBaseType0002";
      try {
        const objectType = Type.of(new Object()) as ClassType;
        const actualBaseType = objectType.getBaseType();
        expect(actualBaseType.equals(objectType)).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETCONSTRUCTOR_0200
     * @tc.name    testGetConstructor0002
     * @tc.desc    Testing getConstructor with invalid index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetConstructor0002";
      try {
        const classType = Type.of(new TestClass5()) as ClassType;
        let hasError = false;
        try {
          classType.getConstructor(1);
        } catch (err) {
          hasError = true;
          expect(err instanceof Error).assertTrue();
        }
        expect(hasError).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETCONSTRUCTORSNUM_0100
     * @tc.name    testGetConstructorsNum0001
     * @tc.desc    Testing getConstructorsNum with a class that has constructors.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetConstructorsNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetConstructorsNum0001";
      try {
        const classType = Type.of(new TestClass7(0, "test")) as ClassType;
        const constructorsNum = classType.getConstructorsNum();
        expect(constructorsNum).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETCONSTRUCTORSNUM_0200
     * @tc.name    testGetConstructorsNum0002
     * @tc.desc    Testing getConstructorsNum with a class that has no constructors (should default to 1 for the default constructor).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetConstructorsNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetConstructorsNum0002";
      try {
        const classType = Type.of(new TestClass4()) as ClassType;
        const constructorsNum = classType.getConstructorsNum();
        expect(constructorsNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETOWNFIELD_0100
     * @tc.name    testGetOwnField0001
     * @tc.desc    Testing getOwnField with valid index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetOwnField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetOwnField0001";
      try {
        const classType = Type.of(new TestClass1()) as ClassType;
        const field0 = classType.getOwnField(0);
        expect(field0 !== undefined).assertTrue();
        expect(field0.getName()).assertEqual("field1");
        expect(field0.getType().getLiteral()).assertEqual("int");
        const field1 = classType.getOwnField(1);
        expect(field1 !== undefined).assertTrue();
        expect(field1.getName()).assertEqual("field2");
        expect(field1.getType().getLiteral()).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETOWNFIELDSNUM_0100
     * @tc.name    testGetOwnFieldsNum0001
     * @tc.desc    Testing getOwnFieldsNum with class that has own fields.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetOwnFieldsNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetOwnFieldsNum0001";
      try {
        const classType = Type.of(new TestClass1()) as ClassType;
        const fieldsNum = classType.getOwnFieldsNum();
        expect(fieldsNum).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETOWNFIELDSNUM_0200
     * @tc.name    testGetOwnFieldsNum0002
     * @tc.desc    Testing getOwnFieldsNum with class that has no own fields.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetOwnFieldsNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetOwnFieldsNum0002";
      try {
        const classType = Type.of(new EmptyClass()) as ClassType;
        const fieldsNum = classType.getOwnFieldsNum();
        expect(fieldsNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETOWNFIELDSNUM_0300
     * @tc.name    testGetOwnFieldsNum0003
     * @tc.desc    Testing getOwnFieldsNum with inherited fields.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetOwnFieldsNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let TAG = "testGetOwnFieldsNum0003";
      try {
        const classType = Type.of(new ChildClass()) as ClassType;
        const fieldsNum = classType.getOwnFieldsNum();
        expect(fieldsNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISFINAL_0100
     * @tc.name    testIsFinal0001
     * @tc.desc    Testing isFinal with a non-final class.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsFinal0001";
      try {
        const classType = Type.of(new TestClass4()) as ClassType;
        expect(classType.isFinal()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });	

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASEMPTYCONSTRUCTOR_0100
     * @tc.name    testHasEmptyConstructor0001
     * @tc.desc    Testing hasEmptyConstructor with a class that has an empty constructor.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasEmptyConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHasEmptyConstructor0001";
      try {
        const classType = Type.of(new TestClass5()) as ClassType;
        expect(classType.hasEmptyConstructor()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASEMPTYCONSTRUCTOR_0200
     * @tc.name    testHasEmptyConstructor0002
     * @tc.desc    Testing hasEmptyConstructor with a class that has no empty constructor.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasEmptyConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHasEmptyConstructor0002";
      try {
        const classType = Type.of(new ClassWithoutEmptyConstructor("test")) as ClassType;
        expect(classType.hasEmptyConstructor()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASFIELD_0100
     * @tc.name    testHasField0001
     * @tc.desc    Testing hasField with a class that contains the specified field.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHasField0001";
      try {
        const classType = Type.of(new TestClass2()) as ClassType;
        expect(classType.hasField("field1")).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASFIELD_0200
     * @tc.name    testHasField0002
     * @tc.desc    Testing hasField with a class that does not contain the specified field.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHasField0002";
      try {
        const classType = Type.of(new TestClass4()) as ClassType;
        expect(classType.hasField("nonExistentField")).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASFIELD_0300
     * @tc.name    testHasField0003
     * @tc.desc    Testing hasField with inherited fields from parent class.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHasField0003";
      try {
        const classType = Type.of(new ChildClass()) as ClassType;
        expect(classType.hasField("parentField")).assertTrue();
        expect(classType.hasField("childField")).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSMAKE_0100
     * @tc.name    testMake0001
     * @tc.desc    Testing make() with a class that has an empty constructor.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMake0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testMake0001";
      try {
        const classType = Type.of(new TestClass5()) as ClassType;
        const instance = classType.make();
        expect(instance instanceof TestClass5).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_MAKEA_0300
     * @tc.name    testMake0003
     * @tc.desc    Testing make() with a class that inherits from another class.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMake0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testMake0003";
      try {
        const classType = Type.of(new ChildClass2()) as ClassType;
        const instance = classType.make();
        expect(instance instanceof ChildClass2).assertTrue();
        expect(instance instanceof ParentClass2).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_MAKE_0100
     * @tc.name    testMakeWithArgs0001
     * @tc.desc    Testing make(args) with a class that has a single matching constructor.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMakeWithArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testMakeWithArgs0001";
      try {
        const classType = Type.of(new TestClassWithArgs("test", 10)) as ClassType;
        const instance = classType.make([new String("test"), new Number(10)]);
        expect(instance instanceof TestClassWithArgs).assertTrue();
        expect((instance as TestClassWithArgs).name).assertEqual("test");
        expect((instance as TestClassWithArgs).age).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_MAKE_0200
     * @tc.name    testMakeWithArgs0002
     * @tc.desc    Testing make(args) with multiple constructors and selecting the most specific one.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testMakeWithArgs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testMakeWithArgs0002";
      try {
        const classType = Type.of(new TestClassMultipleCtors("test")) as ClassType;
        const instance = classType.make([new String("specific")]);
        expect(instance instanceof TestClassMultipleCtors).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0100
     * @tc.name    testClassTypeEquals0001
     * @tc.desc    Testing equals() with same class types.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeEquals0001";
      try {
        const classType1 = Type.of(new TestClass4()) as ClassType;
        const classType2 = Type.of(new TestClass4()) as ClassType;
        expect(classType1.equals(classType2)).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALSOF_0200
     * @tc.name    testClassTypeEquals0002
     * @tc.desc    Testing equals() with different class types.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeEquals0002";
      try {
        const classType1 = Type.of(new TestClass4()) as ClassType;
        const classType2 = Type.of(new EmptyClass()) as ClassType;
        expect(classType1.equals(classType2)).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0300
     * @tc.name    testClassTypeEquals0003
     * @tc.desc    Testing equals() with non-ClassType type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeEquals0003";
      try {
        const classType = Type.of(new TestClass4()) as ClassType;
        const stringType = Type.of("test") as StringType;
        expect(classType.equals(stringType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERAL_0100
     * @tc.name    testGetLiteralForClassType0001
     * @tc.desc    Testing getLiteral() for basic class type returns expected format.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteralForClassType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetLiteralForClassType0001";
      try {
        const classType = Type.of(new TestClass4()) as ClassType;
        const literal = classType.getLiteral();
        expect(literal).assertEqual("class{...}");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERAL_0200
     * @tc.name    testGetLiteralForClassType0002
     * @tc.desc    Testing getLiteral() for built-in Object class type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteralForClassType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetLiteralForClassType0002";
      try {
        const classType = Type.of(new Object()) as ClassType;
        const literal = classType.getLiteral();
        expect(literal).assertEqual("class{...}");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERAL_0300
     * @tc.name    testGetLiteralForClassType0003
     * @tc.desc    Testing getLiteral() consistency across multiple calls.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteralForClassType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetLiteralForClassType0003";
      try {
        const classType = Type.of(new TestClass4()) as ClassType;
        const literal1 = classType.getLiteral();
        const literal2 = classType.getLiteral();
        expect(literal1).assertEqual(literal2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_GETNAME_0100
     * @tc.name    testClassTypeGetName0001
     * @tc.desc    Testing getName method returns expected name for ClassType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetName0001";
      try {
        let testObj = new TestClass4();
        let type = Type.of(testObj);
        let className = Class.of(testObj).getName();
        expect(type.getName()).assertEqual(className);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_GETNAME_0200
     * @tc.name    testClassTypeGetName0002
     * @tc.desc    Testing getName method consistency for same ClassType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetName0002";
      try {
        let type1 = Type.of(new TestClass4());
        let type2 = Type.of(new TestClass4());
        expect(type1.getName()).assertEqual(type2.getName());
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_GETNAME_0300
     * @tc.name    testClassTypeGetName0003
     * @tc.desc    Testing getName method for different ClassTypes returns different names.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeGetName0003";
      try {
        let firstType = Type.of(new EmptyClass());
        let secondType = Type.of(new TestClass4());
        expect(firstType.getName() === secondType.getName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_HASNAME_0100
     * @tc.name    testClassTypeHasName0001
     * @tc.desc    Testing hasName method always returns true for ClassType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeHasName0001";
      try {
        let testObj = new TestClass4();
        let type = Type.of(testObj);
        expect(type.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_HASNAME_0200
     * @tc.name    testClassTypeHasName0002
     * @tc.desc    Testing hasName method consistency for different ClassTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeHasName0002";
      try {
        let firstType = Type.of(new EmptyClass());
        let secondType = Type.of(new TestClass4());
        expect(firstType.hasName()).assertTrue();
        expect(secondType.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_ISPRIMITIVE_0100
     * @tc.name    testClassTypeIsPrimitive0001
     * @tc.desc    Testing isPrimitive method always returns false for ClassType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeIsPrimitive0001";
      try {
        let testObj = new TestClass4();
        let type = Type.of(testObj);
        expect(type.isPrimitive()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_ISPRIMITIVE_0200
     * @tc.name    testClassTypeIsPrimitive0002
     * @tc.desc    Testing isPrimitive consistency for different ClassTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeIsPrimitive0002";
      try {
        let firstType = Type.of(new EmptyClass());
        let secondType = Type.of(new TestClass4());
        expect(firstType.isPrimitive()).assertFalse();
        expect(secondType.isPrimitive()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_ISPRIMITIVE_0300
     * @tc.name    testClassTypeIsPrimitive0003
     * @tc.desc    Testing isPrimitive returns false compared to primitive type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeIsPrimitive0003";
      try {
        let classType = Type.of(new TestClass4());
        let primitiveType = Type.of(123);
        expect(classType.isPrimitive()).assertFalse();
        expect(primitiveType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_ISREFERENCE_0100
     * @tc.name    testClassTypeIsReference0001
     * @tc.desc    Testing isReference method returns true for ClassType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeIsReference0001";
      try {
        let testObj = new Object();
        let type = Type.of(testObj);
        expect(type.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_ISREFERENCE_0200
     * @tc.name    testClassTypeIsReference0002
     * @tc.desc    Testing isReference method consistency for different ClassTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeIsReference0002";
      try {
        let type1 = Type.of(new EmptyClass());
        let type2 = Type.of(new TestClass4());
        expect(type1.isReference()).assertEqual(type2.isReference());
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CLASSTYPE_ISREFERENCE_0300
     * @tc.name    testClassTypeIsReference0003
     * @tc.desc    Testing isReference method returns true for built-in ClassTypes.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testClassTypeIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testClassTypeIsReference0003";
      try {
        let arrayType = Type.of(new Array<number>());
        let dateType = Type.of(new Date());
        expect(arrayType.isReference()).assertTrue();
        expect(dateType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}