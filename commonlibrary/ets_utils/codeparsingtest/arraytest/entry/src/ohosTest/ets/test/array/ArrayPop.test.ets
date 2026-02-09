/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayPopTest() {
  describe('ArrayPopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testArrayPop0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0001
     * @tc.desc   Verify pop returns last number element and reduces length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0002
     * @tc.desc   Verify pop on empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const popped: string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(true);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayPop0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0003
     * @tc.desc   Verify pop on boolean array returns last value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false];
      const popped: boolean | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(false);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPop0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0004
     * @tc.desc   Verify pop works with array of arrays and returns last sub-array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const popped: number[] | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertDeepEquals([3, 4]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPop0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0005
     * @tc.desc   Verify pop returns object from array of objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Item { a: number; }

      const arr: Item[] = [{ a: 1 }, { a: 2 }];
      const popped: Item | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!.a).assertEqual(2);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPop0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0006
     * @tc.desc   Verify successive pop calls reduce length each time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr.pop();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0007
     * @tc.desc   Verify pop combined with push maintains LIFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b'];
      arr.push('c');
      const popped: string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual('c');
    });

    /**
     * @tc.name   testArrayPop0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0008
     * @tc.desc   Verify pop on single element array empties it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [42];
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(42);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayPop0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0009
     * @tc.desc   Verify pop with heterogeneous union types returns expected last
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'two', 2];
      const popped: number | string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0010
     * @tc.desc   Verify pop works repeatedly until empty (third pop yields undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['x', 'y'];
      arr.pop();
      arr.pop();
      const popped: string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0011
     * @tc.desc   Verify pop after reverse returns expected last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.reverse();
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPop0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0012
     * @tc.desc   Verify pop returns last string after shift operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      arr.shift();
      const popped: string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual('c');
    });

    /**
     * @tc.name   testArrayPop0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0013
     * @tc.desc   Verify pop with optional property objects and assert property value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { a?: number; }

      const arr: Opt[] = [{ a: 1 }, {}, { a: 3 }];
      const popped: Opt | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!.a).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0014
     * @tc.desc   Verify pop works with class instances and returns last instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Box {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: Box[] = [new Box(1), new Box(2)];
      const popped: Box | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!.v).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0015
     * @tc.desc   Verify Array.prototype.pop.call on array-like object decreases length and returns last numeric property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   class ArrLike {
    //     length: number;
    //     // define numeric properties explicitly as possibly undefined
    //     0: number | undefined;
    //     1: number | undefined;
    //     constructor() {
    //       this.length = 2;
    //       this[0] = 5;
    //       this[1] = 10;
    //     }
    //   }
    //   const obj = new ArrLike();
    //   const popped: number | undefined = Array.prototype.pop.call(obj);
    //   expect(popped === undefined).assertEqual(false);
    //   expect(popped!).assertEqual(10);
    //   expect(obj.length).assertEqual(1);
    //   expect(obj[1] === undefined).assertEqual(true);
    // });

    /**
     * @tc.name   testArrayPop0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0016
     * @tc.desc   Verify pop combined with concat does not affect combined copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const combined: number[] = arr.concat([3, 4]);
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(2);
      expect(combined.length).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0017
     * @tc.desc   Verify pop on nested arrays returns last nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2], [3]];
      const popped: number[] | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped![0]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPop0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0018
     * @tc.desc   Verify pop removes last element and previous remains intact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['x', 'y', 'z'];
      arr.pop();
      expect(arr[arr.length - 1]).assertEqual('y');
    });

    /**
     * @tc.name   testArrayPop0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0019
     * @tc.desc   Verify pop after push of union type returns expected last
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1];
      arr.push('a');
      const popped: number | string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual('a');
    });

    /**
     * @tc.name   testArrayPop0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0020
     * @tc.desc   Verify pop after splice returns expected last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 1);
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0021
     * @tc.desc   Verify pop returns last boolean from boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const popped: boolean | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0022
     * @tc.desc   Verify pop with array of tuples returns last tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b']];
      const popped: [number, string] | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped![1]).assertEqual('b');
    });

    /**
     * @tc.name   testArrayPop0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0023
     * @tc.desc   Verify pop on large array reduces length by one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array(100).fill(1);
      arr.pop();
      expect(arr.length).assertEqual(99);
    });

    /**
     * @tc.name   testArrayPop0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0024
     * @tc.desc   Verify pop returns last element from array filled with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(3).fill(5);
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0025
     * @tc.desc   Verify pop after sort returns expected last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['c', 'a', 'b'];
      arr.sort();
      const popped: string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual('c');
    });

    /**
     * @tc.name   testArrayPop0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0026
     * @tc.desc   Verify pop on array of class instances with optional field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class OptBox {
        v?: number;

        constructor(v?: number) {
          this.v = v;
        }
      }

      const arr: OptBox[] = [new OptBox(1), new OptBox()];
      const popped: OptBox | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!.v === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0027
     * @tc.desc   Verify pop after push and unshift returns last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2];
      arr.unshift(1);
      arr.push(3);
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPop0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0028
     * @tc.desc   Verify pop from array of union with null returns last numeric value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, null, 2];
      const popped: number | null | undefined = arr.pop();
      expect(popped === undefined).assertEqual(false);
      expect(popped!).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0029
     * @tc.desc   Verify consecutive pop calls on empty array return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const popped1: string | undefined = arr.pop();
      const popped2: string | undefined = arr.pop();
      expect(popped1 === undefined && popped2 === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0030
     * @tc.desc   Verify pop on original array does not change slice copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const copy: number[] = arr.slice();
      arr.pop();
      expect(copy.length).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0031
     * @tc.desc   Verify pop removes last string element and returns it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['x', 'y', 'z'];
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('z');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0032
     * @tc.desc   Verify pop after push null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [];
      arr.push(null, 5);
      const popped: number | null | undefined = arr.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0033
     * @tc.desc   Verify pop on array of optional property objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { a?: number }

      const arr: Opt[] = [{ a: 1 }, { a: 2 }];
      const popped: Opt | undefined = arr.pop();
      expect(popped?.a).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0034
     * @tc.desc   Verify pop returns last boolean and length decreases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const popped: boolean | undefined = arr.pop();
      expect(popped).assertEqual(true);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0035
     * @tc.desc   Verify pop removes nested array from array of arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[][] = [['a'], ['b', 'c']];
      const popped: string[] | undefined = arr.pop();
      expect(popped).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArrayPop0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0036
     * @tc.desc   Verify pop on array after multiple push-pop cycles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1);
      arr.pop();
      arr.push(2);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0037
     * @tc.desc   Verify pop returns last class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public n: number;

        constructor(n: number) {
          this.n = n;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const popped: C | undefined = arr.pop();
      expect(popped?.n).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0038
     * @tc.desc   Verify pop on array of union types with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | null)[] = ['a', null];
      const popped: string | null | undefined = arr.pop();
      expect(popped).assertEqual(null);
    });

    /**
     * @tc.name   testArrayPop0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0039
     * @tc.desc   Verify pop returns function and can invoke it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type F = (n: number) => number;
      const f1: F = n => n * 2;
      const arr: F[] = [f1];
      const popped: F | undefined = arr.pop();
      expect(popped && popped(3)).assertEqual(6);
    });

    /**
     * @tc.name   testArrayPop0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0040
     * @tc.desc   Verify pop from array of numbers leaves empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [100];
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(100);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayPop0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0041
     * @tc.desc   Verify pop after push undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined];
      const popped: number | undefined = arr.pop();
      expect(popped === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0042
     * @tc.desc   Verify pop returns last string after concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: string[] = ['a', 'b'];
      arr = arr.concat(['c']);
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('c');
    });

    /**
     * @tc.name   testArrayPop0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0043
     * @tc.desc   Verify pop after reverse returns first of reversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.reverse();
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPop0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0044
     * @tc.desc   Verify pop returns last array of numbers from mixed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string[])[] = [1, ['a', 'b']];
      const popped: number | string[] | undefined = arr.pop();
      expect(Array.isArray(popped)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0045
     * @tc.desc   Verify pop after fill on array of numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(3).fill(9);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(9);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0046
     * @tc.desc   Verify pop from array containing class instances and primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

      const arr: (C | number)[] = [new C(1), 2];
      const popped: C | number | undefined = arr.pop();
      expect(popped).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0047
     * @tc.desc   Verify pop on array of promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const p1: Promise<number> = Promise.resolve(1);
      const arr: Promise<number>[] = [p1];
      const popped: Promise<number> | undefined = arr.pop();
      expect(popped instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0048
     * @tc.desc   Verify pop after push multiple string values and splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      arr.splice(1, 1);
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('d');
    });

    /**
     * @tc.name   testArrayPop0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0049
     * @tc.desc   Verify pop on array of tuples
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b']];
      const popped: [number, string] | undefined = arr.pop();
      expect(popped).assertDeepEquals([2, 'b']);
    });

    /**
     * @tc.name   testArrayPop0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0050
     * @tc.desc   Verify pop after sort on array of numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 1, 3];
      arr.sort((a, b) => (a - b));
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0051
     * @tc.desc   Verify pop after push multiple booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const popped: boolean | undefined = arr.pop();
      expect(popped).assertEqual(true);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0052
     * @tc.desc   Verify pop from empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const popped: string | undefined = arr.pop();
      expect(popped === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0053
     * @tc.desc   Verify pop after shift to remove first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.shift();
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPop0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0054
     * @tc.desc   Verify pop returns last element from array of interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Item { id: number; }

      const arr: Item[] = [{ id: 1 }, { id: 2 }];
      const popped: Item | undefined = arr.pop();
      expect(popped?.id).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0055
     * @tc.desc   Verify pop after push object literal matching interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface User { name: string; }

      const arr: User[] = [];
      arr.push({ name: 'Alice' }, { name: 'Bob' });
      const popped: User | undefined = arr.pop();
      expect(popped?.name).assertEqual('Bob');
    });

    /**
     * @tc.name   testArrayPop0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0056
     * @tc.desc   Verify pop on nested array three levels deep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][][] = [[[1], [2]], [[3], [4]]];
      const popped: number[][] | undefined = arr.pop();
      expect(popped).assertDeepEquals([[3], [4]]);
    });

    /**
     * @tc.name   testArrayPop0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0057
     * @tc.desc   Verify pop returns last Date object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const d1: Date = new Date(2020, 1, 1);
      const d2: Date = new Date(2021, 1, 1);
      const arr: Date[] = [d1, d2];
      const popped: Date | undefined = arr.pop();
      expect(popped?.getFullYear()).assertEqual(2021);
    });

    /**
     * @tc.name   testArrayPop0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0058
     * @tc.desc   Verify pop on array after unshift adds at start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['b'];
      arr.unshift('a');
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('b');
    });

    /**
     * @tc.name   testArrayPop0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0059
     * @tc.desc   Verify pop returns last element from mixed tuple array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b']];
      const popped: [number, string] | undefined = arr.pop();
      expect(popped).assertDeepEquals([2, 'b']);
    });

    /**
     * @tc.name   testArrayPop0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0060
     * @tc.desc   Verify pop after map transform still returns correct last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr = arr.map(x => x * 2);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(6);
    });

    /**
     * @tc.name   testArrayPop0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0061
     * @tc.desc   Verify pop returns last string after slice used
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: string[] = ['x', 'y', 'z'];
      arr = arr.slice(0, 3);
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('z');
    });

    /**
     * @tc.name   testArrayPop0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0062
     * @tc.desc   Verify pop on array of functions returns last function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type F = (x: number) => number;
      const f1: F = x => x + 1;
      const f2: F = x => x * 2;
      const arr: F[] = [f1, f2];
      const popped: F | undefined = arr.pop();
      expect(popped && popped(3)).assertEqual(6);
    });

    /**
     * @tc.name   testArrayPop0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0063
     * @tc.desc   Verify pop on array of mixed numbers and class instances returns last
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

      const arr: (number | C)[] = [1, new C(2)];
      const popped: number | C | undefined = arr.pop();
      expect(popped instanceof C).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0064
     * @tc.desc   Verify pop after push object with optional fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt {
        a?: number;
        b?: string;
      }

      const arr: Opt[] = [{ a: 1 }, { b: 'x' }];
      const popped: Opt | undefined = arr.pop();
      expect(popped?.b).assertEqual('x');
    });

    /**
     * @tc.name   testArrayPop0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0065
     * @tc.desc   Verify pop after push multiple nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2]];
      const popped: number[] | undefined = arr.pop();
      expect(popped).assertDeepEquals([2]);
    });

    /**
     * @tc.name   testArrayPop0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0066
     * @tc.desc   Verify pop on array with boolean null union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (boolean | null)[] = [true, null];
      const popped: boolean | null | undefined = arr.pop();
      expect(popped).assertEqual(null);
    });

    /**
     * @tc.name   testArrayPop0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0067
     * @tc.desc   Verify pop on array of Dates after sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Date[] = [new Date(2020, 1, 1), new Date(2019, 1, 1)];
      arr.sort((a, b) => a.getFullYear() - b.getFullYear());
      const popped: Date | undefined = arr.pop();
      expect(popped?.getFullYear()).assertEqual(2020);
    });

    /**
     * @tc.name   testArrayPop0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0068
     * @tc.desc   Verify pop after push Promise resolves to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const p: Promise<number> = Promise.resolve(10);
      const arr: Promise<number>[] = [p];
      const popped: Promise<number> | undefined = arr.pop();
      expect(popped instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0069
     * @tc.desc   Verify pop on array after copyWithin operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.copyWithin(1, 0, 2);
      const popped: number | undefined = arr.pop();
      expect(typeof popped === 'number').assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0070
     * @tc.desc   Verify pop after push and flat array returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = arr.flat();
      flat.push(5);
      const popped: number | undefined = flat.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0071
     * @tc.desc   Verify pop after splice leaves expected last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 1); // remove index1
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0072
     * @tc.desc   Verify pop on array containing undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const popped: number | undefined | undefined = arr.pop();
      expect(popped).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPop0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0073
     * @tc.desc   Verify pop returns last RegExp instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: RegExp[] = [/a/, /b/];
      const popped: RegExp | undefined = arr.pop();
      expect(popped?.test('b')).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0074
     * @tc.desc   Verify pop returns last element from frozen inner arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPop0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const inner:number[]=Object.freeze([1,2]);
    //   const arr:number[][]=[inner,[3,4]];
    //   const popped:number[]|undefined=arr.pop();
    //   expect(popped).assertDeepEquals([3,4]);
    // });

    /**
     * @tc.name   testArrayPop0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0075
     * @tc.desc   Verify pop on array of symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPop0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const s1:unique symbol=Symbol('a');
    //   const s2:unique symbol=Symbol('b');
    //   const arr:symbol[]=[s1,s2];
    //   const popped:symbol|undefined=arr.pop();
    //   expect(typeof popped==='symbol').assertEqual(true);
    // });

    /**
     * @tc.name   testArrayPop0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0076
     * @tc.desc   Verify pop on array after reverse order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.reverse();
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPop0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0077
     * @tc.desc   Verify pop on array of nested objects with optional property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: number; }

      const arr: Opt[] = [{ val: 1 }, {}];
      const popped: Opt | undefined = arr.pop();
      expect(popped?.val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0078
     * @tc.desc   Verify pop after concat returns expected last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr = arr.concat([3, 4]);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0079
     * @tc.desc   Verify pop on array containing nulls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | null)[] = ['x', null];
      const popped: string | null | undefined = arr.pop();
      expect(popped).assertEqual(null);
    });

    /**
     * @tc.name   testArrayPop0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0080
     * @tc.desc   Verify pop on array of class instances sorted by property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public n: number;

        constructor(n: number) {
          this.n = n;
        }
      }

      const arr: C[] = [new C(2), new C(1)];
      arr.sort((a, b) => (a.n - b.n));
      const popped: C | undefined = arr.pop();
      expect(popped?.n).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0081
     * @tc.desc   Verify pop on array of tuples after push new tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a']];
      arr.push([2, 'b']);
      const popped: [number, string] | undefined = arr.pop();
      expect(popped).assertDeepEquals([2, 'b']);
    });

    /**
     * @tc.name   testArrayPop0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0082
     * @tc.desc   Verify pop on array of booleans after filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: boolean[] = [true, false, true];
      arr = arr.filter(x => x);
      const popped: boolean | undefined = arr.pop();
      expect(popped).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0083
     * @tc.desc   Verify pop on array of numbers after fill modifies elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [0, 0, 0];
      arr.fill(5);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0084
     * @tc.desc   Verify pop on array of mixed string and number union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | number)[] = [1, 'a', 2];
      const popped: string | number | undefined = arr.pop();
      expect(popped).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0085
     * @tc.desc   Verify pop on array of functions returns correct behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (n: number) => number;
      const f1: Fn = n => n + 1;
      const f2: Fn = n => n * 3;
      const arr: Fn[] = [f1, f2];
      const popped: Fn | undefined = arr.pop();
      expect(popped && popped(4)).assertEqual(12);
    });

    /**
     * @tc.name   testArrayPop0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0086
     * @tc.desc   Verify pop on array of sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const s1: Set<number> = new Set([1]);
      const s2: Set<number> = new Set([2]);
      const arr: Set<number>[] = [s1, s2];
      const popped: Set<number> | undefined = arr.pop();
      expect(popped?.has(2)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0087
     * @tc.desc   Verify pop on array after push undefined explicitly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1];
      arr.push(undefined);
      const popped: number | undefined | undefined = arr.pop();
      expect(popped === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0088
     * @tc.desc   Verify pop on array of Maps returns last Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const m1: Map<string, number> = new Map([['a', 1]]);
      const m2: Map<string, number> = new Map([['b', 2]]);
      const arr: Map<string, number>[] = [m1, m2];
      const popped: Map<string, number> | undefined = arr.pop();
      expect(popped?.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0089
     * @tc.desc   Verify pop on array after push empty object matches interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { name?: string }

      const arr: Obj[] = [{ name: 'x' }, {}, {}];
      const popped: Obj | undefined = arr.pop();
      expect(popped?.name === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0090
     * @tc.desc   Verify pop on array of nested tuples returns correct last
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, number][] = [[1, 2], [3, 4]];
      const popped: [number, number] | undefined = arr.pop();
      expect(popped).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArrayPop0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0091
     * @tc.desc   Verify pop on array of objects after map transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { x: number; }

      let arr: Obj[] = [{ x: 1 }, { x: 2 }];
      arr = arr.map(o => ({ x: o.x * 2 } as Obj));
      const popped: Obj | undefined = arr.pop();
      expect(popped?.x).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0092
     * @tc.desc   Verify pop on array of booleans after fill and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: boolean[] = [false, false, false];
      arr.fill(true);
      arr = arr.slice(0, 2);
      const popped: boolean | undefined = arr.pop();
      expect(popped).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0093
     * @tc.desc   Verify pop on array of numbers after reverse and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.reverse();
      arr.push(4);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0094
     * @tc.desc   Verify pop on array of class instances after filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      let arr: C[] = [new C(1), new C(2)];
      arr = arr.filter(c => c.v > 0);
      const popped: C | undefined = arr.pop();
      expect(popped?.v).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0095
     * @tc.desc   Verify pop on array of strings after push multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b'];
      arr.push('c', 'd');
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('d');
    });

    /**
     * @tc.name   testArrayPop0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0096
     * @tc.desc   Verify pop on array of optional objects after splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: number; }

      const arr: Opt[] = [{ val: 1 }, {}, {}];
      arr.splice(1, 1);
      const popped: Opt | undefined = arr.pop();
      expect(popped?.val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0097
     * @tc.desc   Verify pop on array of nested arrays after flatMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = arr.flatMap(x => x.map(v => v * 2));
      flat.push(10);
      const popped: number | undefined = flat.pop();
      expect(popped).assertEqual(10);
    });

    /**
     * @tc.name   testArrayPop0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0098
     * @tc.desc   Verify pop on array of tuples after map modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: [number, string][] = [[1, 'a'], [2, 'b']];
      arr = arr.map(pair => {
        const n = pair[0];
        const s = pair[1];
        return [n * 2, s] as [number, string];
      });
      const popped: [number, string] | undefined = arr.pop();
      expect(popped).assertDeepEquals([4, 'b']);
    });

    /**
     * @tc.name   testArrayPop0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0099
     * @tc.desc   Verify pop on array of numbers after unshift and pop sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.unshift(0);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0100
     * @tc.desc   Verify pop on array of mixed number and string union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'a', 2];
      const popped: number | string | undefined = arr.pop();
      expect(popped).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0101
     * @tc.desc   Verify pop on array after slice and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr = arr.slice(0, 2);
      arr.push(5);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0102
     * @tc.desc   Verify pop on array of class instances with optional property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPop0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   class C { constructor(public val?:number){} }
    //   const arr:C[]=[new C(1),new C()];
    //   const popped:C|undefined=arr.pop();
    //   expect(popped?.val===undefined).assertEqual(true);
    // });

    /**
     * @tc.name   testArrayPop0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0103
     * @tc.desc   Verify pop on array of nested objects after JSON parse/stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { x: number; }

      const arr: Obj[] = [{ x: 1 }, { x: 2 }];
      const str: string = JSON.stringify(arr);
      const arr2: Obj[] = JSON.parse(str);
      const popped: Obj | undefined = arr2.pop();
      expect(popped?.x).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0104
     * @tc.desc   Verify pop on array of functions returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type F = () => string;
      const f1: F = () => 'x';
      const f2: F = () => 'y';
      const arr: F[] = [f1, f2];
      const popped: F | undefined = arr.pop();
      expect(popped && popped()).assertEqual('y');
    });

    /**
     * @tc.name   testArrayPop0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0105
     * @tc.desc   Verify pop on array of arrays after unshift and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[][] = [[1], [2]];
      arr.unshift([0]);
      arr.push([3]);
      const popped: number[] | undefined = arr.pop();
      expect(popped).assertDeepEquals([3]);
    });

    /**
     * @tc.name   testArrayPop0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0106
     * @tc.desc   Verify pop on array after reverse and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      arr = arr.slice(0, 3);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0107
     * @tc.desc   Verify pop on array of nested tuples after map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: [number, string][] = [[1, 'a'], [2, 'b']];
      arr = arr.map(pair => {
        const n = pair[0];
        const s = pair[1];
        return [n + 1, s] as [number, string];
      });
      const popped: [number, string] | undefined = arr.pop();
      expect(popped).assertDeepEquals([3, 'b']);
    });

    /**
     * @tc.name   testArrayPop0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0108
     * @tc.desc   Verify pop on array of numbers after multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.unshift(0);
      arr.push(4);
      arr.shift();
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0109
     * @tc.desc   Verify pop on array of optional strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: string }

      const arr: Opt[] = [{ val: 'x' }, {}, {}];
      const popped: Opt | undefined = arr.pop();
      expect(popped?.val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0110
     * @tc.desc   Verify pop on array of nested arrays with push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2], [3]];
      arr.push([4]);
      const popped: number[] | undefined = arr.pop();
      expect(popped).assertDeepEquals([4]);
    });

    /**
     * @tc.name   testArrayPop0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0111
     * @tc.desc   Verify pop on array of numbers after fill and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [0, 0, 0, 0];
      arr.fill(5, 1, 3);
      arr = arr.slice(0, 3);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPop0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0112
     * @tc.desc   Verify pop on array of optional numbers after push undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: number }

      const arr: Opt[] = [{ val: 1 }];
      arr.push({});
      const popped: Opt | undefined = arr.pop();
      expect(popped!.val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0113
     * @tc.desc   Verify pop on array of tuples after push and map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: [number, string][] = [[1, 'a']];
      arr.push([2, 'b']);
      arr = arr.map(pair => {
        const n = pair[0];
        const s = pair[1];
        return [n + 1, s] as [number, string];
      });
      const popped: [number, string] | undefined = arr.pop();
      expect(popped).assertDeepEquals([3, 'b']);
    });

    /**
     * @tc.name   testArrayPop0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0114
     * @tc.desc   Verify pop on array of boolean values after filter false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: boolean[] = [true, false, true];
      arr = arr.filter(x => x);
      const popped: boolean | undefined = arr.pop();
      expect(popped).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0115
     * @tc.desc   Verify pop on array of class instances after sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(5), new C(3), new C(7)];
      arr.sort((a, b) => (a.v - b.v));
      const popped: C | undefined = arr.pop();
      expect(popped?.v).assertEqual(7);
    });

    /**
     * @tc.name   testArrayPop0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0116
     * @tc.desc   Verify pop on array of strings after concat and pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: string[] = ['a', 'b'];
      arr = arr.concat(['c', 'd']);
      const popped: string | undefined = arr.pop();
      expect(popped).assertEqual('d');
    });

    /**
     * @tc.name   testArrayPop0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0117
     * @tc.desc   Verify pop on array of nested objects with optional props
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val?: string }

      const arr: Obj[] = [{ val: 'x' }, {}, {}];
      const popped: Obj | undefined = arr.pop();
      expect(popped?.val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0118
     * @tc.desc   Verify pop on array of arrays after flatMap modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = arr.flatMap(a => {
        const result: number[] = [];
        for (let i = 0; i < a.length; i++) {
          result.push(a[i] + 1);
        }
        return result;
      });
      flat.push(10);
      const popped: number | undefined = flat.pop();
      expect(popped).assertEqual(10);
    });

    /**
     * @tc.name   testArrayPop0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0119
     * @tc.desc   Verify pop on array of unique symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPop0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const s1:unique symbol=Symbol('s1');
    //   const s2:unique symbol=Symbol('s2');
    //   const arr:symbol[]=[s1,s2];
    //   const popped:symbol|undefined=arr.pop();
    //   expect(typeof popped==='symbol').assertEqual(true);
    // });

    /**
     * @tc.name   testArrayPop0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0120
     * @tc.desc   Verify pop on array of RegExp after push new pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: RegExp[] = [/a/, /b/];
      arr.push(/c/);
      const popped: RegExp | undefined = arr.pop();
      expect(popped?.test('c')).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0121
     * @tc.desc   Verify pop on array of functions returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (x: number) => number;
      const f1: Fn = (x: number) => {
        return x + 1;
      };
      const f2: Fn = (x: number) => {
        return x * 2;
      };
      const arr: Fn[] = [f1, f2];
      const popped: Fn | undefined = arr.pop();
      expect(popped && popped(3)).assertEqual(6);
    });

    /**
     * @tc.name   testArrayPop0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0122
     * @tc.desc   Verify pop on array of class instances after push optional property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val?: number;

        constructor(val?: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1)];
      arr.push(new C());
      const popped: C | undefined = arr.pop();
      expect(popped?.val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0123
     * @tc.desc   Verify pop on array of Maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const m1: Map<string, number> = new Map([['a', 1]]);
      const m2: Map<string, number> = new Map([['b', 2]]);
      const arr: Map<string, number>[] = [m1, m2];
      const popped: Map<string, number> | undefined = arr.pop();
      expect(popped?.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0124
     * @tc.desc   Verify pop on array of Sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const s1: Set<number> = new Set([1]);
      const s2: Set<number> = new Set([2]);
      const arr: Set<number>[] = [s1, s2];
      const popped: Set<number> | undefined = arr.pop();
      expect(popped?.has(2)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPop0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0125
     * @tc.desc   Verify pop on array after multiple push and unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.unshift(0);
      arr.push(3, 4);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPop0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0126
     * @tc.desc   Verify pop on array of nested arrays with push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2], [3]];
      arr.push([4, 5]);
      const popped: number[] | undefined = arr.pop();
      expect(popped).assertDeepEquals([4, 5]);
    });

    /**
     * @tc.name   testArrayPop0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0127
     * @tc.desc   Verify pop on array of numbers after filter and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr = arr.filter(n => n % 2 === 0);
      arr.push(10);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(10);
    });

    /**
     * @tc.name   testArrayPop0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0128
     * @tc.desc   Verify pop on array of objects with nested properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Inner { x: number };

      interface Obj { data: Inner };
      const arr: Obj[] = [{ data: { x: 1 } }, { data: { x: 2 } }];
      const popped: Obj | undefined = arr.pop();
      expect(popped?.data.x).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPop0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0129
     * @tc.desc   Verify pop on array after push nested tuples
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][][] = [[[1, 'a']], [[2, 'b']]];
      arr.push([[3, 'c']]);
      const popped: [number, string][] | undefined = arr.pop();
      expect(popped).assertDeepEquals([[3, 'c']]);
    });

    /**
     * @tc.name   testArrayPop0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Pop_0130
     * @tc.desc   Verify pop on array of numbers after fill, reverse, and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [0, 0, 0];
      arr.fill(2);
      arr.reverse();
      arr.push(5);
      const popped: number | undefined = arr.pop();
      expect(popped).assertEqual(5);
    });

  });
}