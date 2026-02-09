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

interface GeneratedTypeLiteralInterface_1 {
  id: number;
  name: string;
  age: number;
}

interface Person {
  id: number;
  name: string;
  age: number;
}

export default function builtinsmMultipleGenericsRestraintTest() {
  describe('BuiltinsmMultipleGenericsRestraintTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   builtinsmMultipleGenericsRestraintTest0100
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0100
     * @tc.desc   test Get the first parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0100';
        console.info(`${caseName} test start`);

        class G1<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          getFirst(): T {
            return this.first;
          }
        }

        const pair1 = new G1(42, true);
        expect(pair1.getFirst()).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0200
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0200
     * @tc.desc   test Get the second parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0200';
        console.info(`${caseName} test start`);

        class G2<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          getSecond(): U {
            return this.second;
          }
        }

        const pair2 = new G2('hello', false);
        expect(pair2.getSecond()).assertEqual(false);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0300
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0300
     * @tc.desc   test Convert the first parameter to a string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0300';

        class G3<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          getFirstAsString(): string {
            return String(this.first);
          }
        }

        const pair3 = new G3(42, true);
        expect(pair3.getFirstAsString()).assertEqual('42');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0400
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0400
     * @tc.desc   test Convert the first parameter to a number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0400';
        console.info(`${caseName} test start`);

        class G4<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          getFirstAsNumber(): number {
            return Number(this.first);
          }
        }

        const pair4 = new G4('42', false);
        expect(pair4.getFirstAsNumber()).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0500
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0500
     * @tc.desc   test Gets the length of the first parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0500';
        console.info(`${caseName} test start`);

        class G6<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          getFirstLength(): number {
            if (typeof this.first === 'string') {
              return this.first.length;
            }
            return 0;
          }
        }

        const pair6 = new G6('hello', false);
        expect(pair6.getFirstLength()).assertEqual(5);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0600
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0600
     * @tc.desc   test Check if the first parameter is true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0600';
        console.info(`${caseName} test start`);

        class G7<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          isFirstTruthy(): boolean {
            return Boolean(this.first);
          }
        }

        const pair7 = new G7(0, true);
        expect(pair7.isFirstTruthy()).assertEqual(false);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0700
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0700
     * @tc.desc   test Check if the second parameter is true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0700';
        console.info(`${caseName} test start`);

        class G8<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          isSecondTruthy(): boolean {
            return this.second;
          }
        }

        const pair8 = new G8('hello', false);
        expect(pair8.isSecondTruthy()).assertEqual(false);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0800
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0800
     * @tc.desc   test Combine two parameters as a string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0800';
        console.info(`${caseName} test start`);

        class G9<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          combine(): string {
            return `${this.first}-${this.second}`;
          }
        }

        const pair9 = new G9(42, true);
        expect(pair9.combine()).assertEqual('42-true');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest0900
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_0900
     * @tc.desc   test Toggles the Boolean value of the second parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest0900';
        console.info(`${caseName} test start`);

        class G10<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          toggleSecond(): U {
            return !this.second as boolean as U;
          }
        }

        const pair10 = new G10('hello', false);
        expect(pair10.toggleSecond()).assertEqual(true);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1000
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1000
     * @tc.desc   test There are multiple types of parameters,all with default values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1000';
        console.info(`${caseName} test start`);

        class G11<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          isFirstGreaterThanZero(): boolean {
            if (typeof this.first === 'number') {
              return this.first > 0;
            }
            return false;
          }
        }

        const pair11 = new G11(42, true);
        expect(pair11.isFirstGreaterThanZero()).assertEqual(true);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1100
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1100
     * @tc.desc   test The front ones have default values,and the later ones don't
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1100';
        console.info(`${caseName} test start`);

        class G12<T extends number | string, U extends boolean> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          isFirstEmpty(): boolean {
            if (typeof this.first === 'string') {
              return this.first.length === 0;
            }
            return false;
          }
        }

        const pair12 = new G12('', false);
        expect(pair12.isFirstEmpty()).assertEqual(true);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1200
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1200
     * @tc.desc   test Convert the second parameter to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1200';
        console.info(`${caseName} test start`);

        class G4<T extends number | string, U extends boolean | string> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          toLowerCaseSecond(): string {
            if (typeof this.second === 'string') {
              return this.second.toLowerCase();
            }
            throw new Error('Second value is not a string');
          }
        }

        const pair4 = new G4('hello', 'WORLD');
        expect(pair4.toLowerCaseSecond()).assertEqual('world');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1300
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1300
     * @tc.desc   test Whether it is a string or not
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1300';
        console.info(`${caseName} test start`);

        class G5<T extends number | string, U extends boolean | string> {
          private first: T;
          private second: U;

          constructor(first: T, second: U) {
            this.first = first;
            this.second = second;
          }

          isFirstString(): boolean {
            return typeof this.first === 'string';
          }

          isSecondString(): boolean {
            return typeof this.second === 'string';
          }
        }

        const pair5 = new G5('hello', true);
        expect(pair5.isFirstString()).assertEqual(true);
        const pair6 = new G5(42, 'world');
        expect(pair6.isSecondString()).assertEqual(true)
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1400
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1400
     * @tc.desc   test Get the data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1400';
        console.info(`${caseName} test start`);

        class G<T, U extends keyof T> {
          private data: T[];

          constructor(data: T[]) {
            this.data = data;
          }

          getData(): T[] {
            return this.data;
          }
        }

        const data1: Person[] = [
          {
            id: 3, name: 'Charlie', age: 25
          },
          {
            id: 1, name: 'Alice', age: 30
          },
          {
            id: 2, name: 'Bob', age: 22
          },
        ];

        const example1 = new G<GeneratedTypeLiteralInterface_1, 'id'>(data1);
        expect(example1.getData()).assertEqual(data1);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1500
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1500
     * @tc.desc   test Get the first element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1500';
        console.info(`${caseName} test start`);

        class G<T, U extends keyof T> {
          private data: T[];

          constructor(data: T[]) {
            this.data = data;
          }

          getFirstElement(): T {
            return this.data[0];
          }
        }

        const data2: Person[] = [
          {
            id: 3, name: 'Charlie', age: 25
          },
          {
            id: 1, name: 'Alice', age: 30
          },
          {
            id: 2, name: 'Bob', age: 22
          },
        ];

        const example2 = new G<GeneratedTypeLiteralInterface_1, 'id'>(data2);

        expect(JSON.stringify(example2.getFirstElement())).assertContain(
          'Charlie');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1600
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1600
     * @tc.desc   test Get the first element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1600';
        console.info(`${caseName} test start`);

        class G<T, U extends keyof T> {
          private data: T[];

          constructor(data: T[]) {
            this.data = data;
          }

          getLastElement(): T {
            return this.data[this.data.length - 1];
          }
        }

        const data3: Person[] = [
          {
            id: 3, name: 'Charlie', age: 25
          },
          {
            id: 1, name: 'Alice', age: 30
          },
          {
            id: 2, name: 'Bob', age: 22
          },
        ];

        const example3 = new G<GeneratedTypeLiteralInterface_1, 'id'>(data3);
        (data3);

        expect(JSON.stringify(example3.getLastElement())).assertContain('Bob');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1700
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1700
     * @tc.desc   test Get elements by index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1700';
        console.info(`${caseName} test start`);

        class G<T, U extends keyof T> {
          private data: T[];

          constructor(data: T[]) {
            this.data = data;
          }

          getElementByIndex(index: number): T {
            return this.data[index];
          }
        }

        const data4: Person[] = [
          {
            id: 3, name: 'Charlie', age: 25
          },
          {
            id: 1, name: 'Alice', age: 30
          },
          {
            id: 2, name: 'Bob', age: 22
          },
        ];
        const example4 = new G<GeneratedTypeLiteralInterface_1, 'id'>(data4);
        expect(JSON.stringify(example4.getElementByIndex(1))).assertContain('Alice');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1800
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1800
     * @tc.desc   test Get an array of property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1800';
        console.info(`${caseName} test start`);

        class G<T extends GeneratedTypeLiteralInterface_1, U extends keyof T> {
          private data: T[];

          constructor(data: T[]) {
            this.data = data;
          }

          getElementProperty(key: U): (number | string)[] {
            return this.data.map((item) => {
              if (key === 'id') {
                return item.id;
              } else if (key === 'name') {
                return item.name;
              } else if (key === 'age') {
                return item.age;
              }
              throw new Error(`Unknown key`);
            })
          }
        }

        const data5: Person[] = [
          {
            id: 3, name: 'Charlie', age: 25
          },
          {
            id: 1, name: 'Alice', age: 30
          },
          {
            id: 2, name: 'Bob', age: 22
          },
        ];
        const example5 = new G<GeneratedTypeLiteralInterface_1, 'id'>(data5);
        expect(example5.getElementProperty('id').toString()).assertEqual('3,1,2');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest1900
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_1900
     * @tc.desc   test Get an array of property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest1900';
        console.info(`${caseName} test start`);

        class G<T extends GeneratedTypeLiteralInterface_1, U extends keyof T> {
          private data: T[];

          constructor(data: T[]) {
            this.data = data;
          }

          getData(): T[] {
            return this.data;
          }

          sortByProperty(key: U): T[] {
            const arr = this.data.slice();
            for (let i = 0; i < arr.length - 1; i++) {
              for (let j = 0; j < arr.length - 1 - i; j++) {
                let currentValue: number | string;
                let nextValue: number | string;
                if (key === 'id') {
                  currentValue = arr[j].id;
                  nextValue = arr[j + 1].id;
                } else if (key === 'name') {
                  currentValue = arr[j].name;
                  nextValue = arr[j + 1].name;
                } else if (key === 'age') {
                  currentValue = arr[j].age;
                  nextValue = arr[j + 1].age;
                } else {
                  throw new Error(`Unknown key`);
                }
                if (currentValue > nextValue) {
                  const temp = arr[j];
                  arr[j] = arr[j + 1];
                  arr[j + 1] = temp;
                }
              }
            }
            return arr;
          }
        }

        const data6: Person[] = [
          {
            id: 3, name: 'Charlie', age: 25
          },
          {
            id: 1, name: 'Alice', age: 30
          },
          {
            id: 2, name: 'Bob', age: 22
          },
        ];

        const example6 = new G<GeneratedTypeLiteralInterface_1, 'id'>(data6);
        expect(JSON.stringify(example6.sortByProperty('id')[0]).toString()).assertContain('Alice');
        expect(JSON.stringify(example6.sortByProperty('id')[1]).toString()).assertContain('Bob');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2000
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2000
     * @tc.desc   test Bubbling sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2000';
        console.info(`${caseName} test start`);

        class G<T extends number, U extends T[]> {
          private arr: U;
          private ascending: boolean;

          constructor(arr: U, ascending: boolean = true) {
            this.arr = arr;
            this.ascending = ascending;
          }

          bubbleSort(): U {
            const arr = this.arr.slice();
            const compare = this.ascending
              ? (a: T, b: T) => a - b
              : (a: T, b: T) => b - a;
            for (let i = 0; i < arr.length; i++) {
              for (let j = 0; j < arr.length - i - 1; j++) {
                if (compare(arr[j], arr[j + 1]) > 0) {
                  const temp = arr[j];
                  arr[j] = arr[j + 1];
                  arr[j + 1] = temp;
                }
              }
            }

            return arr as U;
          }
        }

        const example = new G<number, number[]>([3, 1, 4, 1, 5, 9], true);
        expect(JSON.stringify(example.bubbleSort()).toString()).assertEqual('[1,1,3,4,5,9]');
        const exampleDesc = new G<number, number[]>([3, 1, 4, 1, 5, 9], false);
        expect(JSON.stringify(exampleDesc.bubbleSort()).toString()).assertEqual('[9,5,4,3,1,1]');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2100
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2100
     * @tc.desc   test Insert sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2100';
        console.info(`${caseName} test start`);

        class G2<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          insertionSort(): U {
            const arr = this.arr.slice();
            const compare = this.ascending ? (a: T, b: T) => a - b : (a: T, b: T) => b - a;
            for (let i = 1; i < arr.length; i++) {
              const current = arr[i];
              let j = i - 1;
              while (j >= 0 && compare(arr[j], current) > 0) {
                arr[j + 1] = arr[j];
                j--;
              }
              arr[j + 1] = current;
            }
            return arr as U;
          }
        }

        const pair2 = new G2([3, 1, 2], true);
        expect(pair2.insertionSort().toString()).assertEqual('1,2,3');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2200
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2200
     * @tc.desc   test Select Sort
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2200';
        console.info(`${caseName} test start`);

        class G3<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          selectionSort(): U {
            const arr = this.arr.slice();
            const compare = this.ascending ? (a: T, b: T) => a - b : (a: T, b: T) => b - a;
            for (let i = 0; i < arr.length; i++) {
              let minIndex = i;
              for (let j = i + 1; j < arr.length; j++) {
                if (compare(arr[j], arr[minIndex]) < 0) {
                  minIndex = j;
                }
              }
              if (minIndex !== i) {
                const temp = arr[i];
                arr[i] = arr[minIndex];
                arr[minIndex] = temp;
              }
            }
            return arr as U;
          }
        }

        const pair3 = new G3([3, 1, 2], true);
        expect(pair3.selectionSort().toString()).assertEqual('1,2,3');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2300
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2300
     * @tc.desc   test Quick sort
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2300';
        console.info(`${caseName} test start`);

        class G4<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          quickSort(): U {
            const arr = this.arr.slice(); // 复制数组
            const compare = this.ascending ? (a: T, b: T) => a - b : (a: T, b: T) => b - a;

            const quickSortHelper = (arr: T[], left: number, right: number): void => {
              if (left >= right) {
                return;
              }
              const pivot = arr[Math.floor((left + right) / 2)];
              const index = this.partition(arr, left, right, pivot, compare);
              quickSortHelper(arr, left, index - 1);
              quickSortHelper(arr, index, right);
            };

            quickSortHelper(arr, 0, arr.length - 1);
            return arr as U;
          }

          private partition(arr: T[], left: number, right: number, pivot: T, compare: (a: T, b: T) => number): number {
            while (left <= right) {
              while (compare(arr[left], pivot) < 0) {
                left++;
              }
              while (compare(arr[right], pivot) > 0) {
                right--;
              }
              if (left <= right) {
                const temp = arr[left];
                arr[left] = arr[right];
                arr[right] = temp;
                left++;
                right--;
              }
            }
            return left;
          }
        }

        const pair4 = new G4([3, 1, 2], true);
        expect(pair4.quickSort().toString()).assertEqual('1,2,3');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2400
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2400
     * @tc.desc   test Merge sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2400';
        console.info(`${caseName} test start`);

        class G5<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          mergeSort(): U {
            const arr = this.arr.slice();
            const compare = this.ascending ? (a: T, b: T) => a - b : (a: T, b: T) => b - a;

            const merge = (left: T[], right: T[]): T[] => {
              const result: T[] = [];
              while (left.length && right.length) {
                if (compare(left[0], right[0]) <= 0) {
                  result.push(left.shift()!);
                } else {
                  result.push(right.shift()!);
                }
              }
              return [...result, ...left, ...right];
            };

            const mergeSortHelper = (arr: T[]): T[] => {
              if (arr.length <= 1) {
                return arr;
              }
              const mid = Math.floor(arr.length / 2);
              const left = mergeSortHelper(arr.slice(0, mid));
              const right = mergeSortHelper(arr.slice(mid));
              return merge(left, right);
            };

            return mergeSortHelper(arr) as U;
          }
        }

        const pair5 = new G5([3, 1, 2], true);
        expect(pair5.mergeSort().toString()).assertEqual('1,2,3');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2500
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2500
     * @tc.desc   test Binary search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2500';
        console.info(`${caseName} test start`);

        class G6<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          binarySearch(target: T): number {
            const arr =
              this.ascending ? this.arr.slice().sort((a, b) => a - b) : this.arr.slice().sort((a, b) => b - a);
            let left = 0;
            let right = arr.length - 1;
            while (left <= right) {
              const mid = Math.floor((left + right) / 2);
              if (arr[mid] === target) {
                return mid;
              } else if (arr[mid] < target) {
                left = mid + 1;
              } else {
                right = mid - 1;
              }
            }
            return -1;
          }
        }

        const pair6 = new G6([3, 1, 2], true);
        expect(pair6.binarySearch(2)).assertEqual(1);
        const pair7 = new G6([3, 2, 2.3], true);
        expect(pair7.binarySearch(2)).assertEqual(0);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2600
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2600
     * @tc.desc   test Calculate the maximum value of the array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2600';
        console.info(`${caseName} test start`);

        class G7<T extends number, U extends T[]> {
          private arr: U;

          constructor(arr: U) {
            this.arr = arr;
          }

          getMax(): T {
            return this.arr.reduce((max, val) => (val > max ? val : max), this.arr[0]);
          }
        }

        const pair7 = new G7([3, 1, 2]);
        expect(pair7.getMax()).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2700
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2700
     * @tc.desc   test Calculate the minimum value of the array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2700';
        console.info(`${caseName} test start`);

        class G8<T extends number, U extends T[]> {
          private arr: U;

          constructor(arr: U) {
            this.arr = arr;
          }

          getMin(): T {
            return this.arr.reduce((min, val) => (val < min ? val : min), this.arr[0]);
          }
        }

        const pair8 = new G8([3, 1, 2]);
        expect(pair8.getMin()).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2800
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2800
     * @tc.desc   test Hill sorted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2800';
        console.info(`${caseName} test start`);

        class G10<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          shellSort(): U {
            const arr = this.arr.slice();
            const compare = this.ascending ? (a: T, b: T) => a - b : (a: T, b: T) => b - a;
            let gap = Math.floor(arr.length / 2);

            while (gap > 0) {
              for (let i = gap; i < arr.length; i++) {
                const temp = arr[i];
                let j = i;
                while (j >= gap && compare(arr[j - gap], temp) > 0) {
                  arr[j] = arr[j - gap];
                  j -= gap;
                }
                arr[j] = temp;
              }
              gap = Math.floor(gap / 2);
            }

            return arr as U;
          }
        }

        const pair10 = new G10([3, 1, 2, 5, 4], true);
        expect(pair10.shellSort().toString()).assertEqual('1,2,3,4,5');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest2900
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_2900
     * @tc.desc   test Heap sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest2900';
        console.info(`${caseName} test start`);

        class G11<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          heapSort(): U {
            const arr = this.arr.slice();
            const compare = this.ascending ? (a: T, b: T) => a - b : (a: T, b: T) => b - a;

            const heapify = (arr: T[], n: number, i: number): void => {
              let largest = i;
              const left = 2 * i + 1;
              const right = 2 * i + 2;

              if (left < n && compare(arr[left], arr[largest]) > 0) {
                largest = left;
              }
              if (right < n && compare(arr[right], arr[largest]) > 0) {
                largest = right;
              }
              if (largest !== i) {
                const temp = arr[i];
                arr[i] = arr[largest];
                arr[largest] = temp;
                heapify(arr, n, largest);
              }
            };
            const n = arr.length;
            for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
              heapify(arr, n, i);
            }
            for (let i = n - 1; i > 0; i--) {
              const temp = arr[0];
              arr[0] = arr[i];
              arr[i] = temp;
              heapify(arr, i, 0);
            }
            return arr as U;
          }
        }

        const pair11 = new G11([3, 1, 2, 5, 4], true);
        expect(pair11.heapSort().toString()).assertEqual('1,2,3,4,5');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsmMultipleGenericsRestraintTest3000
     * @tc.number SUB_BUILTINS_MULTIPLE_GENERICS_RESTRAINT_TEST_3000
     * @tc.desc   test Cardinality sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsmMultipleGenericsRestraintTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsmMultipleGenericsRestraintTest3000';
        console.info(`${caseName} test start`);

        class G12<T extends number, U extends T[], V extends boolean> {
          private arr: U;
          private ascending: V;

          constructor(arr: U, ascending: V) {
            this.arr = arr;
            this.ascending = ascending;
          }

          radixSort(): U {
            const arr = this.arr.slice();
            const getMax = (arr: T[]): number => {
              return arr.reduce((max, val) => (val > max ? val : max), arr[0]);
            };
            const countSort = (arr: T[], exp: number): void => {
              const output: T[] = new Array(arr.length).fill(0);
              const count: number[] = new Array(10).fill(0);
              for (let i = 0; i < arr.length; i++) {
                const digit = Math.floor(arr[i] / exp) % 10;
                count[digit]++;
              }
              for (let i = 1; i < 10; i++) {
                count[i] += count[i - 1];
              }
              for (let i = arr.length - 1; i >= 0; i--) {
                const digit = Math.floor(arr[i] / exp) % 10;
                output[count[digit] - 1] = arr[i];
                count[digit]--;
              }
              for (let i = 0; i < arr.length; i++) {
                arr[i] = output[i];
              }
            };
            const max = getMax(arr);
            for (let exp = 1; Math.floor(max / exp) > 0; exp *= 10) {
              countSort(arr, exp);
            }
            if (!this.ascending) {
              return arr.reverse() as U;
            }
            return arr as U;
          }
        }

        const pair12 = new G12([170, 45, 75, 90, 802, 24, 2, 66], true);
        expect(pair12.radixSort().toString()).assertEqual('2,24,45,66,75,90,170,802');
        console.info(`${caseName} test end`);
        Done();
      })
  })
}