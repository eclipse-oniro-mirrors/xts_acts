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

export default function ArraySliceTest() {
  describe('ArraySliceTest', () => {
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
     * @tc.name   testArraySlice001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_001
     * @tc.desc   Verify slice() returns a shallow copy of the original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 3]);
      expect(sliced === arr).assertEqual(false);
    });

    /**
     * @tc.name   testArraySlice002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_002
     * @tc.desc   Verify slice(start) returns array from start index to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(2);
      expect(sliced).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArraySlice003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_003
     * @tc.desc   Verify slice(start, end) returns array from start to end-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_004
     * @tc.desc   Verify slice(start, end) returns empty array when start > end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(3, 2);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_005
     * @tc.desc   Verify slice() on empty array returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_006
     * @tc.desc   Verify slice(start) with negative index counts from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(-2);
      expect(sliced).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArraySlice007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_007
     * @tc.desc   Verify slice(start, end) with negative indices counts from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(-4, -1);
      expect(sliced).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySlice008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_008
     * @tc.desc   Verify slice(start) with start index beyond array length returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(10);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_009
     * @tc.desc   Verify slice() returns shallow copy for nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number }

      const arr: Obj[] = [{ val: 1 }, { val: 2 }];
      const sliced: Obj[] = arr.slice();
      expect(sliced).assertDeepEquals([{ val: 1 }, { val: 2 }]);
      expect(sliced[0]).assertEqual(arr[0]); // shallow copy test
    });

    /**
     * @tc.name   testArraySlice010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_010
     * @tc.desc   Verify slice() on array of strings returns correct subarray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySlice011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_011
     * @tc.desc   Verify slice() on array of boolean values returns correct subarray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const sliced: boolean[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   testArraySlice012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_012
     * @tc.desc   Verify slice() returns shallow copy for array of functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (x: number) => number;
      const f1: Fn = x => x + 1;
      const f2: Fn = x => x * 2;
      const arr: Fn[] = [f1, f2];
      const sliced: Fn[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[0](3)).assertEqual(4);
    });

    /**
     * @tc.name   testArraySlice013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_013
     * @tc.desc   Verify slice() on array of objects returns shallow copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number }

      const arr: Obj[] = [{ val: 1 }, { val: 2 }];
      const sliced: Obj[] = arr.slice();
      sliced[0].val = 100;
      expect(arr[0].val).assertEqual(100);
    });

    /**
     * @tc.name   testArraySlice014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_014
     * @tc.desc   Verify slice() on nested arrays returns shallow copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice();
      sliced[0][0] = 10;
      expect(arr[0][0]).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_015
     * @tc.desc   Verify slice() with end index larger than array length returns up to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(1, 10);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_016
     * @tc.desc   Verify slice() on array after push and pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySlice017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_017
     * @tc.desc   Verify slice() on array of strings with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(-3, -1);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySlice018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_018
     * @tc.desc   Verify slice() on array of class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const sliced: C[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_019
     * @tc.desc   Verify slice() on array of Maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const m1: Map<string, number> = new Map([['a', 1]]);
      const m2: Map<string, number> = new Map([['b', 2]]);
      const arr: Map<string, number>[] = [m1, m2];
      const sliced: Map<string, number>[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].get('a')).assertEqual(1);
    });

    /**
     * @tc.name   testArraySlice020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_020
     * @tc.desc   Verify slice() on array of Sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const s1: Set<number> = new Set([1]);
      const s2: Set<number> = new Set([2]);
      const arr: Set<number>[] = [s1, s2];
      const sliced: Set<number>[] = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].has(1)).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_021
     * @tc.desc   Verify slice() on array of optional numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: number }

      const arr: Opt[] = [{ val: 1 }, {}, { val: 3 }];
      const sliced: Opt[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_022
     * @tc.desc   Verify slice() on array after fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0, 0];
      arr.fill(5, 1, 3);
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([5, 5]);
    });

    /**
     * @tc.name   testArraySlice023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_023
     * @tc.desc   Verify slice() on array after reverse method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([3, 2]);
    });

    /**
     * @tc.name   testArraySlice024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_024
     * @tc.desc   Verify slice() on nested tuples
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b'], [3, 'c']];
      const sliced: [number, string][] = arr.slice(1);
      expect(sliced).assertDeepEquals([[2, 'b'], [3, 'c']]);
    });

    /**
     * @tc.name   testArraySlice025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_025
     * @tc.desc   Verify slice() on array after concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const arr: number[] = arr1.concat(arr2);
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_026
     * @tc.desc   Verify slice() returns shallow copy for array after map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const mapped: number[] = arr.map(n => n * 2);
      const sliced: number[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.name   testArraySlice027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_027
     * @tc.desc   Verify slice() on array after sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 1, 4, 2];
      arr.sort((a, b) => (a - b));
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_028
     * @tc.desc   Verify slice() on array of nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Inner { x: number };

      interface Obj { data: Inner };
      const arr: Obj[] = [{ data: { x: 1 } }, { data: { x: 2 } }];
      const sliced: Obj[] = arr.slice(0, 1);
      expect(sliced[0].data.x).assertEqual(1);
    });

    /**
     * @tc.name   testArraySlice029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_029
     * @tc.desc   Verify slice() returns shallow copy on array of mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, 'a', true];
      const sliced: (number | string | boolean)[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([1, 'a']);
    });

    /**
     * @tc.name   testArraySlice030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_030
     * @tc.desc   Verify slice() on array after multiple operations push/pop/shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.pop();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_031
     * @tc.desc   Verify slice() on array after unshift elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      const sliced: number[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySlice032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_032
     * @tc.desc   Verify slice() on array after push multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      arr.push(2, 3, 4);
      const sliced: number[] = arr.slice(1, 4);
      expect(sliced).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySlice033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_033
     * @tc.desc   Verify slice() on array of optional objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: number }

      const arr: Opt[] = [{ val: 1 }, {}, { val: 3 }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_034
     * @tc.desc   Verify slice() on array after pop and shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_035
     * @tc.desc   Verify slice() on array of nested tuples
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b'], [3, 'c']];
      const sliced: [number, string][] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([[2, 'b'], [3, 'c']]);
    });

    /**
     * @tc.name   testArraySlice036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_036
     * @tc.desc   Verify slice() returns empty array when start equals end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(2, 2);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_037
     * @tc.desc   Verify slice() on array after fill with objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number }

      const arr: Obj[] = [{ val: 0 }, { val: 0 }, { val: 0 }];
      arr.fill({ val: 5 }, 1, 3);
      const sliced: Obj[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([{ val: 5 }, { val: 5 }]);
    });

    /**
     * @tc.name   testArraySlice038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_038
     * @tc.desc   Verify slice() on array of functions returns shallow copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (x: number) => number;
      const f1: Fn = x => x + 1;
      const f2: Fn = x => x * 2;
      const arr: Fn[] = [f1, f2];
      const sliced: Fn[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1](3)).assertEqual(6);
    });

    /**
     * @tc.name   testArraySlice039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_039
     * @tc.desc   Verify slice() on array of class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const sliced: C[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_040
     * @tc.desc   Verify slice() on array after reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([3, 2]);
    });

    /**
     * @tc.name   testArraySlice041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_041
     * @tc.desc   Verify slice() on array of nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([[3, 4], [5, 6]]);
    });

    /**
     * @tc.name   testArraySlice042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_042
     * @tc.desc   Verify slice() on array after multiple push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      arr.push(2, 3, 4);
      const sliced: number[] = arr.slice(2);
      expect(sliced).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArraySlice043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_043
     * @tc.desc   Verify slice() on array of strings with negative end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(1, -1);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySlice044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_044
     * @tc.desc   Verify slice() returns empty array on empty original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_045
     * @tc.desc   Verify slice() on array after fill and reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [0, 0, 0];
      arr.fill(5);
      arr.reverse();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([5, 5, 5]);
    });

    /**
     * @tc.name   testArraySlice046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_046
     * @tc.desc   Verify slice() on array of mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, 'a', true, false];
      const sliced: (number | string | boolean)[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['a', true]);
    });

    /**
     * @tc.name   testArraySlice047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_047
     * @tc.desc   Verify slice() on array of optional booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: boolean }

      const arr: Opt[] = [{ val: true }, {}, {}];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_048
     * @tc.desc   Verify slice() on array after concat and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      let arr: number[] = arr1.concat(arr2);
      arr.push(5);
      const sliced: number[] = arr.slice(2, 5);
      expect(sliced).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   testArraySlice049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_049
     * @tc.desc   Verify slice() on array after map returns correct subarray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.map(n => n * 2);
      const sliced: number[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.name   testArraySlice051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_051
     * @tc.desc   Verify slice() on array of optional strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: string }

      const arr: Opt[] = [{ val: 'a' }, {}, { val: 'c' }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_052
     * @tc.desc   Verify slice() on array after multiple fill operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0, 0, 0];
      arr.fill(1, 1, 3);
      arr.fill(2, 3, 5);
      const sliced: number[] = arr.slice(1, 5);
      expect(sliced).assertDeepEquals([1, 1, 2, 2]);
    });

    /**
     * @tc.name   testArraySlice053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_053
     * @tc.desc   Verify slice() on array of objects with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { vals: number[] }

      const arr: Obj[] = [{ vals: [1, 2] }, { vals: [3, 4] }];
      const sliced: Obj[] = arr.slice(1);
      sliced[0].vals[0] = 100;
      expect(arr[1].vals[0]).assertEqual(100);
    });

    /**
     * @tc.name   testArraySlice054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_054
     * @tc.desc   Verify slice() on array of class instances after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const sliced: C[] = arr.slice(0, 2);
      sliced[0].val = 10;
      expect(arr[0].val).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_055
     * @tc.desc   Verify slice() returns empty array when start index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(10);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_056
     * @tc.desc   Verify slice() with negative start beyond array length returns full array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-10);
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_057
     * @tc.desc   Verify slice() on array after map with object transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number }

      const arr: number[] = [1, 2, 3];
      const mapped: Obj[] = arr.map(n => ({ val: n * 10 } as Obj));
      const sliced: Obj[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([{ val: 20 }, { val: 30 }]);
    });

    /**
     * @tc.name   testArraySlice058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_058
     * @tc.desc   Verify slice() on array of functions with multiple args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (x: number, y: number) => number;
      const f1: Fn = (x, y) => x + y;
      const f2: Fn = (x, y) => x * y;
      const arr: Fn[] = [f1, f2];
      const sliced: Fn[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1](2, 3)).assertEqual(6);
    });

    /**
     * @tc.name   testArraySlice059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_059
     * @tc.desc   Verify slice() on array of nested optional objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Inner { n: number }

      interface Opt { val?: Inner }

      const arr: Opt[] = [{ val: { n: 1 } }, {}, { val: { n: 3 } }];
      const sliced: Opt[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_060
     * @tc.desc   Verify slice() on array after sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 1, 4, 2];
      arr.sort((a, b) => (a - b));
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_061
     * @tc.desc   Verify slice() on array of booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const sliced: boolean[] = arr.slice(1);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   testArraySlice062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_062
     * @tc.desc   Verify slice() on array of strings with start > end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const sliced: string[] = arr.slice(2, 1);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_063
     * @tc.desc   Verify slice() returns shallow copy for nested array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice();
      sliced[0][0] = 100;
      expect(arr[0][0]).assertEqual(100);
    });

    /**
     * @tc.name   testArraySlice064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_064
     * @tc.desc   Verify slice() on array after push, pop, shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.push(5);
      arr.pop();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySlice065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_065
     * @tc.desc   Verify slice() on array of Maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const m1: Map<string, number> = new Map([['a', 1]]);
      const m2: Map<string, number> = new Map([['b', 2]]);
      const arr: Map<string, number>[] = [m1, m2];
      const sliced: Map<string, number>[] = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].get('a')).assertEqual(1);
    });

    /**
     * @tc.name   testArraySlice066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_066
     * @tc.desc   Verify slice() on array of Sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const s1: Set<number> = new Set([1, 2]);
      const s2: Set<number> = new Set([3, 4]);
      const arr: Set<number>[] = [s1, s2];
      const sliced: Set<number>[] = arr.slice(1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].has(3)).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_067
     * @tc.desc   Verify slice() on array of optional class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val?: number
      }

      const arr: C[] = [new C(), new C()];
      const sliced: C[] = arr.slice();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_068
     * @tc.desc   Verify slice() on array after repeated slice calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced1: number[] = arr.slice(1, 3);
      const sliced2: number[] = sliced1.slice(0, 1);
      expect(sliced2).assertDeepEquals([2]);
    });

    /**
     * @tc.name   testArraySlice069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_069
     * @tc.desc   Verify slice() on array of mixed optional types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number | string }

      const arr: Opt[] = [{ n: 1 }, {}, { n: 'a' }];
      const sliced: Opt[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    // 问题？
    /**
     * @tc.name   testArraySlice070
     * @tc.number testArraySlice070
     * @tc.desc   testArraySlice070
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const arr1:number[]=[1,2];
    //   const arr2:string[]=['a','b'];
    //   const arr:(number|string)[]=arr1.concat(arr2);
    //   const sliced:(number|string)[]=arr.slice(1,3);
    //   expect(sliced).assertDeepEquals([2,'a']);
    // });

    /**
     * @tc.name   testArraySlice071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_071
     * @tc.desc   Verify slice() on array after repeated push and pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      arr.pop();
      const sliced: number[] = arr.slice(1, 4);
      expect(sliced).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySlice072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_072
     * @tc.desc   Verify slice() on array of nested optional arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { vals?: number[] }

      const arr: Opt[] = [{ vals: [1, 2] }, {}, { vals: [5, 6] }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].vals === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_073
     * @tc.desc   Verify slice() returns shallow copy of nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { a: number };
      const arr: Obj[] = [{ a: 1 }, { a: 2 }];
      const sliced: Obj[] = arr.slice();
      sliced[0].a = 10;
      expect(arr[0].a).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_074
     * @tc.desc   Verify slice() on array of functions with default parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (x?: number) => number;
      const f1: Fn = (x = 0) => x + 1;
      const f2: Fn = (x = 0) => x * 2;
      const arr: Fn[] = [f1, f2];
      const sliced: Fn[] = arr.slice(1);
      expect(sliced[0]()).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_075
     * @tc.desc   Verify slice() with negative end index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(1, -10);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_076
     * @tc.desc   Verify slice() on array after multiple slice calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced1: number[] = arr.slice(1, 4);
      const sliced2: number[] = sliced1.slice(1, 2);
      expect(sliced2).assertDeepEquals([3]);
    });

    /**
     * @tc.name   testArraySlice077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_077
     * @tc.desc   Verify slice() on array of class instances with optional fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val?: number
      }

      const arr: C[] = [new C(), new C()];
      const sliced: C[] = arr.slice();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_078
     * @tc.desc   Verify slice() on array of nested arrays after modifying nested elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(0, 1);
      sliced[0][0] = 10;
      expect(arr[0][0]).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_079
     * @tc.desc   Verify slice() on array after sort with custom comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 3, 4, 1];
      arr.sort((a, b) => (b - a));
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([4, 3]);
    });

    /**
     * @tc.name   testArraySlice080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_080
     * @tc.desc   Verify slice() on array of boolean values with negative start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true, false];
      const sliced: boolean[] = arr.slice(-3, -1);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   testArraySlice081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_081
     * @tc.desc   Verify slice() on array of strings after unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['b', 'c'];
      arr.unshift('a');
      const sliced: string[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   testArraySlice082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_082
     * @tc.desc   Verify slice() on array after concat with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const arr: number[][] = [arr1, arr2];
      const sliced: number[][] = arr.slice(0, 1);
      expect(sliced).assertDeepEquals([[1, 2]]);
    });

    /**
     * @tc.name   testArraySlice083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_083
     * @tc.desc   Verify slice() on array of optional function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = (x: number) => number;

      interface Opt { fn?: Fn }

      const arr: Opt[] = [{ fn: x => x + 1 }, {}, { fn: x => x * 2 }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_084
     * @tc.desc   Verify slice() on array after multiple shift operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.shift();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArraySlice085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_085
     * @tc.desc   Verify slice() on array of objects with nested optional fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Inner { n: number };

      interface Obj { a?: Inner };
      const arr: Obj[] = [{ a: { n: 1 } }, {}, { a: { n: 3 } }];
      const sliced: Obj[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].a === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_086
     * @tc.desc   Verify slice() on array of numbers after repeated push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3, 4, 5);
      const sliced: number[] = arr.slice(2);
      expect(sliced).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   testArraySlice087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_087
     * @tc.desc   Verify slice() on array of class instances with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        getVal() {
          return this.val;
        }

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const sliced: C[] = arr.slice();
      expect(sliced[0].getVal()).assertEqual(1);
    });

    /**
     * @tc.name   testArraySlice088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_088
     * @tc.desc   Verify slice() on array of numbers after pop and unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.pop();
      arr.unshift(0);
      const sliced: number[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([0, 1]);
    });

    /**
     * @tc.name   testArraySlice089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_089
     * @tc.desc   Verify slice() on array of nested arrays after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(1);
      sliced[0][1] = 100;
      expect(arr[1][1]).assertEqual(100);
    });

    /**
     * @tc.name   testArraySlice091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_091
     * @tc.desc   Verify slice() on array of strings with negative start and positive end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(-3, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySlice092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_092
     * @tc.desc   Verify slice() on array of boolean values after reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.reverse();
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArraySlice093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_093
     * @tc.desc   Verify slice() on array of numbers after fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(1, 1, 3);
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([0, 1, 1]);
    });

    /**
     * @tc.name   testArraySlice094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_094
     * @tc.desc   Verify slice() on array of optional objects with nested fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Inner { n: number };

      interface Opt { val?: Inner };
      const arr: Opt[] = [{ val: { n: 1 } }, {}, { val: { n: 3 } }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_095
     * @tc.desc   Verify slice() on array of functions with closure state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Fn = () => number;
      let state = 1;
      const f1: Fn = () => state + 1;
      const f2: Fn = () => state * 2;
      const arr: Fn[] = [f1, f2];
      const sliced: Fn[] = arr.slice(0, 1);
      state = 5;
      expect(sliced[0]()).assertEqual(6);
    });

    /**
     * @tc.name   testArraySlice096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_096
     * @tc.desc   Verify slice() on array of numbers after splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2);
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 4]);
    });

    /**
     * @tc.name   testArraySlice097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_097
     * @tc.desc   Verify slice() on array of class instances after property modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const sliced: C[] = arr.slice();
      sliced[1].val = 20;
      expect(arr[1].val).assertEqual(20);
    });

    /**
     * @tc.name   testArraySlice098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_098
     * @tc.desc   Verify slice() on array after concat with optional objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr1: Opt[] = [{ n: 1 }];
      const arr2: Opt[] = [{}];
      const arr: Opt[] = arr1.concat(arr2);
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_099
     * @tc.desc   Verify slice() on array of nested arrays with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(-2, -1);
      expect(sliced).assertDeepEquals([[3, 4]]);
    });

    /**
     * @tc.name   testArraySlice100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_100
     * @tc.desc   Verify slice() on array of numbers with start equals end returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(2, 2);
      expect(sliced).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySlice101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_101
     * @tc.desc   Verify slice() on array of optional numbers with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{ n: 1 }, {}, { n: 3 }];
      const sliced: Opt[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_102
     * @tc.desc   Verify slice() on array after push and shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySlice103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_103
     * @tc.desc   Verify slice() on array of strings after reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      arr.reverse();
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['c', 'b']);
    });

    /**
     * @tc.name   testArraySlice104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_104
     * @tc.desc   Verify slice() on array of booleans after fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, false];
      arr.fill(true, 1, 3);
      const sliced: boolean[] = arr.slice();
      expect(sliced).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   testArraySlice105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_105
     * @tc.desc   Verify slice() on array of nested arrays after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice();
      sliced[1][0] = 10;
      expect(arr[1][0]).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_106
     * @tc.desc   Verify slice() on array of class instances with method modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(v: number) {
          this.val = v;
        }

        inc() {
          this.val++;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const sliced: C[] = arr.slice();
      sliced[0].inc();
      expect(arr[0].val).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_107
     * @tc.desc   Verify slice() on array of optional functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { fn?: (x: number) => number }

      const arr: Opt[] = [{ fn: x => x + 1 }, {}, { fn: x => x * 2 }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_108
     * @tc.desc   Verify slice() on array after splice with optional elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { val?: number }

      const arr: Opt[] = [{ val: 1 }, { val: 2 }, { val: 3 }];
      arr.splice(1, 1);
      const sliced: Opt[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val).assertEqual(3);
    });

    /**
     * @tc.name   testArraySlice109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_109
     * @tc.desc   Verify slice() on array of nested optional arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { vals?: number[] }

      const arr: Opt[] = [{ vals: [1, 2] }, {}, { vals: [5, 6] }];
      const sliced: Opt[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].vals === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_110
     * @tc.desc   Verify slice() on array of numbers after unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.unshift(1);
      const sliced: number[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySlice111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_111
     * @tc.desc   Verify slice() on array of strings after concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: string[] = ['a', 'b'];
      const arr2: string[] = ['c', 'd'];
      const arr: string[] = arr1.concat(arr2);
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySlice112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_112
     * @tc.desc   Verify slice() on array of booleans after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.pop();
      const sliced: boolean[] = arr.slice();
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArraySlice113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_113
     * @tc.desc   Verify slice() on array after reverse and slice with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      const sliced: number[] = arr.slice(-3, -1);
      expect(sliced).assertDeepEquals([3, 2]);
    });

    /**
     * @tc.name   testArraySlice114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_114
     * @tc.desc   Verify slice() on array of optional numbers with start greater than length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{ n: 1 }, { n: 2 }];
      const sliced: Opt[] = arr.slice(5);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_115
     * @tc.desc   Verify slice() on array after multiple pop and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.pop();
      arr.push(4, 5);
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   testArraySlice116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_116
     * @tc.desc   Verify slice() on array of class instances after push and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: C[] = [new C(1)];
      arr.push(new C(2));
      const sliced: C[] = arr.slice();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_117
     * @tc.desc   Verify slice() on array of nested arrays after push and pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      arr.push([5, 6]);
      arr.pop();
      const sliced: number[][] = arr.slice();
      expect(sliced).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.name   testArraySlice118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_118
     * @tc.desc   Verify slice() on array after fill and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(5, 1, 3);
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([0, 5, 5]);
    });

    /**
     * @tc.name   testArraySlice119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_119
     * @tc.desc   Verify slice() on array of optional functions with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { fn?: () => number }

      const arr: Opt[] = [{ fn: () => 1 }, {}, { fn: () => 3 }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_120
     * @tc.desc   Verify slice() on array of numbers with start < 0 and end > length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(-3, 10);
      expect(sliced).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   testArraySlice121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_121
     * @tc.desc   Verify slice() on array of strings with start > end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const sliced: string[] = arr.slice(2, 1);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_122
     * @tc.desc   Verify slice() on array of numbers with start negative and end zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-2, 0);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_123
     * @tc.desc   Verify slice() on array of class instances with method call in slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(v: number) {
          this.val = v;
        }

        inc() {
          this.val++;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const sliced: C[] = arr.slice();
      sliced[0].inc();
      expect(arr[0].val).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_124
     * @tc.desc   Verify slice() on array of optional numbers with all undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{}, {}, {}];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_125
     * @tc.desc   Verify slice() on array of numbers after push and pop sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.pop();
      arr.push(4);
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 4]);
    });

    /**
     * @tc.name   testArraySlice126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_126
     * @tc.desc   Verify slice() on array of nested arrays with slice start > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([[3, 4], [5, 6]]);
    });

    /**
     * @tc.name   testArraySlice127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_127
     * @tc.desc   Verify slice() on array after fill and slice with negative start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(5, 1, 3);
      const sliced: number[] = arr.slice(-2);
      expect(sliced).assertDeepEquals([5, 5]);
    });

    /**
     * @tc.name   testArraySlice128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_128
     * @tc.desc   Verify slice() on array of strings after map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map(s => s + s);
      const sliced: string[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals(['bb', 'cc']);
    });

    /**
     * @tc.name   testArraySlice129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_129
     * @tc.desc   Verify slice() on array after reverse, push and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.reverse();
      arr.push(4);
      const sliced: number[] = arr.slice(1, 4);
      expect(sliced).assertDeepEquals([2, 1, 4]);
    });

    /**
     * @tc.name   testArraySlice130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_130
     * @tc.desc   Verify slice() on array of optional objects after concat and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr1: Opt[] = [{ n: 1 }];
      const arr2: Opt[] = [{}];
      const arr: Opt[] = arr1.concat(arr2);
      const sliced: Opt[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].n === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_131
     * @tc.desc   Verify slice() on array of booleans after unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false];
      arr.unshift(true);
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testArraySlice132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_132
     * @tc.desc   Verify slice() on array of numbers after multiple fill and pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(2, 0, 2);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   testArraySlice133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_133
     * @tc.desc   Verify slice() on array of class instances with multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const sliced: C[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_134
     * @tc.desc   Verify slice() on array of optional arrays with nested slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { vals?: number[] }

      const arr: Opt[] = [{ vals: [1, 2] }, { vals: [3, 4] }, { vals: [5, 6] }];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced[0].vals).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySlice135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_135
     * @tc.desc   Verify slice() on array of numbers with start negative beyond length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-5);
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_136
     * @tc.desc   Verify slice() on array after push and slice with end exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.push(3);
      const sliced: number[] = arr.slice(0, 5);
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_137
     * @tc.desc   Verify slice() on array of optional functions with closures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { fn?: (x: number) => number }

      let state = 1;
      const arr: Opt[] = [{ fn: x => x + state }, { fn: x => x * state }];
      state = 5;
      const sliced: Opt[] = arr.slice();
      expect(sliced[0].fn!(2)).assertEqual(7);
      expect(sliced[1].fn!(2)).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_138
     * @tc.desc   Verify slice() on array of nested arrays after reverse and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      arr.reverse();
      const sliced: number[][] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([[5, 6], [3, 4]]);
    });

    /**
     * @tc.name   testArraySlice139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_139
     * @tc.desc   Verify slice() on array of numbers with start=0 and end=length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(0, arr.length);
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_140
     * @tc.desc   Verify slice() on array after multiple operations push, pop, reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.pop();
      arr.reverse();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([3, 2, 1]);
    });

    /**
     * @tc.name   testArraySlice141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_141
     * @tc.desc   Verify slice() on array of objects with optional properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{ n: 1 }, {}, { n: 3 }];
      const sliced: Opt[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_142
     * @tc.desc   Verify slice() on array of nested arrays with negative end exceeding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(1, -10);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_143
     * @tc.desc   Verify slice() on array of class instances after multiple modifications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const sliced: C[] = arr.slice(0, 2);
      sliced[0].val = 10;
      expect(arr[0].val).assertEqual(10);
    });

    /**
     * @tc.name   testArraySlice144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_144
     * @tc.desc   Verify slice() on array of optional numbers after reverse and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{ n: 1 }, {}, { n: 3 }];
      arr.reverse();
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n).assertEqual(3);
    });

    /**
     * @tc.name   testArraySlice145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_145
     * @tc.desc   Verify slice() on array of strings with map and slice combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map(s => s.toUpperCase());
      const sliced: string[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals(['B', 'C']);
    });

    /**
     * @tc.name   testArraySlice146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_146
     * @tc.desc   Verify slice() on array after push, pop and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_147
     * @tc.desc   Verify slice() on array of optional functions after push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { fn?: () => number }

      const arr: Opt[] = [{}];
      arr.push({ fn: () => 5 });
      const sliced: Opt[] = arr.slice();
      expect(sliced[1].fn!()).assertEqual(5);
    });

    /**
     * @tc.name   testArraySlice148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_148
     * @tc.desc   Verify slice() on array of nested arrays with start and end exceeding bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(-5, 10);
      expect(sliced).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.name   testArraySlice149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_149
     * @tc.desc   Verify slice() on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced: number[] = arr.slice();
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_150
     * @tc.desc   Verify slice() on array after multiple operations with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      arr.pop();
      arr.reverse();
      arr.push(6);
      const sliced: number[] = arr.slice(-3);
      expect(sliced).assertDeepEquals([2, 1, 6]);
    });

    /**
     * @tc.name   testArraySlice151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_151
     * @tc.desc   Verify slice() on array of nested objects with optional fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Item {
        id: number,
        name?: string
      }

      const arr: Item[] = [{ id: 1 }, { id: 2, name: 'B' }, { id: 3 }];
      const sliced: Item[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].name).assertEqual('B');
    });

    /**
     * @tc.name   testArraySlice152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_152
     * @tc.desc   Verify slice() on array after fill, reverse, and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, 3);
      arr.reverse();
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.name   testArraySlice153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_153
     * @tc.desc   Verify slice() on array of class instances with method calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }

        inc() {
          this.v++
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const sliced: C[] = arr.slice();
      sliced[0].inc();
      expect(arr[0].v).assertEqual(2);
    });

    /**
     * @tc.name   testArraySlice154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_154
     * @tc.desc   Verify slice() on array after pop and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySlice155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_155
     * @tc.desc   Verify slice() on array after unshift and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      const sliced: number[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySlice156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_156
     * @tc.desc   Verify slice() on array of arrays after flatMap and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = arr.flatMap(x => x);
      const sliced: number[] = flat.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_157
     * @tc.desc   Verify slice() on array of strings after map and reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map(s => s + s).reverse();
      const sliced: string[] = mapped.slice(0, 2);
      expect(sliced).assertDeepEquals(['cc', 'bb']);
    });

    /**
     * @tc.name   testArraySlice158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_158
     * @tc.desc   Verify slice() on array after multiple push and pop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.push(3, 4);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_159
     * @tc.desc   Verify slice() on array of boolean values with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const sliced: boolean[] = arr.slice(-2);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   testArraySlice160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_160
     * @tc.desc   Verify slice() on array of optional objects with some undefined fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { x?: number }

      const arr: Opt[] = [{ x: 1 }, {}, {}];
      const sliced: Opt[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].x === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_161
     * @tc.desc   Verify slice() on array of nested arrays after multiple reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      arr.reverse();
      arr.reverse();
      const sliced: number[][] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([[3, 4], [5, 6]]);
    });

    /**
     * @tc.name   testArraySlice162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_162
     * @tc.desc   Verify slice() on array of class instances with optional property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public val: number | undefined;

        constructor(val?: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1), new C(), new C(3)];
      const sliced: C[] = arr.slice(0, 2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_163
     * @tc.desc   Verify slice() on array after fill and slice with end exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(5);
      const sliced: number[] = arr.slice(0, 10);
      expect(sliced).assertDeepEquals([5, 5, 5]);
    });

    /**
     * @tc.name   testArraySlice164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_164
     * @tc.desc   Verify slice() on array of strings after concat and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: string[] = ['a', 'b'];
      const arr2: string[] = ['c', 'd'];
      const arr: string[] = arr1.concat(arr2);
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySlice165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_165
     * @tc.desc   Verify slice() on array of numbers with negative start exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-10);
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_166
     * @tc.desc   Verify slice() on array of optional functions with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { fn?: () => number }

      const arr: Opt[] = [{ fn: () => 1 }, {}, {}];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_167
     * @tc.desc   Verify slice() on array after multiple reverse and push operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.reverse();
      arr.push(4);
      const sliced: number[] = arr.slice(-2);
      expect(sliced).assertDeepEquals([1, 4]);
    });

    /**
     * @tc.name   testArraySlice168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_168
     * @tc.desc   Verify slice() on array of numbers after map and slice with negative end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.map(x => x * 2);
      const sliced: number[] = mapped.slice(1, -1);
      expect(sliced).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.name   testArraySlice169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_169
     * @tc.desc   Verify slice() on array of nested arrays with slice start beyond length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(5);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_170
     * @tc.desc   Verify slice() on array after fill, reverse and multiple slice calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(7, 1, 3);
      arr.reverse();
      const sliced1: number[] = arr.slice(0, 2);
      const sliced2: number[] = arr.slice(2);
      expect(sliced1).assertDeepEquals([4, 7]);
      expect(sliced2).assertDeepEquals([7, 1]);
    });

    /**
     * @tc.name   testArraySlice171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_171
     * @tc.desc   Verify slice() on empty array multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced1: number[] = arr.slice();
      const sliced2: number[] = arr.slice(0, 1);
      expect(sliced1.length).assertEqual(0);
      expect(sliced2.length).assertEqual(0);
    });

    /**
     * @tc.name   testArraySlice172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_172
     * @tc.desc   Verify slice() on array of booleans after pop and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.pop();
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArraySlice173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_173
     * @tc.desc   Verify slice() on array of strings after reverse, push and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: string[] = ['x', 'y'];
      arr.reverse();
      arr.push('z');
      const sliced: string[] = arr.slice(1);
      expect(sliced).assertDeepEquals(['x', 'z']);
    });

    /**
     * @tc.name   testArraySlice174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_174
     * @tc.desc   Verify slice() on array of optional objects after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{ n: 1 }, { n: 2 }];
      arr.pop();
      const sliced: Opt[] = arr.slice();
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].n).assertEqual(1);
    });

    /**
     * @tc.name   testArraySlice175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_175
     * @tc.desc   Verify slice() on array after map and reverse with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const mapped: number[][] = arr.map(a => a.map(x => x * 2)).reverse();
      const sliced: number[][] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([[6, 8], [2, 4]]);
    });

    /**
     * @tc.name   testArraySlice176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_176
     * @tc.desc   Verify slice() on array of optional functions with some undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { fn?: (x: number) => number }

      const arr: Opt[] = [{ fn: x => x + 1 }, {}, {}];
      const sliced: Opt[] = arr.slice(0, 2);
      expect(sliced[1].fn === undefined).assertEqual(true);
      expect(sliced[0].fn!(2)).assertEqual(3);
    });

    /**
     * @tc.name   testArraySlice177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_177
     * @tc.desc   Verify slice() on array after multiple push, pop, and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      arr.pop();
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_178
     * @tc.desc   Verify slice() on array of objects after map and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj {
        a: number;
        b: number
      }

      const arr: Obj[] = [{ a: 1, b: 2 }, { a: 3, b: 4 }, { a: 5, b: 6 }];
      const mapped: Obj[] = arr.map(o => ({ a: o.a * 2, b: o.b * 2 } as Obj));
      const sliced: Obj[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([{ a: 6, b: 8 }, { a: 10, b: 12 }]);
    });

    /**
     * @tc.name   testArraySlice179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_179
     * @tc.desc   Verify slice() on array after reverse and slice with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.reverse();
      const sliced: number[] = arr.slice(-4, -1);
      expect(sliced).assertDeepEquals([4, 3, 2]);
    });

    /**
     * @tc.name   testArraySlice180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_180
     * @tc.desc   Verify slice() on array of nested arrays after flatMap and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const flat: number[] = arr.flatMap(x => x.map(y => y * 2));
      const sliced: number[] = flat.slice(2, 6);
      expect(sliced).assertDeepEquals([6, 8, 10, 12]);
    });

    /**
     * @tc.name   testArraySlice181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_181
     * @tc.desc   Verify slice() on array after multiple pop and push operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr.push(5);
      arr.pop();
      arr.push(6);
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 3, 6]);
    });

    /**
     * @tc.name   testArraySlice182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_182
     * @tc.desc   Verify slice() on array of booleans after map and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const mapped: boolean[] = arr.map(b => !b);
      const sliced: boolean[] = mapped.slice(1);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArraySlice183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_183
     * @tc.desc   Verify slice() on array of strings after fill and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      arr.fill('x', 1, 3);
      const sliced: string[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals(['a', 'x']);
    });

    /**
     * @tc.name   testArraySlice184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_184
     * @tc.desc   Verify slice() on array of numbers after concat and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const combined: number[] = arr1.concat(arr2);
      const sliced: number[] = combined.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_185
     * @tc.desc   Verify slice() on array of objects after reverse and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { k: number }

      const arr: Obj[] = [{ k: 1 }, { k: 2 }, { k: 3 }];
      arr.reverse();
      const sliced: Obj[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([{ k: 3 }, { k: 2 }]);
    });

    /**
     * @tc.name   testArraySlice186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_186
     * @tc.desc   Verify slice() on array of optional numbers after pop and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt { n?: number }

      const arr: Opt[] = [{ n: 1 }, {}, {}];
      arr.pop();
      const sliced: Opt[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].n === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testArraySlice187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_187
     * @tc.desc   Verify slice() on array after multiple push, fill, and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      arr.fill(0, 1, 4);
      const sliced: number[] = arr.slice(1, 4);
      expect(sliced).assertDeepEquals([0, 0, 0]);
    });

    /**
     * @tc.name   testArraySlice188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_188
     * @tc.desc   Verify slice() on array after map, pop, and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.map(x => x * 2);
      mapped.pop();
      const sliced: number[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.name   testArraySlice189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_189
     * @tc.desc   Verify slice() on array of nested optional objects after slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt {
        n?: number,
        s?: string
      }

      const arr: Opt[] = [{ n: 1 }, { s: 'a' }, { n: 2, s: 'b' }];
      const sliced: Opt[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([{ s: 'a' }, { n: 2, s: 'b' }]);
    });

    /**
     * @tc.name   testArraySlice190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_190
     * @tc.desc   Verify slice() on array of class instances after push and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      arr.push(new C(3));
      const sliced: C[] = arr.slice(1);
      expect(sliced.map(c => c.v)).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_191
     * @tc.desc   Verify slice() on array after reverse, fill and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      arr.fill(0, 1, 3);
      const sliced: number[] = arr.slice(0, 3);
      expect(sliced).assertDeepEquals([4, 0, 0]);
    });

    /**
     * @tc.name   testArraySlice192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_192
     * @tc.desc   Verify slice() on array of strings after multiple map and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map(s => s + s).map(s => s.toUpperCase());
      const sliced: string[] = mapped.slice(1);
      expect(sliced).assertDeepEquals(['BB', 'CC']);
    });

    /**
     * @tc.name   testArraySlice193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_193
     * @tc.desc   Verify slice() on array after multiple slice calls with overlapping ranges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const s1: number[] = arr.slice(1, 4);
      const s2: number[] = s1.slice(0, 2);
      expect(s2).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySlice194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_194
     * @tc.desc   Verify slice() on array after concat, reverse, and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const combined: number[] = arr1.concat(arr2).reverse();
      const sliced: number[] = combined.slice(1, 3);
      expect(sliced).assertDeepEquals([3, 2]);
    });

    /**
     * @tc.name   testArraySlice195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_195
     * @tc.desc   Verify slice() on array of nested arrays with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(-2);
      expect(sliced).assertDeepEquals([[3, 4], [5, 6]]);
    });

    /**
     * @tc.name   testArraySlice196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_196
     * @tc.desc   Verify slice() on array of booleans after reverse and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.reverse();
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArraySlice197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_197
     * @tc.desc   Verify slice() on array after multiple push and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.push(3, 4, 5);
      const sliced: number[] = arr.slice(2);
      expect(sliced).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   testArraySlice198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_198
     * @tc.desc   Verify slice() on array of objects after multiple map and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj {
        a: number,
        b: number
      }

      const arr: Obj[] = [{ a: 1, b: 2 }, { a: 3, b: 4 }, { a: 5, b: 6 }];
      const mapped: Obj[] = arr.map(o => ({ a: o.a + 1, b: o.b + 1 } as Obj));
      const sliced: Obj[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([{ a: 4, b: 5 }, { a: 6, b: 7 }]);
    });

    /**
     * @tc.name   testArraySlice199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_199
     * @tc.desc   Verify slice() on array after multiple pop and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      arr.pop();
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySlice200
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_200
     * @tc.desc   Verify slice() on array of class instances after multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }

        inc() {
          this.v++
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      arr.pop();
      arr[0].inc();
      const sliced: C[] = arr.slice();
      expect(sliced.map(c => c.v)).assertDeepEquals([2, 2]);
    });
  });
}