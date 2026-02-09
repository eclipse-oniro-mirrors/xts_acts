/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function ArrayPushTest() {
  describe('ArrayPushTest', () => {
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
     * @tc.name   testArrayPush0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0001
     * @tc.desc   Verify push single number element increases length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const len = arr.push(5);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.name   testArrayPush0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0002
     * @tc.desc   Verify push multiple number elements returns new length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      const len = arr.push(2, 3);
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayPush0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0003
     * @tc.desc   Verify push string element into string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a'];
      const len = arr.push('b');
      expect(len).assertEqual(2);
      expect(arr).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   testArrayPush0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0004
     * @tc.desc   Verify push null element into (number|null)[] array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [10];
      const len = arr.push(null);
      expect(len).assertEqual(2);
      expect(arr[1]).assertEqual(null);
    });

    /**
     * @tc.name   testArrayPush0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0005
     * @tc.desc   Verify push undefined element into (string|undefined)[] array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | undefined)[] = ['x'];
      const len = arr.push(undefined);
      expect(len).assertEqual(2);
      expect(arr[1]).assertEqual(undefined);
    });

    interface Point {
      x: number;
      y: number;
    }

    /**
     * @tc.name   testArrayPush0006
     * @tc.number testArrayPush0006
     * @tc.desc   testArrayPush0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Point[] = [];
      const p: Point = { x: 1, y: 2 };
      const len = arr.push(p);
      expect(len).assertEqual(1);
      expect(arr[0].x).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPush0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0007
     * @tc.desc   Verify push array as element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const len = arr.push([1, 2, 3]);
      expect(len).assertEqual(1);
      expect(arr[0]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayPush0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0008
     * @tc.desc   Verify push multiple string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const len = arr.push('a', 'b', 'c');
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals(['a', 'b', 'c']);
    });

    type FuncType = () => string;
    /**
     * @tc.name   testArrayPush0009
     * @tc.number testArrayPush0009
     * @tc.desc   testArrayPush0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f1: FuncType = () => 'hello';
      const arr: FuncType[] = [];
      const len = arr.push(f1);
      expect(len).assertEqual(1);
      expect(arr[0]()).assertEqual('hello');
    });

    /**
     * @tc.name   testArrayPush0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0010
     * @tc.desc   Verify push different typed elements using union type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [];
      const len = arr.push(1, 'b');
      expect(len).assertEqual(2);
      expect(arr).assertDeepEquals([1, 'b']);
    });

    /**
     * @tc.name   testArrayPush0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0011
     * @tc.desc   Verify push into prefilled array increases length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const len = arr.push(3);
      expect(len).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPush0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0012
     * @tc.desc   Verify push zero elements returns current length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      const len = arr.push();
      expect(len).assertEqual(1);
      expect(arr).assertDeepEquals([1]);
    });

    /**
     * @tc.name   testArrayPush0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0013
     * @tc.desc   Verify push NaN into number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const len = arr.push(NaN);
      expect(len).assertEqual(1);
      expect(Number.isNaN(arr[0])).assertEqual(true);
    });

    /**
     * @tc.name   testArrayPush0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0014
     * @tc.desc   Verify push Infinity into number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const len = arr.push(Infinity);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(Infinity);
    });

    /**
     * @tc.name   testArrayPush0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0015
     * @tc.desc   Verify push negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const len = arr.push(-1, -2);
      expect(len).assertEqual(2);
      expect(arr).assertDeepEquals([-1, -2]);
    });

    /**
     * @tc.name   testArrayPush0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0016
     * @tc.desc   Verify push empty string into string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const len = arr.push('');
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.name   testArrayPush0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0017
     * @tc.desc   Verify push boolean values into boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [];
      const len = arr.push(true, false);
      expect(len).assertEqual(2);
      expect(arr).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArrayPush0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0018
     * @tc.desc   Verify push Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Date[] = [];
      const d: Date = new Date();
      const len = arr.push(d);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(d);
    });

    /**
     * @tc.name   testArrayPush0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0019
     * @tc.desc   Verify push multiple mixed union type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | string)[] = [];
      const len = arr.push(5, null, 'x');
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([5, null, 'x']);
    });

    /**
     * @tc.name   testArrayPush0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0020
     * @tc.desc   Verify push returns correct length after many elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(5);
      expect(arr).assertDeepEquals([0, 1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArrayPush0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0021
     * @tc.desc   Verify push large number of elements increases length correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 100; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.name   testArrayPush0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0022
     * @tc.desc   Verify push multiple objects with different interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface A { a: number; }

      interface B { b: string; }

      const arr: (A | B)[] = [];
      const objA: A = { a: 1 };
      const objB: B = { b: 'x' };
      const len = arr.push(objA, objB);
      expect(len).assertEqual(2);
      expect((arr[0] as A).a).assertEqual(1);
      expect((arr[1] as B).b).assertEqual('x');
    });

    /**
     * @tc.name   testArrayPush0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0023
     * @tc.desc   Verify push nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const len = arr.push([1, 2], [3, 4]);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([1, 2]);
      expect(arr[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArrayPush0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0024
     * @tc.desc   Verify push array into itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type SelfArray = SelfArray[];
      const arr: SelfArray = [];
      const len = arr.push(arr);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(arr);
    });

    /**
     * @tc.name   testArrayPush0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0025
     * @tc.desc   Verify push Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPush0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const s1 = Symbol('s1');
    //   const s2 = Symbol('s2');
    //   const arr: symbol[] = [];
    //   const len = arr.push(s1, s2);
    //   expect(len).assertEqual(2);
    //   expect(arr[0]).assertEqual(s1);
    //   expect(arr[1]).assertEqual(s2);
    // });

    /**
     * @tc.name   testArrayPush0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0026
     * @tc.desc   Verify push BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: bigint[] = [];
      const len = arr.push(10n, 20n);
      expect(len).assertEqual(2);
      expect(arr[1]).assertEqual(20n);
    });

    type VoidFunc = () => void;
    /**
     * @tc.name   testArrayPush0027
     * @tc.number testArrayPush0027
     * @tc.desc   testArrayPush0027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f: VoidFunc = () => {
      };
      const arr: VoidFunc[] = [];
      const len = arr.push(f);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(f);
    });

    /**
     * @tc.name   testArrayPush0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0028
     * @tc.desc   Verify push multiple union type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | null)[] = [];
      const len = arr.push(1, 'x', null);
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([1, 'x', null]);
    });

    /**
     * @tc.name   testArrayPush0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0029
     * @tc.desc   Verify push empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyObj {
      };
      const arr: MyObj[] = [];
      const obj = new MyObj();
      const len = arr.push(obj);
      expect(len).assertEqual(1);
      expect(Object.keys(arr[0]).length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayPush0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0030
     * @tc.desc   Verify push multiple empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const len = arr.push([], [], []);
      expect(len).assertEqual(3);
      expect(arr[1]).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArrayPush0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0031
     * @tc.desc   Verify push undefined and null together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (undefined | null)[] = [];
      const len = arr.push(undefined, null);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(null);
    });

    /**
     * @tc.name   testArrayPush0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0032
     * @tc.desc   Verify push multiple boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [];
      const len = arr.push(true, true, false);
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   testArrayPush0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0033
     * @tc.desc   Verify push array with mixed nested types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | string[])[] = [];
      const len = arr.push([1, 2], ['a', 'b']);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([1, 2]);
      expect(arr[1]).assertDeepEquals(['a', 'b']);
    });

    interface OptionalProp {
      x?: number;
      y?: number;
    }

    /**
     * @tc.name   testArrayPush0034
     * @tc.number testArrayPush0034
     * @tc.desc   testArrayPush0034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: OptionalProp[] = [];
      const len = arr.push({ x: 1 }, {});
      expect(len).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].x).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayPush0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0035
     * @tc.desc   Verify push array of objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface A {
        a: number;
      }

      const arr: A[] = [];
      const len = arr.push({ a: 1 }, { a: 2 });
      expect(len).assertEqual(2);
      expect(arr[0].a).assertEqual(1);
      expect(arr[1].a).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0036
     * @tc.desc   Verify push objects with interface type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface ObjA { a: number; }

      const arr: ObjA[] = [];
      const obj1: ObjA = { a: 10 };
      const obj2: ObjA = { a: 20 };
      const len = arr.push(obj1, obj2);
      expect(len).assertEqual(2);
      expect(arr[0].a).assertEqual(10);
      expect(arr[1].a).assertEqual(20);
    });

    /**
     * @tc.name   testArrayPush0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0037
     * @tc.desc   Verify push array of interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Point {
        x: number;
        y: number;
      }

      const arr: Point[] = [];
      const p1: Point = { x: 1, y: 2 };
      const p2: Point = { x: 3, y: 4 };
      const len = arr.push(p1, p2);
      expect(len).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPush0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0038
     * @tc.desc   Verify push nested arrays of numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const sub1: number[] = [1, 2];
      const sub2: number[] = [3, 4];
      const len = arr.push(sub1, sub2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([1, 2]);
      expect(arr[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArrayPush0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0039
     * @tc.desc   Verify push string elements including empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const len = arr.push('x', '');
      expect(len).assertEqual(2);
      expect(arr).assertDeepEquals(['x', '']);
    });

    /**
     * @tc.name   testArrayPush0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0040
     * @tc.desc   Verify push boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [];
      const len = arr.push(true, false);
      expect(len).assertEqual(2);
      expect(arr).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArrayPush0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0041
     * @tc.desc   Verify push BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: bigint[] = [];
      const len = arr.push(1n, 2n);
      expect(len).assertEqual(2);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.name   testArrayPush0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0042
     * @tc.desc   Verify push Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPush0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const s1 = Symbol('a');
    //   const s2 = Symbol('b');
    //   const arr: symbol[] = [];
    //   const len = arr.push(s1, s2);
    //   expect(len).assertEqual(2);
    //   expect(arr[0]).assertEqual(s1);
    //   expect(arr[1]).assertEqual(s2);
    // });

    /**
     * @tc.name   testArrayPush0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0043
     * @tc.desc   Verify push function references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Func = () => string;
      const f1: Func = () => 'hello';
      const f2: Func = () => 'world';
      const arr: Func[] = [];
      const len = arr.push(f1, f2);
      expect(len).assertEqual(2);
      expect(arr[0]()).assertEqual('hello');
      expect(arr[1]()).assertEqual('world');
    });

    /**
     * @tc.name   testArrayPush0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0044
     * @tc.desc   Verify push Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const d1 = new Date();
      const d2 = new Date();
      const arr: Date[] = [];
      const len = arr.push(d1, d2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(d1);
      expect(arr[1]).assertEqual(d2);
    });

    /**
     * @tc.name   testArrayPush0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0045
     * @tc.desc   Verify push objects implementing multiple interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface I1 { a: number; };

      interface Multi extends I1 { b: string; };
      const arr: Multi[] = [];
      const obj1: Multi = { a: 1, b: 'x' };
      const obj2: Multi = { a: 2, b: 'y' };
      const len = arr.push(obj1, obj2);
      expect(len).assertEqual(2);
      expect(arr[0].a).assertEqual(1);
      expect(arr[1].b).assertEqual('y');
    });

    /**
     * @tc.name   testArrayPush0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0046
     * @tc.desc   Verify push array of arrays with mixed lengths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const sub1: number[] = [1];
      const sub2: number[] = [2, 3];
      const len = arr.push(sub1, sub2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([1]);
      expect(arr[1]).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArrayPush0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0047
     * @tc.desc   Verify push recursive type array (array of itself)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type SelfArray = SelfArray[];
      const arr: SelfArray = [];
      const len = arr.push(arr);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(arr);
    });

    /**
     * @tc.name   testArrayPush0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0048
     * @tc.desc   Verify push array of interfaces with optional properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Optional {
        x?: number;
        y?: string;
      }

      const arr: Optional[] = [];
      const len = arr.push({ x: 1 }, {});
      expect(len).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].x).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayPush0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0049
     * @tc.desc   Verify push object instances of class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyObj {
        a: number;

        constructor(a: number) {
          this.a = a;
        }
      }

      const arr: MyObj[] = [];
      const obj1 = new MyObj(1);
      const obj2 = new MyObj(2);
      const len = arr.push(obj1, obj2);
      expect(len).assertEqual(2);
      expect(arr[0].a).assertEqual(1);
      expect(arr[1].a).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0050
     * @tc.desc   Verify push multiple mixed type elements using interfaces and classes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface IVal { v: number; }

      class CVal {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: (IVal | CVal)[] = [];
      const i1: IVal = { v: 10 };
      const c1 = new CVal(20);
      const len = arr.push(i1, c1);
      expect(len).assertEqual(2);
      expect(arr[0].v).assertEqual(10);
      expect(arr[1].v).assertEqual(20);
    });

    /**
     * @tc.name   testArrayPush0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0051
     * @tc.desc   Verify push numbers including negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const len = arr.push(0, -1, 42);
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([0, -1, 42]);
    });

    /**
     * @tc.name   testArrayPush0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0052
     * @tc.desc   Verify push strings including empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      const len = arr.push('hello', '', 'world');
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals(['hello', '', 'world']);
    });

    /**
     * @tc.name   testArrayPush0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0053
     * @tc.desc   Verify push boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [];
      const len = arr.push(true, false, true);
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   testArrayPush0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0054
     * @tc.desc   Verify push BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: bigint[] = [];
      const len = arr.push(100n, 200n);
      expect(len).assertEqual(2);
      expect(arr[1]).assertEqual(200n);
    });

    /**
     * @tc.name   testArrayPush0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0055
     * @tc.desc   Verify push Symbol values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testArrayPush0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const s1 = Symbol('s1');
    //   const s2 = Symbol('s2');
    //   const arr: symbol[] = [];
    //   const len = arr.push(s1, s2);
    //   expect(len).assertEqual(2);
    //   expect(arr[0]).assertEqual(s1);
    //   expect(arr[1]).assertEqual(s2);
    // });

    /**
     * @tc.name   testArrayPush0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0056
     * @tc.desc   Verify push function references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Func = () => string;
      const f1: Func = () => 'a';
      const f2: Func = () => 'b';
      const arr: Func[] = [];
      const len = arr.push(f1, f2);
      expect(len).assertEqual(2);
      expect(arr[0]()).assertEqual('a');
      expect(arr[1]()).assertEqual('b');
    });

    /**
     * @tc.name   testArrayPush0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0057
     * @tc.desc   Verify push object implementing interface declared inside function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj {
        x: number;
        y: string;
      }

      const arr: Obj[] = [];
      const obj1: Obj = { x: 1, y: 'a' };
      const obj2: Obj = { x: 2, y: 'b' };
      const len = arr.push(obj1, obj2);
      expect(len).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual('b');
    });

    /**
     * @tc.name   testArrayPush0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0058
     * @tc.desc   Verify push class instances declared inside function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Obj {
        x: number;

        constructor(x: number) {
          this.x = x;
        }
      }

      const arr: Obj[] = [];
      const o1 = new Obj(1);
      const o2 = new Obj(2);
      const len = arr.push(o1, o2);
      expect(len).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].x).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0059
     * @tc.desc   Verify push array of numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const sub1: number[] = [1, 2];
      const sub2: number[] = [3, 4];
      const len = arr.push(sub1, sub2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([1, 2]);
      expect(arr[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArrayPush0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0060
     * @tc.desc   Verify push nested array including empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const sub1: number[] = [];
      const sub2: number[] = [1];
      const len = arr.push(sub1, sub2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([]);
      expect(arr[1]).assertDeepEquals([1]);
    });

    /**
     * @tc.name   testArrayPush0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0061
     * @tc.desc   Verify push recursive array (array contains itself)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type SelfArray = SelfArray[];
      const arr: SelfArray = [];
      const len = arr.push(arr);
      expect(len).assertEqual(1);
      expect(arr[0]).assertEqual(arr);
    });

    /**
     * @tc.name   testArrayPush0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0062
     * @tc.desc   Verify push objects with optional properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Opt {
        a?: number;
        b?: string;
      }

      const arr: Opt[] = [];
      const len = arr.push({ a: 1 }, {});
      expect(len).assertEqual(2);
      expect(arr[0].a).assertEqual(1);
      expect(arr[1].b).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayPush0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0063
     * @tc.desc   Verify push Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Date[] = [];
      const d1 = new Date();
      const d2 = new Date();
      const len = arr.push(d1, d2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(d1);
      expect(arr[1]).assertEqual(d2);
    });

    /**
     * @tc.name   testArrayPush0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0064
     * @tc.desc   Verify push RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: RegExp[] = [];
      const r1 = /abc/;
      const r2 = new RegExp('xyz');
      const len = arr.push(r1, r2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(r1);
      expect(arr[1].source).assertEqual('xyz');
    });

    /**
     * @tc.name   testArrayPush0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0065
     * @tc.desc   Verify push multiple types using interface and class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface IVal { v: number; }

      class CVal {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: (IVal | CVal)[] = [];
      const i1: IVal = { v: 1 };
      const c1 = new CVal(2);
      const len = arr.push(i1, c1);
      expect(len).assertEqual(2);
      expect(arr[0].v).assertEqual(1);
      expect(arr[1].v).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0066
     * @tc.desc   Verify push functions returning void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type FuncVoid = () => void;
      const f1: FuncVoid = () => {
      };
      const f2: FuncVoid = () => {
      };
      const arr: FuncVoid[] = [];
      const len = arr.push(f1, f2);
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0067
     * @tc.desc   Verify push async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type AsyncFunc = () => Promise<number>;
      const f1: AsyncFunc = async () => 1;
      const f2: AsyncFunc = async () => 2;
      const arr: AsyncFunc[] = [];
      const len = arr.push(f1, f2);
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0068
     * @tc.desc   Verify push objects with inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Base { a: number; }

      interface Derived extends Base { b: string; }

      const arr: Derived[] = [];
      const d1: Derived = { a: 1, b: 'x' };
      const d2: Derived = { a: 2, b: 'y' };
      const len = arr.push(d1, d2);
      expect(len).assertEqual(2);
      expect(arr[0].b).assertEqual('x');
      expect(arr[1].a).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0069
     * @tc.desc   Verify push array of empty objects with interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Empty {}

      const arr: Empty[] = [];
      const len = arr.push({}, {});
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0070
     * @tc.desc   Verify push multiple elements including numbers and objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { a: number; }

      const arr: (number | Obj)[] = [];
      const len = arr.push(1, { a: 2 }, 3);
      expect(len).assertEqual(3);
      expect((arr[1] as Obj).a).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0071
     * @tc.desc   Verify push arrays with mixed nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { x: number; }

      const arr: (Obj | number[])[] = [];
      const len = arr.push({ x: 1 }, [1, 2]);
      expect(len).assertEqual(2);
      expect((arr[0] as Obj).x).assertEqual(1);
      expect(arr[1]).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayPush0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0072
     * @tc.desc   Verify push multiple nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][][] = [];
      const len = arr.push([[1]], [[2, 3]]);
      expect(len).assertEqual(2);
      expect(arr[0]).assertDeepEquals([[1]]);
      expect(arr[1]).assertDeepEquals([[2, 3]]);
    });

    /**
     * @tc.name   testArrayPush0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0073
     * @tc.desc   Verify push arrays with self-reference nested inside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type SelfArray = (SelfArray | number)[];
      const arr: SelfArray = [];
      const len = arr.push(arr, 1);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(arr);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPush0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0074
     * @tc.desc   Verify push objects with optional and required properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj {
        a: number;
        b?: string;
      }

      const arr: Obj[] = [];
      const len = arr.push({ a: 1 }, { a: 2, b: 'x' });
      expect(len).assertEqual(2);
      expect(arr[0].b).assertEqual(undefined);
      expect(arr[1].b).assertEqual('x');
    });

    /**
     * @tc.name   testArrayPush0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0075
     * @tc.desc   Verify push Date and RegExp objects together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (Date | RegExp)[] = [];
      const d = new Date();
      const r = /abc/;
      const len = arr.push(d, r);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(d);
      expect(arr[1]).assertEqual(r);
    });

    /**
     * @tc.name   testArrayPush0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0076
     * @tc.desc   Verify push objects created from class and interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface IVal { x: number; }

      class CVal {
        x: number;

        constructor(x: number) {
          this.x = x;
        }
      }

      const arr: (IVal | CVal)[] = [];
      const i: IVal = { x: 1 };
      const c = new CVal(2);
      const len = arr.push(i, c);
      expect(len).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].x).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0077
     * @tc.desc   Verify push arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (() => number)[] = [];
      const f1 = () => 1;
      const f2 = () => 2;
      const len = arr.push(f1, f2);
      expect(len).assertEqual(2);
      expect(arr[0]()).assertEqual(1);
      expect(arr[1]()).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0078
     * @tc.desc   Verify push arrays containing objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { a: number; }

      const arr: Obj[][] = [];
      const sub: Obj[] = [{ a: 1 }];
      const len = arr.push(sub);
      expect(len).assertEqual(1);
      expect(arr[0][0].a).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPush0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0079
     * @tc.desc   Verify push arrays containing empty interface objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Empty {}

      const arr: Empty[][] = [];
      const len = arr.push([{}], [{}]);
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0080
     * @tc.desc   Verify push multiple mixed types including objects, numbers, strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { x: number; }

      const arr: (Obj | number | string)[] = [];
      const len = arr.push({ x: 1 }, 42, 'test');
      expect(len).assertEqual(3);
      expect((arr[0] as Obj).x).assertEqual(1);
      expect(arr[1]).assertEqual(42);
      expect(arr[2]).assertEqual('test');
    });

    /**
     * @tc.name   testArrayPush0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0081
     * @tc.desc   Verify push elements and use pop afterwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const len1 = arr.push(1, 2, 3);
      const last = arr.pop();
      expect(len1).assertEqual(3);
      expect(last).assertEqual(3);
      expect(arr).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayPush0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0082
     * @tc.desc   Verify push elements and check length consistency with concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const len = arr1.push(...arr2);
      const concatArr = [1, 2].concat(arr2);
      expect(len).assertEqual(4);
      expect(arr1).assertDeepEquals(concatArr);
    });

    /**
     * @tc.name   testArrayPush0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0083
     * @tc.desc   Verify push multiple object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { x: number; }

      const o1: Obj = { x: 1 };
      const o2: Obj = { x: 2 };
      const arr: Obj[] = [];
      const len = arr.push(o1, o2);
      expect(len).assertEqual(2);
      expect(arr[0]).assertEqual(o1);
      expect(arr[1]).assertEqual(o2);
    });

    /**
     * @tc.name   testArrayPush0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0084
     * @tc.desc   Verify push nested arrays and access inner elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const nested1: number[] = [1, 2];
      const nested2: number[] = [3, 4];
      arr.push(nested1, nested2);
      expect(arr[0][1]).assertEqual(2);
      expect(arr[1][0]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPush0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0085
     * @tc.desc   Verify push function references and call them
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Func = (x: number) => number;
      const f1: Func = x => x + 1;
      const f2: Func = x => x * 2;
      const arr: Func[] = [];
      arr.push(f1, f2);
      expect(arr[0](5)).assertEqual(6);
      expect(arr[1](3)).assertEqual(6);
    });

    /**
     * @tc.name   testArrayPush0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0086
     * @tc.desc   Verify push objects with nested properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface GeneratedTypeLiteralInterface_1 {
        a: number;
      }

      interface Nested { inner: GeneratedTypeLiteralInterface_1 }

      const arr: Nested[] = [];
      arr.push({ inner: { a: 10 } });
      expect(arr[0].inner.a).assertEqual(10);
    });

    /**
     * @tc.name   testArrayPush0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0087
     * @tc.desc   Verify push array of mixed types including numbers and objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: (number | Obj)[] = [];
      arr.push(1, { val: 2 }, 3);
      expect(arr[0]).assertEqual(1);
      expect((arr[1] as Obj).val).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPush0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0088
     * @tc.desc   Verify push self-referencing array inside itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type SelfArray = (number | SelfArray)[];
      const arr: SelfArray = [];
      arr.push(arr);
      expect(arr[0]).assertEqual(arr);
    });

    /**
     * @tc.name   testArrayPush0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0089
     * @tc.desc   Verify push elements after slice copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2, 3];
      const arr2 = arr1.slice();
      arr2.push(4);
      expect(arr2.length).assertEqual(4);
      expect(arr1.length).assertEqual(3);
    });

    /**
     * @tc.name   testArrayPush0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0090
     * @tc.desc   Verify push elements after map transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = arr1.map(x => x * 2);
      arr2.push(10);
      expect(arr2).assertDeepEquals([2, 4, 10]);
      expect(arr1).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayPush0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0091
     * @tc.desc   Verify push multiple arrays using spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const sub1 = [1, 2];
      const sub2 = [3, 4];
      arr.push(...sub1, ...sub2);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArrayPush0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0092
     * @tc.desc   Verify push after filter returns new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = [1, 2, 3, 4];
      const arr2: number[] = [];
      arr2.push(...arr1.filter(x => x % 2 === 0));
      expect(arr2).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   testArrayPush0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0093
     * @tc.desc   Verify push objects and then sort array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      arr.push({ val: 3 }, { val: 1 }, { val: 2 });
      arr.sort((a, b) => a.val - b.val);
      expect(arr.map(e => e.val)).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayPush0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0094
     * @tc.desc   Verify push objects and then reverse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      arr.push({ val: 1 }, { val: 2 }, { val: 3 });
      arr.reverse();
      expect(arr.map(e => e.val)).assertDeepEquals([3, 2, 1]);
    });

    /**
     * @tc.name   testArrayPush0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0095
     * @tc.desc   Verify push elements then use indexOf to locate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [];
      arr.push(1, 'a', 2, 'b');
      expect(arr.indexOf('a')).assertEqual(1);
      expect(arr.indexOf(2)).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0096
     * @tc.desc   Verify push objects then use find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      arr.push({ val: 1 }, { val: 2 }, { val: 3 });
      const found = arr.find(e => e.val === 2);
      expect(found?.val).assertEqual(2);
    });

    /**
     * @tc.name   testArrayPush0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0097
     * @tc.desc   Verify push elements then use forEach to iterate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1, 2, 3);
      let sum = 0;
      arr.forEach(v => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayPush0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0098
     * @tc.desc   Verify push nested objects and check deep equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Inner {
        a: number,
        b: string
      };

      interface Nested { inner: Inner };
      const arr: Nested[] = [];
      arr.push({ inner: { a: 1, b: 'x' } }, { inner: { a: 2, b: 'y' } });
      expect(arr[0].inner).assertDeepEquals({ a: 1, b: 'x' });
      expect(arr[1].inner).assertDeepEquals({ a: 2, b: 'y' });
    });

    /**
     * @tc.name   testArrayPush0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0099
     * @tc.desc   Verify push elements and then use every method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(2, 4, 6);
      const allEven = arr.every(v => v % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.name   testArrayPush0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0100
     * @tc.desc   Verify push mixed types and then use some method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [];
      arr.push(1, 'a', true, false, 2);
      const hasString = arr.some(v => typeof v === 'string');
      const hasBoolean = arr.some(v => typeof v === 'boolean');
      expect(hasString).assertTrue();
      expect(hasBoolean).assertTrue();
    });

    /**
     * @tc.name   testArrayPush0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0101
     * @tc.desc   Verify push multi-dimensional arrays and access inner arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][][] = [];
      arr.push([[1, 2], [3, 4]]);
      expect(arr[0][1][1]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayPush0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0102
     * @tc.desc   Verify push objects and modify them after push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      const o: Obj = { val: 10 };
      arr.push(o);
      o.val = 20;
      expect(arr[0].val).assertEqual(20);
    });

    /**
     * @tc.name   testArrayPush0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0103
     * @tc.desc   Verify push elements and reduce to sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1, 2, 3, 4);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name   testArrayPush0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0104
     * @tc.desc   Verify push nested arrays and flatten with flat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number[] | number)[] = [];
      arr.push([1, 2], [3, 4]);
      const flatArr = arr.flat();
      expect(flatArr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArrayPush0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0105
     * @tc.desc   Verify push elements then use flatMap for transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1, 2, 3);
      const result = arr.flatMap(x => [x, x * 2]);
      expect(result).assertDeepEquals([1, 2, 2, 4, 3, 6]);
    });

    /**
     * @tc.name   testArrayPush0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0106
     * @tc.desc   Verify push arrays with reference and modify inner array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const inner: number[] = [1, 2];
      const arr: number[][] = [];
      arr.push(inner);
      inner.push(3);
      expect(arr[0]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayPush0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0107
     * @tc.desc   Verify push elements and then use splice to remove middle element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1, 2, 3, 4);
      const removed = arr.splice(1, 1);
      expect(removed[0]).assertEqual(2);
      expect(arr).assertDeepEquals([1, 3, 4]);
    });

    /**
     * @tc.name   testArrayPush0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0108
     * @tc.desc   Verify push elements and then shift the first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      arr.push('a', 'b', 'c');
      const first = arr.shift();
      expect(first).assertEqual('a');
      expect(arr).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArrayPush0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0109
     * @tc.desc   Verify push elements then unshift new elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(3, 4);
      arr.unshift(1, 2);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArrayPush0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0110
     * @tc.desc   Verify push array with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type SelfArray = (number | SelfArray)[];
      const arr: SelfArray = [];
      arr.push(arr);
      expect(arr[0]).assertEqual(arr);
    });

    /**
     * @tc.name   testArrayPush0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0111
     * @tc.desc   Verify push elements after filter then map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1, 2, 3, 4, 5);
      const result = arr.filter(x => x % 2 === 1).map(x => x * 10);
      expect(result).assertDeepEquals([10, 30, 50]);
    });

    /**
     * @tc.name   testArrayPush0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0112
     * @tc.desc   Verify push objects and then use map to transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      arr.push({ val: 1 }, { val: 2 });
      const mapped = arr.map(o => o.val * 2);
      expect(mapped).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   testArrayPush0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0113
     * @tc.desc   Verify push nested arrays and flatten depth 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][][] = [];
      arr.push([[1, 2], [3, 4]]);
      const flatArr = arr.flat(2);
      expect(flatArr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArrayPush0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0114
     * @tc.desc   Verify push functions and call all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Func = () => number;
      const f1: Func = () => 1;
      const f2: Func = () => 2;
      const arr: Func[] = [];
      arr.push(f1, f2);
      const results = arr.map(f => f());
      expect(results).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayPush0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0115
     * @tc.desc   Verify push objects with nested arrays and modify inner array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { nums: number[]; }

      const arr: Obj[] = [];
      const inner = [1, 2];
      arr.push({ nums: inner });
      inner.push(3);
      expect(arr[0].nums).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayPush0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0116
     * @tc.desc   Verify push mixed types and then use filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [];
      arr.push(1, 'a', true, 2, 'b');
      const numbers = arr.filter(v => typeof v === 'number');
      expect(numbers).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayPush0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0117
     * @tc.desc   Verify push elements and then use findIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      arr.push('a', 'b', 'c');
      const index = arr.findIndex(v => v === 'b');
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayPush0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0118
     * @tc.desc   Verify push objects and then use every to check property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      arr.push({ val: 2 }, { val: 4 }, { val: 6 });
      const allEven = arr.every(o => o.val % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.name   testArrayPush0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0119
     * @tc.desc   Verify push objects and then use some to find condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { val: number; }

      const arr: Obj[] = [];
      arr.push({ val: 1 }, { val: 2 }, { val: 3 });
      const hasGreaterThan2 = arr.some(o => o.val > 2);
      expect(hasGreaterThan2).assertTrue();
    });

    /**
     * @tc.name   testArrayPush0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Push_0120
     * @tc.desc   Verify push elements then use reduceRight for cumulative computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.push(1, 2, 3, 4);
      const result = arr.reduceRight((a, b) => a - b, 0);
      expect(result).assertEqual(-10);
    });

  });
}