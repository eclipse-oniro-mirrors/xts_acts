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

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

class MyClass {}

interface GeneratedObjectLiteralInterface_1 {
  a: number;
}

interface GeneratedObjectLiteralInterface_2 {
  b: number;
}

interface Response {
  data: number[];
}
interface TreeNode {
  id: number;
  children?: TreeNode[];
}
interface Page {
  items: GeneratedTypeLiteralInterface_1[];
}

function flattenTree(nodes: TreeNode[]): TreeNode[] {
  return nodes.flatMap(node => [
    node,
    ...(node.children ? flattenTree(node.children) : [])
  ]);
}

interface GeneratedTypeLiteralInterface_1 {
  id: number;
}
interface DataItem {
  items?: number[];
}

interface GeneratedTypeLiteralInterface_2 {
  price: number;
}
interface Order {
  items: GeneratedTypeLiteralInterface_2[];
}

export default function BuiltinsArrayFlatTest(): void {
  describe("BuiltinsArrayFlatTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name    BuiltinsArrayFlatTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0100
     * @tc.desc    Verify default depth is 1 when no parameter is passed
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], [4, [5]]];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, 2, 3, 4, [5]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0200
     * @tc.desc    Verify passing undefined as depth parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], [4, [5]]];
      const result = arr.flat(1);
      expect(result).assertDeepEquals([1, 2, 3, 4, [5]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0300
     * @tc.desc    Verify calling flat() on one-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.flat();
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0400
     * @tc.desc    Verify calling flat() on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result: number[] = arr.flat();
      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0500
     * @tc.desc    Verify flattening standard two-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[] = arr.flat();
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0600
     * @tc.desc    Verify flattening irregular two-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[1], [2, 3], [4, 5, 6]];
      const result: number[] = arr.flat();
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0700
     * @tc.desc    Verify depth=0 does not flatten array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], [4, [5, 6]]];
      const result = arr.flat(0);
      expect(result).assertDeepEquals([1, [2, 3], [4, [5, 6]]]);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0800
     * @tc.desc    Verify depth=0 on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result: number[] = arr.flat(0) as number[];
      expect(result).assertDeepEquals([]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0900
     * @tc.desc    Verify depth=1 flattens one level
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | number[])[] = [1, [2, [3, [4]]] as number[]];
      const result: (number | number[])[] = arr.flat(1) as (number | number[])[];
      expect(result).assertDeepEquals([1, 2, [3, [4]]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1000
     * @tc.desc    Verify depth=2 flattens two levels
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | number[])[] = [1, [2, [3, [4]]] as number[]];
      const result: (number | number[])[] = arr.flat(2) as (number | number[])[];
      expect(result).assertDeepEquals([1, 2, 3, [4]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1100
     * @tc.desc    Verify depth=2 handles mixed level nesting
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | number[])[] = [[1] as number[], [2, [3]] as number[], [4, [5, [6]]] as number[]];
      const result: (number | number[])[] = arr.flat(2) as (number | number[])[];
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, [6]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1200
     * @tc.desc    Verify Infinity depth completely flattens nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, [4, [5]]]]];
      const result = arr.flat(Infinity);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1300
     * @tc.desc    Verify Infinity depth handles complex irregular nesting
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]], [[4, [5, [6]]]], 7];
      const result = arr.flat(Infinity);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6, 7]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1400
     * @tc.desc    Verify negative depth is treated as 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result: (number | number[])[] = arr.flat(-1) as (number | number[])[];
      expect(result).assertDeepEquals([1, [2, 3]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1500
     * @tc.desc    Verify floating point depth is truncated down
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, [4]]]];
      const result = arr.flat(1);
      expect(result).assertDeepEquals([1, 2, [3, [4]]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1600
     * @tc.desc    Verify NaN depth is treated as 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]]];
      const result = arr.flat(NaN);
      expect(result).assertDeepEquals([1, [2, [3]]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1700
     * @tc.desc    Verify flat removes empty slots in one-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3, undefined, undefined, 6];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, undefined, 3, undefined, undefined, 6]);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1800
     * @tc.desc    Verify flat removes empty slots in nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, undefined, 3], [4, undefined, undefined, 7]];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, undefined, 3, 4, undefined, undefined, 7]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1900
     * @tc.desc    Verify depth=1 removes outer empty slots only
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, [2, undefined, 4], undefined, [5]];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, undefined, 2, undefined, 4, undefined, 5]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2000
     * @tc.desc    Verify Infinity depth removes all empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, [2, undefined, [3, undefined, 5]], undefined, 6];
      const result = arr.flat(Infinity);
      expect(result).assertDeepEquals([1, undefined, 2, undefined, 3, undefined, 5, undefined, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2100
     * @tc.desc    Verify flat on array with only empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: undefined[] = [undefined, undefined, undefined];
      const result: undefined[] = arr.flat() as undefined[];
      expect(result).assertDeepEquals([undefined, undefined, undefined]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2200
     * @tc.desc    Verify flat removes empty slots but keeps explicit undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: (number | undefined)[] = [1, undefined, 3];
      const arr2: (number | undefined)[] = [1, undefined, 3];
      const result1: (number | undefined)[] = arr1.flat() as (number | undefined)[];
      const result2: (number | undefined)[] = arr2.flat() as (number | undefined)[];
      expect(result1).assertDeepEquals([1, undefined, 3]);
      expect(result2).assertDeepEquals([1, undefined, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2300
     * @tc.desc    Verify flat handles null values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, null, [2, null], 3];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, null, 2, null, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2400
     * @tc.desc    Verify flat handles undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, [2, undefined], 3];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, undefined, 2, undefined, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2500
     * @tc.desc    Verify flat handles boolean values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [true, [false, true], false];
      const result = arr.flat();
      expect(result).assertDeepEquals([true, false, true, false]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2600
     * @tc.desc    Verify flat handles positive and negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [+0, [-0, 1], 2];
      const result = arr.flat();
      expect(result).assertDeepEquals([+0, -0, 1, 2]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2700
     * @tc.desc    Verify flat handles Infinity values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [Infinity, [-Infinity, 1], 2];
      const result = arr.flat();
      expect(result).assertDeepEquals([Infinity, -Infinity, 1, 2]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2800
     * @tc.desc    Verify flat handles plain objects (not flattened)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: GeneratedObjectLiteralInterface_1 = {a: 1};
      const arr = [obj, [({ b: 2 } as GeneratedObjectLiteralInterface_2)], 3];
      const result = arr.flat();
      expect(result).assertDeepEquals([obj, {b: 2}, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_2900
     * @tc.desc    Verify flat handles Date objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      const arr = [date, [new Date('2020-01-01')], 1];
      const result = arr.flat();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3000
     * @tc.desc    Verify flat handles RegExp objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const regex = /test/g;
      const arr = [regex, [/pattern/i], 'string'];
      const result = arr.flat();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3100
     * @tc.desc    Verify flat handles functions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fn = (): string => 'test';
      const arr = [fn, [() => {
        return 1;
      }], 2];
      const result = arr.flat();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3200
     * @tc.desc    Verify flat handles class constructors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [MyClass, [Array], Object];
      const result = arr.flat();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3300
     * @tc.desc    Verify flat handles three-level nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[[1, 2]], [[3, 4]], [[5, 6]]];
      const result = arr.flat();
      expect(result).assertDeepEquals([[1, 2], [3, 4], [5, 6]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3400
     * @tc.desc    Verify flat handles deep nested array with depth=1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[[[1]]], [[[2]]]];
      const result = arr.flat(1);
      expect(result).assertDeepEquals([[[1]], [[2]]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3500
     * @tc.desc    Verify flat completely flattens deep nested array with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[[[[[1]]]]], [[[[[2]]]]]];
      const result = arr.flat(Infinity);
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3600
     * @tc.desc    Verify flat handles mixed depth nesting with depth=2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], [[4, 5]], [[[6]]]];
      const result = arr.flat(2);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, [6]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3700
     * @tc.desc    Verify flat handles array with both simple values and nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 'a', [2, 'b'], [[3]], true];
      const result = arr.flat(1);
      expect(result).assertDeepEquals([1, 'a', 2, 'b', [3], true]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3800
     * @tc.desc    Verify flat handles nested empty arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[], [[]], [[[]]]];
      const result1 = arr.flat(1);
      const result2 = arr.flat(2);
      const result3 = arr.flat(3);
      expect(result1).assertDeepEquals([[],[[]]]);
      expect(result2).assertDeepEquals([[]]);
      expect(result3).assertDeepEquals([]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_3900
     * @tc.desc    Verify flat combined with map (flatMap equivalent)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.map(x => [x, x * 2]).flat();
      expect(result).assertDeepEquals([1, 2, 2, 4, 3, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4000
     * @tc.desc    Verify flat handles map with multi-level nesting
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const result1 = arr.map(x => [[x]]).flat(1);
      const result2 = arr.map(x => [[x]]).flat(2);
      expect(result1).assertDeepEquals([[1], [2]]);
      expect(result2).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4100
     * @tc.desc    Verify flat after filter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.filter(sub => sub[0] > 2).flat();
      expect(result).assertDeepEquals([3, 4, 5, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4200
     * @tc.desc    Verify filter after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.flat().filter(x => x > 3);
      expect(result).assertDeepEquals([4, 5, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4300
     * @tc.desc    Verify reduce after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const sum = arr.flat().reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4400
     * @tc.desc    Verify flat after reduce creating nested structure
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.reduce((acc, val) => {
        acc.push([val, val * 2]);
        return acc;
      }, [] as number[][]).flat();
      expect(result).assertDeepEquals([1, 2, 2, 4, 3, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4500
     * @tc.desc    Verify sort after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[3, 1], [6, 2], [5, 4]];
      const result = arr.flat().sort((a, b) => a - b);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4600
     * @tc.desc    Verify flat after slice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.slice(0, 2).flat();
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4700
     * @tc.desc    Verify slice after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.flat().slice(2, 5);
      expect(result).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4800
     * @tc.desc    Verify flat after concat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [[1, 2]];
      const arr2 = [[3, 4]];
      const result = arr1.concat(arr2).flat();
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_4900
     * @tc.desc    Verify concat after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const result = arr.flat().concat([5, 6]);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5000
     * @tc.desc    Verify multiple method chain calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr
        .filter(sub => sub[0] > 1)
        .map(sub => sub.map(x => x * 2))
        .flat()
        .sort((a, b) => b - a);
      expect(result).assertDeepEquals([12, 10, 8, 6]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5100
     * @tc.desc    Verify flat handles mixed number and string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, ['a', 2], ['b', 3]];
      const result = arr.flat();
      expect(result).assertDeepEquals([1, 'a', 2, 'b', 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5200
     * @tc.desc    Verify flat handles all basic types mixed
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [
        1,
        ['string', true],
        [null, undefined]
      ];
      const result = arr.flat();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5300
     * @tc.desc    Verify flat handles basic types mixed with objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | (GeneratedObjectLiteralInterface_1 | string)[] | (boolean | number[])[] | null)[] = [
        1,
        [{a: 1}, 'string'],
        [true, [1, 2, 3]],
        null
      ];
      const result = arr.flat();
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5400
     * @tc.desc    Verify flat handles strings as non-array elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['hello', ['world']];
      const result = arr.flat();
      expect(result).assertDeepEquals(['hello', 'world']);
      expect(result[0].length).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5500
     * @tc.desc    Verify flat handles all empty nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[], [[]], [[[]]]];
      const result = arr.flat(Infinity);
      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5600
     * @tc.desc    Verify flat handles very large depth value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]]];
      const result = arr.flat(Number.MAX_SAFE_INTEGER);
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5700
     * @tc.desc    Verify flat handles large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = Array(1000).fill([1, 2]);
      const result = arr.flat();
      expect(result.length).assertEqual(2000);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5800
     * @tc.desc    Verify flat handles deeply nested large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] | object = Array(100).fill(1);
      for (let i = 0; i < 10; i++) {
        arr = [arr];
      }
      const result = (arr as number[]).flat(Infinity);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_5900
     * @tc.desc    Verify flat handles Number.MIN_VALUE as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3]];
      const result = arr.flat(Number.MIN_VALUE);
      expect(result).assertDeepEquals([1, [2, 3]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6000
     * @tc.desc    Verify flat handles Number.MAX_VALUE as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, [4]]]];
      const result = arr.flat(Number.MAX_VALUE);
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6100
     * @tc.desc    Verify flat handles -Infinity as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3]];
      const result = arr.flat(-Infinity);
      expect(result).assertDeepEquals([1, [2, 3]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6200
     * @tc.desc    Verify flat handles string number as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]]];
      const result = arr.flat(2);
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6300
     * @tc.desc    Verify flat handles object as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3]];
      const result = arr.flat(0);
      expect(result).assertDeepEquals([1, [2, 3]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6400
     * @tc.desc    Verify flat handles boolean as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]]];
      const result1 = arr.flat(1);
      const result2 = arr.flat(0);
      expect(result1).assertDeepEquals([1, 2, [3]]);
      expect(result2).assertDeepEquals([1, [2, [3]]]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6500
     * @tc.desc    Verify flat doesn't modify original one-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const original = [...arr];
      const result = arr.flat();
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify(original));
      expect(arr !== result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6600
     * @tc.desc    Verify flat doesn't modify original two-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const original = JSON.stringify(arr);
      const result = arr.flat();
      expect(JSON.stringify(arr)).assertEqual(original);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6700
     * @tc.desc    Verify flat doesn't modify original deeply nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, [4]]]];
      const original = JSON.stringify(arr);
      const result = arr.flat(2);
      expect(JSON.stringify(arr)).assertEqual(original);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6800
     * @tc.desc    Verify object references are preserved after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const obj: GeneratedObjectLiteralInterface_1 = {a: 1};
      const arr = [obj, [obj]];
      const result = arr.flat();
      expect(result[0]).assertEqual(obj);
      expect(result[1]).assertEqual(obj);
      expect(result[0]).assertEqual(result[1]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_6900
     * @tc.desc    Verify array references are preserved after flat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const inner = [3, 4];
      const arr = [1, [2, inner]];
      const result = arr.flat(1);
      expect(result[2]).assertEqual(inner);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7000
     * @tc.desc    Verify modifying returned array doesn't affect original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const result = arr.flat();
      result.push(5);
      result[0] = 999;
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7100
     * @tc.desc    Verify modifying original array doesn't affect returned array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const result = arr.flat();
      arr.push([5, 6]);
      arr[0][0] = 999;
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7200
     * @tc.desc    Verify flat returns Array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3]];
      const result = arr.flat();
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7300
     * @tc.desc    Verify flat returns array with Array constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3]];
      const result = arr.flat();
      expect(result.constructor).assertEqual(Array);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7400
     * @tc.desc    Verify flat preserves element order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[3, 2, 1], [6, 5, 4]];
      const result = arr.flat();
      expect(result).assertDeepEquals([3, 2, 1, 6, 5, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7500
     * @tc.desc    Verify flat preserves nested element order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, [4]]]];
      const result = arr.flat(Infinity);
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7600
     * @tc.desc    Verify flat handles tree structure flattening
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const tree: TreeNode[] = [
        {
          id: 1,
          children: [
            {id: 2, children: [{id: 4}]},
            {id: 3}
          ]
        }
      ];

      const result = flattenTree(tree);
      expect(result.map(n => n.id)).assertDeepEquals([1, 2, 4, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7700
     * @tc.desc    Verify flat handles multi-dimensional coordinates flattening
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const coordinates = [
        [[1, 2], [3, 4]],
        [[5, 6], [7, 8]]
      ];
      const flatCoords = coordinates.flat(Infinity);
      expect(flatCoords).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7800
     * @tc.desc    Verify flat handles removing nested empty arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const data = [1, [], [2, []], [[3]]];
      const cleaned = data.flat(Infinity).filter(x => x !== undefined);
      expect(cleaned).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest7900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_7900
     * @tc.desc    Verify flat handles removing array empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 2, undefined, undefined, 3, undefined, undefined, undefined, 4];
      const cleaned = arr.flat().filter(x => x !== undefined && x !== null);
      expect(cleaned).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8000
     * @tc.desc    Verify flat handles merging multiple API responses
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const responses: Response[] = [
        {data: [1, 2, 3]},
        {data: [4, 5]},
        {data: [6, 7, 8]}
      ];
      const allData = responses.map(r => r.data).flat();
      expect(allData).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8100
     * @tc.desc    Verify flat handles processing paginated data
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const pages: Page[] = [
        {items: [{id: 1}, {id: 2}]},
        {items: [{id: 3}, {id: 4}]},
        {items: [{id: 5}]}
      ];
      const allItems = pages.map(p => p.items).flat();
      expect(allItems.length).assertEqual(5);
      expect(allItems[2].id).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8200
     * @tc.desc    Verify flat handles matrix to vector conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      const vector = matrix.flat();
      expect(vector).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8300
     * @tc.desc    Verify flat handles 3D tensor to 1D conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const tensor = [
        [[1, 2], [3, 4]],
        [[5, 6], [7, 8]]
      ];
      const flatTensor = tensor.flat(Infinity);
      expect(flatTensor).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8400
     * @tc.desc    Verify flat handles functional programming chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      interface DataItem {
        tags: string[];
      }
      const data: DataItem[] = [
        {tags: ['js', 'node']},
        {tags: ['library', 'js']},
        {tags: ['framework', 'frontend']}
      ];
      const allTags = data
        .map(item => item.tags)
        .flat()
        .filter((tag, index, arr) => arr.indexOf(tag) === index)
        .sort();
      expect(allTags).assertDeepEquals(['framework', 'frontend', 'js', 'library', 'node']);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8500
     * @tc.desc    Verify flat handles complex method combinations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const orders: Order[] = [
        {items: [{price: 10}, {price: 20}]},
        {items: [{price: 15}]},
        {items: [{price: 5}, {price: 30}]}
      ];
      const total = orders
        .map(order => order.items)
        .flat()
        .reduce((sum, item) => sum + item.price, 0);
      expect(total).assertEqual(80);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8600
     * @tc.desc    Verify flat handles nullable nested structures
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const data: DataItem[] = [
        {items: [1, 2]},
        {items: undefined},
        {items: [3, 4]},
        {items: undefined}
      ];
      const allItems = data
        .map(d => d.items || [])
        .flat();
      expect(allItems).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name    BuiltinsArrayFlatTest8700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_8700
     * @tc.desc    Verify flat handles filtering and flattening mixed types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const mixed = [1, [2, 3], 'string', [4, 5], null, [6]];
      const result = mixed
        .filter(item => Array.isArray(item))
        .flat();
      expect(result).assertDeepEquals([2, 3, 4, 5, 6]);
    });

  });
}
