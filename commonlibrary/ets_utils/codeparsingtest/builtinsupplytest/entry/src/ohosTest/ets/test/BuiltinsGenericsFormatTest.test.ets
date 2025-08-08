/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License,Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

interface MyObject {
  key1: string;
  key2: string;
}


export default function builtinsGenericsFormatTest() {
  describe('BuiltinsGenericsFormatTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action,which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action,which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
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
      Done();
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

      class G<T = string, T1 = number> {
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

      const defaultPair = new G('Hello', 42);
      console.log(defaultPair.getValue1());
      console.log(defaultPair.getValue2().toString());
      expect(defaultPair.getValue1()).assertEqual('Hello');
      expect(defaultPair.getValue2()).assertEqual(42)
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends Object> {
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

      const obj = new G<Person>({
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
      Done();
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

      class A {
        name: string;

        constructor(name: string) {
          this.name = name;
        }

        greet(): string {
          return `Hello, my name is ${this.name}`;
        }
      }

      class G<T extends A> {
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

      class B extends A {
        age: number;

        constructor(name: string, age: number) {
          super(name);
          this.age = age;
        }

        introduce(): string {
          return `${this.greet()} and I am ${this.age} years old.`;
        }
      }

      class C extends A {
        job: string;

        constructor(name: string, job: string) {
          super(name);
          this.job = job;
        }

        introduce(): string {
          return `${this.greet()} and I am a ${this.job}.`;
        }
      }

      const bInstance = new B('Alice', 30);
      const gB = new G<B>(bInstance);
      console.log(gB.useGreet());
      console.log(bInstance.introduce());
      const cInstance = new C('Bob', 'Developer');
      const gC = new G<C>(cInstance);
      console.log(gC.useGreet());
      expect(gC.useGreet()).assertEqual('Hello, my name is Bob');
      console.log(cInstance.introduce());
      expect(cInstance.introduce()).assertEqual('Hello, my name is Bob and I am a Developer.');
      console.info(`${caseName} test end`);
      Done();
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

      class G<T = number[]> {
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

      const g1 = new G([1, 2, 3, 4]);

      console.log(g1.getValue().toString());
      expect(g1.getValue().toString()).assertEqual('1,2,3,4');
      g1.setValue([5, 6, 7]);
      console.log(g1.getValue().toString());
      expect(g1.getValue().toString()).assertEqual('5,6,7');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_0600
     * @tc.name builtinsGenericsFormatTest0600
     * @tc.desc test Generic single type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest0600';
      console.info(`${caseName} test start`);

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

        processValue(): T {
          if (typeof this.value === 'number') {
            return this.value + 1 as T;
          } else if (typeof this.value === 'string') {
            return this.value.split('').reverse().join('') as T;
          }
          return this.value;
        }
      }

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
      const processedNumber = new G<number>(42);
      console.log(processedNumber.processValue().toString());
      expect(processedNumber.processValue()).assertEqual(43);
      const processedString = new G<string>('Hello, TypeScript!');
      console.log(processedString.processValue());
      expect(processedString.processValue().toString()).assertEqual('!tpircSepyT ,olleH');
      console.info(`${caseName} test end`);
      Done();
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

      class G<T> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        isEqual(otherValue: T): boolean {
          return this.value === otherValue;
        }
      }

      const numberWrapper = new G<number>(42);
      expect(numberWrapper.isEqual(42)).assertTrue();
      expect(numberWrapper.isEqual(100)).assertFalse();
      console.info(`${caseName} test end`);
      Done();
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

      class G<T> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        toString(): string {
          return String(this.value);
        }
      }

      const numberWrapper = new G<number>(8);
      expect(numberWrapper.toString()).assertEqual('8');
      console.info(`${caseName} test end`);
      Done();
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

      class G<T> {
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

      const numberWrapper = new G<number>(42, 0);
      expect(numberWrapper.isDefault()).assertFalse();
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        double(): T {
          return (this.value * 2) as T;
        }
      }

      const numberWrapper = new G<number>(42);
      expect(numberWrapper.double()).assertEqual(84);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends string> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        toUpperCase(): string {
          return this.value.toUpperCase();
        }
      }

      const stringWrapper = new G<string>('hello');
      expect(stringWrapper.toUpperCase()).assertEqual('HELLO');
      console.info(`${caseName} test end`);
      Done();
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

      class G<T> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        toArray(): T[] {
          return [this.value];
        }
      }

      const numberWrapper = new G<number>(42);
      expect(numberWrapper.toArray().toString()).assertEqual('42');
      expect(typeof numberWrapper.toArray()).assertEqual('object');
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number, T1 extends number> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        sumOfSquares(): number {
          return this.value1 * this.value1 + this.value2 * this.value2;
        }
      }

      const numberWrapper = new G<number, number>(3, 9);
      expect(numberWrapper.sumOfSquares()).assertEqual(90);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        add(otherValue: T): T {
          return (this.value + otherValue) as T;
        }
      }

      const numberWrapper = new G<number>(42);
      expect(numberWrapper.add(58)).assertEqual(100);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number, T1 extends number> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        sum(): number {
          return this.value1 + this.value2;
        }
      }

      const numberWrapper = new G<number, number>(19, 23);
      expect(numberWrapper.sum()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number, T1 extends number> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        multiply(): number {
          return this.value1 * this.value2;
        }
      }

      const numberWrapper = new G<number, number>(6, 7);
      expect(numberWrapper.multiply()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends boolean, T1 extends boolean> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        and(): boolean {
          return this.value1 && this.value2;
        }
      }

      const booleanWrapper = new G<boolean, boolean>(true, false);
      expect(booleanWrapper.and()).assertFalse();
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number, T1 extends number> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        difference(): number {
          return this.value1 - this.value2;
        }
      }

      const numberWrapper = new G<number, number>(50, 8);
      expect(numberWrapper.difference()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number, T1 extends number> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        divide(): number {
          return this.value1 / this.value2;
        }
      }

      const numberWrapper = new G<number, number>(84, 2);
      expect(numberWrapper.divide()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T extends number, T1 extends number> {
        value1: T;
        value2: T1;

        constructor(value1: T, value2: T1) {
          this.value1 = value1;
          this.value2 = value2;
        }

        power(): number {
          return Math.pow(this.value1, this.value2);
        }
      }

      const numberWrapper = new G<number, number>(2, 6);
      expect(numberWrapper.power()).assertEqual(64);
      console.info(`${caseName} test end`);
      Done();
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

      class A {
      }

      class G<T extends Object | A> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        getType(): string {
          return typeof this.value;
        }
      }

      const aWrapper = new G<A>(new A());
      expect(aWrapper.getType()).assertEqual('object');
      console.info(`${caseName} test end`);
      Done();
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

      class A {
      }

      class G<T extends Object | A> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        isInstanceOfA(): boolean {
          return this.value instanceof A;
        }
      }

      const aWrapper = new G<A>(new A());
      expect(aWrapper.isInstanceOfA()).assertTrue();
      console.info(`${caseName} test end`);
      Done();
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

      class A {
      }

      class G<T extends Object | A> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        getPropertyCount(): number {
          return Object.keys(this.value).length;
        }
      }

      const objWrapper = new G<MyObject>({
        key1: 'value1', key2: 'value2'
      });
      const aWrapper = new G<A>(new A());
      expect(objWrapper.getPropertyCount()).assertEqual(2);
      expect(aWrapper.getPropertyCount()).assertEqual(0);
      console.info(`${caseName} test end`);
      Done();
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

      class A {
      }

      class G<T extends Object | A> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        getPropertyList(): string[] {
          return Object.keys(this.value);
        }
      }

      const objWrapper = new G<MyObject>({
        key1: 'value1', key2: 'value2'
      });
      const aWrapper = new G<A>(new A());
      expect(objWrapper.getPropertyList().toString()).assertEqual('key1,key2');
      expect(aWrapper.getPropertyList().toString()).assertEqual('');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2500
     * @tc.name builtinsGenericsFormatTest2500
     * @tc.desc A list of attribute values that return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2500';
      console.info(`${caseName} test start`);

      class A {
      }

      class G<T extends Object | A> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        getPropertyValues(): T[] {
          return Object.values(this.value);
        }
      }

      const objWrapper = new G<MyObject>({
        key1: 'value1', key2: 'value2'
      });
      const aWrapper = new G<A>(new A());
      expect(objWrapper.getPropertyValues().toString()).assertEqual('value1,value2');
      expect(aWrapper.getPropertyValues().toString()).assertEqual('');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_FORMAT_TEST_2600
     * @tc.name builtinsGenericsFormatTest2600
     * @tc.desc A list of attribute values that return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsFormatTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsFormatTest2600';
      console.info(`${caseName} test start`);

      class MyObject {
        key: string;

        constructor(key: string) {
          this.key = key;
        }
      }

      class A {
      }

      class G<T extends Object | A> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        hasProperty(key: string): boolean {
          const value = this.value as Record<string, string | number | boolean>;
          return value[key] !== undefined;
        }
      }

      const objWrapper = new G<MyObject>(new MyObject('value'));
      const aWrapper = new G<A>(new A());
      expect(objWrapper.hasProperty('key')).assertTrue();
      expect(aWrapper.hasProperty('key')).assertFalse();
      console.info(`${caseName} test end`);
      Done();
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

      class G<T = number[]> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        slice(start?: number, end?: number): T[] {
          return (this.value as T[]).slice(start, end);
        }
      }

      const numberArrayWrapper = new G([1, 2, 3, 4, 5]);
      const result = numberArrayWrapper.slice(1, 3);
      expect(result.toString()).assertEqual('2,3');
      console.info(`${caseName} test end`);
      Done();
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

      class G<T = string[]> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        includes(item: string): boolean {
          return (this.value as string).includes(item);
        }
      }

      const stringArrayWrapper = new G(['a', 'b', 'c']);
      expect(stringArrayWrapper.includes('b')).assertTrue();
      expect(stringArrayWrapper.includes('d')).assertFalse();
      console.info(`${caseName} test end`);
      Done();
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

      class G<T = string[]> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        indexOf(item: string): number {
          return (this.value as string).indexOf(item);
        }
      }

      const stringArrayWrapper = new G(['a', 'b', 'c']);
      expect(stringArrayWrapper.indexOf('b')).assertEqual(1);
      expect(stringArrayWrapper.indexOf('d')).assertEqual(-1);
      console.info(`${caseName} test end`);
      Done();
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

      class G<T = string[]> {
        value: T;

        constructor(value: T) {
          this.value = value;
        }

        unique(): string[] {
          return Array.from(new Set(this.value as string[]));
        }
      }

      const stringArrayWrapper = new G(['a', 'b', 'a', 'c']);
      expect(stringArrayWrapper.unique().toString()).assertEqual('a,b,c');
      console.info(`${caseName} test end`);
      Done();
    })
  })
}