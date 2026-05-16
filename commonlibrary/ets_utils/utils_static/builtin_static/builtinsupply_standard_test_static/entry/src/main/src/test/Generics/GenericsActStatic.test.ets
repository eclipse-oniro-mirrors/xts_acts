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

class Utils {
  static identity<T>(value: T): T {
    return value;
  }

  static reverse<T>(array: T[]): T[] {
    return array.reverse();
  }

  static findIndex<T>(array: T[], predicate: (item: T) => boolean): number {
    return array.findIndex(predicate);
  }

  static filterArray<T>(array: T[], predicate: (item: T) => boolean): T[] {
    return array.filter(predicate);
  }
}

interface GeneratedObjectLiteralInterface_1 {
  theme: string;
  version: number;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
  settings: GeneratedObjectLiteralInterface_1;
}

interface Wrapper<T> {
  value: T;
}

function wrapValue<T>(value: T): Wrapper<T> {
  return { value };
}

function getFirstElement<T>(arr: T[]): T | undefined {
  return arr.length > 0 ? arr[0] : undefined;
}

interface HasLength {
  length: number;
}

function logLength<T extends HasLength>(arg: T): number {
  console.log(`Length: ${arg.length}`);
  return arg.length;
}

function identity<T>(arg: T): T {
  return arg;
}

function reverseArray<T>(arr: T[]): T[] {
  return arr.reverse();
}

function pair<T1, T2>(value1: T1, value2: T2): [T1, T2] {
  return [value1, value2];
}

function filterArray<T>(array: T[], predicate: (item: T) => boolean): T[] {
  return array.filter(predicate);
}
interface Config<T> {
  name: string;
  settings: T;
}

class Application<T> {
  private config: Config<T>;

  constructor(config: Config<T>) {
    this.config = config;
  }

  getConfig(): Config<T> {
    return this.config;
  }
}

interface Pair1<T1, T2, T3> {
  value1: T1;
  value2: T2;
  value3: T3;

  getValue1(): T1;

  getValue2(): T2;

  getValue3(): T3;
}

class NumberStringPair implements Pair1<number, string, number> {
  value1: number;
  value2: string;
  value3: number;

  constructor(value1: number, value2: string, value3: number,) {
    this.value1 = value1;
    this.value2 = value2;
    this.value3 = value3;
  }

  getValue1(): number {
    return this.value1;
  }

  getValue2(): string {
    return this.value2;
  }

  getValue3(): number {
    return this.value3;
  }
}

interface Animal {
  name: string;
}

class Dog implements Animal {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

interface Container<T1 = number, T2 = string> {
  value1: T1;
  value2: T2;

  getValue1(): T1;
  getValue2(): T2;
}

class DefaultContainer implements Container {
  value1: number;
  value2: string;

  constructor(value1: number, value2: string) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): number {
    return this.value1;
  }

  getValue2(): string {
    return this.value2;
  }
}


interface MathUtils {
  add<T extends number>(a: T, b: T): T;
}

interface Box17<T> {
  value: T;
  getValue():T;
}

interface Pair18<T1, T2> {
  value1: T1;
  value2: T2;
  getValue1(): T1;
  getValue2(): T2;
}

class Pair10<T1, T2> {
  private value1: T1;
  private value2: T2;

  constructor(value1: T1, value2: T2) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }
}

interface User<T> {
  id: number;
  data: T;
  getData: () => T;
}

interface NestedValue<T2> {
  value2: T2;
  getValue(): T2;
}

interface NestedObject<T1, T2> {
  value1: T1;
  nested: NestedValue<T2>;
}

interface Item {
  category: string;
  value: number;
}

class Container10<T> {
  private items: T[] = [];

  addItem(item: T): void {
    this.items.push(item);
  }

  getItems(): T[] {
    return this.items;
  }

  findItem<U extends T>(predicate: (item: T) => boolean): U | undefined {
    const result = this.items.find(predicate);
    if (result) {
      return result as U;
    }
    return undefined;
  }
}

