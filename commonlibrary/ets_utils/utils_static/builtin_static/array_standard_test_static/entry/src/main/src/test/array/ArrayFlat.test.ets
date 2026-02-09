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
import Utils from './../Util.test';

class MyArray034 extends Array<number | number[]> {
}

class MyArray042 extends Array<number | (number | number[])[]> {
}

interface Item008 { value: number }

export default function ArrayFlatTest() {
  describe('ArrayFlatTest', () => {
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
     * @tc.name   testArrayFlat0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0001
     * @tc.desc   Verify flat() default flattens one level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayFlat0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0002
     * @tc.desc   Verify flat() with depth=2 flattens two levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[][] = [[1, [2, 3]], [4]];
      const result = arr.flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayFlat0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0003
     * @tc.desc   Verify flat() with depth greater than nesting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | (number | number[])[])[] = [1, [2, [3, 4]]];
      const result = arr.flat(5);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayFlat0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0004
     * @tc.desc   Verify flat() with depth=0 returns shallow copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2]];
      const result = arr.flat(0);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([[1], [2]]));
    });

    /**
     * @tc.name   testArrayFlat0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0005
     * @tc.desc   Verify flat() on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const result = arr.flat();
      const arr1: Array<number> = [];
      expect(result).assertDeepEquals(arr1);
    });

    /**
     * @tc.name   testArrayFlat0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0006
     * @tc.desc   Verify flat() skips holes in sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.name   testArrayFlat0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0007
     * @tc.desc   Verify flat() keeps null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined)[][] = [[1, null], [undefined, 2]];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, null, undefined, 2]));
    });

    /**
     * @tc.name   testArrayFlat0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0008
     * @tc.desc   Verify flat() leaves objects untouched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (Item008 | Item008[])[] = [{ value: 1 }, [{ value: 2 }]];
      const result = arr.flat();
      let val1: Item008 = { value: 1 };
      let val2: Item008 = { value: 2 };
      expect(result).assertDeepEquals([val1, val2]);
    });

    /**
     * @tc.name   testArrayFlat0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0012
     * @tc.desc   Verify flat() with map combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result = arr.map((x: number) => [x, x * 2]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 2, 4, 3, 6]));
    });

    /**
     * @tc.name   testArrayFlat0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0013
     * @tc.desc   Verify flat() behaves like flatMap equivalence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const result1 = arr.map((x: number) => [x, x * 2]).flat();
      const result2 = arr.flatMap((x: number) => [x, x * 2]);
      expect(result1).assertDeepEquals(result2);
    });

    /**
     * @tc.name   testArrayFlat0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0014
     * @tc.desc   Verify flat() preserves functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const f = (): number => 42;
      const arr: (number | (() => number))[] = [1, f];
      const result = arr.flat<undefined|Object|null>();
      expect(result[1]).assertEqual(f);
    });

    /**
     * @tc.name   testArrayFlat0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0019
     * @tc.desc   Verify flat() keeps TypedArray as element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (Int32Array | number)[] = [new Int32Array([1, 2]), 3];
      const result = arr.flat();
      expect(result[0] instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.name   testArrayFlat0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0021
     * @tc.desc   flat on nested numeric arrays with explicit depth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it("testArrayFlat0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const arr: number[][][] = [[[1, 2]], [[3, 4]]];
    //   const result = arr.flat(1);
    //   expect(result.length).assertEqual(2);
    //   expect((result as number[][])[0][0]).assertEqual(1);
    // });

    /**
     * @tc.name   testArrayFlat0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0022
     * @tc.desc   flat with depth 0 returns original array unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result = arr.flat(0);
      expect(result[1] instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testArrayFlat0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0024
     * @tc.desc   flat removes empty slots from sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.name   testArrayFlat0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0025
     * @tc.desc   flat keeps null and undefined elements intact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined | (number | null | undefined)[])[] = [1, null, [undefined, 2]];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, null, undefined, 2]));
    });

    /**
     * @tc.name   testArrayFlat0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0026
     * @tc.desc   flat on nested empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[] | (number | number[])[])[] = [1, [] as number[], [2, [3]]];
      const result = (arr as (number | number[] | (number | number[])[])[]).flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0027
     * @tc.desc   flat with depth 0 returns same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result = arr.flat(0);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, [2, 3]]));
    });

    /**
     * @tc.name   testArrayFlat0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0028
     * @tc.desc   flat with depth 1 flattens one level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | (number | number[])[])[] = [1, [2, [3]]];
      const result = arr.flat(1);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, [3]]));
    });

    /**
     * @tc.name   testArrayFlat0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0030
     * @tc.desc   flat on sparse array keeps empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined | (number | undefined)[])[] = [1, undefined, [2, undefined, 3]];
      const result = arr.flat(2);
      expect(result.length).assertEqual(5); // includes empty slots
    });

    /**
     * @tc.name   testArrayFlat0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0032
     * @tc.desc   flat on read-only array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: readonly (number | number[])[] = [1, [2, 3]];
      const result = (arr as (number | number[])[]).flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0034
     * @tc.desc   flat on inherited Array subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: MyArray034 = new MyArray034();
      arr.push(1);
      arr.push([2, 3]);
      const result = (arr as (number | number[])[]).flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0035
     * @tc.desc   flat on typed array converted to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typed: Int16Array = new Int16Array([1, 2, 3]);
      const arr: number[][] = [Array.from(typed)];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0037
     * @tc.desc   flat with mixed null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined | (number | null | undefined | number[])[])[] = [null, [1, undefined, [2]]];
      const result = arr.flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([null, 1, undefined, 2]));
    });

    /**
     * @tc.name   testArrayFlat0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0038
     * @tc.desc   flat with empty array inside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [], [2]];
      const result = (arr as (number | number[])[]).flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayFlat0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0039
     * @tc.desc   flat on deeply nested array with depth 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | (number | (number | number[])[])[])[] = [1, [2, [3, [4]]]];
      const result = (arr as (number | (number | (number | number[])[])[])[]).flat(3);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayFlat0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0040
     * @tc.desc   flat on array with multiple empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined | (number | undefined)[])[] = [undefined, undefined, [1, undefined, 2], 3];
      const result = arr.flat(2);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   testArrayFlat0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0042
     * @tc.desc   flat on subclassed Array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: MyArray042 = new MyArray042();
      arr.push(1);
      arr.push([2, [3]]);
      const result = (arr as MyArray042).flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0043
     * @tc.desc   flat on typed array converted to normal array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typed: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr: number[][] = [Array.from(typed)];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0044
     * @tc.desc   flat on large nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nested: number[][] = [];
      for (let i = 0; i < 1000; i++) {
        nested.push([i]);
      }
      const result = nested.flat<undefined|Object|null>();
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(999);
    });

    /**
     * @tc.name   testArrayFlat0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0045
     * @tc.desc   flat on array with sparse slots and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined | (number | undefined)[])[] = [undefined, 1, [undefined, 2]];
      const result = arr.flat(2);
      expect(result.length).assertEqual(4);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([undefined, 1, undefined, 2]));
    });

    /**
     * @tc.name   testArrayFlat0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0046
     * @tc.desc   flat preserves null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | (number | null)[])[] = [1, null, [2, null]];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, null, 2, null]));
    });

    /**
     * @tc.name   testArrayFlat0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0047
     * @tc.desc   flat on array with mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | (number | string)[])[] = [1, ["a", 2]];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, "a", 2]));
    });

    /**
     * @tc.name   testArrayFlat0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0048
     * @tc.desc   flat on empty array returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [];
      const result = arr.flat();
      let arr1: Array<number> = [];
      expect(result).assertDeepEquals(arr1);
    });

    /**
     * @tc.name   testArrayFlat0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0049
     * @tc.desc   flat on array of arrays of length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[], [], []];
      const result = arr.flat();
      let arr1: Array<number> = [];
      expect(result).assertDeepEquals(arr1);
    });

    /**
     * @tc.name   testArrayFlat0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0050
     * @tc.desc   flat on array with nested empty arrays and numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: Array<number> = [];
      const arr: (number | number[])[] = [arr1, 1, arr1, [2]];
      const result = (arr as (number | number[])[]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayFlat0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0052
     * @tc.desc   flat on read-only array preserves values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: readonly (number | number[])[] = [1, [2, 3]];
      const result = (arr as (number | number[])[]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0054
     * @tc.desc   flat on deeply nested array with null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined | (number | null | undefined | (number | null)[])[])[] =
        [1, null, [undefined, [2, null]]];
      const result =
        (arr as (number | null | undefined | (number | null | undefined | (number | null)[])[])[]).flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, null, undefined, 2, null]));
    });

    /**
     * @tc.name   testArrayFlat0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0056
     * @tc.desc   flat on array with empty slots and nested empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[] | undefined)[] = [undefined, [], 1, [2]];
      const result = (arr as (number | number[] | undefined)[]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([undefined, 1, 2]));
    });

    /**
     * @tc.name   testArrayFlat0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0058
     * @tc.desc   flat with depth 0 returns original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result = arr.flat(0);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, [2, 3]]));
    });

    /**
     * @tc.name   testArrayFlat0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0059
     * @tc.desc   flat on array containing nested readonly arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nested: readonly number[] = [10, 20];
      const arr: (number | readonly number[])[] = [1, nested as number[]];
      const result = (arr as (number | number[])[]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 10, 20]));
    });

    /**
     * @tc.name   testArrayFlat0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0061
     * @tc.desc   flat on deeply nested arrays with depth 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, [2, [3, [4, [5]]]]];
      const result = arr.flat(5);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   testArrayFlat0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0063
     * @tc.desc   flat on array with nested nulls and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined | (number | null | undefined)[])[] = [1, null, [undefined, 2]];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, null, undefined, 2]));
    });

    /**
     * @tc.name   testArrayFlat0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0065
     * @tc.desc   flat on array with deeply nested empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: Array<number>= [];
      let arr2: Array<Array<number>> = [arr1];
      const arr = [1, arr1, [arr1], [arr2]];
      const result = arr.flat(4);
      expect(result).assertDeepEquals([1]);
    });

    /**
     * @tc.name   testArrayFlat0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0068
     * @tc.desc   flat on large nested array with depth 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[][] = [];
      for (let i = 0; i < 100; i++) {
        arr.push([i, [i + 1]]);
      }
      const result = arr.flat<undefined|Object|null>(2) ;
      expect(result[0]).assertEqual(0);
      expect(result[result.length - 1]).assertEqual(100);
    });

    /**
     * @tc.name   testArrayFlat0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0069
     * @tc.desc   flat on array containing null, undefined, empty, and numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined | (number | null | undefined)[])[] = [null, 1, [], [undefined, 2]];
      const result = arr.flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([null, 1, undefined, 2]));
    });
    /**
     * @tc.name   testArrayFlat0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0071
     * @tc.desc   flat combined with map doubles all numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result = (arr.map((x: number | number[]): number | number[] => typeof x === "number" ? x as number * 2 :
        x) as (number | number[])[]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0072
     * @tc.desc   flat combined with filter removes odd numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const result = (arr.flat<number>()).filter((x: number) => x % 2 === 0);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4]));
    });

    /**
     * @tc.name   testArrayFlat0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0073
     * @tc.desc   flat combined with reduce sums all numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const sum = (arr.flat<number>()).reduce((acc: number, val: number) => acc + val, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayFlat0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0074
     * @tc.desc   flat combined with find returns first element greater than 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const result = (arr.flat<number>()).find((x: number) => x > 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFlat0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0075
     * @tc.desc   flat combined with findIndex returns index of first number greater than 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const idx = (arr.flat<number>()).findIndex((x: number) => x > 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFlat0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0076
     * @tc.desc   flat combined with some checks if any number is greater than 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const flag: boolean = (arr.flat<number>()).some((x: number) => x > 3);
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFlat0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0077
     * @tc.desc   flat combined with every checks if all numbers are less than 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const flag: boolean = (arr.flat<number>()).every((x: number) => x < 10);
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFlat0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0078
     * @tc.desc   flat combined with sort sorts numbers ascending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [5, [1, 3, 2]];
      const result = (arr.flat<number>()).sort((a: number, b: number) => (a - b).toInt());
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 5]));
    });

    /**
     * @tc.name   testArrayFlat0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0079
     * @tc.desc   flat combined with reverse reverses array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result = (arr.flat<number>()).reverse();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 2, 1]));
    });

    /**
     * @tc.name   testArrayFlat0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0080
     * @tc.desc   flat combined with concat merges with another array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const arr2: number[] = [4, 5];
      const result: number[] = (arr.flat<number>()).concat(arr2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4, 5]));
    });

    /**
     * @tc.name   testArrayFlat0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0081
     * @tc.desc   flat combined with join produces string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | string[])[] = ["a", ["b", "c"]];
      const result: string = (arr.flat()).join("-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.name   testArrayFlat0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0082
     * @tc.desc   flat combined with map and filter in one chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const result: number[] = (arr.flat<number>().map((x: number) => x * 2).filter((x: number) => x > 4));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([6, 8]));
    });

    /**
     * @tc.name   testArrayFlat0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0084
     * @tc.desc   flat combined with flatMap doubles nested numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result = arr.flatMap((x: number | number[]) => typeof x === "number" ? [x as number * 2] : x);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0085
     * @tc.desc   flat combined with slice and map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [0, [1, 2, 3]];
      const result: number[] = arr.flat<number>().slice(1).map((x: number) => x * 10);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([10, 20, 30]));
    });

    /**
     * @tc.name   testArrayFlat0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0086
     * @tc.desc   flat combined with splice modifies array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const flatArr = arr.flat();
      flatArr.splice(1, 2);
      expect(JSON.stringify(flatArr)).assertDeepEquals(JSON.stringify([1, 4]));
    });

    /**
     * @tc.name   testArrayFlat0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0087
     * @tc.desc   flat combined with reverse and map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const result: number[] = arr.flat<number>().reverse().map((x: number) => x * 2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([6, 4, 2]));
    });

    /**
     * @tc.name   testArrayFlat0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0088
     * @tc.desc   flat combined with filter removes nulls and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, null, [undefined, 2, null]];
      const result = arr.flat(2).filter((x): boolean => x !== null && x !== undefined);
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayFlat0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0090
     * @tc.desc   flat combined with map, filter, and reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3, 4]];
      const sum: number = arr.flat<number>()
        .map((x: number) => x * 2)
        .filter((x: number) => x > 4)
        .reduce((acc: number, val: number) => acc + val, 0);
      expect(sum).assertEqual(14);
    });

    /**
     * @tc.name   testArrayFlat0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0091
     * @tc.desc   flat deeply nested array with depth 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | (number | (number | number[])[])[])[] = [1, [2, [3, 4]]];
      const result = arr.flat(3);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayFlat0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0093
     * @tc.desc   flat on read-only array preserves original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: readonly (number | number[])[] = [1, [2, 3]];
      const result = (arr as (number | number[])[]).flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFlat0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0096
     * @tc.desc   flat mixed null, undefined, and numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null | undefined | (number | null)[])[] = [null, 1, undefined, [2, null]];
      const result = arr.flat(2);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([null, 1, undefined, 2, null]));
    });

    /**
     * @tc.name   testArrayFlat0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0098
     * @tc.desc   flat nested array combined with map and reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | number[])[] = [1, [2, 3]];
      const sum: number = arr.flat<number>().map((x: number) => x * 2).reduce((acc: number, val: number) => acc + val, 0);
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.name   testArrayFlat0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0099
     * @tc.desc   flat array with empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.name   testArrayFlat0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FLAT_0100
     * @tc.desc   flat large nested typed arrays with map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFlat0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (Uint16Array | number[])[] = [new Uint16Array([1, 2]), [3, 4]];
      const result = arr.flatMap(x => Array.from<number>(x));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });
  });
}