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


class ClassA {
  a: number = 1;
}

class ClassB {
  b: string = "test";
}

function returnUndefined() {
  return undefined;
}

function functionWithParams(a: number, b: string) {
}

function basicFunction() {
}

class IsReferenceTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }
}

class IsPrimitiveTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }
}

function anonymousFunctionExpr() {
};

class HasNameTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }

  private privateMethod() {
  }

  callPrivateMethod() {
    this.privateMethod();
  }
}

function namedFunction() {
}

function functionWithParameters(a: number, b: string) {
}

class NameTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }

  private privateMethod() {
  }

  callPrivateMethod() {
    this.privateMethod();
  }
}

class FunctionEqualityClass {
  methodX() {
  }

  methodY() {
  }

  calculate(a: number, b: number): number {
    return a + b;
  }
}

function identicalFunction() {
}

function functionA() {
}

function functionB() {
}

function add(a: number, b: number): number {
  return a + b;
}

function sum(a: number, b: number): number {
  return a + b;
}

function multiply(a: number, b: number): number {
  return a * b;
}

class ParameterTestClass {
  zeroParamMethod() {
  }

  oneParamMethod(value: number) {
  }

  twoParamsMethod(a: string, b: number) {
  }

  static staticThreeParamsMethod(x: boolean, y: object, z: string) {
  }
}

function genericFunction<T, U>(a: T, b: U): T {
  return a;
}

function noParamFunction() {
}

function oneParamFunction(a: number) {
}

function twoParamsFunction(a: string, b: boolean) {
}

function threeParamsFunction(x: number, y: string, z: object) {
}

function variableParamsFunction(...args: number[]) {
}

function defaultParamFunction(a: number, b: string = "default") {
}

class ExceptionTestClass {
  alwaysThrow(): void {
    throw new Error("Class method always throws");
  }

  conditionalThrow(flag: boolean): void {
    if (flag) {
      throw new Error("Class method conditionally throws");
    }
  }

  neverThrow(): string {
    return "Class method never throws";
  }

  static staticThrow(): void {
    throw new Error("Static method throws");
  }
}

function throwingWithTryCatch(): void {
  try {
    throw new Error("Error inside try block");
  } catch (e) {
    console.log("Error caught");
  }
}

function conditionallyThrowingFunction(shouldThrow: boolean): string {
  if (shouldThrow) {
    throw new Error("Conditionally throws an error");
  }
  return "No error thrown";
}

function neverThrowingFunction(): number {
  return 42;
}

function throwingInLoopFunction(count: number): void {
  for (let i = 0; i < count; i++) {
    if (i === count - 1) {
      throw new Error("Throws on last iteration");
    }
  }
}

function alwaysThrowingFunction(): void {
  throw new Error("Always throws an error");
}

function conditionalNeverFunction(condition: boolean): string | never {
  if (condition) {
    throw new Error("Conditionally throws");
  }
  return "returns string when condition is false";
}

function infiniteLoopFunction(): never {
  while (true) {
  }
}


function neverFunction(): never {
  throw new Error("This function never returns");
}

function genericUserFunction<T>(input: T): T {
  return input;
}

class UserClass {
  instanceMethod(): number {
    return 42;
  }

  static staticMethod(): boolean {
    return true;
  }

  private privateMethod(): string {
    return "private method";
  }

  callPrivateMethod(): string {
    return this.privateMethod();
  }
}

function parameterizedUserFunction(a: number, b: string): boolean {
  return a > b.length;
}

function basicUserFunction(): string {
  return "user function";
}

function voidSyncFunction(): void {
}

function genericSyncFunction<T>(input: T): T {
  return input;
}

function parameterizedSyncFunction(a: string, b: number): boolean {
  return a.length > b;
}

function basicSyncFunction(): number {
  return 100;
}

class FieldTestClass {
  public publicField: number = 0;
  private privateField: string = "";
  static staticField: boolean = false;
}

class GenericClass<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

interface TestInterfacef {
  name: string;
  age: number;
}

function interfaceReturningFunction(): TestInterfacef {
  return { name: "test", age: 20 };
}

function arrayReturningFunction(): number[] {
  return [1, 2, 3];
}

function classInstanceReturningFunction(): TestClass {
  return new TestClass("test");
}

function booleanReturningFunction(): boolean {
  return true;
}

function genericIdentityFunction<T>(item: T): T {
  return item;
};

function FuncTestClass(user: TestClass): void {
};

function numberReturningFunction(): number {
  return 42;
};

