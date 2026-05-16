/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


interface MyObject {
  key1: string;
  key2: string;
}

class G<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(newValue: T): void {
    this.value = newValue;
  }
}

class G2<T = string, T1 = number> {
  private value1: T;
  private value2: T1;

  constructor(value1: T, value2: T1) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): T {
    return this.value1;
  }

  getValue2(): T1 {
    return this.value2;
  }
}
class G3<T extends Object> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(newValue: T): void {
    this.value = newValue;
  }
}

interface Person {
  name: string;
  age: number;
}

class A4 {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return `Hello, my name is ${this.name}`;
  }
}

class G4<T extends A4> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(newValue: T): void {
    this.value = newValue;
  }

  useGreet(): string {
    return this.value.greet();
  }
}

class B4 extends A4 {
  age: number;

  constructor(name: string, age: number) {
    super(name);
    this.age = age;
  }

  introduce(): string {
    return `${this.greet()} and I am ${this.age} years old.`;
  }
}

class C4 extends A4 {
  job: string;

  constructor(name: string, job: string) {
    super(name);
    this.job = job;
  }

  introduce(): string {
    return `${this.greet()} and I am a ${this.job}.`;
  }
}

class G5<T = number[]> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(newValue: T): void {
    this.value = newValue;
  }
}

class G7<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  isEqual(otherValue: T): boolean {
    return this.value === otherValue;
  }
}

class G8<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  toString(): string {
    return String(this.value);
  }
}

class G9<T> {
  private value: T;
  private defaultValue: T;

  constructor(value: T, defaultValue: T) {
    this.value = value;
    this.defaultValue = defaultValue;
  }

  isDefault(): boolean {
    return this.value === this.defaultValue;
  }
}

class G10{
  private value: number;

  constructor(value: number) {
    this.value = value;
  }

  calculate(): number {
    return (this.value * 2) ;
  }
}

class G11<T extends string> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  toUpperCase(): string {
    return this.value.toUpperCase();
  }
}

class G12<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  toArray(): T[] {
    return [this.value];
  }
}

class G13 {
  value1: number;
  value2: number;

  constructor(value1: number, value2: number) {
    this.value1 = value1;
    this.value2 = value2;
  }

  sumOfSquares(): number {
    return this.value1 * this.value1 + this.value2 * this.value2;
  }
}

class G14 {
  private value: number;

  constructor(value: number) {
    this.value = value;
  }

  add(otherValue: number): number {
    return (this.value + otherValue);
  }
}

class G15{
  value1: number;
  value2: number;

  constructor(value1: number, value2: number) {
    this.value1 = value1;
    this.value2 = value2;
  }

  sum(): number {
    return this.value1 + this.value2;
  }
}
class G16 {
  value1: number;
  value2: number;

  constructor(value1: number, value2: number) {
    this.value1 = value1;
    this.value2 = value2;
  }

  multiply(): number {
    return this.value1 * this.value2;
  }
}

class G17 {
  value1: boolean;
  value2: boolean;

  constructor(value1: boolean, value2: boolean) {
    this.value1 = value1;
    this.value2 = value2;
  }

  and(): boolean {
    return this.value1 && this.value2;
  }
}

class G18 {
  value1: number;
  value2: number;

  constructor(value1: number, value2: number) {
    this.value1 = value1;
    this.value2 = value2;
  }

  difference(): number {
    return this.value1 - this.value2;
  }
}

class G19 {
  value1: number;
  value2: number;

  constructor(value1: number, value2: number) {
    this.value1 = value1;
    this.value2 = value2;
  }

  divide(): number {
    return this.value1 / this.value2;
  }
}

class G20 {
  value1: number;
  value2: number;

  constructor(value1: number, value2: number) {
    this.value1 = value1;
    this.value2 = value2;
  }

  power(): number {
    return Math.pow(this.value1, this.value2);
  }
}
class A21 {
}

class G21<T extends Object | A21> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getType(): string {
    return typeof this.value;
  }
}

class A22 {
}

class G22<T extends Object | A22> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  isInstanceOfA(): boolean {
    return this.value instanceof A22;
  }
}
class A23 {
}

class G23<T extends Object | A23> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getPropertyCount(): number {
    return Object.keys(this.value).length;
  }
}

const objWrapper = new G23<MyObject>({
  key1: 'value1', key2: 'value2'
});

class A24 {
}

class G24<T extends Object | A24> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getPropertyList(): string[] {
    return Object.keys(this.value);
  }
}



class A25 {
}

class MyObject26 {
  key: string;

  constructor(key: string) {
    this.key = key;
  }
}

class A26 {
}

class G26<T extends Object | A26> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  hasProperty(key: string): boolean {
    const value = this.value as Record<string, string | number | boolean>;
    return value[key] !== undefined;
  }
}
class G27<T = number[]> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  slice(start: int, end: int): T[] {
    return (this.value as T[]).slice(start, end);
  }
}

