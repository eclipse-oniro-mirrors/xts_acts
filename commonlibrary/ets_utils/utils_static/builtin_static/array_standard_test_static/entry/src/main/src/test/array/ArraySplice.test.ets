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

interface Obj10 { a: number }

interface Obj13 { x: number; }

interface Opt20 { x?: number }

interface Opt29 { a?: number }

interface Opt33 { a?: number }

interface Obj45 { x: number }

interface Opt47 { a?: number }

interface Opt54 { a?: number }

interface Opt64 { a?: number }

interface Item91 {
  id: number,
  name: string
}

interface I102 { val: number }

interface I108 { val: number }

class C {
  public v: number;

  constructor(v: number) {
    this.v = v;
  }
}

export default function ArraySpliceTest() {
  describe('ArraySpliceTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0001
     * @tc.name testArraySplice0001
     * @tc.desc Verify splice removes a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 1);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 3]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0002
     * @tc.name testArraySplice0002
     * @tc.desc Verify splice inserts a single element without removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 0, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0003
     * @tc.name testArraySplice0003
     * @tc.desc Verify splice inserts multiple elements without removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 100, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0004
     * @tc.name testArraySplice0004
     * @tc.desc Verify splice removes multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const removed: number[] = arr.splice(1, 3);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 5]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0005
     * @tc.name testArraySplice0005
     * @tc.desc Verify splice with negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const removed: number[] = arr.splice(-2, 1);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 5]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0006
     * @tc.name testArraySplice0006
     * @tc.desc Verify splice removes zero elements when deleteCount is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 0);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([] as number[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0007
     * @tc.name testArraySplice0007
     * @tc.desc Verify splice with start index greater than array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(5, 2, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 99]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([] as number[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0008
     * @tc.name testArraySplice0008
     * @tc.desc Verify splice removes all elements if deleteCount exceeds length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 10);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([] as number[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0009
     * @tc.name testArraySplice0009
     * @tc.desc Verify splice on array of strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(1, 2, 'x', 'y');
      expect(arr).assertDeepEquals(['a', 'x', 'y', 'd']);
      expect(removed).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0010
     * @tc.name testArraySplice0010
     * @tc.desc Verify splice inserts objects into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj10[] = [{ a: 1 }, { a: 2 }, { a: 3 }];
      const removed: Obj10[] = arr.splice(1, 1, { a: 99 });
      expect(arr).assertDeepEquals([{ a: 1 }, { a: 99 }, { a: 3 }] as Obj10[]);
      expect(removed).assertDeepEquals([{ a: 2 }] as Obj10[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0011
     * @tc.name testArraySplice0011
     * @tc.desc Verify splice on array of nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const removed: number[][] = arr.splice(1, 1, [9, 9]);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual("1,2,9,9,5,6");
      expect(removed.length).assertEqual(1);
      expect(removed.toString()).assertDeepEquals("3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0012
     * @tc.name testArraySplice0012
     * @tc.desc Verify splice with start index 0 and deleteCount 0 inserts elements at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.splice(0, 0, 1);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0013
     * @tc.name testArraySplice0013
     * @tc.desc Verify splice removes and inserts multiple object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj13[] = [{ x: 1 }, { x: 2 }, { x: 3 }];
      const removed: Obj13[] = arr.splice(1, 2, { x: 99 }, { x: 100 });
      expect(arr).assertDeepEquals([{ x: 1 }, { x: 99 }, { x: 100 }] as Obj13[]);
      expect(removed).assertDeepEquals([{ x: 2 }, { x: 3 }] as Obj13[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0014
     * @tc.name testArraySplice0014
     * @tc.desc Verify splice removes element from array of strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const removed: string[] = arr.splice(1, 1);
      expect(arr).assertDeepEquals(['a', 'c']);
      expect(removed).assertDeepEquals(['b']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0015
     * @tc.name testArraySplice0015
     * @tc.desc Verify splice inserts class instances into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99));
      expect(JSON.stringify(arr.map((c:C): number => c.v))).assertEqual(JSON.stringify([1, 99, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0016
     * @tc.name testArraySplice0016
     * @tc.desc Verify splice with negative start index inserts element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(-1, 0, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 99, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0017
     * @tc.name testArraySplice0017
     * @tc.desc Verify splice removes zero elements when deleteCount is 0 at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3] as number[];
      const removed: number[] = arr.splice(3, 0, 4);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([] as number[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0018
     * @tc.name testArraySplice0018
     * @tc.desc Verify splice removes all elements if deleteCount exceeds array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 10);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([] as number[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0019
     * @tc.name testArraySplice0019
     * @tc.desc Verify splice inserts multiple nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4]];
      arr.splice(1, 0, [[9, 9], [8, 8]]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [[9, 9], [8, 8]], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0020
     * @tc.name testArraySplice0020
     * @tc.desc Verify splice on array of optional objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt20[] = [{ x: 1 }, {}, { x: 3 }];
      const removed: Opt20[] = arr.splice(1, 1, { x: 99 });
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([{ x: 1 }, { x: 99 }, { x: 3 }] as Opt20[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([{}] as Opt20[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0021
     * @tc.name testArraySplice0021
     * @tc.desc Verify splice removes elements from array after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      const removed: number[] = arr.splice(1, 3);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 5]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0022
     * @tc.name testArraySplice0022
     * @tc.desc Verify splice replaces elements with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2)];
      const removed: C[] = arr.splice(0, 1, new C(99));
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([99, 2]));
      expect(JSON.stringify(removed.map((c: C): number => c.v))).assertEqual(JSON.stringify([1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0023
     * @tc.name testArraySplice0023
     * @tc.desc Verify splice with negative start index removes and inserts elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-2, 1, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99, 100, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0024
     * @tc.name testArraySplice0024
     * @tc.desc Verify splice inserts elements at the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(arr.length, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 99, 100]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0025
     * @tc.name testArraySplice0025
     * @tc.desc Verify splice removes all elements when deleteCount equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(0, 4);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([] as number[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0026
     * @tc.name testArraySplice0026
     * @tc.desc Verify splice on array of strings removes and inserts elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(1, 2, 'x', 'y');
      expect(arr).assertDeepEquals(['a', 'x', 'y', 'd']);
      expect(removed).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0027
     * @tc.name testArraySplice0027
     * @tc.desc Verify splice removes no elements if deleteCount is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 0);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3]));
      expect(removed).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0028
     * @tc.name testArraySplice0028
     * @tc.desc Verify splice inserts elements of different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'a', 2];
      arr.splice(1, 1, 'x', 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 'x', 99, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0029
     * @tc.name testArraySplice0029
     * @tc.desc Verify splice removes elements from an array of optional objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt29[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt29[] = arr.splice(1, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([{ a: 1 }] as Opt29[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([{}, { a: 3 }] as Opt29[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0030
     * @tc.name testArraySplice0030
     * @tc.desc Verify splice on array of class instances removes and inserts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 1, new C(99));
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([1, 99, 3]));
      expect(JSON.stringify(removed.map((c: C): number => c.v))).assertEqual(JSON.stringify([2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0031
     * @tc.name testArraySplice0031
     * @tc.desc Verify splice with negative start index and deleteCount exceeding array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-5, 10, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([99]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0032
     * @tc.name testArraySplice0032
     * @tc.desc Verify splice inserts multiple nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4]];
      arr.splice(1, 0, [[9, 9]], [[8, 8]]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [[9, 9]], [[8, 8]], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0033
     * @tc.name testArraySplice0033
     * @tc.desc Verify splice on array of optional objects with insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt33[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt33[] = arr.splice(1, 1, { a: 99 });
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([{ a: 1 }, { a: 99 }, { a: 3 }] as Opt33[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([{}] as Opt33[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0034
     * @tc.name testArraySplice0034
     * @tc.desc Verify splice removes elements from class instance array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(0, 2);
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([3]));
      expect(JSON.stringify(removed.map((c: C): number => c.v))).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0035
     * @tc.name testArraySplice0035
     * @tc.desc Verify splice inserts elements at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(arr.length, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 99, 100]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0036
     * @tc.name testArraySplice0036
     * @tc.desc Verify splice removes elements from mixed type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b'];
      const removed: (number | string)[] = arr.splice(1, 2, 'x');
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 'x', 'b']));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify(['a', 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0037
     * @tc.name testArraySplice0037
     * @tc.desc Verify splice with zero deleteCount inserts elements without removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 100, 2, 3]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([] as number[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0038
     * @tc.name testArraySplice0038
     * @tc.desc Verify splice removes all elements when deleteCount equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(0, 4);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([] as number[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0039
     * @tc.name testArraySplice0039
     * @tc.desc Verify splice removes elements after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3, 4);
      const removed: number[] = arr.splice(1, 3);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0040
     * @tc.name testArraySplice0040
     * @tc.desc Verify splice inserts elements into array of class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99), new C(100));
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([1, 99, 100, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0041
     * @tc.name testArraySplice0041
     * @tc.desc Verify splice removes elements using negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const removed: number[] = arr.splice(-3, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 5]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0042
     * @tc.name testArraySplice0042
     * @tc.desc Verify splice inserts elements at start using negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 4, 5];
      arr.splice(-3, 0, 1, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0043
     * @tc.name testArraySplice0043
     * @tc.desc Verify splice removes no elements if start index exceeds array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(5, 2, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 99]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([] as number[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0044
     * @tc.name testArraySplice0044
     * @tc.desc Verify splice removes middle element from string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(2, 1);
      expect(arr).assertDeepEquals(['a', 'b', 'd']);
      expect(removed).assertDeepEquals(['c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0045
     * @tc.name testArraySplice0045
     * @tc.desc Verify splice inserts object elements into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj45[] = [{ x: 1 }, { x: 2 }];
      arr.splice(1, 0, { x: 99 });
      expect(arr).assertDeepEquals([{ x: 1 }, { x: 99 }, { x: 2 }] as Obj45[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0046
     * @tc.name testArraySplice0046
     * @tc.desc Verify splice removes all elements and inserts new ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 3, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([99, 100]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0047
     * @tc.name testArraySplice0047
     * @tc.desc Verify splice on array of optional objects with multiple insertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt47[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt47[] = arr.splice(1, 1, { a: 99 }, { a: 100 });
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([{ a: 1 }, { a: 99 }, { a: 100 }, { a: 3 }] as Opt47[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([{}] as Opt47[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0048
     * @tc.name testArraySplice0048
     * @tc.desc Verify splice removes from nested arrays and inserts new arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(1, 2, [[9, 9]]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [[9, 9]]]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[3, 4], [5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0049
     * @tc.name testArraySplice0049
     * @tc.desc Verify splice removes elements and returns correct removed array for mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b'];
      const removed: (number | string)[] = arr.splice(0, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([2, 'b']));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 'a']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0050
     * @tc.name testArraySplice0050
     * @tc.desc Verify splice inserts class instances and removes existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 2, new C(99), new C(100));
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([1, 99, 100]));
      expect(JSON.stringify(removed.map((c: C): number => c.v))).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0051
     * @tc.name testArraySplice0051
     * @tc.desc Verify splice after push inserts elements at specific position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3, 4);
      const removed: number[] = arr.splice(2, 1, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0052
     * @tc.name testArraySplice0052
     * @tc.desc Verify splice combined with slice preserves array immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const copy: number[] = arr.slice();
      const removed: number[] = arr.splice(1, 2, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 4]));
      expect(JSON.stringify(copy)).assertEqual(JSON.stringify([1, 2, 3, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0053
     * @tc.name testArraySplice0053
     * @tc.desc Verify splice with nested array elements and negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(-2, 1, [[9, 9]]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [[9, 9]], [5, 6]]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0054
     * @tc.name testArraySplice0054
     * @tc.desc Verify splice removes elements and returns correct array for optional objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt54[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt54[] = arr.splice(0, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([{ a: 3 }] as Opt54[]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([{ a: 1 }, {}] as Opt54[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0055
     * @tc.name testArraySplice0055
     * @tc.desc Verify splice inserts elements into array of class instances and then pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99));
      const popped: C | undefined = arr.pop();
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([1, 99]));
      expect(popped?.v).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0056
     * @tc.name testArraySplice0056
     * @tc.desc Verify splice combined with push and slice on mixed type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b'];
      arr.push('c');
      const removed: (number | string)[] = arr.splice(1, 2, 'x');
      const copy: (number | string)[] = arr.slice();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 'x', 'b', 'c']));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify(['a', 2]));
      expect(JSON.stringify(copy)).assertEqual(JSON.stringify([1, 'x', 'b', 'c']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0057
     * @tc.name testArraySplice0057
     * @tc.desc Verify splice removes from array of nested arrays and inserts multiple arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(0, 2, [[9, 9]], [[8, 8]]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[[9, 9]], [[8, 8]], [5, 6]]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[1, 2], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0058
     * @tc.name testArraySplice0058
     * @tc.desc Verify splice removes no elements if deleteCount is 0 and inserts at negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-2, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99, 100, 3, 4]));
      expect(removed).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0059
     * @tc.name testArraySplice0059
     * @tc.desc Verify splice removes elements equal to deleteCount and inserts multiple types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b', 3];
      const removed: (number | string)[] = arr.splice(1, 3, 'x', 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 'x', 99, 3]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify(['a', 2, 'b']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0060
     * @tc.name testArraySplice0060
     * @tc.desc Verify splice on array of class instances with multiple insertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 2, new C(99), new C(100));
      expect(JSON.stringify(arr.map((c: C): number => c.v))).assertEqual(JSON.stringify([1, 99, 100]));
      expect(JSON.stringify(removed.map((c: C): number => c.v))).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0061
     * @tc.name testArraySplice0061
     * @tc.desc Verify splice combined with pop returns correct popped element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 1, 99);
      const popped: number | undefined = arr.pop();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99]));
      expect(popped).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0062
     * @tc.name testArraySplice0062
     * @tc.desc Verify splice combined with slice on nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(1, 1, [[9, 9]]);
      const copy = arr.slice();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [[9, 9]], [5, 6]]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[3, 4]]));
      expect(JSON.stringify(copy)).assertEqual(JSON.stringify([[1, 2], [[9, 9]], [5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0063
     * @tc.name testArraySplice0063
     * @tc.desc Verify splice removes first element from string array and inserts new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(0, 1, 'x', 'y');
      expect(arr).assertDeepEquals(['x', 'y', 'b', 'c', 'd']);
      expect(removed).assertDeepEquals(['a']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0064
     * @tc.name testArraySplice0064
     * @tc.desc Verify splice inserts optional objects into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Opt64[] = [{ a: 1 }, { a: 2 }];
      arr.splice(1, 0, {}, { a: 99 });
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([{ a: 1 }, {}, { a: 99 }, { a: 2 }] as Opt64[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0065
     * @tc.name testArraySplice0065
     * @tc.desc Verify splice removes all elements when start=0 and deleteCount exceeds length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 10, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([99]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0066
     * @tc.name testArraySplice0066
     * @tc.desc Verify splice inserts elements at end using start greater than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(5, 0, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0067
     * @tc.name testArraySplice0067
     * @tc.desc Verify splice removes elements from end using negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-2, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0068
     * @tc.name testArraySplice0068
     * @tc.desc Verify splice inserts elements into empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const removed: number[] = arr.splice(0, 0, 1, 2, 3);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([] as number[]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0070
     * @tc.name testArraySplice0070
     * @tc.desc Verify splice combined with multiple pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99);
      const pop1: number | undefined = arr.pop();
      const pop2: number | undefined = arr.pop();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1]));
      expect(pop1).assertEqual(4);
      expect(pop2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0071
     * @tc.name testArraySplice0071
     * @tc.desc Verify splice removes elements and returns correct array for mixed nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | string[])[] = [[1, 2], ['a', 'b'], [3, 4]];
      const removed = arr.splice(1, 2, [9, 9]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [9, 9]]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([['a', 'b'], [3, 4]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0072
     * @tc.name testArraySplice0072
     * @tc.desc Verify splice combined with multiple pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99);
      const pop1: number | undefined = arr.pop();
      const pop2: number | undefined = arr.pop();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1]));
      expect(pop1).assertEqual(4);
      expect(pop2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0073
     * @tc.name testArraySplice0073
     * @tc.desc Verify splice with negative start index and deleteCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-3, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0074
     * @tc.name testArraySplice0074
     * @tc.desc Verify splice with negative start index and insert elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(-2, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99, 100, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0075
     * @tc.name testArraySplice0075
     * @tc.desc Verify splice with deleteCount of 0 and insert elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(2, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99, 100, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0076
     * @tc.name testArraySplice0076
     * @tc.desc Verify splice with deleteCount greater than array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 5);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0077
     * @tc.name testArraySplice0077
     * @tc.desc Verify splice with deleteCount of 0 and insert elements at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(5, 0, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 99]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0078
     * @tc.name testArraySplice0078
     * @tc.desc Verify splice with deleteCount of 0 and insert elements at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(0, 0, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([99, 1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0079
     * @tc.name testArraySplice0079
     * @tc.desc Verify splice with deleteCount of 0 and insert elements at negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(-1, 0, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0080
     * @tc.name testArraySplice0080
     * @tc.desc Verify splice with deleteCount of 0 and insert multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(1, 0, 99, 100);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 100, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0081
     * @tc.name testArraySplice0081
     * @tc.desc Verify splice works correctly on sparse arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      const removed = arr.splice(1, 2, 99);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual("1,99,,5")
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([undefined, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0082
     * @tc.name testArraySplice0082
     * @tc.desc Verify splice can be applied to array-like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('testArraySplice0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   expect(testArraySpliceJs0082()).assertDeepEquals([1, 99, 3, 3]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0083
     * @tc.name testArraySplice0083
     * @tc.desc Verify splice combined with map on array of numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99, 100);
      const mapped: number[] = arr.map(x => (x * 2) as number);
      expect(JSON.stringify(mapped)).assertEqual(JSON.stringify([2, 198, 200, 8]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0084
     * @tc.name testArraySplice0084
     * @tc.desc Verify splice combined with filter to remove specific elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(1, 2, 99);
      const filtered: number[] = arr.filter(x => x > 2);
      expect(JSON.stringify(filtered)).assertEqual(JSON.stringify([99, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0085
     * @tc.name testArraySplice0085
     * @tc.desc Verify splice combined with reduce to sum array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99);
      const sum: number = arr.reduce<number>((acc, curr) => acc + curr, 0);
      expect(sum).assertEqual(1 + 99 + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0086
     * @tc.name testArraySplice0086
     * @tc.desc Verify splice on sparse array combined with map and filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      arr.splice(2, 1, 99);
      const processed: number[] = arr.map(x => x ? x * 2.0 : 0.0).filter(x => x > 0);
      expect(processed.length).assertEqual(3);
      expect(processed.toString()).assertEqual("2,198,10")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0087
     * @tc.name testArraySplice0087
     * @tc.desc Verify splice on array-like object combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('testArraySplice0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   expect(testArraySpliceJs0087()).assertDeepEquals([2, 198, 6]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0088
     * @tc.name testArraySplice0088
     * @tc.desc Verify splice inserts elements and concatenates with another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 1, 99);
      const combined: number[] = arr.concat([100, 101] as number[]);
      expect(JSON.stringify(combined)).assertEqual(JSON.stringify([1, 99, 3, 100, 101]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0089
     * @tc.name testArraySplice0089
     * @tc.desc Verify splice removes elements and then reverses array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2);
      arr.reverse();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([4, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0090
     * @tc.name testArraySplice0090
     * @tc.desc Verify splice removes and inserts elements in combination with sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 2, 4, 3];
      arr.splice(1, 2, 99);
      arr.sort((a, b) => (a - b).toInt());
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([3, 5, 99]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0091
     * @tc.name testArraySplice0091
     * @tc.desc Verify splice removes objects from array of interfaces and inserts new ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item91[] = [{ id: 1, name: 'a' }, { id: 2, name: 'b' }, { id: 3, name: 'c' }];
      const removed: Item91[] = arr.splice(1, 1, { id: 99, name: 'x' });
      expect(arr).assertDeepEquals([{ id: 1, name: 'a' }, { id: 99, name: 'x' }, { id: 3, name: 'c' }] as Item91 []);
      expect(removed).assertDeepEquals([{ id: 2, name: 'b' }] as Item91 []);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0092
     * @tc.name testArraySplice0092
     * @tc.desc Verify splice on nested arrays combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(1, 1, [99, 99]);
      const flattened = arr.flat();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([[1, 2], [99, 99], [5, 6]]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[3, 4]]));
      expect(JSON.stringify(flattened)).assertEqual(JSON.stringify([1, 2, 99, 99, 5, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0093
     * @tc.name testArraySplice0093
     * @tc.desc Verify splice on class instances array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 1, new C(99));
      expect(JSON.stringify(arr.map((c:C): number => c.v))).assertEqual(JSON.stringify([1, 99, 3]));
      expect(JSON.stringify(removed.map((c:C): number => c.v))).assertEqual(JSON.stringify([2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0094
     * @tc.name testArraySplice0094
     * @tc.desc Verify splice combined with reduce on numbers array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(2, 2, 99, 100);
      const sum: number = arr.reduce<number>((acc, curr) => acc + curr, 0);
      expect(sum).assertEqual(1 + 2 + 99 + 100 + 5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0095
     * @tc.name testArraySplice0095
     * @tc.desc Verify splice with negative start combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(-2, 1, 99);
      const filtered: number[] = arr.filter(x => x > 2);
      expect(JSON.stringify(filtered)).assertEqual(JSON.stringify([3, 99, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0096
     * @tc.name testArraySplice0096
     * @tc.desc Verify splice removes from array and concatenates with another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(1, 2);
      const combined: number[] = arr.concat([99, 100] as number[]);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([2, 3]));
      expect(JSON.stringify(combined)).assertEqual(JSON.stringify([1, 4, 99, 100]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0097
     * @tc.name testArraySplice0097
     * @tc.desc Verify splice inserts multiple class instances and map their values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99), new C(100));
      expect(JSON.stringify(arr.map((c:C): number => c.v))).assertEqual(JSON.stringify([1, 99, 100, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0098
     * @tc.name testArraySplice0098
     * @tc.desc Verify splice on sparse array with negative deleteCount is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, 4];
      const removed = arr.splice(1, -1, 99);
      expect(arr.length).assertEqual(5);
      expect(arr.toString()).assertDeepEquals('1,99,,3,4');
      expect(removed).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0099
     * @tc.name testArraySplice0099
     * @tc.desc Verify splice combined with flat on nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number)[] = [1, [2, 3], [4, 5]];
      arr.splice(1, 1, [99, 100]);
      const flat: number[] = arr.flat<number>();
      expect(JSON.stringify(flat)).assertEqual(JSON.stringify([1, 99, 100, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0100
     * @tc.name testArraySplice0100
     * @tc.desc Verify splice with zero deleteCount combined with sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 2, 4, 3];
      arr.splice(2, 0, 99);
      arr.sort((a, b) => (a - b).toInt());
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([2, 3, 4, 5, 99]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0101
     * @tc.name testArraySplice0101
     * @tc.desc Verify splice removes last element and map values in reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(-1, 1);
      const reversed: number[] = arr.reverse().map<number>(x => x * 10);
      expect(JSON.stringify(reversed)).assertEqual(JSON.stringify([30, 20, 10]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0102
     * @tc.name testArraySplice0102
     * @tc.desc Verify splice inserts objects into array and filter based on property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: I102[] = [{ val: 1 }, { val: 2 }, { val: 3 }];
      arr.splice(1, 1, { val: 99 }, { val: 100 });
      const filtered: I102[] = arr.filter(x => x.val > 2);
      expect(JSON.stringify(filtered.map<number>(x => x.val))).assertEqual(JSON.stringify([99, 100, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0103
     * @tc.name testArraySplice0103
     * @tc.desc Verify splice on array-like object with negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('testArraySplice0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   expect(testArraySpliceJs0103()).assertDeepEquals([1, 99, 3, 3]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0104
     * @tc.name testArraySplice0104
     * @tc.desc Verify splice combined with reduce and class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: C[] = [new C(1), new C(2), new C(3)];
      arr.splice(1, 1, new C(99));
      const sum: number = arr.reduce<number>((acc, curr) => acc + curr.v, 0);
      expect(sum).assertEqual(1 + 99 + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0105
     * @tc.name testArraySplice0105
     * @tc.desc Verify splice removes elements and flattens nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number)[] = [1, [2, 3], 4];
      const removed: (number[] | number)[] = arr.splice(1, 1, [99, 100]);
      const flat: number[] = arr.flat<number>();
      expect(JSON.stringify(flat)).assertEqual(JSON.stringify([1, 99, 100, 4]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[2, 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0106
     * @tc.name testArraySplice0106
     * @tc.desc Verify splice inserts into sparse array and map non-empty elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      arr.splice(2, 1, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, null,99, null,5]));
      const processed: number[] = arr.map<number>(x => x ?? 0);
      expect(JSON.stringify(processed)).assertEqual(JSON.stringify([1, 0, 99, 0, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0107
     * @tc.name testArraySplice0107
     * @tc.desc Verify splice removes last element of nested array and reverse flatten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(-1, 1);
      const flat = arr.flat<number>().reverse();
      expect(JSON.stringify(flat)).assertEqual(JSON.stringify([4, 3, 2, 1]));
      expect(JSON.stringify(removed)).assertEqual(JSON.stringify([[5, 6]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0108
     * @tc.name testArraySplice0108
     * @tc.desc Verify splice combined with object array sort by property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: I108[] = [{ val: 3 }, { val: 1 }, { val: 2 }];
      arr.splice(1, 1, { val: 99 });
      arr.sort((a: I108, b: I108): int => (a.val - b.val).toInt());
      expect(JSON.stringify(arr.map<number>(x => x.val))).assertEqual(JSON.stringify([2, 3, 99]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0109
     * @tc.name testArraySplice0109
     * @tc.desc Verify splice on array-like object with multiple inserts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('testArraySplice0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   expect(testArraySpliceJs0109()).assertDeepEquals([1, 99, 100, 2, 4]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Splice_0110
     * @tc.name testArraySplice0110
     * @tc.desc Verify splice combined with reduce on sparse array and negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArraySplice0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, 4];
      arr.splice(-2, 1, 99);
      const sum = arr.reduce<number>((acc, x) => acc! + (x ?? 0), 0);
      expect(sum).assertEqual(1 + 0 + 99 + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0001
     * @tc.name testSparseArray0001
     * @tc.desc Verify sparse array processed by map then filter preserves non-empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      const mapped: number[] = arr.map((x: number | undefined): number => x ?? 0);
      const filtered: number[] = mapped.filter(x => x > 0);
      expect(JSON.stringify(filtered)).assertEqual(JSON.stringify([1, 3, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0002
     * @tc.name testSparseArray0002
     * @tc.desc Verify sparse array after splice and reduce sums correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, 2, undefined, 4,];
      arr.splice(1, 1, 10);
      const sum: number = arr.reduce<number>((acc, curr) => acc + (curr ?? 0), 0);
      expect(sum).assertEqual(10 + 0 + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0003
     * @tc.name testSparseArray0003
     * @tc.desc Verify sparse array concat with normal array fills undefined as empty slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const combined: (number | undefined)[] = arr.concat([4, 5] as (number | undefined)[]);
      expect(combined[1]).assertEqual(undefined);
      expect(combined.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0004
     * @tc.name testSparseArray0004
     * @tc.desc Verify sparse array reversed keeps undefined positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, 4];
      arr.reverse();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([4, 3, undefined, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0005
     * @tc.name testSparseArray0005
     * @tc.desc Verify sparse array sort moves undefined to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, 3, 1, undefined, 2];
      arr.sort((a, b): int => ((a ?? Infinity) - (b ?? Infinity)).toInt());
      expect(arr[0]).assertEqual(1);
      expect(arr[arr.length-1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0006
     * @tc.name testSparseArray0006
     * @tc.desc Verify sparse array mapped then flat removes nested arrays but keeps undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | undefined)[] = [[1, 2], undefined, [3]];
      const flattened: (number | undefined)[] = arr.flat<number | undefined>();
      expect(JSON.stringify(flattened)).assertEqual(JSON.stringify([1, 2, undefined, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0007
     * @tc.name testSparseArray0007
     * @tc.desc Verify sparse array filter then splice behaves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: (number | undefined)[] = [undefined, 1, undefined, 2, 3];
      arr = arr.filter(x => x !== undefined);
      arr.splice(1, 1, 99);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 99, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0008
     * @tc.name testSparseArray0008
     * @tc.desc Verify sparse array reduceRight sums correctly from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 2, 3];
      const sum: number = arr.reduceRight<number>((acc, curr) => acc + (curr ?? 0), 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0009
     * @tc.name testSparseArray0009
     * @tc.desc Verify sparse array joined into string treats undefined as empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 2];
      const joined: string = arr.join('-');
      expect(joined).assertEqual('1--2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Sparse_0010
     * @tc.name testSparseArray0010
     * @tc.desc Verify sparse array with fill replaces undefined correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSparseArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined, 3];
      arr.fill(0, 0, 2);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([0, 0, 3]));
    });

  });
}