function stringReturningFunction(): string {
  return "test";
};

function FuncAdd(a: number, b: number): number {
  return a + b;
};

function FuncMult(id: number, name: string, active: boolean): void {
};

function FuncX(value: string): string {
  return value;
};

function voidReturningFunction(name: string): void {
};

class AnotherTestClass {
  public publicField: number = 1;
  private privateField: number = 2;
}

class ParentEntity {
  parentField: number = 0;
  protected parentProtectedField: string = "parent";
}

class ChildEntity extends ParentEntity {
  childField: boolean = false;
  public childPublicField: string = "child";
  static childStaticField: number = 100;
}

class SingleFieldClass {
  onlyField: short = 5;
}


class TestObject {
  id: number;
  static undefinedProp: undefined

  constructor(id: number) {
    this.id = id;
  }
}

class TestClass {
  uninitializedProp = null;
  undefinedField = undefined;
  name: string;
  public value: number = 0;

  constructor(name?: string) {
    this.name = name ?? "test";
  }

  defaultSyncMethod(): number {
    return this.privateSyncHelper();
  }

  private privateSyncHelper(): number {
    return 42;
  }

  static staticSyncMethod(): boolean {
    return true;
  }

  neverMethod(): never {
    throw new Error("Class method never returns");
  }

  stringMethod(): string {
    return "class method";
  }

  static staticNeverMethod(): never {
    throw new Error("Static method never returns");
  }
}

class ParentClass {
}

class ChildClass extends ParentClass {
}

interface TestInterface {}

class InterfaceImpl implements TestInterface {
}

interface Person {
  name: string;
  age: number;
}

function anonymousFunction() {
};
type NestedUnion = number | string ;

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