class G28<T = string[]> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  includes(item: string): boolean {
    return (this.value as string[]).includes(item);
  }
}
class G29<T = string[]> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  indexOf(item: string): number {
    return (this.value as string[]).indexOf(item);
  }
}

class G30<T = string[]> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  unique(): string[] {
    return Array.from(new Set<string>(this.value as string[]));
  }
}

export default function builtinsGenericsFormatTest() {
  describe('BuiltinsGenericsFormatTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action,which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action,which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await sleep(50);
      // Presets a clear action,which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0100
     * @tc.name builtinsGenericsFormatTest0100
     * @tc.desc test Generic single type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0100';
      console.info(`${caseName} test start`);
      const numberWrapper = new G<number>(42);
      console.log(numberWrapper.getValue().toString());
      expect(numberWrapper.getValue()).assertEqual(42);
      numberWrapper.setValue(100);
      console.log(numberWrapper.getValue().toString());
      expect(numberWrapper.getValue()).assertEqual(100);
      const stringWrapper = new G<string>('Hello, TypeScript!');
      console.log(stringWrapper.getValue());
      expect(stringWrapper.getValue()).assertEqual('Hello, TypeScript!');
      stringWrapper.setValue('TypeScript is awesome!');
      console.log(stringWrapper.getValue());
      expect(stringWrapper.getValue()).assertEqual('TypeScript is awesome!');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0200
     * @tc.name builtinsGenericsFormatTest0200
     * @tc.desc test Multiple types of parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0200';
      console.info(`${caseName} test start`);
      const defaultPair = new G2('Hello', 42);
      console.log(defaultPair.getValue1());
      console.log(defaultPair.getValue2().toString());
      expect(defaultPair.getValue1()).assertEqual('Hello');
      expect(defaultPair.getValue2()).assertEqual(42)
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0300
     * @tc.name builtinsGenericsFormatTest0300
     * @tc.desc test Generics extends constraints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0300';
      const obj = new G3<Person>({
        name: 'Alice', age: 25
      });
      console.log(obj.getValue().age.toString());
      expect(obj.getValue().age).assertEqual(25);
      obj.setValue({
        name: 'Bob', age: 30
      });
      console.log(obj.getValue().age.toString());
      expect(obj.getValue().age).assertEqual(30);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0400
     * @tc.name builtinsGenericsFormatTest0400
     * @tc.desc test Whether there is an extend constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0400';
      console.info(`${caseName} test start`);
      const bInstance = new B4('Alice', 30);
      const gB = new G4<B4>(bInstance);
      console.log(gB.useGreet());
      console.log(bInstance.introduce());
      const cInstance = new C4('Bob', 'Developer');
      const gC = new G4<C4>(cInstance);
      console.log(gC.useGreet());
      expect(gC.useGreet()).assertEqual('Hello, my name is Bob');
      console.log(cInstance.introduce());
      expect(cInstance.introduce()).assertEqual('Hello, my name is Bob and I am a Developer.');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0500
     * @tc.name builtinsGenericsFormatTest0500
     * @tc.desc test Generic whether there is an extend constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0500';
      console.info(`${caseName} test start`);
      const g1 = new G5([1, 2, 3, 4]);

      console.log(g1.getValue().toString());
      expect(g1.getValue().toString()).assertEqual('1,2,3,4');
      g1.setValue([5, 6, 7]);
      console.log(g1.getValue().toString());
      expect(g1.getValue().toString()).assertEqual('5,6,7');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0700
     * @tc.name builtinsGenericsFormatTest0700
     * @tc.desc test Check that the values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0700';
      console.info(`${caseName} test start`);
      const numberWrapper = new G7<number>(42);
      expect(numberWrapper.isEqual(42)).assertTrue();
      expect(numberWrapper.isEqual(100)).assertFalse();
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0800
     * @tc.name builtinsGenericsFormatTest0800
     * @tc.desc test Generics convert values to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0800';
      console.info(`${caseName} test start`);
      const numberWrapper = new G8<number>(8);
      expect(numberWrapper.toString()).assertEqual('8');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0900
     * @tc.name builtinsGenericsFormatTest0900
     * @tc.desc test Generics check whether the value is the default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0900';
      console.info(`${caseName} test start`);
      const numberWrapper = new G9<number>(42, 0);
      expect(numberWrapper.isDefault()).assertFalse();
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1000
     * @tc.name builtinsGenericsFormatTest1000
     * @tc.desc test Generics Double the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1000';
      console.info(`${caseName} test start`);
      const numberWrapper = new G10(42);
      expect(numberWrapper.calculate()).assertEqual(84);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1100
     * @tc.name builtinsGenericsFormatTest1100
     * @tc.desc test Convert values to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1100';
      console.info(`${caseName} test start`);
      const stringWrapper = new G11<string>('hello');
      expect(stringWrapper.toUpperCase()).assertEqual('HELLO');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1200
     * @tc.name builtinsGenericsFormatTest1200
     * @tc.desc test Convert values to arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1200';
      console.info(`${caseName} test start`);
      const numberWrapper = new G12<number>(42);
      expect(numberWrapper.toArray().toString()).assertEqual('42');
      expect(typeof numberWrapper.toArray()).assertEqual('object');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1300
     * @tc.name builtinsGenericsFormatTest1300
     * @tc.desc test Returns the sum of squares of the two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1300';
      console.info(`${caseName} test start`);
      const numberWrapper = new G13(3, 9);
      expect(numberWrapper.sumOfSquares()).assertEqual(90);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1400
     * @tc.name builtinsGenericsFormatTest1400
     * @tc.desc test Add the value to the other values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1400';
      console.info(`${caseName} test start`);
      const numberWrapper = new G14(42);
      expect(numberWrapper.add(58)).assertEqual(100);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1500
     * @tc.name builtinsGenericsFormatTest1500
     * @tc.desc test Returns the sum of the two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1500';
      console.info(`${caseName} test start`);
      const numberWrapper = new G15(19, 23);
      expect(numberWrapper.sum()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1600
     * @tc.name builtinsGenericsFormatTest1600
     * @tc.desc test Return the product of two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1600';
      console.info(`${caseName} test start`);
      const numberWrapper = new G16(6, 7);
      expect(numberWrapper.multiply()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1700
     * @tc.name builtinsGenericsFormatTest1700
     * @tc.desc test Return the product of two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1700';
      console.info(`${caseName} test start`);
      const booleanWrapper = new G17(true, false);
      expect(booleanWrapper.and()).assertFalse();
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1800
     * @tc.name builtinsGenericsFormatTest1800
     * @tc.desc test Returns the difference between the two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1800';
      console.info(`${caseName} test start`);
      const numberWrapper = new G18(50, 8);
      expect(numberWrapper.difference()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_1900
     * @tc.name builtinsGenericsFormatTest1900
     * @tc.desc test Returns the difference between the two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest1900';
      console.info(`${caseName} test start`);
      const numberWrapper = new G19(84, 2);
      expect(numberWrapper.divide()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2000
     * @tc.name builtinsGenericsFormatTest2000
     * @tc.desc test Returns the power of two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2000';
      console.info(`${caseName} test start`);
      const numberWrapper = new G20(2, 6);
      expect(numberWrapper.power()).assertEqual(64);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2100
     * @tc.name builtinsGenericsFormatTest2100
     * @tc.desc test The type of return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2100';
      console.info(`${caseName} test start`);
      const aWrapper = new G21<A21>(new A21());
      expect(aWrapper.getType()).assertEqual('object');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2200
     * @tc.name builtinsGenericsFormatTest2200
     * @tc.desc test Check if the value is an instance of A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2200';
      console.info(`${caseName} test start`);
      const aWrapper = new G22<A22>(new A22());
      expect(aWrapper.isInstanceOfA()).assertTrue();
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2300
     * @tc.name builtinsGenericsFormatTest2300
     * @tc.desc test The number of attributes that return the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2300';
      console.info(`${caseName} test start`);
      const aWrapper = new G23<A23>(new A23());
      expect(objWrapper.getPropertyCount()).assertEqual(2);
      expect(aWrapper.getPropertyCount()).assertEqual(0);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2400
     * @tc.name builtinsGenericsFormatTest2400
     * @tc.desc test A list of properties that return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2400';
      console.info(`${caseName} test start`);
      const aWrapper = new G24<A24>(new A24());
      const objWrapper = new G24<MyObject>({
        key1: 'value1', key2: 'value2'
      });
      expect(objWrapper.getPropertyList().toString()).assertEqual('key1,key2');
      expect(aWrapper.getPropertyList().toString()).assertEqual('');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2700
     * @tc.name builtinsGenericsFormatTest2700
     * @tc.desc Returns the result of slicing the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2700';
      console.info(`${caseName} test start`);
      const numberArrayWrapper = new G27([1, 2, 3, 4, 5]);
      const result = numberArrayWrapper.slice(1, 3);
      expect(result.toString()).assertEqual('2,3');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2800
     * @tc.name builtinsGenericsFormatTest2800
     * @tc.desc Returns an inclusion check for the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2800';
      console.info(`${caseName} test start`);
      const stringArrayWrapper = new G28(['a', 'b', 'c']);
      expect(stringArrayWrapper.includes('b')).assertTrue();
      expect(stringArrayWrapper.includes('d')).assertFalse();
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2900
     * @tc.name builtinsGenericsFormatTest2900
     * @tc.desc Returns an index lookup for an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2900';
      console.info(`${caseName} test start`);
      const stringArrayWrapper = new G29(['a', 'b', 'c']);
      expect(stringArrayWrapper.indexOf('b')).assertEqual(1);
      expect(stringArrayWrapper.indexOf('d')).assertEqual(-1);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_3000
     * @tc.name builtinsGenericsFormatTest3000
     * @tc.desc Returns an index lookup for an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest3000';
      console.info(`${caseName} test start`);
      const stringArrayWrapper = new G30(['a', 'b', 'a', 'c']);
      expect(stringArrayWrapper.unique().toString()).assertEqual('a,b,c');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })
  })
}