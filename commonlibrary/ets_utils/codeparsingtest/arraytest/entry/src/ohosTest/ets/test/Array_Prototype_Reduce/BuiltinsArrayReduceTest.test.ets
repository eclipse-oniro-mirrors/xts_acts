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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium/index';
import Utils from '../Util.test';

function sumReducer(arr: number[], initial: number): number {
  return arr.reduce((acc: number, cur: number): number => acc + cur, initial);
}

function compose<T>(...fns: Array<(x: T) => T>): (x: T) => T {
  return (x: T): T => fns.reduceRight((acc: T, fn: (x: T) => T): T => fn(acc), x);
}
function pipe<T>(...fns: Array<(x: T) => T>): (x: T) => T {
  return (x: T): T => fns.reduce((acc: T, fn: (x: T) => T): T => fn(acc), x);
}
function reduceFromZero(arr: number[], fn: (acc: number, cur: number) => number): number {
  return arr.reduce(fn, 0);
}

export default function BuiltinsArrayPrototypeReduceTest(): void {
  describe("BuiltinsArrayPrototypeReduceTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name    BuiltinsArrayPrototypeReduceTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0100
     * @tc.desc    Verify that reduce() works with number array without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0200
     * @tc.desc    Verify that reduce() works with number array with initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 10);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0300
     * @tc.desc    Verify that reduce() returns initial value for empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0400
     * @tc.desc    Verify that reduce() throws TypeError for empty array without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      try {
        arr.reduce((acc: number, cur: number): number => acc + cur);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0500
     * @tc.desc    Verify that reduce() returns the single element for array with one element without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0600
     * @tc.desc    Verify that reduce() works with array with one element with initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0700
     * @tc.desc    Verify that reduce() works for multiplication
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [2, 3, 4];
      const result: number = arr.reduce((acc: number, cur: number): number => acc * cur, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0800
     * @tc.desc    Verify that reduce() works for string concatenation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['Hello', ' ', 'World', '!'];
      const result: string = arr.reduce((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual('Hello World!');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_0900
     * @tc.desc    Verify that reduce() works with array accumulator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        acc.push(cur * 2);
        return acc;
      }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1000
     * @tc.desc    Verify that reduce() works with null initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number | null = arr.reduce((acc: number | null, cur: number): number => {
        if (acc === null) return cur;
        return acc + cur;
      }, null);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1100
     * @tc.desc    Verify that accumulator initial value is the first element when no initial value is provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      let firstAcc: number | undefined = undefined;
      arr.reduce((acc: number, cur: number): number => {
        if (firstAcc === undefined) firstAcc = acc;
        return acc + cur;
      });
      expect(firstAcc).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1200
     * @tc.desc    Verify that accumulator initial value is the provided initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      let firstAcc: number | undefined = undefined;
      arr.reduce((acc: number, cur: number): number => {
        if (firstAcc === undefined) firstAcc = acc;
        return acc + cur;
      }, 5);
      expect(firstAcc).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1300
     * @tc.desc    Verify that accumulator updates correctly during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const accValues: number[] = [];
      arr.reduce((acc: number, cur: number): number => {
        accValues.push(acc);
        return acc + cur;
      }, 0);
      expect(accValues.length).assertEqual(3);
      expect(accValues[0]).assertEqual(0);
      expect(accValues[1]).assertEqual(1);
      expect(accValues[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1400
     * @tc.desc    Verify that currentValue iterates through all array elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const values: number[] = [];
      arr.reduce((acc: number, cur: number): number => {
        values.push(cur);
        return acc + cur;
      }, 0);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1500
     * @tc.desc    Verify that currentValue handles undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const values: (number | undefined)[] = [];
      arr.reduce((acc: number, cur: number | undefined): number => {
        values.push(cur);
        return acc;
      }, 0);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertUndefined();
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1600
     * @tc.desc    Verify that currentValue handles null values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [1, null, 3];
      const values: (number | null)[] = [];
      arr.reduce((acc: number, cur: number | null): number => {
        values.push(cur);
        return acc;
      }, 0);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertNull();
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1700
     * @tc.desc    Verify that currentIndex starts from 0 when initial value is provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const indices: number[] = [];
      arr.reduce((acc: number, cur: number, index: number): number => {
        indices.push(index);
        return acc + cur;
      }, 0);
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1800
     * @tc.desc    Verify that currentIndex starts from 1 when no initial value is provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const indices: number[] = [];
      arr.reduce((acc: number, cur: number, index: number): number => {
        indices.push(index);
        return acc + cur;
      });
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_1900
     * @tc.desc    Verify that currentIndex is accurate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const result: Record<number, string> = arr.reduce((acc: Record<number, string>, cur: string, index: number): Record<number, string> => {
        acc[index] = cur;
        return acc;
      }, {});
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2000
     * @tc.desc    Verify that array parameter points to the original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let originalArray: number[] | undefined = undefined;
      arr.reduce((acc: number, cur: number, index: number, array: number[]): number => {
        if (!originalArray) originalArray = array;
        return acc + cur;
      }, 0);
      expect(originalArray === arr).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2100
     * @tc.desc    Verify that array parameter always points to the same array even when array is modified during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const arrays: number[][] = [];
      arr.reduce((acc: number, cur: number, index: number, array: number[]): number => {
        arrays.push(array);
        arr.push(cur + 10);
        return acc + cur;
      }, 0);
      const allSame = arrays.every(a => a === arr);
      expect(allSame).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2200
     * @tc.desc    Verify that all parameters are correctly passed to the callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.reduce((acc: number, cur: number, index: number, array: number[]): number => {
        return acc + cur + index + array.length;
      }, 0);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2300
     * @tc.desc    Verify that reduce() works with boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true];
      const result: boolean = arr.reduce((acc: boolean, cur: boolean): boolean => acc || cur, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2400
     * @tc.desc    Verify that reduce() works with bigint array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: bigint[] = [1n, 2n, 3n];
      const result: bigint = arr.reduce((acc: bigint, cur: bigint): bigint => acc + cur, 0n);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2500
     * @tc.desc    Verify that reduce() works with function array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: ((x: number) => number)[] = [x => x * 2, x => x + 1];
      const result: number = arr.reduce((acc: number, fn: (x: number) => number): number => fn(acc), 5);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2600
     * @tc.desc    Verify that reduce() works with NaN initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.reduce((acc: number, cur: number): number => {
        if (Number.isNaN(acc)) return cur;
        return acc + cur;
      }, NaN);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2700
     * @tc.desc    Verify that reduce() works with Infinity initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2800
     * @tc.desc    Verify that reduce() works with -Infinity initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, -Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_2900
     * @tc.desc    Verify that callback is called once per element when initial value is provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let callCount: number = 0;
      arr.reduce((acc: number, cur: number): number => {
        callCount++;
        return acc + cur;
      }, 0);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3000
     * @tc.desc    Verify that callback is called n-1 times when no initial value is provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let callCount: number = 0;
      arr.reduce((acc: number, cur: number): number => {
        callCount++;
        return acc + cur;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3100
     * @tc.desc    Verify that callback is not called for empty array with initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      let callCount: number = 0;
      const result: number = arr.reduce((acc: number, cur: number): number => {
        callCount++;
        return acc + cur;
      }, 0);
      expect(callCount).assertEqual(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3200
     * @tc.desc    Verify that callback is not called for array with one element without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      let callCount: number = 0;
      const result: number = arr.reduce((acc: number, cur: number): number => {
        callCount++;
        return acc + cur;
      });
      expect(callCount).assertEqual(0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3300
     * @tc.desc    Verify that callback is called once for array with one element with initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      let callCount: number = 0;
      const result: number = arr.reduce((acc: number, cur: number): number => {
        callCount++;
        return acc + cur;
      }, 0);
      expect(callCount).assertEqual(1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3400
     * @tc.desc    Verify that reduce() returns string initial value for empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: string = arr.reduce((acc: string, cur: number): string => acc + cur, 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3500
     * @tc.desc    Verify that reduce() throws TypeError for empty array without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      try {
        arr.reduce((acc: number, cur: number): number => acc + cur);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3600
     * @tc.desc    Verify that callback is not called for array with one element without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [42];
      const result: number = arr.reduce((acc: number, cur: number): number => {
        throw new Error('Should not be called');
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3700
     * @tc.desc    Verify that callback is called for array with one element with initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [42];
      let called: boolean = false;
      const result: number = arr.reduce((acc: number, cur: number): number => {
        called = true;
        return acc + cur;
      }, 0);
      expect(called).assertTrue();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3800
     * @tc.desc    Verify that reduce() works with array containing undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [undefined];
      const result: number | undefined = arr.reduce((acc: number | undefined, cur: number | undefined): number | undefined => acc as number + (cur as number));
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_3900
     * @tc.desc    Verify that reduce() works with array containing null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [null];
      const result: number | null = arr.reduce((acc: number | null, cur: number | null): number | null => acc as number + (cur as number));
      expect(result).assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4000
     * @tc.desc    Verify that reduce() works with large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeArr: number[] = Array(10000).fill(1);
      const result: number = largeArr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4100
     * @tc.desc    Verify that reduce() works with large array of objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface ValueObj {
        value: number;
      }
      const largeArr: ValueObj[] = [];
      for (let i = 0; i < 1000; i++) {
        largeArr.push({value: i});
      }
      const result: number = largeArr.reduce((acc: number, cur: ValueObj): number => acc + cur.value, 0);
      expect(result).assertEqual(499500);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4200
     * @tc.desc    Verify that reduce() works with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [Number.MIN_VALUE, 0];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4300
     * @tc.desc    Verify that reduce() works with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [Infinity, 1];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4400
     * @tc.desc    Verify that reduce() works with -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [-Infinity, 1];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4500
     * @tc.desc    Verify that reduce() works with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [NaN, 1];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4600
     * @tc.desc    Verify that reduce() works with empty strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['', 'a', ''];
      const result: string = arr.reduce((acc: string, cur: string): string => acc + cur);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4700
     * @tc.desc    Verify that reduce() works with long strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let longStr: string = '';
      for (let i = 0; i < 10000; i++) {
        longStr += 'a';
      }
      const arr: string[] = [longStr, longStr];
      const result: string = arr.reduce((acc: string, cur: string): string => acc + cur);
      expect(result.length).assertEqual(20000);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4800
     * @tc.desc    Verify that reduce() works with Chinese characters and emojis
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['你好', '世界', '🎉'];
      const result: string = arr.reduce((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual('你好世界🎉');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_4900
     * @tc.desc    Verify that currentIndex starts from 0 when initial value is provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const indices: number[] = [];
      arr.reduce((acc: number, cur: number, idx: number): number => {
        indices.push(idx);
        return acc + cur;
      }, 0);
      expect(indices[0]).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5000
     * @tc.desc    Verify that currentIndex ends at array.length - 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let lastIndex: number | undefined = undefined;
      arr.reduce((acc: number, cur: number, idx: number): number => {
        lastIndex = idx;
        return acc + cur;
      }, 0);
      expect(lastIndex).assertEqual(2);
      expect(lastIndex === arr.length - 1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5100
     * @tc.desc    Verify that reduce() works with small number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5200
     * @tc.desc    Verify that reduce() works with floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1.1, 2.2, 3.3];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertClose(6.6, 0.001);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5300
     * @tc.desc    Verify that reduce() works with mixed positive and negative numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, -2, 3, -4, 5];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5400
     * @tc.desc    Verify that reduce() works with array starting with zeros
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [0, 0, 0, 1];
      const result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5500
     * @tc.desc    Verify that reduce() can find maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 2, 8, 1, 9, 3];
      const max: number = arr.reduce((acc: number, cur: number): number => Math.max(acc, cur));
      expect(max).assertEqual(9);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5600
     * @tc.desc    Verify that reduce() can find minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 2, 8, 1, 9, 3];
      const min: number = arr.reduce((acc: number, cur: number): number => Math.min(acc, cur));
      expect(min).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5700
     * @tc.desc    Verify that reduce() works with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['Hello', ' ', 'World'];
      const result: string = arr.reduce((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5800
     * @tc.desc    Verify that reduce() can remove duplicates from array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'a', 'c', 'b'];
      const result: string[] = arr.reduce((acc: string[], cur: string): string[] => {
        if (!acc.includes(cur)) {
          acc.push(cur);
        }
        return acc;
      }, []);
      expect(result.length).assertEqual(3);
      expect(result.includes('a')).assertTrue();
      expect(result.includes('b')).assertTrue();
      expect(result.includes('c')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_5900
     * @tc.desc    Verify that reduce() can calculate total string length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'bb', 'ccc'];
      const result: number = arr.reduce((acc: number, cur: string): number => acc + cur.length, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6000
     * @tc.desc    Verify that reduce() works with small string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const result: string = arr.reduce((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual('abcd');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6100
     * @tc.desc    Verify that reduce() works with boolean array using OR operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [false, true, false];
      const result: boolean = arr.reduce((acc: boolean, cur: boolean): boolean => acc || cur, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6200
     * @tc.desc    Verify that reduce() works with boolean array using AND operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true];
      const result: boolean = arr.reduce((acc: boolean, cur: boolean): boolean => acc && cur, true);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6300
     * @tc.desc    Verify that reduce() can count true values in boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true, true];
      const result: number = arr.reduce((acc: number, cur: boolean): number => acc + (cur ? 1 : 0), 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6400
     * @tc.desc    Verify that reduce() works with function array for composition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface XObj {
        x: number;
      }
      const arr: XObj[] = [{x: 1}, {x: 2}, {x: 3}];
      const result: number = arr.reduce((acc: number, cur: XObj): number => acc + cur.x, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6500
     * @tc.desc    Verify that reduce() can flatten a 2D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[] = arr.reduce((acc: number[], cur: number[]): number[] => {
        return acc.concat(cur);
      }, []);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6600
     * @tc.desc    Verify that reduce() can remove duplicates using spread operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 2, 3, 3, 3, 4];
      const result: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        if (!acc.includes(cur)) {
          return [...acc, cur];
        }
        return acc;
      }, []);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6700
     * @tc.desc    Verify that reduce() can handle null values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [1, null, 3];
      const result: number = arr.reduce((acc: number, cur: number | null): number => {
        return acc + (cur === null ? 0 : cur);
      }, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6800
     * @tc.desc    Verify that reduce() can handle undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const result: number = arr.reduce((acc: number, cur: number | undefined): number => {
        return acc + (cur === undefined ? 0 : cur);
      }, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_6900
     * @tc.desc    Verify that reduce() can count null values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [null, null, null];
      const result: number = arr.reduce((acc: number, cur: number | null): number => {
        return acc + (cur === null ? 1 : 0);
      }, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7000
     * @tc.desc    Verify that reduce() propagates errors from callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      try {
        arr.reduce((acc: number, cur: number): number => {
          if (cur === 2) throw new Error('Custom error');
          return acc + cur;
        }, 0);
        expect(false).assertTrue();
      } catch (e) {
        expect((e as Error).message).assertEqual('Custom error');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7100
     * @tc.desc    Verify that reduce() works with array of objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface XObj {
        x: number;
      }
      const arr: XObj[] = [{x: 1}, {x: 2}];
      const result: number = arr.reduce((acc: number, cur: XObj): number => acc + cur.x, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7200
     * @tc.desc    Verify that reduce() can handle array modification during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const values: number[] = [];
      arr.reduce((acc: number, cur: number, idx: number, array: number[]): number => {
        values.push(cur);
        if (idx === 0) {
          array.push(4);
        }
        return acc + cur;
      }, 0);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7300
     * @tc.desc    Verify that reduce() can handle array element modification during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const values: number[] = [];
      arr.reduce((acc: number, cur: number, idx: number, array: number[]): number => {
        values.push(cur);
        if (idx === 0) {
          array[2] = 10;
        }
        return acc + cur;
      }, 0);
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(10);
      expect(values[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7400
     * @tc.desc    Verify that reduce() works with small number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sum: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7500
     * @tc.desc    Verify that reduce() works for multiplication
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [2, 3, 4];
      const product: number = arr.reduce((acc: number, cur: number): number => acc * cur, 1);
      expect(product).assertEqual(24);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7600
     * @tc.desc    Verify that reduce() can calculate average
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const avg: number = arr.reduce((acc: number, cur: number, idx: number, array: number[]): number => {
        acc += cur;
        if (idx === array.length - 1) {
          return acc / array.length;
        }
        return acc;
      }, 0);
      expect(avg).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7700
     * @tc.desc    Verify that reduce() can find maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 2, 8, 1, 9, 3];
      const max: number = arr.reduce((acc: number, cur: number): number => Math.max(acc, cur));
      expect(max).assertEqual(9);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7800
     * @tc.desc    Verify that reduce() can find minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 2, 8, 1, 9, 3];
      const min: number = arr.reduce((acc: number, cur: number): number => Math.min(acc, cur));
      expect(min).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest7900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_7900
     * @tc.desc    Verify that reduce() can flatten a 2D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const flattened: number[] = arr.reduce((acc: number[], cur: number[]): number[] => {
        return acc.concat(cur);
      }, []);
      expect(flattened.length).assertEqual(6);
      expect(flattened[0]).assertEqual(1);
      expect(flattened[1]).assertEqual(2);
      expect(flattened[2]).assertEqual(3);
      expect(flattened[3]).assertEqual(4);
      expect(flattened[4]).assertEqual(5);
      expect(flattened[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8000
     * @tc.desc    Verify that reduce() can group numbers by even and odd
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      class GroupedObj {
        odd: number[] = [];
        even: number[] = [];
      }
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const grouped: GroupedObj = arr.reduce((acc: GroupedObj, cur: number): GroupedObj => {
        if (cur % 2 === 0) {
          acc.even.push(cur);
        } else {
          acc.odd.push(cur);
        }
        return acc;
      }, new GroupedObj());
      expect(grouped.odd.length).assertEqual(3);
      expect(grouped.odd[0]).assertEqual(1);
      expect(grouped.odd[1]).assertEqual(3);
      expect(grouped.odd[2]).assertEqual(5);
      expect(grouped.even.length).assertEqual(3);
      expect(grouped.even[0]).assertEqual(2);
      expect(grouped.even[1]).assertEqual(4);
      expect(grouped.even[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8100
     * @tc.desc    Verify that reduce() can remove duplicates using spread operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 2, 3, 3, 3, 4];
      const unique: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        if (!acc.includes(cur)) {
          return [...acc, cur];
        }
        return acc;
      }, []);
      expect(unique.length).assertEqual(4);
      expect(unique[0]).assertEqual(1);
      expect(unique[1]).assertEqual(2);
      expect(unique[2]).assertEqual(3);
      expect(unique[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8200
     * @tc.desc    Verify that reduce() can convert array to object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface KeyValue {
        key: string;
        value: number;
      }
      const arr: KeyValue[] = [
        {key: 'a', value: 1},
        {key: 'b', value: 2},
        {key: 'c', value: 3}
      ];
      const obj: Record<string, number> = arr.reduce((acc: Record<string, number>, cur: KeyValue): Record<string, number> => {
        acc[cur.key] = cur.value;
        return acc;
      }, {});
      expect(obj.a).assertEqual(1);
      expect(obj.b).assertEqual(2);
      expect(obj.c).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8300
     * @tc.desc    Verify that reduce() can calculate total value of products
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface Product {
        name: string;
        price: number;
        quantity: number;
      }
      const products: Product[] = [
        {name: 'A', price: 10, quantity: 2},
        {name: 'B', price: 20, quantity: 1},
        {name: 'C', price: 15, quantity: 3}
      ];
      const totalValue: number = products.reduce((acc: number, cur: Product): number => {
        return acc + (cur.price * cur.quantity);
      }, 0);
      expect(totalValue).assertEqual(85);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8400
     * @tc.desc    Verify that reduce() can count elements greater than threshold
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const count: number = arr.reduce((acc: number, cur: number): number => {
        return acc + (cur > 5 ? 1 : 0);
      }, 0);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8500
     * @tc.desc    Verify that reduce() can calculate total score of persons
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface Person {
        name: string;
        score: number;
      }
      const arr: Person[] = [
        {name: 'Alice', score: 85},
        {name: 'Bob', score: 92},
        {name: 'Charlie', score: 78}
      ];
      const totalScore: number = arr.reduce((acc: number, cur: Person): number => acc + cur.score, 0);
      expect(totalScore).assertEqual(255);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8600
     * @tc.desc    Verify that reduce() works with map
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.map((x: number): number => x * 2).reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8700
     * @tc.desc    Verify that reduce() works with filter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const result: number = arr.filter((x: number): boolean => x % 2 === 0).reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8800
     * @tc.desc    Verify that reduce() can check if any element is even
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const hasEven: boolean = arr.reduce((acc: boolean, cur: number): boolean => acc || cur % 2 === 0, false);
      expect(hasEven).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest8900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_8900
     * @tc.desc    Verify that reduce() can check if all elements are even
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [2, 4, 6, 8];
      const allEven: boolean = arr.reduce((acc: boolean, cur: number): boolean => acc && cur % 2 === 0, true);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9000
     * @tc.desc    Verify that reduce() can concatenate 2D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const concatenated: number[] = arr.reduce((acc: number[], cur: number[]): number[] => acc.concat(cur), []);
      expect(concatenated.length).assertEqual(6);
      expect(concatenated[0]).assertEqual(1);
      expect(concatenated[1]).assertEqual(2);
      expect(concatenated[2]).assertEqual(3);
      expect(concatenated[3]).assertEqual(4);
      expect(concatenated[4]).assertEqual(5);
      expect(concatenated[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9100
     * @tc.desc    Verify that reduce() can map elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        acc.push(cur * 2);
        return acc;
      }, []);
      expect(mapped.length).assertEqual(4);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
      expect(mapped[3]).assertEqual(8);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9200
     * @tc.desc    Verify that reduce() can filter elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const filtered: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        if (cur % 2 === 0) {
          acc.push(cur);
        }
        return acc;
      }, []);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
      expect(filtered[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9300
     * @tc.desc    Verify that reduce() can filter and map elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const result: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        if (cur % 2 === 0) {
          acc.push(cur * 10);
        }
        return acc;
      }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(60);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9400
     * @tc.desc    Verify that reduce() can be used for side effects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const log: number[] = [];
      arr.reduce((acc: null, cur: number): null => {
        log.push(cur);
        return acc;
      }, null);
      expect(log.length).assertEqual(4);
      expect(log[0]).assertEqual(1);
      expect(log[1]).assertEqual(2);
      expect(log[2]).assertEqual(3);
      expect(log[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9500
     * @tc.desc    Verify that reduce() can find first element matching condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const found: number | undefined = arr.reduce((acc: number | undefined, cur: number): number | undefined => {
        if (acc === undefined && cur > 3) {
          return cur;
        }
        return acc;
      }, undefined);
      expect(found).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9600
     * @tc.desc    Verify that reduce() can flatten 2D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const flattened: number[] = arr.reduce((acc: number[], cur: number[]): number[] => acc.concat(cur), []);
      expect(flattened.length).assertEqual(6);
      expect(flattened[0]).assertEqual(1);
      expect(flattened[1]).assertEqual(2);
      expect(flattened[2]).assertEqual(3);
      expect(flattened[3]).assertEqual(4);
      expect(flattened[4]).assertEqual(5);
      expect(flattened[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9700
     * @tc.desc    Verify that reduce() can flat map elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const flatMapped: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        return acc.concat([cur, cur * 2]);
      }, []);
      expect(flatMapped.length).assertEqual(6);
      expect(flatMapped[0]).assertEqual(1);
      expect(flatMapped[1]).assertEqual(2);
      expect(flatMapped[2]).assertEqual(2);
      expect(flatMapped[3]).assertEqual(4);
      expect(flatMapped[4]).assertEqual(3);
      expect(flatMapped[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9800
     * @tc.desc    Verify that reduce() can sort elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [3, 1, 4, 1, 5, 9, 2, 6];
      const sorted: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        let inserted: boolean = false;
        for (let i: number = 0; i < acc.length; i++) {
          if (cur < acc[i]) {
            acc.splice(i, 0, cur);
            inserted = true;
            break;
          }
        }
        if (!inserted) {
          acc.push(cur);
        }
        return acc;
      }, []);
      expect(sorted.length).assertEqual(8);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(1);
      expect(sorted[2]).assertEqual(2);
      expect(sorted[3]).assertEqual(3);
      expect(sorted[4]).assertEqual(4);
      expect(sorted[5]).assertEqual(5);
      expect(sorted[6]).assertEqual(6);
      expect(sorted[7]).assertEqual(9);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceTest9900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_TEST_9900
     * @tc.desc    Verify that reduce() works with sort
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceTest9900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [3, 1, 4, 1, 5, 9, 2, 6];
      const result: number[] = arr.sort((a: number, b: number): number => a - b).reduce((acc: number[], cur: number, idx: number): number[] => {
        if (idx % 2 === 0) {
          acc.push(cur);
        }
        return acc;
      }, []);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(6);
    });

  });
}
