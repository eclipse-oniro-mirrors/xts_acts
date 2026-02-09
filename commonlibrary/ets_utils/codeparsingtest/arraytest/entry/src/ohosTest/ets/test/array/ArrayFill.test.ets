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
import { testArrayFindIndexJs0116, testArrayFindIndexJs0117 } from './ArrayFindIndex';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayFillTest() {
  describe('ArrayFillTest', () => {
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
     * @tc.name   testArrayFill0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0001
     * @tc.desc   fill entire array with a number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(5);
      expect(arr).assertDeepEquals([5, 5, 5]);
    });

    /**
     * @tc.name   testArrayFill0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0002
     * @tc.desc   fill part of array with a string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c", "d"];
      arr.fill("x", 1, 3);
      expect(arr).assertDeepEquals(["a", "x", "x", "d"]);
    });

    /**
     * @tc.name   testArrayFill0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0003
     * @tc.desc   fill array with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.fill(false);
      expect(arr).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   testArrayFill0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0004
     * @tc.desc   fill with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, 2, 3];
      arr.fill(undefined);
      expect(arr).assertDeepEquals([undefined, undefined, undefined]);
    });

    /**
     * @tc.name   testArrayFill0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0005
     * @tc.desc   fill with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | null)[] = ["a", "b", "c"];
      arr.fill(null, 0, 2);
      expect(arr).assertDeepEquals([null, null, "c"]);
    });

    /**
     * @tc.name   testArrayFill0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0006
     * @tc.desc   fill empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.fill(9);
      expect(arr).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArrayFill0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0007
     * @tc.desc   fill array with start index greater than end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 2, 1);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0008
     * @tc.desc   fill array with negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("z", -2);
      expect(arr).assertDeepEquals(["a", "z", "z"]);
    });

    /**
     * @tc.name   testArrayFill0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0009
     * @tc.desc   fill array with negative end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(arr).assertDeepEquals([1, 0, 0, 4]);
    });

    /**
     * @tc.name   testArrayFill0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0010
     * @tc.desc   fill array with object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Obj { value: number }

      const o: Obj = { value: 1 };
      const arr: Obj[] = [{ value: 0 }, { value: 0 }];
      arr.fill(o);
      expect(arr[0]).assertEqual(o);
      expect(arr[1]).assertEqual(o);
    });

    /**
     * @tc.name   testArrayFill0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0011
     * @tc.desc   fill array with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(NaN);
      expect(arr).assertDeepEquals([NaN, NaN, NaN]);
    });

    /**
     * @tc.name   testArrayFill0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0012
     * @tc.desc   fill array with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(Infinity);
      expect(arr).assertDeepEquals([Infinity, Infinity, Infinity]);
    });

    /**
     * @tc.name   testArrayFill0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0013
     * @tc.desc   fill part of sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, , 3]; // sparse
      arr.fill(0, 0, 2);
      expect(arr).assertDeepEquals([0, 0, 3]);
    });

    /**
     * @tc.name   testArrayFill0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0014
     * @tc.desc   fill array with start and end index equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      arr.fill(9, 1, 1);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0015
     * @tc.desc   fill array with large start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2];
      arr.fill(0, 10);
      expect(arr).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayFill0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0016
     * @tc.desc   fill array with large negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2];
      arr.fill(0, -10);
      expect(arr).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.name   testArrayFill0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0017
     * @tc.desc   fill array with large negative end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      arr.fill(5, 0, -10);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0018
     * @tc.desc   fill array with same value object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface MyObj {
        a: number;
      }

      const obj: MyObj = { a: 1 };
      const arr: MyObj[] = [{ a: 0 }, { a: 0 }];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0019
     * @tc.desc   fill array with values on negative and positive indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3, 4];
      arr.fill(9, -3, 3);
      expect(arr).assertDeepEquals([1, 9, 9, 4]);
    });

    /**
     * @tc.name   testArrayFill0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0020
     * @tc.desc   fill array with mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, "b", 3];
      arr.fill("x", 1);
      expect(arr).assertDeepEquals([1, "x", "x"]);
    });

    /**
     * @tc.name   testArrayFill0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0021
     * @tc.desc   fill array with object using class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyClass {
        value: number = 0;
      }

      const obj = new MyClass();
      const arr: MyClass[] = [new MyClass(), new MyClass()];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0022
     * @tc.desc   fill array with function references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const fn = () => 42;
      const arr: (() => number)[] = [() => 1, () => 2, () => 3];
      arr.fill(fn, 1);
      expect(arr[0]()).assertEqual(1);
      expect(arr[1]()).assertEqual(42);
      expect(arr[2]()).assertEqual(42);
    });

    /**
     * @tc.name   testArrayFill0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0023
     * @tc.desc   fill array with start index equal to array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 3);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0024
     * @tc.desc   fill array with end index greater than length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 1, 10);
      expect(arr).assertDeepEquals(["a", "x", "x"]);
    });

    /**
     * @tc.name   testArrayFill0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0025
     * @tc.desc   fill array multiple times to test reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Item { id: number }

      const obj: Item = { id: 1 };
      const arr: Item[] = [{ id: 0 }, { id: 0 }, { id: 0 }];
      arr.fill(obj, 0, 2);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2].id).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFill0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0026
     * @tc.desc   fill array of length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5];
      arr.fill(0);
      expect(arr).assertDeepEquals([0]);
    });

    /**
     * @tc.name   testArrayFill0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0027
     * @tc.desc   fill array of length 0 with any value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.fill(1);
      expect(arr).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArrayFill0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0028
     * @tc.desc   fill array with mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, "a", 3];
      arr.fill("z", 0, 2);
      expect(arr).assertDeepEquals(["z", "z", 3]);
    });

    /**
     * @tc.name   testArrayFill0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0029
     * @tc.desc   fill array with boolean false using negative start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, true, true];
      arr.fill(false, -2);
      expect(arr).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   testArrayFill0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0030
     * @tc.desc   fill array with numbers using negative end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(arr).assertDeepEquals([1, 0, 0, 4]);
    });

    /**
     * @tc.name   testArrayFill0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0031
     * @tc.desc   fill sparse array partially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, , 3, , 5]; // sparse
      arr.fill(0, 1, 4);
      expect(arr).assertDeepEquals([1, 0, 0, 0, 5]);
    });

    /**
     * @tc.name   testArrayFill0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0032
     * @tc.desc   fill array with object having nested property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Nested {
        inner: number = 1;
      }

      const obj = new Nested();
      const arr: Nested[] = [new Nested(), new Nested()];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0033
     * @tc.desc   fill array with float numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0.1, 0.2, 0.3];
      arr.fill(1.5, 0, 2);
      expect(arr).assertDeepEquals([1.5, 1.5, 0.3]);
    });

    /**
     * @tc.name   testArrayFill0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0034
     * @tc.desc   fill array with string "test" on all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("test");
      expect(arr).assertDeepEquals(["test", "test", "test"]);
    });

    /**
     * @tc.name   testArrayFill0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0035
     * @tc.desc   fill array with null on middle segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, 2, 3, 4, 5];
      arr.fill(null, 1, 4);
      expect(arr).assertDeepEquals([1, null, null, null, 5]);
    });

    /**
     * @tc.name   testArrayFill0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0036
     * @tc.desc   fill array with boolean true entirely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, false];
      arr.fill(true);
      expect(arr).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   testArrayFill0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0037
     * @tc.desc   fill array using zero start and zero end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 0);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0038
     * @tc.desc   fill array with same string reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "shared";
      const arr: string[] = ["a", "b", "c"];
      arr.fill(str, 1);
      expect(arr).assertDeepEquals(["a", "shared", "shared"]);
    });

    /**
     * @tc.name   testArrayFill0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0039
     * @tc.desc   fill array with start and end negative exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, -10, -5);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0040
     * @tc.desc   fill array with undefined in sparse array segment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, , 3, , 5];
      arr.fill(undefined, 1, 4);
      expect(arr).assertDeepEquals([1, undefined, undefined, undefined, 5]);
    });

    /**
     * @tc.name   testArrayFill0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0041
     * @tc.desc   fill array with multiple object references using interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Item { value: number }

      const obj: Item = { value: 42 };
      const arr: Item[] = [{ value: 1 }, { value: 2 }, { value: 3 }];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0042
     * @tc.desc   fill array using negative start and end indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, -3, -1);
      expect(arr).assertDeepEquals([1, 0, 0, 4]);
    });

    /**
     * @tc.name   testArrayFill0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0043
     * @tc.desc   fill array with nested objects using class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Nested {
        inner: number = 5
      }

      const obj = new Nested();
      const arr: Nested[] = [new Nested(), new Nested(), new Nested()];
      arr.fill(obj, 1);
      expect(arr[0].inner).assertEqual(5);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0044
     * @tc.desc   fill array with boolean using start index only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.fill(false, 1);
      expect(arr).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   testArrayFill0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0045
     * @tc.desc   fill array of strings with negative start exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", -10);
      expect(arr).assertDeepEquals(["x", "x", "x"]);
    });

    /**
     * @tc.name   testArrayFill0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0046
     * @tc.desc   fill array with same string reference using end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "shared";
      const arr: string[] = ["a", "b", "c"];
      arr.fill(str, 0, 2);
      expect(arr).assertDeepEquals(["shared", "shared", "c"]);
    });

    /**
     * @tc.name   testArrayFill0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0047
     * @tc.desc   fill sparse array entirely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [, , ,]; // sparse array of length 3
      arr.fill(1);
      expect(arr).assertDeepEquals([1, 1, 1]);
    });

    /**
     * @tc.name   testArrayFill0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0048
     * @tc.desc   fill array with NaN using start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(NaN, 1, 3);
      expect(arr).assertDeepEquals([1, NaN, NaN, 4]);
    });

    /**
     * @tc.name   testArrayFill0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0049
     * @tc.desc   fill array with Infinity using negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(Infinity, -3, -1);
      expect(arr).assertDeepEquals([1, Infinity, Infinity, 4]);
    });

    /**
     * @tc.name   testArrayFill0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0050
     * @tc.desc   fill array with start index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 10);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0051
     * @tc.desc   fill array with end index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 0, 10);
      expect(arr).assertDeepEquals(["x", "x", "x"]);
    });

    /**
     * @tc.name   testArrayFill0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0052
     * @tc.desc   fill array with objects using class references repeatedly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Item {
        value: number = 0
      }

      const obj = new Item();
      const arr: Item[] = [new Item(), new Item(), new Item()];
      arr.fill(obj, 0, 2);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2].value).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFill0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0053
     * @tc.desc   fill array with multiple types using tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string, boolean][] = [[1, "a", true], [2, "b", false]];
      arr.fill([0, "x", false], 1);
      expect(arr).assertDeepEquals([[1, "a", true], [0, "x", false]]);
    });

    /**
     * @tc.name   testArrayFill0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0054
     * @tc.desc   fill array partially with zero start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 0);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0055
     * @tc.desc   fill array with nested objects using negative start exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Nested {
        value: number = 1
      }

      const obj = new Nested();
      const arr: Nested[] = [new Nested(), new Nested()];
      arr.fill(obj, -10);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0056
     * @tc.desc   fill sparse array completely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [, , ,];
      arr.fill(9);
      expect(arr).assertDeepEquals([9, 9, 9]);
    });

    /**
     * @tc.name   testArrayFill0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0057
     * @tc.desc   fill array with object, verify reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyObj {
        value: number = 1
      }

      const obj = new MyObj();
      const arr: MyObj[] = [new MyObj(), new MyObj()];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.name   testArrayFill0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0058
     * @tc.desc   fill only part of sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, , 3, , 5];
      arr.fill(0, 1, 4);
      expect(arr).assertDeepEquals([1, 0, 0, 0, 5]);
    });

    /**
     * @tc.name   testArrayFill0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0059
     * @tc.desc   fill array using end index equals length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 3);
      expect(arr).assertDeepEquals([9, 9, 9]);
    });

    /**
     * @tc.name   testArrayFill0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0060
     * @tc.desc   fill array using end index greater than length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 0, 10);
      expect(arr).assertDeepEquals(["x", "x", "x"]);
    });

    /**
     * @tc.name   testArrayFill0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0061
     * @tc.desc   fill array using negative start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, -2);
      expect(arr).assertDeepEquals([1, 2, 0, 0]);
    });

    /**
     * @tc.name   testArrayFill0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0062
     * @tc.desc   fill array with negative end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(arr).assertDeepEquals([1, 0, 0, 4]);
    });

    /**
     * @tc.name   testArrayFill0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0063
     * @tc.desc   fill array with start index beyond length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 10);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0064
     * @tc.desc   fill array with end index less than start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 2, 1);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0065
     * @tc.desc   fill array with function references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const fn = () => 42;
      const arr: (() => number)[] = [() => 1, () => 2];
      arr.fill(fn);
      expect(arr[0]).assertEqual(fn);
      expect(arr[1]).assertEqual(fn);
    });

    /**
     * @tc.name   testArrayFill0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0066
     * @tc.desc   fill array with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, 2, 3];
      arr.fill(null);
      expect(arr).assertDeepEquals([null, null, null]);
    });

    /**
     * @tc.name   testArrayFill0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0067
     * @tc.desc   fill array with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, 2, 3];
      arr.fill(undefined);
      expect(arr).assertDeepEquals([undefined, undefined, undefined]);
    });

    /**
     * @tc.name   testArrayFill0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0068
     * @tc.desc   fill array with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(NaN);
      expect(arr).assertDeepEquals([NaN, NaN, NaN]);
    });

    /**
     * @tc.name   testArrayFill0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0069
     * @tc.desc   fill array with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(Infinity);
      expect(arr).assertDeepEquals([Infinity, Infinity, Infinity]);
    });

    /**
     * @tc.name   testArrayFill0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0070
     * @tc.desc   fill array of length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5];
      arr.fill(0);
      expect(arr).assertDeepEquals([0]);
    });

    /**
     * @tc.name   testArrayFill0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0071
     * @tc.desc   fill array with negative start exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, -10);
      expect(arr).assertDeepEquals([9, 9, 9]);
    });

    /**
     * @tc.name   testArrayFill0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0072
     * @tc.desc   fill array-like object with length property using class wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class ArrayLike {
        length: number;
        arr: number[];

        constructor(values: number[]) {
          this.arr = values;
          this.length = values.length;
        }

        fill(value: number, start?: number, end?: number): void {
          const s = start ?? 0;
          const e = end ?? this.length;
          for (let i = s; i < e; i++) {
            this.arr[i] = value;
          }
        }

        get(index: number): number {
          return this.arr[index];
        }
      }

      const obj = new ArrayLike([1, 2, 3]);
      obj.fill(9, 1);
      expect(obj.get(0)).assertEqual(1);
      expect(obj.get(1)).assertEqual(9);
      expect(obj.get(2)).assertEqual(9);
    });


    /**
     * @tc.name   testArrayFill0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0073
     * @tc.desc   fill array with nested objects in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Nested {
        value: number = 1
      }

      const obj = new Nested();
      const arr: (Nested | undefined)[] = [, new Nested(),];
      arr.fill(obj);
      expect(arr[0]).assertDeepEquals(obj);
      expect(arr[1]).assertDeepEquals(obj);
      expect(arr[2]).assertDeepEquals(undefined);
    });

    /**
     * @tc.name   testArrayFill0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0074
     * @tc.desc   fill array with zero start and zero end (no change)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 0);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0075
     * @tc.desc   fill array partially using negative end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(arr).assertDeepEquals([1, 0, 0, 4]);
    });

    /**
     * @tc.name   testArrayFill0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0076
     * @tc.desc   fill array with multiple types (number | string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, "a", 2];
      arr.fill("x", 0, 2);
      expect(arr).assertDeepEquals(["x", "x", 2]);
    });

    /**
     * @tc.name   testArrayFill0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0077
     * @tc.desc   fill array using negative start and end exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, -10, -5);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayFill0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0078
     * @tc.desc   fill array with floating point numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0.1, 0.2, 0.3];
      arr.fill(1.5, 0, 2);
      expect(arr).assertDeepEquals([1.5, 1.5, 0.3]);
    });

    /**
     * @tc.name   testArrayFill0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0079
     * @tc.desc   fill array with objects partially in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyObj {
        value: number = 0
      }

      const obj = new MyObj();
      const arr: (MyObj | undefined)[] = [, new MyObj(), ,];
      arr.fill(obj, 1, 3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
      expect(arr[3]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFill0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0080
     * @tc.desc   fill array then map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(5);
      const mapped = arr.map(v => v * 2);
      expect(mapped).assertDeepEquals([10, 10, 10, 10]);
    });

    /**
     * @tc.name   testArrayFill0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0081
     * @tc.desc   fill sparse array and use forEach to sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [, , ,];
      arr.fill(2);
      let sum = 0;
      arr.forEach(v => sum += v!);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayFill0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0082
     * @tc.desc   fill array and filter values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.fill(3, 1, 4);
      const filtered = arr.filter(v => v === 3);
      expect(filtered).assertDeepEquals([3, 3, 3]);
    });

    /**
     * @tc.name   testArrayFill0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0083
     * @tc.desc   fill array then slice values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(9, 1, 3);
      const sliced = arr.slice(0, 3);
      expect(sliced).assertDeepEquals([1, 9, 9]);
    });

    /**
     * @tc.name   testArrayFill0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0084
     * @tc.desc   fill nested object array then map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Obj {
        value: number = 0
      }

      const o = new Obj();
      const arr: Obj[] = [new Obj(), new Obj()];
      arr.fill(o);
      const mapped = arr.map(v => v.value + 1);
      expect(mapped).assertDeepEquals([1, 1]);
    });

    /**
     * @tc.name   testArrayFill0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0085
     * @tc.desc   fill array and concat with another array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 1);
      const result = arr.concat([4, 5]);
      expect(result).assertDeepEquals([1, 0, 0, 4, 5]);
    });

    /**
     * @tc.name   testArrayFill0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0086
     * @tc.desc   fill array with function then call each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const fn = () => 1;
      const arr: (() => number)[] = [() => 0, () => 0];
      arr.fill(fn);
      let sum = 0;
      arr.forEach(f => sum += f());
      expect(sum).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFill0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0087
     * @tc.desc   fill array then reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(9, 1, 3);
      arr.reverse();
      expect(arr).assertDeepEquals([4, 9, 9, 1]);
    });

    /**
     * @tc.name   testArrayFill0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0088
     * @tc.desc   fill array then join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 1);
      const str = arr.join("-");
      expect(str).assertEqual("1-0-0");
    });

    /**
     * @tc.name   testArrayFill0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0089
     * @tc.desc   fill array partially with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(5, -3, -1);
      expect(arr).assertDeepEquals([1, 5, 5, 4]);
    });

    /**
     * @tc.name   testArrayFill0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0090
     * @tc.desc   fill prototype array and verify instance inherit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyArray extends Array<number> {
      }

      const arr = new MyArray(1, 2, 3);
      arr.fill(9, 1);
      expect(arr).assertDeepEquals([1, 9, 9]);
    });

    /**
     * @tc.name   testArrayFill0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0091
     * @tc.desc   fill array then map and filter combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(2, 1, 3);
      const result = arr.map(v => v * 2).filter(v => v > 3);
      expect(result).assertDeepEquals([4, 4, 8]);
    });

    /**
     * @tc.name   testArrayFill0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0092
     * @tc.desc   fill array then sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 1, 4];
      arr.fill(2, 0, 2);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([2, 2, 4]);
    });

    /**
     * @tc.name   testArrayFill0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0093
     * @tc.desc   fill array then reduce sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(5, 1);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.name   testArrayFill0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0094
     * @tc.desc   fill array of objects and forEach modify property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Obj {
        value: number = 1
      }

      const o = new Obj();
      const arr: Obj[] = [new Obj(), new Obj()];
      arr.fill(o);
      arr.forEach(v => v.value += 1);
      expect(arr[0].value).assertEqual(3);
      expect(arr[1].value).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFill0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0095
     * @tc.desc   fill array then slice and fill again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const slice = arr.slice(1, 3);
      slice.fill(9);
      expect(slice).assertDeepEquals([9, 9]);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArrayFill0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0096
     * @tc.desc   fill array with booleans then map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.fill(false);
      const result = arr.map(v => v ? 1 : 0);
      expect(result).assertDeepEquals([0, 0, 0]);
    });

    /**
     * @tc.name   testArrayFill0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0097
     * @tc.desc   fill array then concat multiple arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.fill(0);
      const result = arr.concat([3, 4], [5]);
      expect(result).assertDeepEquals([0, 0, 3, 4, 5]);
    });

    /**
     * @tc.name   testArrayFill0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0098
     * @tc.desc   fill nested object array partially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Obj {
        value: number = 0
      }

      const o1 = new Obj();
      const o2 = new Obj();
      const arr: Obj[] = [o1, o2, o1];
      arr.fill(o2, 1, 3);
      expect(arr[0]).assertEqual(o1);
      expect(arr[1]).assertEqual(o2);
      expect(arr[2]).assertEqual(o2);
    });

    /**
     * @tc.name   testArrayFill0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0099
     * @tc.desc   fill array with strings then join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 1);
      const result = arr.join(",");
      expect(result).assertEqual("a,x,x");
    });

    /**
     * @tc.name   testArrayFill0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0100
     * @tc.desc   fill array then every check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(7);
      const allSevens = arr.every(v => v === 7);
      expect(allSevens).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFill0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0101
     * @tc.desc   fill array then some check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(2, 1);
      const hasTwo = arr.some(v => v === 2);
      expect(hasTwo).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFill0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0102
     * @tc.desc   fill array then find index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(5, 2);
      const idx = arr.findIndex(v => v === 5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFill0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0103
     * @tc.desc   fill array then find value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9);
      const value = arr.find(v => v === 9);
      expect(value).assertEqual(9);
    });

    /**
     * @tc.name   testArrayFill0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0104
     * @tc.desc   fill array then reverse and map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(2, 1, 3);
      arr.reverse();
      const mapped = arr.map(v => v * 2);
      expect(mapped).assertDeepEquals([8, 4, 4, 2]);
    });

    /**
     * @tc.name   testArrayFill0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0105
     * @tc.desc   fill array then reduceRight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(1);
      const sum = arr.reduceRight((a, b) => a + b, 0);
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFill0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0106
     * @tc.desc   fill array then flat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      arr.fill([0, 0], 1);
      const flat = arr.flat();
      expect(flat).assertDeepEquals([1, 2, 0, 0]);
    });

    /**
     * @tc.name   testArrayFill0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0107
     * @tc.desc   fill array then splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(9, 1, 3);
      const spliced = arr.splice(1, 2);
      expect(spliced).assertDeepEquals([9, 9]);
      expect(arr).assertDeepEquals([1, 4]);
    });

    /**
     * @tc.name   testArrayFill0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0108
     * @tc.desc   fill array then flatMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 1);
      const result = arr.flatMap(v => [v, v + 1]);
      expect(result).assertDeepEquals([1, 2, 0, 1, 0, 1]);
    });

    /**
     * @tc.name   testArrayFill0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0109
     * @tc.desc   fill array then copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.fill(0, 1, 4);
      arr.copyWithin(3, 0, 2);
      expect(arr).assertDeepEquals([1, 0, 0, 1, 0]);
    });

    /**
     * @tc.name   testArrayFill0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0111
     * @tc.desc   create array, fill, then find
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(5).fill(0).map((_: number, i: number): number => i + 1);
      arr.fill(3, 1, 4);
      const found: number | undefined = arr.find((v: number): boolean => v === 3);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFill0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0112
     * @tc.desc   create array, fill, then map to double values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(4).fill(0).map((_: number, i: number): number => i);
      arr.fill(2, 1);
      const mapped: number[] = arr.map((v: number): number => v * 2);
      expect(mapped).assertDeepEquals([0, 4, 4, 4]);
    });

    /**
     * @tc.name   testArrayFill0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0113
     * @tc.desc   fill then filter and reduce sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(5).fill(0).map((_: number, i: number): number => i + 1);
      arr.fill(3, 1, 4);
      const sum: number =
        arr.filter((v: number): boolean => v === 3).reduce((a: number, b: number): number => a + b, 0);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.name   testArrayFill0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0114
     * @tc.desc   fill then reverse and find index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(4).fill(0).map((_: number, i: number): number => i + 1);
      arr.fill(7, 1, 3);
      arr.reverse();
      const idx: number = arr.findIndex((v: number): boolean => v === 7);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFill0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0115
     * @tc.desc   fill, slice, then map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFill0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(6).fill(0).map((_: number, i: number): number => i);
      arr.fill(5, 2, 5);
      const mapped: number[] = arr.slice(1, 5).map((v: number): number => v * 2);
      expect(mapped).assertDeepEquals([2, 10, 10, 10]);
    });

    /**
     * @tc.name   testArrayFill0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0116
     * @tc.desc   Verify fill on Proxy array intercepting set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0116()).assertDeepEquals([10, 10, 10]);
    });

    /**
     * @tc.name   testArrayFill0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0117
     * @tc.desc   Verify fill on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0117()).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFill0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0118
     * @tc.desc   Verify fill on inherited array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyArray extends Array<number> {
      }

      const arr: MyArray = new MyArray(1, 2, 3);
      arr.fill(7);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(7);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.name   testArrayFill0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0119
     * @tc.desc   Verify fill on sparse array fills empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[1] = 2;
      arr[3] = 4;
      arr.fill(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFill0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0120
     * @tc.desc   Verify fill on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(9);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.name   testArrayFill0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0121
     * @tc.desc   Verify fill combined with map returns transformed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(3).fill(2).map((x: number, i: number) => x + i);
      expect(arr).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArrayFill0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0123
     * @tc.desc   Verify fill on large array for performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(10000);
      arr.fill(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[9999]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFill0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0124
     * @tc.desc   Verify fill partially with start and end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.fill(9, 1, 4);
      expect(arr).assertDeepEquals([1, 9, 9, 9, 5]);
    });

    /**
     * @tc.name   testArrayFill0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0125
     * @tc.desc   Verify fill combined with find returns expected result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFill0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(5).fill(3);
      const filled: number = arr.find((x: number) => x === 3) as number;
      expect(filled).assertEqual(3);
    });

  });
}