class Box09<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

class Animal11 {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class Box11<T extends Animal11> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

class Container12<T1 = number, T2 = string> {
  private value1: T1;
  private value2: T2;

  constructor(value1: T1, value2: T2) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }
}
type MathOperation<T> = (a: T, b: T) => T;
export default function builtinsGenericsActTest() {
  describe('BuiltinsGenericsActTest', () => {
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
    afterAll(async() => {
      await sleep(50);
      // Presets a clear action,which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0200
     * @tc.name builtinsGenericsActTest0200
     * @tc.desc test Generics as interfaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0200';
      console.info(`${caseName} test start`);

      const appConfig: Config<GeneratedObjectLiteralInterface_1> = {
        name: 'MyApp',
        settings: ({
          theme: 'dark', version: 1.0
        } as GeneratedObjectLiteralInterface_1)
      };
      const app = new Application<GeneratedObjectLiteralInterface_1>(appConfig);
      const config = app.getConfig();
      const output = JSON.stringify(config);
      console.log(output.toString());
      expect(output.toString()).assertContain('MyApp')
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0300
     * @tc.name builtinsGenericsActTest0300
     * @tc.desc test Generics as type aliases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0300';
      console.info(`${caseName} test start`);
      const wrappedNumber = wrapValue(100);
      const wrappedString = wrapValue('TypeScript is awesome!');
      console.log(wrappedNumber.value.toString());
      console.log(wrappedString.value);
      expect(wrappedNumber.value).assertEqual(100);
      expect(wrappedString.value).assertEqual('TypeScript is awesome!');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0400
     * @tc.name builtinsGenericsActTest0400
     * @tc.desc test Generic methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0400';
      console.info(`${caseName} test start`);
      const numbers = [1, 2, 3, 4];
      const strings = ['apple', 'banana', 'cherry'];
      const firstNumber = getFirstElement(numbers);
      const firstString = getFirstElement(strings);
      console.log(firstNumber?.toString());
      console.log(firstString);
      expect(firstNumber).assertEqual(1);
      expect(firstString).assertEqual('apple');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0600
     * @tc.name builtinsGenericsActTest0600
     * @tc.desc test Generic function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0600';
      console.info(`${caseName} test start`);
      const output1 = identity<string>('Hello, TypeScript!');
      const output2 = identity(42);
      console.log(output1);
      console.log(output2.toString());
      expect(output1).assertEqual('Hello, TypeScript!');
      expect(output2).assertEqual(42);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0700
     * @tc.name builtinsGenericsActTest0700
     * @tc.desc test Generic function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0700';
      console.info(`${caseName} test start`);
      const numbers = [1, 2, 3, 4];
      const strings = ['apple', 'banana', 'cherry'];
      const reversedNumbers = reverseArray(numbers);
      const reversedStrings = reverseArray(strings);
      console.log(reversedNumbers.toString());
      console.log(reversedStrings.toString());
      expect(reversedNumbers).assertContain(4);
      expect(reversedStrings).assertContain('banana');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0900
     * @tc.name builtinsGenericsActTest0900
     * @tc.desc test Generic classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0900';
      console.info(`${caseName} test start`);

      const numberBox = new Box09<number>(42);
      const stringBox = new Box09<string>('Hello');
      expect(numberBox.getValue()).assertEqual(42);
      expect(stringBox.getValue()).assertEqual('Hello');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1000
     * @tc.name builtinsGenericsActTest1000
     * @tc.desc test Classes with multiple generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1000';
      console.info(`${caseName} test start`);
      const numberStringPair = new Pair10<number, string>(42, 'Hello');
      const booleanNumberPair = new Pair10<boolean, number>(true, 100);
      expect(numberStringPair.getValue1()).assertEqual(42);
      expect(numberStringPair.getValue2()).assertEqual('Hello');
      expect(booleanNumberPair.getValue1()).assertEqual(true);
      expect(booleanNumberPair.getValue2()).assertEqual(100);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1100
     * @tc.name builtinsGenericsActTest1100
     * @tc.desc test Generic class inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1100';
      console.info(`${caseName} test start`);
      const animalBox = new Box11<Animal11>(new Animal11('Dog'));
      expect(animalBox.getValue().name).assertEqual('Dog');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1200
     * @tc.name builtinsGenericsActTest1200
     * @tc.desc test Generic classes with default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1200';
      console.info(`${caseName} test start`);

      const defaultContainer = new Container12(42, 'Hello');
      const customContainer = new Container12<string, boolean>('TypeScript', true);
      expect(defaultContainer.getValue1()).assertEqual(42);
      expect(defaultContainer.getValue2()).assertEqual('Hello');
      expect(customContainer.getValue1()).assertEqual('TypeScript');
      expect(customContainer.getValue2()).assertEqual(true);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1300
     * @tc.name builtinsGenericsActTest1300
     * @tc.desc test Interfaces for multiple generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1300';
      console.info(`${caseName} test start`);

      const pair1 = new NumberStringPair(42, 'Hello', 1);
      const pair2 = new NumberStringPair(100, 'World', 1);
      expect(pair1.getValue1()).assertEqual(42);
      expect(pair1.getValue2()).assertEqual('Hello');
      expect(pair1.getValue3()).assertEqual(1);
      expect(pair2.getValue1()).assertEqual(100);
      expect(pair2.getValue2()).assertEqual('World');
      expect(pair2.getValue3()).assertEqual(1);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1500
     * @tc.name builtinsGenericsActTest1500
     * @tc.desc test Generic interfaces with default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1500';
      console.info(`${caseName} test start`);

      const container1 = new DefaultContainer(42, 'Hello');
      const container2 = new DefaultContainer(100, 'World');
      expect(container1.getValue1()).assertEqual(42);
      expect(container1.getValue2()).assertEqual('Hello');
      expect(container2.getValue1()).assertEqual(100);
      expect(container2.getValue2()).assertEqual('World');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1900
     * @tc.name builtinsGenericsActTest1900
     * @tc.desc test Generic type aliases and functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1900';
      console.info(`${caseName} test start`);

      const add: MathOperation<number> = (a: number, b: number): number => a + b;
      const multiply: MathOperation<number> = (a: number, b: number): number => a * b;
      expect(add(10, 20)).assertEqual(30);
      expect(multiply(5, 5)).assertEqual(25);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2200
     * @tc.name builtinsGenericsActTest2200
     * @tc.desc test Generic methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2200';
      console.info(`${caseName} test start`);


      const identityResult = Utils.identity<number>(42);
      const reverseResult = Utils.reverse<number>([1, 2, 3]);
      const findIndexResult = Utils.findIndex<number>([10, 20, 30], (item) => item === 20);
      const filterArrayResult = Utils.filterArray<number>([1, 2, 3, 4], (item) => item % 2 === 0);
      expect(identityResult).assertEqual(42);
      expect(reverseResult.toString()).assertEqual('3,2,1');
      expect(findIndexResult).assertEqual(1);
      expect(filterArrayResult.toString()).assertEqual('2,4');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2300
     * @tc.name builtinsGenericsActTest2300
     * @tc.desc test Functions with multiple generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2300';
      console.info(`${caseName} test start`);
      const booleanNumberPair = pair<boolean, number>(true, 100);
      expect(booleanNumberPair.toString()).assertEqual('true,100');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2400
     * @tc.name builtinsGenericsActTest2400
     * @tc.desc test Generic functions and conditional filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsActTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2400';
      console.info(`${caseName} test start`);
      const filteredArray = filterArray<number>([1, 2, 3, 4], (item) => item % 2 === 0);
      expect(filteredArray.toString()).assertEqual('2,4');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })


  })
}