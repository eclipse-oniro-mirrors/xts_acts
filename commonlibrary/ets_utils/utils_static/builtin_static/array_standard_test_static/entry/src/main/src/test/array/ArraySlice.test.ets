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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

interface Obj9 { val: number }

interface Obj13 { val: number }

interface Opt21 { val?: number }

interface Inner28 { x: number };

interface Obj28 { data: Inner28 };

interface Opt33 { val?: number }

interface Obj37 { val: number }

interface Opt47 { val?: boolean }

interface Opt51 { val?: string }

interface Obj53 { vals: number[] }

interface Obj57 { val: number }

interface Inner59 { n: number }

interface Opt59 { val?: Inner59 }

interface Opt69 { n?: number | string }

interface Opt72 { vals?: number[] }

interface Obj73 { a: number };

type Fn83 = (x: int) => int;

interface Opt83 { fn?: Fn83 }

interface Inner85 { n: number };

interface Obj85 { a?: Inner85 };

interface Inner94 { n: number };

interface Opt94 { val?: Inner94 };

interface Opt98 { n?: number }

interface Opt101 { n?: number }

interface Opt107 { fn?: (x: int) => int }

interface Opt108 { val?: number }

interface Opt109 { vals?: number[] }

interface Opt114 { n?: number }

interface Opt119 { fn?: () => number }

interface Opt124 { n?: number }

interface Opt130 { n?: number }

interface Opt134 { vals?: number[] }

interface Opt137 { fn?: (x: int) => int }

interface Opt141 { n?: number }

interface Opt144 { n?: number }

interface Opt147 { fn?: () => number }

interface Item151 {
  id: number,
  name?: string
}

interface Opt160 { x?: number }

interface Opt166 { fn?: () => number }

interface Opt174 { n?: number }

interface Opt176 { fn?: (x: int) => int }

interface Obj178 {
  a: number;
  b: number
}

interface Obj185 { k: number }

interface Opt186 { n?: number }

interface Opt189 {
  n?: number,
  s?: string
}

interface Obj198 {
  a: number,
  b: number
}

class C18 {
  val: number;

  constructor(val: number) {
    this.val = val;
  }
}

class C39 {
  val: number;

  constructor(val: number) {
    this.val = val;
  }
}

class C54 {
  val: number;

  constructor(val: number) {
    this.val = val;
  }
}

class C67 {
  val?: number
}

class C77 {
  val?: number
}

class C87 {
  val: number;

  getVal() {
    return this.val;
  }

  constructor(v: number) {
    this.val = v;
  }
}

class C97 {
  val: number;

  constructor(v: number) {
    this.val = v;
  }
}

class C106 {
  val: number;

  constructor(v: number) {
    this.val = v;
  }

  inc() {
    this.val++;
  }
}

class C116 {
  val: number;

  constructor(v: number) {
    this.val = v;
  }
}

class C123 {
  val: number;

  constructor(v: number) {
    this.val = v;
  }

  inc() {
    this.val++;
  }
}

class C133 {
  val: number;

  constructor(v: number) {
    this.val = v;
  }
}

class C143 {
  val: number;

  constructor(v: number) {
    this.val = v;
  }
}

class C153 {
  public v: number;

  constructor(v: number) {
    this.v = v;
  }

  inc() {
    this.v++
  }
}

class C162 {
  public val: number | undefined;

  constructor(val?: number) {
    this.val = val;
  }
}

class C190 {
  public v: number;

  constructor(v: number) {
    this.v = v;
  }
}

class C200 {
  public v: number;

  constructor(v: number) {
    this.v = v;
  }

  inc() {
    this.v++
  }
}

type Fn12 = (x: number) => number;

type Fn38 = (x: number) => number;

type Fn58 = (x: number, y: number) => number;

type Fn74 = (x?: number) => number;

type Fn95 = () => number;

