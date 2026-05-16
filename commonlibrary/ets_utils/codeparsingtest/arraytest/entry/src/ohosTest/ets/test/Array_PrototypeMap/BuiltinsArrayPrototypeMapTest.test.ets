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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

export default function BuiltinsArrayPrototypeMapTest(): void {
  describe("BuiltinsArrayPrototypeMapTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0100
     * @tc.desc   Verify map() with number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const numbers: number[] = [1, 4, 9, 16];
      const result: number[] = numbers.map((x: number): number => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(18);
      expect(result[3]).assertEqual(32);
      expect(numbers[0]).assertEqual(1);
      expect(numbers[1]).assertEqual(4);
      expect(numbers[2]).assertEqual(9);
      expect(numbers[3]).assertEqual(16);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0200
     * @tc.desc   Verify map() with string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const words: string[] = ['hello', 'world'];
      const result: string[] = words.map((word: string): string => word.toUpperCase());
      expect(result[0]).assertEqual('HELLO');
      expect(result[1]).assertEqual('WORLD');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0300
     * @tc.desc   Verify map() with object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface User {
        name: string;
        age: number;
      }
      const users: User[] = [
        { name: 'Alice', age: 25 },
        { name: 'Bob', age: 30 }
      ];
      const names: string[] = users.map((user: User): string => user.name);
      expect(names[0]).assertEqual('Alice');
      expect(names[1]).assertEqual('Bob');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0400
     * @tc.desc   Verify map() does not modify original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const original: number[] = [1, 2, 3];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(arr[0]).assertEqual(original[0]);
      expect(arr[1]).assertEqual(original[1]);
      expect(arr[2]).assertEqual(original[2]);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0500
     * @tc.desc   Verify map() returns new array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((x: number): number => x);
      expect(arr !== result).assertTrue();
      expect(arr[0]).assertEqual(result[0]);
      expect(arr[1]).assertEqual(result[1]);
      expect(arr[2]).assertEqual(result[2]);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0600
     * @tc.desc   Verify map() on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0700
     * @tc.desc   Verify map() on single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      const result: number[] = arr.map((x: number): number => x * 3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(15);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0800
     * @tc.desc   Verify callback function element parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const result: number[] = arr.map((element: number): number => element + 5);
      expect(result[0]).assertEqual(15);
      expect(result[1]).assertEqual(25);
      expect(result[2]).assertEqual(35);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0900
     * @tc.desc   Verify callback function index parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const result: string[] = arr.map((element: string, index: number): string => `${index}: ${element}`);
      expect(result[0]).assertEqual('0: a');
      expect(result[1]).assertEqual('1: b');
      expect(result[2]).assertEqual('2: c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1000
     * @tc.desc   Verify callback function array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let arrayReference: number[] | null = null;
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          arrayReference = array;
        }
        return element;
      });
      expect(arrayReference === arr).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1100
     * @tc.desc   Verify callback with various element types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string | boolean | null | undefined)[] = [1, 'hello', true, null, undefined];
      const result: string[] = arr.map((element: number | string | boolean | null | undefined): string => typeof element);
      expect(result[0]).assertEqual('number');
      expect(result[1]).assertEqual('string');
      expect(result[2]).assertEqual('boolean');
      expect(result[3]).assertEqual('object');
      expect(result[4]).assertEqual('undefined');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1200
     * @tc.desc   Verify callback with index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const result: number[] = arr.map((element: number, index: number): number => element + index);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1300
     * @tc.desc   Verify callback with array length calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let capturedLength: number = 0;
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          capturedLength = array.length;
        }
        return element;
      });
      expect(capturedLength).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1400
     * @tc.desc   Verify callback with all three parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: string[] = arr.map((element: number, index: number, array: number[]): string => {
        return `element: ${element}, index: ${index}, array length: ${array.length}`;
      });
      expect(result[0]).assertEqual('element: 1, index: 0, array length: 3');
      expect(result[1]).assertEqual('element: 2, index: 1, array length: 3');
      expect(result[2]).assertEqual('element: 3, index: 2, array length: 3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1500
     * @tc.desc   Verify callback with ignored parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number): number => element * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1600
     * @tc.desc   Verify map() with thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      interface MultiplierObj {
        multiplier: number;
      }
      const obj: MultiplierObj = {
        multiplier: 10
      };
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        return element * obj.multiplier;
      });
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1700
     * @tc.desc   Verify map() with null thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let thisValue: null | undefined = null;
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        return element;
      });
      expect(thisValue).assertNull();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1800
     * @tc.desc   Verify map() with array thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const thisArg: number[] = [10, 20, 30];
      let thisValue: number[] | null = null;
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          thisValue = thisArg;
        }
        return element + thisArg[0];
      });
      expect(thisValue === thisArg).assertTrue();
      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(12);
      expect(result[2]).assertEqual(13);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1900
     * @tc.desc   Verify map() with function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      class FunctionWithMultiplier {
        multiplier: number = 5;
        call(): number {
          return 10;
        }
      }
      const thisArg = new FunctionWithMultiplier();
      let thisValue: FunctionWithMultiplier | null = null;
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          thisValue = thisArg;
        }
        return element * thisArg.multiplier;
      });
      expect(thisValue === thisArg).assertTrue();
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(15);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2000
     * @tc.desc   Verify map() returns object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      interface Result {
        value: number;
        double: number;
      }
      const result: Result[] = arr.map((x: number): Result => ({
        value: x,
        double: x * 2
      }));
      expect(result[0].value).assertEqual(1);
      expect(result[0].double).assertEqual(2);
      expect(result[1].value).assertEqual(2);
      expect(result[1].double).assertEqual(4);
      expect(result[2].value).assertEqual(3);
      expect(result[2].double).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2100
     * @tc.desc   Verify map() returns array of arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[][] = arr.map((x: number): number[] => [x, x * 2]);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(2);
      expect(result[1][1]).assertEqual(4);
      expect(result[2][0]).assertEqual(3);
      expect(result[2][1]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2200
     * @tc.desc   Verify map() with implicit undefined return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: (number | undefined)[] = arr.map((x: number): number | undefined => {
        // Explicitly return undefined
        return undefined;
      });
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2300
     * @tc.desc   Verify map() returns numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2400
     * @tc.desc   Verify map() returns strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: string[] = arr.map((x: number): string => x.toString());
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('2');
      expect(result[2]).assertEqual('3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2500
     * @tc.desc   Verify map() returns booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 0, 3];
      const result: boolean[] = arr.map((x: number): boolean => x > 0);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2600
     * @tc.desc   Verify map() returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: (null | number)[] = arr.map((x: number): null | number => x === 2 ? null : x);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2700
     * @tc.desc   Verify map() returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: (undefined | number)[] = arr.map((x: number): undefined | number => x === 2 ? undefined : x);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2800
     * @tc.desc   Verify map() returns Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1000, 2000, 3000];
      const result: Date[] = arr.map((x: number): Date => new Date(x));
      expect(result[0] instanceof Date).assertTrue();
      expect(result[1] instanceof Date).assertTrue();
      expect(result[2] instanceof Date).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2900
     * @tc.desc   Verify map() returns functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: Array<() => number> = arr.map((x: number): (() => number) => {
        return () => x;
      });
      expect(typeof result[0]).assertEqual('function');
      expect(typeof result[1]).assertEqual('function');
      expect(typeof result[2]).assertEqual('function');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3000
     * @tc.desc   Verify map() returns different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: (number | string | boolean | null | undefined)[] = arr.map((x: number, index: number): number | string | boolean | null | undefined => {
        switch (index) {
          case 0:
            return x;
          case 1:
            return x.toString();
          case 2:
            return x > 0;
          default:
            return null;
        }
      });
      expect(typeof result[0]).assertEqual('number');
      expect(typeof result[1]).assertEqual('string');
      expect(typeof result[2]).assertEqual('boolean');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3100
     * @tc.desc   Verify map() throws error from callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      try {
        arr.map((x: number): number => {
          if (x === 2) {
            throw new Error('Callback error');
          }
          return x;
        });
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.message).assertEqual('Callback error');
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3200
     * @tc.desc   Verify map() with very large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(1998);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3300
     * @tc.desc   Verify map() with sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[2] = 3;
      let callCount: number = 0;
      const result: (number | undefined)[] = arr.map((x: number | undefined): number | undefined => {
        callCount++;
        return x;
      });
      expect(callCount).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3400
     * @tc.desc   Verify map() with empty slots preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[2] = 3;
      const result: (number | undefined)[] = arr.map((x: number | undefined): number | undefined => x);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3500
     * @tc.desc   Verify map() after delete operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[3] = 4;
      let callCount: number = 0;
      const result: (number | undefined)[] = arr.map((x: number | undefined): number | undefined => {
        callCount++;
        return x;
      });
      expect(callCount).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3600
     * @tc.desc   Verify map() on new Array(length) sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [];
      arr.length = 5;
      arr[0] = 1;
      arr[4] = 5;
      let callCount: number = 0;
      const result: (number | undefined)[] = arr.map((x: number | undefined): number | undefined => {
        callCount++;
        return x;
      });
      expect(callCount).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3700
     * @tc.desc   Verify map() on array with set length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2];
      arr.length = 5;
      let callCount: number = 0;
      const result: (number | undefined)[] = arr.map((x: number | undefined): number | undefined => {
        callCount++;
        return x;
      });
      expect(callCount).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3800
     * @tc.desc   Verify map() on array with empty slots at both ends
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [];
      arr[1] = 2;
      arr[3] = 4;
      let callCount: number = 0;
      const result: (number | undefined)[] = arr.map((x: number | undefined): number | undefined => {
        callCount++;
        return x;
      });
      expect(callCount).assertEqual(2);
      expect(result[1]).assertEqual(2);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3900
     * @tc.desc   Verify map() on array with only empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: undefined[] = [];
      arr.length = 3;
      let callCount: number = 0;
      const result: undefined[] = arr.map((x: undefined): undefined => {
        callCount++;
        return x;
      });
      expect(callCount).assertEqual(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4000
     * @tc.desc   Verify map() combined with filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr
        .map((x: number): number => x * 2)
        .filter((x: number): boolean => x > 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4100
     * @tc.desc   Verify map() with adding elements in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          array.push(4);
        }
        return element * 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4200
     * @tc.desc   Verify map() with modifying already visited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 1) {
          array[0] = 10;
        }
        return element;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4300
     * @tc.desc   Verify map() with modifying unvisited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          array[2] = 30;
        }
        return element;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4400
     * @tc.desc   Verify map() with increasing array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 0) {
          array.length = 5;
        }
        return element * 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4500
     * @tc.desc   Verify map() with decreasing array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.map((element: number, index: number, array: number[]): number => {
        if (index === 1) {
          array.length = 2;
        }
        return element * 2;
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4600
     * @tc.desc   Verify map() combined with reduce()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr
        .map((x: number): number => x * 2)
        .reduce((acc: number, val: number): number => acc + val, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4700
     * @tc.desc   Verify map() after filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr
        .filter((x: number): boolean => x % 2 === 0)
        .map((x: number): number => x * 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4800
     * @tc.desc   Verify map() with filtering logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: (number | null)[] = arr.map((x: number): number | null => {
        return x % 2 === 0 ? x * 2 : null;
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertNull();
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertNull();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4900
     * @tc.desc   Verify map-like functionality with reduce()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.reduce((acc: number[], val: number): number[] => {
        acc.push(val * 2);
        return acc;
      }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_5000
     * @tc.desc   Verify map() for data transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface User {
        id: number;
        name: string;
      }
      const users: User[] = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' }
      ];
      const userIds: number[] = users.map((user: User): number => user.id);
      expect(userIds.length).assertEqual(2);
      expect(userIds[0]).assertEqual(1);
      expect(userIds[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_5100
     * @tc.desc   Verify map() with Object.keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface TestObject {
        a: number;
        b: number;
        c: number;
      }
      const obj: TestObject = {
        a: 1,
        b: 2,
        c: 3
      };
      const result: string[] = Object.keys(obj).map((key: string): string => key.toUpperCase());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('A');
      expect(result[1]).assertEqual('B');
      expect(result[2]).assertEqual('C');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_5200
     * @tc.desc   Verify map() with Object.values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface TestObject {
        a: number;
        b: number;
        c: number;
      }
      const obj: TestObject = {
        a: 1,
        b: 2,
        c: 3
      };
      const result: number[] = Object.values(obj).map((value: number): number => value * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_5300
     * @tc.desc   Verify map() with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = [...arr.map((x: number): number => x * 2)];
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });
  });
}