export default function type_04Test() {
  describe("type_04Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
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

    console.log(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number  SUB_COMMONLIBRARY_UTL_BASE_TYPE_OF_0100
     * @tc.name    testTypeOf0001
     * @tc.desc    Testing Type.of with null value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0001";
      try {
        const input = null;
        const type = Type.of(input);
        expect(type.toString()).assertEqual(String(null));
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_0200
     * @tc.name    testTypeOf0002
     * @tc.desc    Testing Type.of with undefined value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0002";
      try {
        const input = undefined;
        const type = Type.of(input);
        expect(type.toString()).assertEqual(String(undefined));
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_0300
     * @tc.name    testTypeOf0003
     * @tc.desc    Testing Type.of with double value (floating-point number).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0003";
      try {
        const input: double = 3.14;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('double');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_0400
     * @tc.name    testTypeOf0004
     * @tc.desc    Testing Type.of with FixedArray<double>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0004";
      try {
        const input: FixedArray<double> = [3.14, 1.59, 2.71, 0.618, 1.414];
        const type = Type.of(input);
        expect(type.toString()).assertEqual('double[]');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_0800
     * @tc.name    testTypeOf0008
     * @tc.desc    Testing Type.of with FixedArray<int>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0008";
      try {
        const input: FixedArray<int> = [500, 300, 900, 200];
        const type = Type.of(input);
        expect(type.toString()).assertEqual('int[]');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_0900
     * @tc.name    testTypeOf0009
     * @tc.desc    Testing Type.of with long value (large integer).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0009";
      try {
        const input: long = 9223372036854775807;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('long');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1000
     * @tc.name    testTypeOf0010
     * @tc.desc    Testing Type.of with FixedArray<long>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0010";
      try {
        const input: FixedArray<long> = [-9223372036854775808, 0, 9223372036854775807];
        const type = Type.of(input);
        expect(type.toString()).assertEqual('long[]');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1100
     * @tc.name    testTypeOf0011
     * @tc.desc    Testing Type.of with short value (small integer).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0011";
      try {
        const input: short = 5;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('short');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1200
     * @tc.name    testTypeOf0012
     * @tc.desc    Testing Type.of with FixedArray<short>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0012";
      try {
        const input: FixedArray<short> = [5, 3, 9, 2];
        const type = Type.of(input);
        expect(type.toString()).assertEqual('short[]');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1300
     * @tc.name    testTypeOf0013
     * @tc.desc    Testing Type.of with boolean value (true).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0013";
      try {
        const input: boolean = true;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('boolean');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1400
     * @tc.name    testTypeOf0014
     * @tc.desc    Testing Type.of with boolean value (false).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0014";
      try {
        const input: boolean = false;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('boolean');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1500
     * @tc.name    testTypeOf0015
     * @tc.desc    Testing Type.of with non-empty string literal.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0015";
      try {
        const input: string = "ArkTS Type Test";
        const type = Type.of(input);
        expect(type.toString()).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1600
     * @tc.name    testTypeOf0016
     * @tc.desc    Testing Type.of with empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0016";
      try {
        const input: string = "";
        const type = Type.of(input);
        expect(type.toString()).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1700
     * @tc.name    testTypeOf0017
     * @tc.desc    Testing Type.of with FixedArray<boolean>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0017";
      try {
        const input: FixedArray<boolean> = [true, false, true];
        const type = Type.of(input);
        expect(type.toString()).assertEqual('boolean[]');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1800
     * @tc.name    testTypeOf0018
     * @tc.desc    Testing Type.of with FixedArray<byte>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0018";
      try {
        const input: FixedArray<byte> = [60, -38, -128];
        const type = Type.of(input);
        expect(type.toString()).assertEqual("byte[]");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_1900
     * @tc.name    testTypeOf0019
     * @tc.desc    Testing Type.of with positive byte value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0019";
      try {
        const input: byte = 65;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('byte');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_2000
     * @tc.name    testTypeOf0020
     * @tc.desc    Testing Type.of with negative byte value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0020";
      try {
        const input: byte = -35;
        const type = Type.of(input);
        expect(type.toString()).assertEqual('byte');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_2300
     * @tc.name    testTypeOf0023
     * @tc.desc    Testing Type.of with FixedArray<Object> (custom objects).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeOf0023";
      try {
        const input: FixedArray<Object> = [new TestObject(1), new TestObject(2)];
        const type = Type.of(input);
        expect(type.toString()).assertEqual('std.core.Object[]');
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_TYPE_TOSTRING_0200
     * @tc.name    testTypeToString0002
     * @tc.desc    Testing Type.toString() for primitive reference type (Byte).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeToString0002";
      try {
        const type = Type.of(127 as byte) as ByteType;
        expect(type.toString()).assertEqual(type.getLiteral());
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_TYPE_TOSTRING_0300
     * @tc.name    testTypeToString0003
     * @tc.desc    Testing Type.toString() for ArrayType without name (hasName()=false).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeToString0003";
      try {

        const input: FixedArray<boolean> = [true, false];
        const type = Type.of(input) as ArrayType;
        expect(type.toString()).assertEqual(type.getLiteral());
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_TYPE_TOSTRING_0400
     * @tc.name    testTypeToString0004
     * @tc.desc    Testing Type.toString() for ClassType with valid name (hasName()=true).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeToString0004";
      try {
        const testObj = new TestClass("TestClass");
        const type = Type.of(testObj) as ClassType;
        expect(type.toString()).assertEqual(type.getName());
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0100
     * @tc.name    testTypeAssignableFrom0001
     * @tc.desc    Testing assignableFrom between int and byte (int <- byte should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0001";
      try {
        const intType = Type.of(123 as int);
        const byteType = Type.of(65 as byte);
        const expected: boolean = intType.assignableFrom(byteType);
        const result: boolean = true;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0200
     * @tc.name    testTypeAssignableFrom0002
     * @tc.desc    Testing assignableFrom between double and int (double <- int should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0002";
      try {
        const doubleType = Type.of(3.14 as double);
        const intType = Type.of(123 as int);
        const expected: boolean = doubleType.assignableFrom(intType);
        const result: boolean = true;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0300
     * @tc.name    testTypeAssignableFrom0003
     * @tc.desc    Testing assignableFrom for same long type (long <- long should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0003";
      try {
        const longType = Type.of(9223372036854775807 as long);
        const expected: boolean = longType.assignableFrom(longType);
        const result: boolean = true;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0400
     * @tc.name    testTypeAssignableFrom0004
     * @tc.desc    Testing assignableFrom between parent and child class (Parent <- Child should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0004";
      try {
        const parentType = Type.of(new ParentClass());
        const childType = Type.of(new ChildClass());
        const expected: boolean = parentType.assignableFrom(childType);
        const result: boolean = true;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0500
     * @tc.name    testTypeAssignableFrom0005
     * @tc.desc    Testing assignableFrom between interface and implementation (Interface <- Impl should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0005";
      try {
        const interfaceType = Type.of({} as TestInterface);
        const implType = Type.of(new InterfaceImpl());
        const expected: boolean = interfaceType.assignableFrom(implType);
        const result: boolean = false;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0600
     * @tc.name    testTypeAssignableFrom0006
     * @tc.desc    Testing assignableFrom between int and boolean (int <- boolean should be false)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0006";
      try {
        const intType = Type.of(123 as int);
        const boolType = Type.of(true);
        const expected: boolean = intType.assignableFrom(boolType);
        const result: boolean = false;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0700
     * @tc.name    testTypeAssignableFrom0007
     * @tc.desc    Testing assignableFrom between parent class and string (Parent <- String should be false)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0007";
      try {
        const parentType = Type.of(new ParentClass()) as ClassType;
        const stringType = Type.of("test") as StringType;
        const expected: boolean = parentType.assignableFrom(stringType);
        const result: boolean = false;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0800
     * @tc.name    testTypeAssignableFrom0008
     * @tc.desc    Testing assignableFrom between object and null (Object <- Null should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0008";
      try {
        const objectType = Type.of(new Object()) as ClassType;
        const nullType = Type.of(null) as NullType;
        const expected: boolean = objectType.assignableFrom(nullType);
        const result: boolean = false;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_0900
     * @tc.name    testTypeAssignableFrom0009
     * @tc.desc    Testing assignableFrom between double and undefined (Double <- Undefined should be false)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0009";
      try {
        const doubleType = Type.of(3.14 as double) as DoubleType;
        const undefinedType = Type.of(undefined) as UndefinedType;
        const expected: boolean = doubleType.assignableFrom(undefinedType);
        const result: boolean = false;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ASSIGNABLEFROM_1000
     * @tc.name    testTypeAssignableFrom0010
     * @tc.desc    Testing assignableFrom between double and float (Double <- Float should be true)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeAssignableFrom0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testTypeAssignableFrom0010";
      try {
        const doubleType = Type.of(3.14 as double) as DoubleType;
        const floatType = Type.of(1.5 as float);
        const expected: boolean = doubleType.assignableFrom(floatType);
        const result: boolean = true;
        expect(expected).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0100
     * @tc.name    testToRefType0001
     * @tc.desc    Test converting boolean primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0001";
      try {
        const primitiveType = BooleanType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(BooleanType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0200
     * @tc.name    testToRefType0002
     * @tc.desc    Test converting byte primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0002";
      try {
        const primitiveType = ByteType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(ByteType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0300
     * @tc.name    testToRefType0003
     * @tc.desc    Test converting char primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0003";
      try {
        const primitiveType = CharType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(CharType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0400
     * @tc.name    testToRefType0004
     * @tc.desc    Test converting short primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0004";
      try {
        const primitiveType = ShortType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(ShortType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0500
     * @tc.name    testToRefType0005
     * @tc.desc    Test converting int primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0005";
      try {
        const primitiveType = IntType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(IntType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0600
     * @tc.name    testToRefType0006
     * @tc.desc    Test converting long primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0006";
      try {
        const primitiveType = LongType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(LongType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0700
     * @tc.name    testToRefType0007
     * @tc.desc    Test converting float primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0007";
      try {
        const primitiveType = FloatType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(FloatType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0800
     * @tc.name    testToRefType0008
     * @tc.desc    Test converting double primitive type to reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0008";
      try {
        const primitiveType = DoubleType.VAL;
        const refType = Type.toRefType(primitiveType);
        expect(refType).assertEqual(DoubleType.REF);
        expect(refType.isPrimitive()).assertTrue();
        expect(refType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_0900
     * @tc.name    testToRefType0009
     * @tc.desc    Test returning self when input is both primitive and reference type (e.g., StringType)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0009";
      try {

        const stringType = StringType.REF;
        const result = Type.toRefType(stringType);

        expect(result).assertEqual(stringType);

        expect(result.isPrimitive()).assertTrue();
        expect(result.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_1000
     * @tc.name    testToRefType0010
     * @tc.desc    Test throwing "is not primitive type" exception when input is non-primitive array type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0010";
      try {

        const input: FixedArray<long> = [-9223372036854775808, 0, 9223372036854775807];
        const type = Type.of(input);
        Type.toRefType(type);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual("type  is not primitive type");
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TOREFTYPE_1200
     * @tc.name    testToRefType0012
     * @tc.desc    Test throwing exception when input is unsupported primitive type (undefined)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testToRefType0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testToRefType0012";
      try {
        const input = undefined;
        const type = Type.of(input);
        let result = Type.toRefType(type);
        expect(result.isPrimitive()).assertTrue();
        expect(result.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });
  });
}