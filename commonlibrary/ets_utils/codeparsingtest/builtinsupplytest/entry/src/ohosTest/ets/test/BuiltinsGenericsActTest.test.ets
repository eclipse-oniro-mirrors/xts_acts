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

export default function builtinsGenericsActTest() {
  describe('BuiltinsGenericsActTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   builtinsGenericsActTest0100
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0100
     * @tc.desc   test Generic classes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0100';
      console.info(`${caseName} test start`);

      class Container<T> {
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

      const numberContainer = new Container<number>();
      numberContainer.addItem(10);
      numberContainer.addItem(20);
      numberContainer.addItem(30);
      const evenNumber = numberContainer.findItem<number>((item) => item % 2 === 0);
      console.log(evenNumber?.toString());
      expect(evenNumber).assertEqual(10);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0200
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0200
     * @tc.desc   test Generics as interfaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0200';
      console.info(`${caseName} test start`);

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

      const appConfig: GeneratedObjectLiteralInterface_2 = {
        name: 'MyApp',
        settings: ({
          theme: 'dark', version: 1.0
        } as GeneratedObjectLiteralInterface_1)
      };
      const app = new Application(appConfig);
      const config = app.getConfig();
      const output = JSON.stringify(config);
      console.log(output.toString());
      expect(output.toString()).assertContain('MyApp')
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0300
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0300
     * @tc.desc   test Generics as type aliases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0400
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0400
     * @tc.desc   test Generic methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0500
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0500
     * @tc.desc   test Generic methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0500';
      console.info(`${caseName} test start`);
      let num1 = logLength('Hello');
      let num2 = logLength([1, 2, 3]);
      expect(num1).assertEqual(5);
      expect(num2).assertEqual(3);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0600
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0600
     * @tc.desc   test Generic function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0700
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0700
     * @tc.desc   test Generic function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest0800
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0800
     * @tc.desc   test Generic function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0800';
      console.info(`${caseName} test start`);
      const identity = <T>(arg: T): T => {
        return arg;
      };
      let outputString = identity<string>('Hello, TypeScript!');
      console.log(outputString)
      expect(outputString).assertEqual('Hello, TypeScript!');
      let outputNumber = identity<number>(123);
      console.log(outputNumber.toString());
      expect(outputNumber).assertEqual(123);
      console.info(`${caseName} test end`);
      Done();
    })
    /**
     * @tc.name   builtinsGenericsActTest0900
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_0900
     * @tc.desc   test Generic classes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest0900';
      console.info(`${caseName} test start`);

      class Box<T> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        getValue(): T {
          return this.value;
        }
      }

      const numberBox = new Box<number>(42);
      const stringBox = new Box<string>('Hello');
      expect(numberBox.getValue()).assertEqual(42);
      expect(stringBox.getValue()).assertEqual('Hello');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1000
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1000
     * @tc.desc   test Classes with multiple generic parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1000';
      console.info(`${caseName} test start`);

      class Pair<T1, T2> {
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

      const numberStringPair = new Pair<number, string>(42, 'Hello');
      const booleanNumberPair = new Pair<boolean, number>(true, 100);
      expect(numberStringPair.getValue1()).assertEqual(42);
      expect(numberStringPair.getValue2()).assertEqual('Hello');
      expect(booleanNumberPair.getValue1()).assertEqual(true);
      expect(booleanNumberPair.getValue2()).assertEqual(100);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1100
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1100
     * @tc.desc   test Generic class inheritance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1100';
      console.info(`${caseName} test start`);

      class Animal {
        name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      class Box<T extends Animal> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        getValue(): T {
          return this.value;
        }
      }

      const animalBox = new Box<Animal>(new Animal('Dog'));
      expect(animalBox.getValue().name).assertEqual('Dog');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1200
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1200
     * @tc.desc   test Generic classes with default values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1200';
      console.info(`${caseName} test start`);

      class Container<T1 = number, T2 = string> {
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

      const defaultContainer = new Container(42, 'Hello');
      const customContainer = new Container<string, boolean>('TypeScript', true);
      expect(defaultContainer.getValue1()).assertEqual(42);
      expect(defaultContainer.getValue2()).assertEqual('Hello');
      expect(customContainer.getValue1()).assertEqual('TypeScript');
      expect(customContainer.getValue2()).assertEqual(true);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1300
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1300
     * @tc.desc   test Interfaces for multiple generic parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1300';
      console.info(`${caseName} test start`);

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

      const pair1 = new NumberStringPair(42, 'Hello', 1);
      const pair2 = new NumberStringPair(100, 'World', 1);
      expect(pair1.getValue1()).assertEqual(42);
      expect(pair1.getValue2()).assertEqual('Hello');
      expect(pair1.getValue3()).assertEqual(1);
      expect(pair2.getValue1()).assertEqual(100);
      expect(pair2.getValue2()).assertEqual('World');
      expect(pair2.getValue3()).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1400
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1400
     * @tc.desc   test Generic interface inheritance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1400';
      console.info(`${caseName} test start`);

      interface Animal {
        name: string;
      }

      interface Box<T extends Animal> {
        value: T;

        getValue(): T;
      }

      class Dog implements Animal {
        name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      class AnimalBox implements Box<Dog> {
        value: Dog;

        constructor(value: Dog) {
          this.value = value;
        }

        getValue(): Dog {
          return this.value;
        }
      }

      const dogBox1 = new AnimalBox(new Dog('Buddy'));
      const dogBox2 = new AnimalBox(new Dog('Max'));
      expect(dogBox1.getValue().name).assertEqual('Buddy');
      expect(dogBox2.getValue().name).assertEqual('Max');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1500
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1500
     * @tc.desc   test Generic interfaces with default values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1500';
      console.info(`${caseName} test start`);

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

      const container1 = new DefaultContainer(42, 'Hello');
      const container2 = new DefaultContainer(100, 'World');
      expect(container1.getValue1()).assertEqual(42);
      expect(container1.getValue2()).assertEqual('Hello');
      expect(container2.getValue1()).assertEqual(100);
      expect(container2.getValue2()).assertEqual('World');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1600
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1600
     * @tc.desc   test Generic interfaces and functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1600';
      console.info(`${caseName} test start`);

      interface MathUtils {
        add<T extends number>(a: T, b: T): T;
      }

      class Calculator implements MathUtils {
        add<T extends number>(a: T, b: T): T {
          return (a + b) as T;
        }
      }

      const calculator = new Calculator();
      const result1 = calculator.add<number>(10, 20);
      const result2 = calculator.add<number>(5, 5);
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(10);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1700
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1700
     * @tc.desc   test Simple generic type aliases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1700';
      console.info(`${caseName} test start`);

      interface Box<T> {
        value: T;
        getValue: () => T;
      }

      const numberBox: Box<number> = {
        value: 42,
        getValue(): number {
          return numberBox.value;
        },
      };

      const stringBox: Box<string> = {
        value: 'Hello',
        getValue(): string {
          return stringBox.value;
        },
      };

      expect(numberBox.getValue()).assertEqual(42);
      expect(stringBox.getValue()).assertEqual('Hello');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1800
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1800
     * @tc.desc   test Type aliases for multiple generic parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1800';
      console.info(`${caseName} test start`);

      interface Pair<T1, T2> {
        value1: T1;
        value2: T2;
        getValue1: () => T1;
        getValue2: () => T2;
      }

      const numberStringPair: Pair<number, string> = {
        value1: 42,
        value2: 'Hello',
        getValue1(): number {
          return numberStringPair.value1;
        },
        getValue2(): string {
          return numberStringPair.value2;
        },
      };

      const booleanNumberPair: Pair<boolean, number> = {
        value1: true,
        value2: 100,
        getValue1(): boolean {
          return booleanNumberPair.value1;
        },
        getValue2(): number {
          return booleanNumberPair.value2;
        },
      };

      expect(numberStringPair.getValue1()).assertEqual(42);
      expect(numberStringPair.getValue2()).assertEqual('Hello');
      expect(booleanNumberPair.getValue1()).assertEqual(true);
      expect(booleanNumberPair.getValue2()).assertEqual(100);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest1900
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_1900
     * @tc.desc   test Generic type aliases and functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest1900';
      console.info(`${caseName} test start`);
      type MathOperation<T> = (a: T, b: T) => T;
      const add: MathOperation<number> = (a: number, b: number): number => a + b;
      const multiply: MathOperation<number> = (a: number, b: number): number => a * b;
      expect(add(10, 20)).assertEqual(30);
      expect(multiply(5, 5)).assertEqual(25);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2000
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2000
     * @tc.desc   test Generic type aliases and objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2000';
      console.info(`${caseName} test start`);

      interface User<T> {
        id: number;
        data: T;
        getData: () => T;
      }

      const stringUser: User<string> = {
        id: 1,
        data: 'Alice',
        getData(): string {
          return stringUser.data;
        },
      };

      const numberUser: User<number> = {
        id: 2,
        data: 30,
        getData(): number {
          return numberUser.data;
        },
      };
      expect(stringUser.getData()).assertEqual('Alice');
      expect(numberUser.getData()).assertEqual(30);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2100
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2100
     * @tc.desc   test Generic type aliases and nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2100';
      console.info(`${caseName} test start`);

      interface NestedValue<T2> {
        value2: T2;
        getValue: () => T2;
      }

      interface NestedObject<T1, T2> {
        value1: T1;
        nested: NestedValue<T2>;
      }

      const nestedObject: NestedObject<number, string> = {
        value1: 42,
        nested: {
          value2: 'Hello',
          getValue(): string {
            return nestedObject.nested.value2;
          },
        },
      };
      expect(nestedObject.nested.getValue()).assertEqual('Hello');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2200
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2200
     * @tc.desc   test Generic methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2300
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2300
     * @tc.desc   test Functions with multiple generic parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2300';
      console.info(`${caseName} test start`);
      const booleanNumberPair = pair<boolean, number>(true, 100);
      expect(booleanNumberPair.toString()).assertEqual('true,100');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2400
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2400
     * @tc.desc   test Generic functions and conditional filtering
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2400';
      console.info(`${caseName} test start`);
      const filteredArray = filterArray<number>([1, 2, 3, 4], (item) => item % 2 === 0);
      expect(filteredArray.toString()).assertEqual('2,4');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2500
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2500
     * @tc.desc   test Simple generic lambda expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2500';
      console.info(`${caseName} test start`);
      const identity = <T>(value: T): T => value;
      const numberResult = identity<number>(42);
      const stringResult = identity<string>('Hello');
      expect(numberResult).assertEqual(42);
      expect(stringResult).assertEqual('Hello');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2600
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2600
     * @tc.desc   test Simple generic lambda expressionsLambda expressions for multiple generic parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2600';
      console.info(`${caseName} test start`);
      const pair = <T1, T2>(value1: T1, value2: T2): [T1, T2] => [value1, value2];
      const numberStringPair = pair<number, string>(42, 'Hello');
      const booleanNumberPair = pair<boolean, number>(true, 100);
      expect(numberStringPair.toString()).assertEqual('42,Hello');
      expect(booleanNumberPair.toString()).assertEqual('true,100');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2700
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2700
     * @tc.desc   test Generic Lambda expressions and arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2700';
      console.info(`${caseName} test start`);
      const reverseArray = <T>(array: T[]): T[] => array.reverse();
      const numberArray = reverseArray<number>([1, 2, 3]);
      const stringArray = reverseArray<string>(['a', 'b', 'c']);
      expect(numberArray.toString()).assertEqual('3,2,1');
      expect(stringArray.toString()).assertContain('c');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2800
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2800
     * @tc.desc   test Generic Lambda Expressions vs. Conditional Filtering
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2800';
      console.info(`${caseName} test start`);
      const filterArray = <T>(array: T[], predicate: (item: T) => boolean): T[] => array.filter(predicate);
      const filteredArray = filterArray<number>([1, 2, 3, 4], (item) => item % 2 === 0)
      expect(filteredArray.toString()).assertEqual('2,4');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest2900
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_2900
     * @tc.desc   test Generic Lambda Expressions and Mappings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest2900';
      console.info(`${caseName} test start`);
      const mapArray = <T, U>(array: T[], mapper: (item: T) => U): U[] => array.map(mapper);
      const mappedArray = mapArray<number, string>([1, 2, 3], (item) => `Item: ${item}`);
      expect(mappedArray).assertContain('Item: 3');
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest3000
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_3000
     * @tc.desc   test Generic Lambda Expressions vs. Lookups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest3000';
      console.info(`${caseName} test start`);
      const findItem = <T>(array: T[], predicate: (item: T) => boolean): T | undefined => array.find(predicate);
      const foundItem = findItem<number>([1, 2, 3, 4], (item) => item === 2);
      expect(foundItem).assertEqual(2);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsGenericsActTest3100
     * @tc.number SUB_BUILTINS_GENERICS_ACT_TEST_3100
     * @tc.desc   test Generic Lambda Expressions vs. Lookups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsGenericsActTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsActTest3100';
      console.info(`${caseName} test start`);

      interface Item {
        category: string;
        value: number;
      }

      const groupBy = <T, K extends string>(array: T[], keySelector: (item: T) => K): Record<K, T[]> =>
      array.reduce((result, item) => {
        const key = keySelector(item);
        if (!result[key]) {
          result[key] = [];
        }
        result[key].push(item);
        return result;
      }, {} as Record<K, T[]>);
      const groupedResult = groupBy<Item, string>(
        [
          {
            category: 'A', value: 1
          },
          {
            category: 'B', value: 2
          },
          {
            category: 'A', value: 3
          },
        ],
        (item) => item.category
      );
      console.info(JSON.stringify(groupedResult) + groupedResult)
      expect(JSON.stringify(groupedResult)).assertContain('A');
      expect(JSON.stringify(groupedResult)).assertContain('B');
      console.info(`${caseName} test end`);
      Done();
    })
  })
}