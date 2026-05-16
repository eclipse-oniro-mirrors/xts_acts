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
export default function BuiltinsArrayPrototypeReduceSecTest(): void {
  describe("BuiltinsArrayPrototypeReduceSecTest", () => {
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
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0100
     * @tc.desc    Verify that reduce() works with number array without initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const chunks: number[][] = arr.reduce((acc: number[][], cur: number, idx: number): number[][] => {
        const chunkIndex: number = Math.floor(idx / 3);
        if (!acc[chunkIndex]) {
          acc[chunkIndex] = [];
        }
        acc[chunkIndex].push(cur);
        return acc;
      }, []);
      expect(chunks.length).assertEqual(4);
      expect(chunks[0].length).assertEqual(3);
      expect(chunks[1].length).assertEqual(3);
      expect(chunks[2].length).assertEqual(3);
      expect(chunks[3].length).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0200
     * @tc.desc    Verify that reduce() processes elements in correct order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const order: number[] = [];
      arr.reduce((acc: number, cur: number): number => {
        order.push(cur);
        return acc + cur;
      }, 0);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      expect(order[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0300
     * @tc.desc    Verify that reduceRight() processes elements in reverse order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const order: number[] = [];
      arr.reduceRight((acc: number, cur: number): number => {
        order.push(cur);
        return acc + cur;
      }, 0);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(3);
      expect(order[1]).assertEqual(2);
      expect(order[2]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0400
     * @tc.desc    Verify that reduce() and reduceRight() work with 2D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const leftConcat: number[] = arr.reduce((acc: number[], cur: number[]): number[] => acc.concat(cur), []);
      const rightConcat: number[] = arr.reduceRight((acc: number[], cur: number[]): number[] => acc.concat(cur), []);
      expect(leftConcat.length).assertEqual(6);
      expect(leftConcat[0]).assertEqual(1);
      expect(leftConcat[1]).assertEqual(2);
      expect(leftConcat[2]).assertEqual(3);
      expect(leftConcat[3]).assertEqual(4);
      expect(leftConcat[4]).assertEqual(5);
      expect(leftConcat[5]).assertEqual(6);
      expect(rightConcat.length).assertEqual(6);
      expect(rightConcat[0]).assertEqual(5);
      expect(rightConcat[1]).assertEqual(6);
      expect(rightConcat[2]).assertEqual(3);
      expect(rightConcat[3]).assertEqual(4);
      expect(rightConcat[4]).assertEqual(1);
      expect(rightConcat[5]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0500
     * @tc.desc    Verify that reduce() can filter even numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        if (cur % 2 === 0) {
          acc.push(cur);
        }
        return acc;
      }, []);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0600
     * @tc.desc    Verify that reduce() can filter even numbers using spread operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.reduce((acc: number[], cur: number): number[] => {
        if (cur % 2 === 0) {
          return [...acc, cur];
        }
        return acc;
      }, []);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0700
     * @tc.desc    Verify that reduce() can compose functions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const double: (x: number) => number = x => x * 2;
      const addOne: (x: number) => number = x => x + 1;
      const composed: (x: number) => number = compose(double, addOne);
      const piped: (x: number) => number = pipe(double, addOne);
      expect(composed(3)).assertEqual(8);
      expect(piped(3)).assertEqual(7);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0800
     * @tc.desc    Verify that reduce() can remove duplicates using Set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 2, 3, 3, 3, 4];
      const uniqueSet: Set<number> = arr.reduce((acc: Set<number>, cur: number): Set<number> => {
        if (!acc.has(cur)) {
          acc.add(cur);
        }
        return acc;
      }, new Set<number>());
      const result: number[] = Array.from(uniqueSet);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_0900
     * @tc.desc    Verify that reduce() can simulate stack operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface StackOperation {
        op: string;
        val?: number;
      }
      const operations: StackOperation[] = [
        {op: 'push', val: 1},
        {op: 'push', val: 2},
        {op: 'pop'},
        {op: 'push', val: 3}
      ];
      const stack: number[] = operations.reduce((acc: number[], op: StackOperation): number[] => {
        if (op.op === 'push' && op.val !== undefined) {
          acc.push(op.val);
        } else if (op.op === 'pop') {
          acc.pop();
        }
        return acc;
      }, []);
      expect(stack.length).assertEqual(2);
      expect(stack[0]).assertEqual(1);
      expect(stack[1]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1000
     * @tc.desc    Verify that reduce() can calculate multiple results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      class MultiResult {
        sum: number = 0;
        even: number[] = [];
        product: number = 1;
      }
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const result: MultiResult = arr.reduce((acc: MultiResult, cur: number): MultiResult => {
        acc.sum += cur;
        if (cur % 2 === 0) {
          acc.even.push(cur);
        }
        acc.product *= cur;
        return acc;
      }, new MultiResult());
      expect(result.sum).assertEqual(21);
      expect(result.even.length).assertEqual(3);
      expect(result.even[0]).assertEqual(2);
      expect(result.even[1]).assertEqual(4);
      expect(result.even[2]).assertEqual(6);
      expect(result.product).assertEqual(720);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1100
     * @tc.desc    Verify that reduce() can be terminated early with error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let sum: number = 0;
      try {
        arr.reduce((acc: number, cur: number): number => {
          sum += cur;
          if (sum >= 15) {
            throw new Error('Stop');
          }
          return acc;
        }, 0);
      } catch (e) {
        // Early termination
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1200
     * @tc.desc    Verify that reduce() works with custom reduce function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const arr: number[] = [1, 2, 3, 4];
      const sum: number = reduceFromZero(arr, (acc: number, cur: number): number => acc + cur);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1300
     * @tc.desc    Verify that reduce() works with sumReducer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const arr: number[] = [1, 2, 3, 4];
      const sum: number = sumReducer(arr, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1400
     * @tc.desc    Verify that reduce() works with Int8Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8: Int8Array = new Int8Array([1, 2, 3, 4]);
      const result: number = int8.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1500
     * @tc.desc    Verify that reduce() works with Float32Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const float32: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
      const result: number = float32.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(7.5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1600
     * @tc.desc    Verify that reduce() works with Uint8Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uint8: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = uint8.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1700
     * @tc.desc    Verify that reduce() works with Map values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, number> = new Map([['a', 1], ['b', 2], ['c', 3]]);
      const result: number = Array.from(map.values()).reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1800
     * @tc.desc    Verify that reduce() works with Set values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const set: Set<number> = new Set([1, 2, 2, 3, 3, 3]);
      const result: number = Array.from(set).reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_1900
     * @tc.desc    Verify that reduce() works with string characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = 'hello';
      const result: number = Array.from(str).reduce((acc: number, cur: string): number => acc + cur.charCodeAt(0), 0);
      expect(result).assertEqual(532);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_2000
     * @tc.desc    Verify that reduce() works with array of objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface Person {
        name: string;
        age: number;
      }
      const people: Person[] = [{name: 'Alice', age: 30}, {name: 'Bob', age: 25}, {name: 'Charlie', age: 35}];
      const totalAge: number = people.reduce((acc: number, cur: Person): number => acc + cur.age, 0);
      expect(totalAge).assertEqual(90);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_2100
     * @tc.desc    Verify that reduce() can find earliest date
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const dates: Date[] = [new Date(2023, 0, 1), new Date(2023, 0, 2), new Date(2023, 0, 3)];
      const earliest: Date = dates.reduce((acc: Date, cur: Date): Date => cur < acc ? cur : acc, dates[0]);
      expect(earliest.toDateString()).assertEqual('Sun Jan 01 2023');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeReduceSecTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_REDUCE_SEC_TEST_2200
     * @tc.desc    Verify that reduce() can compose array of functions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeReduceSecTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const functions: Array<(x: number) => number> = [
        (x: number): number => x + 1,
        (x: number): number => x * 2,
        (x: number): number => x - 3
      ];
      const composed: (x: number) => number = functions.reduce((acc: (x: number) => number, cur: (x: number) => number): (x: number) => number => {
        return (x: number): number => cur(acc(x));
      }, (x: number): number => x);
      expect(composed(5)).assertEqual(9);
    });

  })
}