export default function ArraySliceTest() {
  describe('ArraySliceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_001
     * @tc.name testArraySlice001
     * @tc.desc Verify slice() returns a shallow copy of the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
      expect(sliced === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_002
     * @tc.name testArraySlice002
     * @tc.desc Verify slice(start) returns array from start index to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_003
     * @tc.name testArraySlice003
     * @tc.desc Verify slice(start, end) returns array from start to end-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_004
     * @tc.name testArraySlice004
     * @tc.desc Verify slice(start, end) returns empty array when start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(3, 2);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_005
     * @tc.name testArraySlice005
     * @tc.desc Verify slice() on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_006
     * @tc.name testArraySlice006
     * @tc.desc Verify slice(start) with negative index counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(-2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_007
     * @tc.name testArraySlice007
     * @tc.desc Verify slice(start, end) with negative indices counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(-4, -1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_008
     * @tc.name testArraySlice008
     * @tc.desc Verify slice(start) with start index beyond array length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(10);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_009
     * @tc.name testArraySlice009
     * @tc.desc Verify slice() returns shallow copy for nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj9[] = [{ val: 1 }, { val: 2 }];
      const sliced: Obj9[] = arr.slice();
      expect(sliced).assertDeepEquals([{ val: 1 }, { val: 2 }] as Obj9[]);
      expect(sliced[0]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_010
     * @tc.name testArraySlice010
     * @tc.desc Verify slice() on array of strings returns correct subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_011
     * @tc.name testArraySlice011
     * @tc.desc Verify slice() on array of boolean values returns correct subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const sliced: boolean[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_012
     * @tc.name testArraySlice012
     * @tc.desc Verify slice() returns shallow copy for array of functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f1: Fn12 = x => x + 1;
      const f2: Fn12 = x => x * 2;
      const arr: Fn12[] = [f1, f2];
      const sliced: Fn12[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[0](3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_013
     * @tc.name testArraySlice013
     * @tc.desc Verify slice() on array of objects returns shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj13[] = [{ val: 1 }, { val: 2 }];
      const sliced: Obj13[] = arr.slice();
      sliced[0].val = 100;
      expect(arr[0].val).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_014
     * @tc.name testArraySlice014
     * @tc.desc Verify slice() on nested arrays returns shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice();
      sliced[0][0] = 10;
      expect(arr[0][0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_015
     * @tc.name testArraySlice015
     * @tc.desc Verify slice() with end index larger than array length returns up to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(1, 10);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_016
     * @tc.name testArraySlice016
     * @tc.desc Verify slice() on array after push and pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_017
     * @tc.name testArraySlice017
     * @tc.desc Verify slice() on array of strings with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(-3, -1);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_018
     * @tc.name testArraySlice018
     * @tc.desc Verify slice() on array of class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C18[] = [new C18(1), new C18(2), new C18(3)];
      const sliced: C18[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_019
     * @tc.name testArraySlice019
     * @tc.desc Verify slice() on array of Maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const m1: Map<string, number> = new Map<string, number>([['a', 1]]);
      const m2: Map<string, number> = new Map<string, number>([['b', 2]]);
      const arr: Map<string, number>[] = [m1, m2];
      const sliced: Map<string, number>[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_020
     * @tc.name testArraySlice020
     * @tc.desc Verify slice() on array of Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const s1: Set<number> = new Set<number>([1]);
      const s2: Set<number> = new Set<number>([2]);
      const arr: Set<number>[] = [s1, s2];
      const sliced: Set<number>[] = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].has(1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_021
     * @tc.name testArraySlice021
     * @tc.desc Verify slice() on array of optional numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt21[] = [{ val: 1 }, {}, { val: 3 }];
      const sliced: Opt21[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_022
     * @tc.name testArraySlice022
     * @tc.desc Verify slice() on array after fill method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0, 0];
      arr.fill(5, 1, 3);
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([5, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_023
     * @tc.name testArraySlice023
     * @tc.desc Verify slice() on array after reverse method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_024
     * @tc.name testArraySlice024
     * @tc.desc Verify slice() on nested tuples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b'], [3, 'c']];
      const sliced: [number, string][] = arr.slice(1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[2, 'b'], [3, 'c']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_025
     * @tc.name testArraySlice025
     * @tc.desc Verify slice() on array after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const arr: number[] = arr1.concat(arr2);
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_026
     * @tc.name testArraySlice026
     * @tc.desc Verify slice() returns shallow copy for array after map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const mapped: number[] = arr.map<number>(n => n * 2);
      const sliced: number[] = mapped.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_027
     * @tc.name testArraySlice027
     * @tc.desc Verify slice() on array after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 1, 4, 2];
      arr.sort((a, b) => (a - b).toInt());
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_028
     * @tc.name testArraySlice028
     * @tc.desc Verify slice() on array of nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj28[] = [{ data: { x: 1 } }, { data: { x: 2 } }];
      const sliced: Obj28[] = arr.slice(0, 1);
      expect(sliced[0].data.x).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_029
     * @tc.name testArraySlice029
     * @tc.desc Verify slice() returns shallow copy on array of mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, 'a', true];
      const sliced: (number | string | boolean)[] = arr.slice(0, 2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 'a']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_030
     * @tc.name testArraySlice030
     * @tc.desc Verify slice() on array after multiple operations push/pop/shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.pop();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_031
     * @tc.name testArraySlice031
     * @tc.desc Verify slice() on array after unshift elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      const sliced: number[] = arr.slice(0, 2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_032
     * @tc.name testArraySlice032
     * @tc.desc Verify slice() on array after push multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      arr.push(2, 3, 4);
      const sliced: number[] = arr.slice(1, 4);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_033
     * @tc.name testArraySlice033
     * @tc.desc Verify slice() on array of optional objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt33[] = [{ val: 1 }, {}, { val: 3 }];
      const sliced: Opt33[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_034
     * @tc.name testArraySlice034
     * @tc.desc Verify slice() on array after pop and shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_035
     * @tc.name testArraySlice035
     * @tc.desc Verify slice() on array of nested tuples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string][] = [[1, 'a'], [2, 'b'], [3, 'c']];
      const sliced: [number, string][] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[2, 'b'], [3, 'c']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_036
     * @tc.name testArraySlice036
     * @tc.desc Verify slice() returns empty array when start equals end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(2, 2);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_037
     * @tc.name testArraySlice037
     * @tc.desc Verify slice() on array after fill with objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj37[] = [{ val: 0 }, { val: 0 }, { val: 0 }];
      arr.fill({ val: 5 }, 1, 3);
      const sliced: Obj37[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([{ val: 5 }, { val: 5 }] as Obj37[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_038
     * @tc.name testArraySlice038
     * @tc.desc Verify slice() on array of functions returns shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f1: Fn38 = x => x + 1;
      const f2: Fn38 = x => x * 2;
      const arr: Fn38[] = [f1, f2];
      const sliced: Fn38[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1](3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_039
     * @tc.name testArraySlice039
     * @tc.desc Verify slice() on array of class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C39[] = [new C39(1), new C39(2), new C39(3)];
      const sliced: C39[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_040
     * @tc.name testArraySlice040
     * @tc.desc Verify slice() on array after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_041
     * @tc.name testArraySlice041
     * @tc.desc Verify slice() on array of nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[3, 4], [5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_042
     * @tc.name testArraySlice042
     * @tc.desc Verify slice() on array after multiple push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      arr.push(2, 3, 4);
      const sliced: number[] = arr.slice(2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_043
     * @tc.name testArraySlice043
     * @tc.desc Verify slice() on array of strings with negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(1, -1);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_044
     * @tc.name testArraySlice044
     * @tc.desc Verify slice() returns empty array on empty original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced: number[] = arr.slice();
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_045
     * @tc.name testArraySlice045
     * @tc.desc Verify slice() on array after fill and reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [0, 0, 0];
      arr.fill(5);
      arr.reverse();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([5, 5, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_046
     * @tc.name testArraySlice046
     * @tc.desc Verify slice() on array of mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, 'a', true, false];
      const sliced: (number | string | boolean)[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['a', true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_047
     * @tc.name testArraySlice047
     * @tc.desc Verify slice() on array of optional booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt47[] = [{ val: true }, {}, {}];
      const sliced: Opt47[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_048
     * @tc.name testArraySlice048
     * @tc.desc Verify slice() on array after concat and push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      let arr: number[] = arr1.concat(arr2);
      arr.push(5);
      const sliced: number[] = arr.slice(2, 5);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_049
     * @tc.name testArraySlice049
     * @tc.desc Verify slice() on array after map returns correct subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.map<number>(n => n * 2);
      const sliced: number[] = mapped.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_051
     * @tc.name testArraySlice051
     * @tc.desc Verify slice() on array of optional strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt51[] = [{ val: 'a' }, {}, { val: 'c' }];
      const sliced: Opt51[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_052
     * @tc.name testArraySlice052
     * @tc.desc Verify slice() on array after multiple fill operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0, 0, 0];
      arr.fill(1, 1, 3);
      arr.fill(2, 3, 5);
      const sliced: number[] = arr.slice(1, 5);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 1, 2, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_053
     * @tc.name testArraySlice053
     * @tc.desc Verify slice() on array of objects with nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj53[] = [{ vals: [1, 2] }, { vals: [3, 4] }];
      const sliced: Obj53[] = arr.slice(1);
      sliced[0].vals[0] = 100;
      expect(arr[1].vals[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_054
     * @tc.name testArraySlice054
     * @tc.desc Verify slice() on array of class instances after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C54[] = [new C54(1), new C54(2), new C54(3)];
      const sliced: C54[] = arr.slice(0, 2);
      sliced[0].val = 10;
      expect(arr[0].val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_055
     * @tc.name testArraySlice055
     * @tc.desc Verify slice() returns empty array when start index beyond array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(10);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_056
     * @tc.name testArraySlice056
     * @tc.desc Verify slice() with negative start beyond array length returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-10);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_057
     * @tc.name testArraySlice057
     * @tc.desc Verify slice() on array after map with object transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const mapped: Obj57[] = arr.map(n => ({ val: n * 10 } as Obj57));
      const sliced: Obj57[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([{ val: 20 }, { val: 30 }] as Obj57[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_058
     * @tc.name testArraySlice058
     * @tc.desc Verify slice() on array of functions with multiple args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f1: Fn58 = (x, y) => x + y;
      const f2: Fn58 = (x, y) => x * y;
      const arr: Fn58[] = [f1, f2];
      const sliced: Fn58[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1](2, 3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_059
     * @tc.name testArraySlice059
     * @tc.desc Verify slice() on array of nested optional objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt59[] = [{ val: { n: 1 } }, {}, { val: { n: 3 } }];
      const sliced: Opt59[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_060
     * @tc.name testArraySlice060
     * @tc.desc Verify slice() on array after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 1, 4, 2];
      arr.sort((a, b) => (a - b).toInt());
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_061
     * @tc.name testArraySlice061
     * @tc.desc Verify slice() on array of booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const sliced: boolean[] = arr.slice(1);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_062
     * @tc.name testArraySlice062
     * @tc.desc Verify slice() on array of strings with start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const sliced: string[] = arr.slice(2, 1);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_063
     * @tc.name testArraySlice063
     * @tc.desc Verify slice() returns shallow copy for nested array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice();
      sliced[0][0] = 100;
      expect(arr[0][0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_064
     * @tc.name testArraySlice064
     * @tc.desc Verify slice() on array after push, pop, shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.push(5);
      arr.pop();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_065
     * @tc.name testArraySlice065
     * @tc.desc Verify slice() on array of Maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const m1: Map<string, number> = new Map<string, number>([['a', 1]]);
      const m2: Map<string, number> = new Map<string, number>([['b', 2]]);
      const arr: Map<string, number>[] = [m1, m2];
      const sliced: Map<string, number>[] = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_066
     * @tc.name testArraySlice066
     * @tc.desc Verify slice() on array of Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const s1: Set<number> = new Set<number>([1, 2]);
      const s2: Set<number> = new Set<number>([3, 4]);
      const arr: Set<number>[] = [s1, s2];
      const sliced: Set<number>[] = arr.slice(1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].has(3)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_067
     * @tc.name testArraySlice067
     * @tc.desc Verify slice() on array of optional class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C67[] = [new C67(), new C67()];
      const sliced: C67[] = arr.slice();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_068
     * @tc.name testArraySlice068
     * @tc.desc Verify slice() on array after repeated slice calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced1: number[] = arr.slice(1, 3);
      const sliced2: number[] = sliced1.slice(0, 1);
      expect(JSON.stringify(sliced2)).assertEqual(JSON.stringify([2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_069
     * @tc.name testArraySlice069
     * @tc.desc Verify slice() on array of mixed optional types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt69[] = [{ n: 1 }, {}, { n: 'a' }];
      const sliced: Opt69[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_070
     * @tc.name testArraySlice070
     * @tc.desc Verify slice() on array after concat of arrays with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // 问题？
    // it('testArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const arr1:number[]=[1,2];
    //   const arr2:string[]=['a','b'];
    //   const arr:(number|string)[]=arr1.concat(arr2);
    //   const sliced:(number|string)[]=arr.slice(1,3);
    //   expect(sliced).assertDeepEquals([2,'a']);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_071
     * @tc.name testArraySlice071
     * @tc.desc Verify slice() on array after repeated push and pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      arr.pop();
      const sliced: number[] = arr.slice(1, 4);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_072
     * @tc.name testArraySlice072
     * @tc.desc Verify slice() on array of nested optional arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt72[] = [{ vals: [1, 2] }, {}, { vals: [5, 6] }];
      const sliced: Opt72[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].vals === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_073
     * @tc.name testArraySlice073
     * @tc.desc Verify slice() returns shallow copy of nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj73[] = [{ a: 1 }, { a: 2 }];
      const sliced: Obj73[] = arr.slice();
      sliced[0].a = 10;
      expect(arr[0].a).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_074
     * @tc.name testArraySlice074
     * @tc.desc Verify slice() on array of functions with default parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f1: Fn74 = (x: number = 0) => (x as number) + 1;
      const f2: Fn74 = (x: number = 0) => (x as number) * 2;
      const arr: Fn74[] = [f1, f2];
      const sliced: Fn74[] = arr.slice(1);
      expect(sliced[0]()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_075
     * @tc.name testArraySlice075
     * @tc.desc Verify slice() with negative end index beyond array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(1, -10);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_076
     * @tc.name testArraySlice076
     * @tc.desc Verify slice() on array after multiple slice calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced1: number[] = arr.slice(1, 4);
      const sliced2: number[] = sliced1.slice(1, 2);
      expect(JSON.stringify(sliced2)).assertEqual(JSON.stringify([3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_077
     * @tc.name testArraySlice077
     * @tc.desc Verify slice() on array of class instances with optional fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C77[] = [new C77(), new C77()];
      const sliced: C77[] = arr.slice();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_078
     * @tc.name testArraySlice078
     * @tc.desc Verify slice() on array of nested arrays after modifying nested elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(0, 1);
      sliced[0][0] = 10;
      expect(arr[0][0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_079
     * @tc.name testArraySlice079
     * @tc.desc Verify slice() on array after sort with custom comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 3, 4, 1];
      arr.sort((a, b) => (b - a).toInt());
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_080
     * @tc.name testArraySlice080
     * @tc.desc Verify slice() on array of boolean values with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true, false];
      const sliced: boolean[] = arr.slice(-3, -1);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_081
     * @tc.name testArraySlice081
     * @tc.desc Verify slice() on array of strings after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['b', 'c'];
      arr.unshift('a');
      const sliced: string[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_082
     * @tc.name testArraySlice082
     * @tc.desc Verify slice() on array after concat with nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const arr: number[][] = [arr1, arr2];
      const sliced: number[][] = arr.slice(0, 1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[1, 2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_083
     * @tc.name testArraySlice083
     * @tc.desc Verify slice() on array of optional function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt83[] = [{ fn: (x: int) => x + 1 }, {}, { fn: (x: int) => x * 2 }];
      const sliced: Opt83[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_084
     * @tc.name testArraySlice084
     * @tc.desc Verify slice() on array after multiple shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.shift();
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_085
     * @tc.name testArraySlice085
     * @tc.desc Verify slice() on array of objects with nested optional fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const arr: Obj85[] = [{ a: { n: 1 } }, {}, { a: { n: 3 } }];
      const sliced: Obj85[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].a === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_086
     * @tc.name testArraySlice086
     * @tc.desc Verify slice() on array of numbers after repeated push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3, 4, 5);
      const sliced: number[] = arr.slice(2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_087
     * @tc.name testArraySlice087
     * @tc.desc Verify slice() on array of class instances with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C87[] = [new C87(1), new C87(2)];
      const sliced: C87[] = arr.slice();
      expect(sliced[0].getVal()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_088
     * @tc.name testArraySlice088
     * @tc.desc Verify slice() on array of numbers after pop and unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.pop();
      arr.unshift(0);
      const sliced: number[] = arr.slice(0, 2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([0, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_089
     * @tc.name testArraySlice089
     * @tc.desc Verify slice() on array of nested arrays after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(1);
      sliced[0][1] = 100;
      expect(arr[1][1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_091
     * @tc.name testArraySlice091
     * @tc.desc Verify slice() on array of strings with negative start and positive end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = arr.slice(-3, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_092
     * @tc.name testArraySlice092
     * @tc.desc Verify slice() on array of boolean values after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.reverse();
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_093
     * @tc.name testArraySlice093
     * @tc.desc Verify slice() on array of numbers after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(1, 1, 3);
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([0, 1, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_094
     * @tc.name testArraySlice094
     * @tc.desc Verify slice() on array of optional objects with nested fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt94[] = [{ val: { n: 1 } }, {}, { val: { n: 3 } }];
      const sliced: Opt94[] = arr.slice(0, 2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_095
     * @tc.name testArraySlice095
     * @tc.desc Verify slice() on array of functions with closure state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let state = 1;
      const f1: Fn95 = () => state + 1;
      const f2: Fn95 = () => state * 2;
      const arr: Fn95[] = [f1, f2];
      const sliced: Fn95[] = arr.slice(0, 1);
      state = 5;
      expect(sliced[0]()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_096
     * @tc.name testArraySlice096
     * @tc.desc Verify slice() on array of numbers after splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2);
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_097
     * @tc.name testArraySlice097
     * @tc.desc Verify slice() on array of class instances after property modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C97[] = [new C97(1), new C97(2)];
      const sliced: C97[] = arr.slice();
      sliced[1].val = 20;
      expect(arr[1].val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_098
     * @tc.name testArraySlice098
     * @tc.desc Verify slice() on array after concat with optional objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Opt98[] = [{ n: 1 }];
      const arr2: Opt98[] = [{}];
      const arr: Opt98[] = arr1.concat(arr2);
      const sliced: Opt98[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_099
     * @tc.name testArraySlice099
     * @tc.desc Verify slice() on array of nested arrays with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(-2, -1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_100
     * @tc.name testArraySlice100
     * @tc.desc Verify slice() on array of numbers with start equals end returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(2, 2);
      expect(sliced).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_101
     * @tc.name testArraySlice101
     * @tc.desc Verify slice() on array of optional numbers with undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt101[] = [{ n: 1 }, {}, { n: 3 }];
      const sliced: Opt101[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_102
     * @tc.name testArraySlice102
     * @tc.desc Verify slice() on array after push and shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.shift();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_103
     * @tc.name testArraySlice103
     * @tc.desc Verify slice() on array of strings after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      arr.reverse();
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['c', 'b']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_104
     * @tc.name testArraySlice104
     * @tc.desc Verify slice() on array of booleans after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, false];
      arr.fill(true, 1, 3);
      const sliced: boolean[] = arr.slice();
      expect(sliced).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_105
     * @tc.name testArraySlice105
     * @tc.desc Verify slice() on array of nested arrays after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice();
      sliced[1][0] = 10;
      expect(arr[1][0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_106
     * @tc.name testArraySlice106
     * @tc.desc Verify slice() on array of class instances with method modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C106[] = [new C106(1), new C106(2)];
      const sliced: C106[] = arr.slice();
      sliced[0].inc();
      expect(arr[0].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_107
     * @tc.name testArraySlice107
     * @tc.desc Verify slice() on array of optional functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt107[] = [{ fn: (x: int) => x + 1 }, {}, { fn: (x: int) => x * 2 }];
      const sliced: Opt107[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_108
     * @tc.name testArraySlice108
     * @tc.desc Verify slice() on array after splice with optional elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt108[] = [{ val: 1 }, { val: 2 }, { val: 3 }];
      arr.splice(1, 1);
      const sliced: Opt108[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].val).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_109
     * @tc.name testArraySlice109
     * @tc.desc Verify slice() on array of nested optional arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt109[] = [{ vals: [1, 2] }, {}, { vals: [5, 6] }];
      const sliced: Opt109[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].vals === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_110
     * @tc.name testArraySlice110
     * @tc.desc Verify slice() on array of numbers after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.unshift(1);
      const sliced: number[] = arr.slice(0, 2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_111
     * @tc.name testArraySlice111
     * @tc.desc Verify slice() on array of strings after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: string[] = ['a', 'b'];
      const arr2: string[] = ['c', 'd'];
      const arr: string[] = arr1.concat(arr2);
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_112
     * @tc.name testArraySlice112
     * @tc.desc Verify slice() on array of booleans after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.pop();
      const sliced: boolean[] = arr.slice();
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_113
     * @tc.name testArraySlice113
     * @tc.desc Verify slice() on array after reverse and slice with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      const sliced: number[] = arr.slice(-3, -1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_114
     * @tc.name testArraySlice114
     * @tc.desc Verify slice() on array of optional numbers with start greater than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt114[] = [{ n: 1 }, { n: 2 }];
      const sliced: Opt114[] = arr.slice(5);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_115
     * @tc.name testArraySlice115
     * @tc.desc Verify slice() on array after multiple pop and push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.pop();
      arr.push(4, 5);
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_116
     * @tc.name testArraySlice116
     * @tc.desc Verify slice() on array of class instances after push and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C116[] = [new C116(1)];
      arr.push(new C116(2));
      const sliced: C116[] = arr.slice();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_117
     * @tc.name testArraySlice117
     * @tc.desc Verify slice() on array of nested arrays after push and pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      arr.push([5, 6]);
      arr.pop();
      const sliced: number[][] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[1, 2], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_118
     * @tc.name testArraySlice118
     * @tc.desc Verify slice() on array after fill and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(5, 1, 3);
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([0, 5, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_119
     * @tc.name testArraySlice119
     * @tc.desc Verify slice() on array of optional functions with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt119[] = [{ fn: (): number => 1 }, {}, { fn: (): number => 3 }];
      const sliced: Opt119[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_120
     * @tc.name testArraySlice120
     * @tc.desc Verify slice() on array of numbers with start < 0 and end > length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(-3, 10);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_121
     * @tc.name testArraySlice121
     * @tc.desc Verify slice() on array of strings with start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const sliced: string[] = arr.slice(2, 1);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_122
     * @tc.name testArraySlice122
     * @tc.desc Verify slice() on array of numbers with start negative and end zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-2, 0);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_123
     * @tc.name testArraySlice123
     * @tc.desc Verify slice() on array of class instances with method call in slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C123[] = [new C123(1), new C123(2)];
      const sliced: C123[] = arr.slice();
      sliced[0].inc();
      expect(arr[0].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_124
     * @tc.name testArraySlice124
     * @tc.desc Verify slice() on array of optional numbers with all undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt124[] = [{}, {}, {}];
      const sliced: Opt124[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_125
     * @tc.name testArraySlice125
     * @tc.desc Verify slice() on array of numbers after push and pop sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.pop();
      arr.push(4);
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_126
     * @tc.name testArraySlice126
     * @tc.desc Verify slice() on array of nested arrays with slice start > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[3, 4], [5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_127
     * @tc.name testArraySlice127
     * @tc.desc Verify slice() on array after fill and slice with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(5, 1, 3);
      const sliced: number[] = arr.slice(-2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([5, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_128
     * @tc.name testArraySlice128
     * @tc.desc Verify slice() on array of strings after map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map<string>(s => s + s);
      const sliced: string[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals(['bb', 'cc']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_129
     * @tc.name testArraySlice129
     * @tc.desc Verify slice() on array after reverse, push and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.reverse();
      arr.push(4);
      const sliced: number[] = arr.slice(1, 4);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 1, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_130
     * @tc.name testArraySlice130
     * @tc.desc Verify slice() on array of optional objects after concat and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Opt130[] = [{ n: 1 }];
      const arr2: Opt130[] = [{}];
      const arr: Opt130[] = arr1.concat(arr2);
      const sliced: Opt130[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].n === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_131
     * @tc.name testArraySlice131
     * @tc.desc Verify slice() on array of booleans after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false];
      arr.unshift(true);
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_132
     * @tc.name testArraySlice132
     * @tc.desc Verify slice() on array of numbers after multiple fill and pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(2, 0, 2);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_133
     * @tc.name testArraySlice133
     * @tc.desc Verify slice() on array of class instances with multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C133[] = [new C133(1), new C133(2), new C133(3)];
      const sliced: C133[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_134
     * @tc.name testArraySlice134
     * @tc.desc Verify slice() on array of optional arrays with nested slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt134[] = [{ vals: [1, 2] }, { vals: [3, 4] }, { vals: [5, 6] }];
      const sliced: Opt134[] = arr.slice(0, 2);
      expect(JSON.stringify(sliced[0].vals)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_135
     * @tc.name testArraySlice135
     * @tc.desc Verify slice() on array of numbers with start negative beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-5);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_136
     * @tc.name testArraySlice136
     * @tc.desc Verify slice() on array after push and slice with end exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.push(3);
      const sliced: number[] = arr.slice(0, 5);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_137
     * @tc.name testArraySlice137
     * @tc.desc Verify slice() on array of optional functions with closures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let state = 1;
      const arr: Opt137[] = [{ fn: (x: int) => x + state }, { fn: (x: int) => x * state }];
      state = 5;
      const sliced: Opt137[] = arr.slice();
      expect(sliced[0].fn!(2)).assertEqual(7);
      expect(sliced[1].fn!(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_138
     * @tc.name testArraySlice138
     * @tc.desc Verify slice() on array of nested arrays after reverse and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      arr.reverse();
      const sliced: number[][] = arr.slice(0, 2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[5, 6], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_139
     * @tc.name testArraySlice139
     * @tc.desc Verify slice() on array of numbers with start=0 and end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(0, arr.length);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_140
     * @tc.name testArraySlice140
     * @tc.desc Verify slice() on array after multiple operations push, pop, reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.pop();
      arr.reverse();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 2, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_141
     * @tc.name testArraySlice141
     * @tc.desc Verify slice() on array of objects with optional properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt141[] = [{ n: 1 }, {}, { n: 3 }];
      const sliced: Opt141[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_142
     * @tc.name testArraySlice142
     * @tc.desc Verify slice() on array of nested arrays with negative end exceeding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(1, -10);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_143
     * @tc.name testArraySlice143
     * @tc.desc Verify slice() on array of class instances after multiple modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C143[] = [new C143(1), new C143(2), new C143(3)];
      const sliced: C143[] = arr.slice(0, 2);
      sliced[0].val = 10;
      expect(arr[0].val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_144
     * @tc.name testArraySlice144
     * @tc.desc Verify slice() on array of optional numbers after reverse and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {


      const arr: Opt144[] = [{ n: 1 }, {}, { n: 3 }];
      arr.reverse();
      const sliced: Opt144[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].n).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_145
     * @tc.name testArraySlice145
     * @tc.desc Verify slice() on array of strings with map and slice combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map<string>(s => s.toUpperCase());
      const sliced: string[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals(['B', 'C']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_146
     * @tc.name testArraySlice146
     * @tc.desc Verify slice() on array after push, pop and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_147
     * @tc.name testArraySlice147
     * @tc.desc Verify slice() on array of optional functions after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt147[] = [{}];
      arr.push({ fn: (): number => 5 });
      const sliced: Opt147[] = arr.slice();
      expect(sliced[1].fn!()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_148
     * @tc.name testArraySlice148
     * @tc.desc Verify slice() on array of nested arrays with start and end exceeding bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(-5, 10);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[1, 2], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_149
     * @tc.name testArraySlice149
     * @tc.desc Verify slice() on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced: number[] = arr.slice();
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_150
     * @tc.name testArraySlice150
     * @tc.desc Verify slice() on array after multiple operations with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      arr.pop();
      arr.reverse();
      arr.push(6);
      const sliced: number[] = arr.slice(-3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 1, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_151
     * @tc.name testArraySlice151
     * @tc.desc Verify slice() on array of nested objects with optional fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item151[] = [{ id: 1 }, { id: 2, name: 'B' }, { id: 3 }];
      const sliced: Item151[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].name).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_152
     * @tc.name testArraySlice152
     * @tc.desc Verify slice() on array after fill, reverse, and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, 3);
      arr.reverse();
      const sliced: number[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([0, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_153
     * @tc.name testArraySlice153
     * @tc.desc Verify slice() on array of class instances with method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C153[] = [new C153(1), new C153(2)];
      const sliced: C153[] = arr.slice();
      sliced[0].inc();
      expect(arr[0].v).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_154
     * @tc.name testArraySlice154
     * @tc.desc Verify slice() on array after pop and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_155
     * @tc.name testArraySlice155
     * @tc.desc Verify slice() on array after unshift and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      const sliced: number[] = arr.slice(0, 2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_156
     * @tc.name testArraySlice156
     * @tc.desc Verify slice() on array of arrays after flatMap and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testArraySlice156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const arr: number[][] = [[1, 2], [3, 4]];
    //   const flat: number[] = arr.flatMap(x => x);
    //   const sliced: number[] = flat.slice(1, 3);
    //   expect(sliced).assertDeepEquals([2, 3]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_157
     * @tc.name testArraySlice157
     * @tc.desc Verify slice() on array of strings after map and reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map<string>(s => s + s).reverse();
      const sliced: string[] = mapped.slice(0, 2);
      expect(sliced).assertDeepEquals(['cc', 'bb']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_158
     * @tc.name testArraySlice158
     * @tc.desc Verify slice() on array after multiple push and pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.push(3, 4);
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_159
     * @tc.name testArraySlice159
     * @tc.desc Verify slice() on array of boolean values with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const sliced: boolean[] = arr.slice(-2);
      expect(sliced).assertDeepEquals([false, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_160
     * @tc.name testArraySlice160
     * @tc.desc Verify slice() on array of optional objects with some undefined fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt160[] = [{ x: 1 }, {}, {}];
      const sliced: Opt160[] = arr.slice(1);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0].x === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_161
     * @tc.name testArraySlice161
     * @tc.desc Verify slice() on array of nested arrays after multiple reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      arr.reverse();
      arr.reverse();
      const sliced: number[][] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[3, 4], [5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_162
     * @tc.name testArraySlice162
     * @tc.desc Verify slice() on array of class instances with optional property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C162[] = [new C162(1), new C162(), new C162(3)];
      const sliced: C162[] = arr.slice(0, 2);
      expect(sliced[1].val === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_163
     * @tc.name testArraySlice163
     * @tc.desc Verify slice() on array after fill and slice with end exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(5);
      const sliced: number[] = arr.slice(0, 10);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([5, 5, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_164
     * @tc.name testArraySlice164
     * @tc.desc Verify slice() on array of strings after concat and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: string[] = ['a', 'b'];
      const arr2: string[] = ['c', 'd'];
      const arr: string[] = arr1.concat(arr2);
      const sliced: string[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_165
     * @tc.name testArraySlice165
     * @tc.desc Verify slice() on array of numbers with negative start exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const sliced: number[] = arr.slice(-10);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_166
     * @tc.name testArraySlice166
     * @tc.desc Verify slice() on array of optional functions with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt166[] = [{ fn: (): number => 1 }, {}, {}];
      const sliced: Opt166[] = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].fn === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_167
     * @tc.name testArraySlice167
     * @tc.desc Verify slice() on array after multiple reverse and push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3];
      arr.reverse();
      arr.push(4);
      const sliced: number[] = arr.slice(-2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_168
     * @tc.name testArraySlice168
     * @tc.desc Verify slice() on array of numbers after map and slice with negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.map<number>(x => x * 2);
      const sliced: number[] = mapped.slice(1, -1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_169
     * @tc.name testArraySlice169
     * @tc.desc Verify slice() on array of nested arrays with slice start beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const sliced: number[][] = arr.slice(5);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_170
     * @tc.name testArraySlice170
     * @tc.desc Verify slice() on array after fill, reverse and multiple slice calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(7, 1, 3);
      arr.reverse();
      const sliced1: number[] = arr.slice(0, 2);
      const sliced2: number[] = arr.slice(2);
      expect(JSON.stringify(sliced1)).assertEqual(JSON.stringify([4, 7]));
      expect(JSON.stringify(sliced2)).assertEqual(JSON.stringify([7, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_171
     * @tc.name testArraySlice171
     * @tc.desc Verify slice() on empty array multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sliced1: number[] = arr.slice();
      const sliced2: number[] = arr.slice(0, 1);
      expect(sliced1.length).assertEqual(0);
      expect(sliced2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_172
     * @tc.name testArraySlice172
     * @tc.desc Verify slice() on array of booleans after pop and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.pop();
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_173
     * @tc.name testArraySlice173
     * @tc.desc Verify slice() on array of strings after reverse, push and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: string[] = ['x', 'y'];
      arr.reverse();
      arr.push('z');
      const sliced: string[] = arr.slice(1);
      expect(sliced).assertDeepEquals(['x', 'z']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_174
     * @tc.name testArraySlice174
     * @tc.desc Verify slice() on array of optional objects after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt174[] = [{ n: 1 }, { n: 2 }];
      arr.pop();
      const sliced: Opt174[] = arr.slice();
      expect(sliced.length).assertEqual(1);
      expect(sliced[0].n).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_175
     * @tc.name testArraySlice175
     * @tc.desc Verify slice() on array after map and reverse with nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const mapped: number[][] = arr.map<number[]>(a => a.map<number>(x => x * 2)).reverse();
      const sliced: number[][] = mapped.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[6, 8], [2, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_176
     * @tc.name testArraySlice176
     * @tc.desc Verify slice() on array of optional functions with some undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt176[] = [{ fn: (x: int) => x + 1 }, {}, {}];
      const sliced: Opt176[] = arr.slice(0, 2);
      expect(sliced[1].fn === undefined).assertEqual(true);
      expect(sliced[0].fn!(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_177
     * @tc.name testArraySlice177
     * @tc.desc Verify slice() on array after multiple push, pop, and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      arr.pop();
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_178
     * @tc.name testArraySlice178
     * @tc.desc Verify slice() on array of objects after map and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj178[] = [{ a: 1, b: 2 }, { a: 3, b: 4 }, { a: 5, b: 6 }];
      const mapped: Obj178[] = arr.map((o: Obj178): Obj178 => ({ a: o.a * 2, b: o.b * 2 } as Obj178));
      const sliced: Obj178[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([{ a: 6, b: 8 }, { a: 10, b: 12 }] as Obj178[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_179
     * @tc.name testArraySlice179
     * @tc.desc Verify slice() on array after reverse and slice with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.reverse();
      const sliced: number[] = arr.slice(-4, -1);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 3, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_180
     * @tc.name testArraySlice180
     * @tc.desc Verify slice() on array of nested arrays after flatMap and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testArraySlice180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
    //   const flat: number[] = arr.flatMap(x => x.map(y => y * 2));
    //   const sliced: number[] = flat.slice(2, 6);
    //   expect(sliced).assertDeepEquals([6, 8, 10, 12]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_181
     * @tc.name testArraySlice181
     * @tc.desc Verify slice() on array after multiple pop and push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr.push(5);
      arr.pop();
      arr.push(6);
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_182
     * @tc.name testArraySlice182
     * @tc.desc Verify slice() on array of booleans after map and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const mapped: boolean[] = arr.map<boolean>(b => !b);
      const sliced: boolean[] = mapped.slice(1);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_183
     * @tc.name testArraySlice183
     * @tc.desc Verify slice() on array of strings after fill and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      arr.fill('x', 1, 3);
      const sliced: string[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals(['a', 'x']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_184
     * @tc.name testArraySlice184
     * @tc.desc Verify slice() on array of numbers after concat and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const combined: number[] = arr1.concat(arr2);
      const sliced: number[] = combined.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_185
     * @tc.name testArraySlice185
     * @tc.desc Verify slice() on array of objects after reverse and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj185[] = [{ k: 1 }, { k: 2 }, { k: 3 }];
      arr.reverse();
      const sliced: Obj185[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([{ k: 3 }, { k: 2 }] as Obj185[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_186
     * @tc.name testArraySlice186
     * @tc.desc Verify slice() on array of optional numbers after pop and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt186[] = [{ n: 1 }, {}, {}];
      arr.pop();
      const sliced: Opt186[] = arr.slice();
      expect(sliced.length).assertEqual(2);
      expect(sliced[1].n === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_187
     * @tc.name testArraySlice187
     * @tc.desc Verify slice() on array after multiple push, fill, and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      arr.fill(0, 1, 4);
      const sliced: number[] = arr.slice(1, 4);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([0, 0, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_188
     * @tc.name testArraySlice188
     * @tc.desc Verify slice() on array after map, pop, and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const mapped: number[] = arr.map<number>(x => x * 2);
      mapped.pop();
      const sliced: number[] = mapped.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_189
     * @tc.name testArraySlice189
     * @tc.desc Verify slice() on array of nested optional objects after slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt189[] = [{ n: 1 }, { s: 'a' }, { n: 2, s: 'b' }];
      const sliced: Opt189[] = arr.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([{ s: 'a' }, { n: 2, s: 'b' }] as Opt189[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_190
     * @tc.name testArraySlice190
     * @tc.desc Verify slice() on array of class instances after push and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C190[] = [new C190(1), new C190(2)];
      arr.push(new C190(3));
      const sliced: C190[] = arr.slice(1);
      expect(JSON.stringify(sliced.map<number>(c => c.v))).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_191
     * @tc.name testArraySlice191
     * @tc.desc Verify slice() on array after reverse, fill and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.reverse();
      arr.fill(0, 1, 3);
      const sliced: number[] = arr.slice(0, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([4, 0, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_192
     * @tc.name testArraySlice192
     * @tc.desc Verify slice() on array of strings after multiple map and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const mapped: string[] = arr.map<string>(s => s + s).map<string>(s => s.toUpperCase());
      const sliced: string[] = mapped.slice(1);
      expect(sliced).assertDeepEquals(['BB', 'CC']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_193
     * @tc.name testArraySlice193
     * @tc.desc Verify slice() on array after multiple slice calls with overlapping ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const s1: number[] = arr.slice(1, 4);
      const s2: number[] = s1.slice(0, 2);
      expect(JSON.stringify(s2)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_194
     * @tc.name testArraySlice194
     * @tc.desc Verify slice() on array after concat, reverse, and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const combined: number[] = arr1.concat(arr2).reverse();
      const sliced: number[] = combined.slice(1, 3);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_195
     * @tc.name testArraySlice195
     * @tc.desc Verify slice() on array of nested arrays with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const sliced: number[][] = arr.slice(-2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([[3, 4], [5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_196
     * @tc.name testArraySlice196
     * @tc.desc Verify slice() on array of booleans after reverse and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.reverse();
      const sliced: boolean[] = arr.slice(0, 2);
      expect(sliced).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_197
     * @tc.name testArraySlice197
     * @tc.desc Verify slice() on array after multiple push and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2];
      arr.push(3, 4, 5);
      const sliced: number[] = arr.slice(2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([3, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_198
     * @tc.name testArraySlice198
     * @tc.desc Verify slice() on array of objects after multiple map and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj198[] = [{ a: 1, b: 2 }, { a: 3, b: 4 }, { a: 5, b: 6 }];
      const mapped: Obj198[] = arr.map((o: Obj198): Obj198 => ({ a: o.a + 1, b: o.b + 1 } as Obj198));
      const sliced: Obj198[] = mapped.slice(1, 3);
      expect(sliced).assertDeepEquals([{ a: 4, b: 5 }, { a: 6, b: 7 }] as Obj198[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_199
     * @tc.name testArraySlice199
     * @tc.desc Verify slice() on array after multiple pop and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      arr.pop();
      arr.pop();
      const sliced: number[] = arr.slice();
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Slice_200
     * @tc.name testArraySlice200
     * @tc.desc Verify slice() on array of class instances after multiple operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySlice200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C200[] = [new C200(1), new C200(2), new C200(3)];
      arr.pop();
      arr[0].inc();
      const sliced: C200[] = arr.slice();
      expect(JSON.stringify(sliced.map<number>(c => c.v))).assertEqual(JSON.stringify([2, 2]));
    });
  });
}