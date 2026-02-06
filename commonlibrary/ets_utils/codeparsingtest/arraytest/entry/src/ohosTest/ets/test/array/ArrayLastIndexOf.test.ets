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
import {
  testArrayLastIndexOfJs0033,
  testArrayLastIndexOfJs0037,
  testArrayLastIndexOfJs0038,
  testArrayLastIndexOfJs0046,
  testArrayLastIndexOfJs0047,
  testArrayLastIndexOfJs0048,
  testArrayLastIndexOfJs0051,
  testArrayLastIndexOfJs0052,
  testArrayLastIndexOfJs0053,
  testArrayLastIndexOfJs0054,
  testArrayLastIndexOfJs0056,
  testArrayLastIndexOfJs0059,
  testArrayLastIndexOfJs0074,
  testArrayLastIndexOfJs0086,
  testArrayLastIndexOfJs0104
} from './ArrayLastIndexOf';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayLastIndexOfTest() {
  describe('ArrayLastIndexOfTest', () => {
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
     * @tc.name   testArrayLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0001
     * @tc.desc   Verify lastIndexOf finds last occurrence of an element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 2];
      const index: number = arr.lastIndexOf(2);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0002
     * @tc.desc   Verify lastIndexOf returns -1 when element not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const index: number = arr.lastIndexOf("z");
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0003
     * @tc.desc   Verify lastIndexOf with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 2, 4];
      const index: number = arr.lastIndexOf(2, 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0004
     * @tc.desc   Verify lastIndexOf with fromIndex larger than length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const index: number = arr.lastIndexOf(3, 99);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0005
     * @tc.desc   Verify lastIndexOf with negative fromIndex inside bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 6, 7, 8];
      const index: number = arr.lastIndexOf(7, -2);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0006
     * @tc.desc   Verify lastIndexOf with negative fromIndex less than -length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [9, 10, 11];
      const index: number = arr.lastIndexOf(9, -5);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0007
     * @tc.desc   Verify lastIndexOf compares using strict equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, "1"];
      const index = arr.lastIndexOf("1");
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0008
     * @tc.desc   Verify lastIndexOf cannot find NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN];
      const index: number = arr.lastIndexOf(NaN);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0009
     * @tc.desc   Verify lastIndexOf treats +0 and -0 as equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, -0, +0];
      const index: number = arr.lastIndexOf(-0);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0010
     * @tc.desc   Verify lastIndexOf works on sparse arrays with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[2] = undefined;
      const index: number = arr.lastIndexOf(undefined);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0011
     * @tc.desc   Verify lastIndexOf returns last index in duplicate values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "b", "a", "c", "a"];
      const index: number = arr.lastIndexOf("a");
      expect(index).assertEqual(4);
    });

    /**
     * @tc.name   testArrayLastIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0012
     * @tc.desc   Verify lastIndexOf returns -1 on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const index: number = arr.lastIndexOf(1);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0013
     * @tc.desc   Verify lastIndexOf on array with booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false, true];
      const index: number = arr.lastIndexOf(true);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0014
     * @tc.desc   Verify lastIndexOf with fromIndex at 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const index: number = arr.lastIndexOf("a", 0);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0015
     * @tc.desc   Verify lastIndexOf with fromIndex pointing to element not matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const index: number = arr.lastIndexOf(1, 1);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0016
     * @tc.desc   Verify lastIndexOf returns -1 if fromIndex is negative and skips element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["x", "y"];
      const index: number = arr.lastIndexOf("x", -2);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0017
     * @tc.desc   Verify lastIndexOf with mixed type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, "1", 1, "1"];
      const index: number = arr.lastIndexOf(1);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0018
     * @tc.desc   Verify lastIndexOf on array containing object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const o1: Obj = new Obj(1);
      const o2: Obj = new Obj(2);
      const arr: Obj[] = [o1, o2, o1];
      const index: number = arr.lastIndexOf(o1);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0019
     * @tc.desc   Verify lastIndexOf does not match structurally equal objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: Obj[] = [new Obj(1)];
      const index: number = arr.lastIndexOf(new Obj(1));
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0020
     * @tc.desc   Verify lastIndexOf on array containing undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined];
      const index: number = arr.lastIndexOf(undefined);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0021
     * @tc.desc   Verify lastIndexOf skips empty slots in sparse arrays but finds real undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[1] = undefined;
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0022
     * @tc.desc   Verify lastIndexOf does not find NaN since NaN !== NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN, 1, 2];
      const result: number = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0023
     * @tc.desc   Verify lastIndexOf treats 0 and -0 as equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, -0, 0];
      const result: number = arr.lastIndexOf(-0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0024
     * @tc.desc   Verify lastIndexOf with fromIndex larger than array length behaves as if at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const result: number = arr.lastIndexOf("c", 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0025
     * @tc.desc   Verify lastIndexOf with negative fromIndex offsets from array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["x", "y", "z"];
      const result: number = arr.lastIndexOf("x", -2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0026
     * @tc.desc   Verify lastIndexOf with negative fromIndex smaller than -length returns -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 6, 7];
      const result: number = arr.lastIndexOf(5, -10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0027
     * @tc.desc   Verify lastIndexOf with fromIndex as Infinity behaves like fromIndex at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(2, Infinity);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0028
     * @tc.desc   Verify lastIndexOf with fromIndex as -Infinity always returns -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "b"];
      const result: number = arr.lastIndexOf("a", Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0029
     * @tc.desc   Verify lastIndexOf strict equality without type coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | number)[] = [1, "1"];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0030
     * @tc.desc   Verify lastIndexOf finds correct element in large array performance case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(10000).fill(0);
      arr[9999] = 123;
      const result: number = arr.lastIndexOf(123);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.name   testArrayLastIndexOf0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0031
     * @tc.desc   Verify lastIndexOf returns first occurrence when scanning backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 1, 2, 1];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testArrayLastIndexOf0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0032
     * @tc.desc   Verify lastIndexOf with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false, true];
      const result: number = arr.lastIndexOf(true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0033
     * @tc.desc   Verify lastIndexOf works on frozen arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0033()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0034
     * @tc.desc   Verify lastIndexOf handles array with holes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, , 2, , 3];
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0035
     * @tc.desc   Verify lastIndexOf returns -1 when value not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["x", "y", "z"];
      const result: number = arr.lastIndexOf("a");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0036
     * @tc.desc   Verify lastIndexOf with mixed types does not coerce numbers and strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, "2", 3];
      const result: number = arr.lastIndexOf("2");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0037
     * @tc.desc   Verify lastIndexOf can find object reference by identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0037()).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0038
     * @tc.desc   Verify lastIndexOf does not match different object instances with same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0038()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0039
     * @tc.desc   Verify lastIndexOf with nested arrays compares by reference not content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const subArr: number[] = [1, 2];
      const arr: (number[] | number)[] = [subArr, [1, 2]];
      const result: number = arr.lastIndexOf(subArr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0040
     * @tc.desc   Verify lastIndexOf respects fromIndex exactly when specified in middle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const result: number = arr.lastIndexOf(2, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0041
     * @tc.desc   Verify lastIndexOf works correctly on Int32Array (typed array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([10, 20, 30, 20]);
      const result: number = arr.lastIndexOf(20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0042
     * @tc.desc   Verify lastIndexOf returns -1 on typed array when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.1, 2.2, 3.3]);
      const result: number = arr.lastIndexOf(4.4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0043
     * @tc.desc   Verify lastIndexOf treats +0 and -0 as equal in typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0, -0]);
      const result: number = arr.lastIndexOf(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0044
     * @tc.desc   Verify subclassed array inherits lastIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyArray<T> extends Array<T> {
      }

      const arr: MyArray<number> = new MyArray(1, 2, 3, 2);
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0046
     * @tc.desc   Verify lastIndexOf on sealed array still works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0046()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0047
     * @tc.desc   Verify lastIndexOf on array with Object.create(null) prototype still works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0047()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0048
     * @tc.desc   Verify lastIndexOf called on array-like object with numeric keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0048()).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0051
     * @tc.desc   Verify lastIndexOf respects overridden length property on array-like
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0051()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0052
     * @tc.desc   Verify lastIndexOf ignores non-numeric keys in array-like
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0052()).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0053
     * @tc.desc   Verify lastIndexOf called on string (array-like behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0053()).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0054
     * @tc.desc   Verify lastIndexOf with fromIndex as string convertible to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0054()).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0055
     * @tc.desc   Verify lastIndexOf on Uint8Array with max value 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 255, 128, 255]);
      const result: number = arr.lastIndexOf(255);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0056
     * @tc.desc   Verify lastIndexOf works on Proxy with custom length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0056()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0057
     * @tc.desc   Verify lastIndexOf does not confuse different NaN values in typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, NaN]);
      const result: number = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0059
     * @tc.desc   Verify lastIndexOf does not access prototype chain values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0059()).assertEqual(true);
    });

    /**
     * @tc.name   testArrayLastIndexOf0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0061
     * @tc.desc   Should return -1 when element not found in empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0062
     * @tc.desc   Should return 0 when only element matches in single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [7];
      const result: number = arr.lastIndexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0063
     * @tc.desc   Should return -1 when only element does not match in single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [7];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0064
     * @tc.desc   Should return last occurrence index for duplicate elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 1, 2];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0065
     * @tc.desc   Should respect fromIndex=0 and return -1 if element not at index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0066
     * @tc.desc   Should clamp fromIndex greater than length-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(2, 99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0067
     * @tc.desc   Should handle negative fromIndex correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.lastIndexOf(3, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0068
     * @tc.desc   Should return -1 if fromIndex < -length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(1, -5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0069
     * @tc.desc   Should not find NaN because strict equality is used
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN];
      const result: number = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0070
     * @tc.desc   Should treat +0 and -0 as equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0];
      const result: number = arr.lastIndexOf(-0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0071
     * @tc.desc   Should not match empty slots in sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5);
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0072
     * @tc.desc   Should match explicit undefined element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined];
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0073
     * @tc.desc   Should handle large arrays with element at the end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(100000).fill(0);
      arr[99999] = 5;
      const result: number = arr.lastIndexOf(5);
      expect(result).assertEqual(99999);
    });

    /**
     * @tc.name   testArrayLastIndexOf0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0074
     * @tc.desc   Should return correct index for frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0074()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LASTINDEXOF_0075
     * @tc.desc   Should not be affected by array modifications after call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(2);
      arr.push(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0076
     * @tc.desc   Should find element after mapping TypedArray values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 2]);
      const mappedArr: number[] = Array.from(arr).map((x: number) => x * 2);
      const result: number = mappedArr.lastIndexOf(4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0077
     * @tc.desc   Should find element in TypedArray after fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      const filledArr: number[] = Array.from(arr);
      filledArr.fill(5, 1, 3);
      const result: number = filledArr.lastIndexOf(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0078
     * @tc.desc   Should find element after filtering TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5, 2.5, 3.5, 2.5]);
      const filteredArr: number[] = Array.from(arr).filter((x: number) => x > 2);
      const result: number = filteredArr.lastIndexOf(2.5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0079
     * @tc.desc   Should find element after slice on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20]);
      const slicedArr: number[] = Array.from(arr).slice(1, 4);
      const result: number = slicedArr.lastIndexOf(20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0080
     * @tc.desc   Should find element after reverse on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = new Int16Array([1, 2, 3, 2]);
      const reversedArr: number[] = Array.from(arr).reverse();
      const result: number = reversedArr.lastIndexOf(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0081
     * @tc.desc   Should find element after sort on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array([4, 1, 3, 1]);
      const sortedArr: number[] = Array.from(arr).sort((a: number, b: number) => a - b);
      const result: number = sortedArr.lastIndexOf(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0082
     * @tc.desc   Should find element after concat TypedArray with normal array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1, 2, 3]);
      const combinedArr: number[] = Array.from(arr).concat([2, 4]);
      const result: number = combinedArr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0083
     * @tc.desc   Should find element after flatMap on nested TypedArray array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array[] = [new Uint8Array([1, 2]), new Uint8Array([3, 2])];
      const flatArr: number[] = arr.flatMap((x: Uint8Array) => Array.from(x).map((v: number) => v * 2));
      const result: number = flatArr.lastIndexOf(4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0084
     * @tc.desc   Should find last occurrence of zero in TypedArray after map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([0, 1, 0, 2]);
      const mappedArr: number[] = Array.from(arr).map((x: number) => x);
      const result: number = mappedArr.lastIndexOf(0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0085
     * @tc.desc   Should find element after filter + map on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 2]);
      const processedArr: number[] = Array.from(arr)
        .filter((x: number) => x > 1)
        .map((x: number) => x * 10);
      const result: number = processedArr.lastIndexOf(20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0086
     * @tc.desc   Verify lastIndexOf on TypedArray wrapped in Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0086()).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0087
     * @tc.desc   Verify lastIndexOf after fill on TypedArray converted to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 2]);
      const arrCopy: number[] = Array.from(arr);
      arrCopy.fill(5, 1, 3);
      const result: number = arrCopy.lastIndexOf(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0088
     * @tc.desc   Verify lastIndexOf after reverse and map on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1, 2, 3, 2]);
      const processedArr: number[] = Array.from(arr).reverse().map((x: number) => x * 2);
      const result: number = processedArr.lastIndexOf(4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0089
     * @tc.desc   Verify lastIndexOf with sparse TypedArray array flattened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Int8Array = new Int8Array([1, 2]);
      const arr2: Int8Array = new Int8Array([3]);
      const nestedArr: (Int8Array | undefined)[] = [arr1, undefined, arr2];
      const flatArr: number[] = nestedArr.flatMap((x: Int8Array | undefined) => x ? Array.from(x) : []);
      const result: number = flatArr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0090
     * @tc.desc   Verify lastIndexOf after slice + map on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array([10, 20, 30, 20]);
      const processedArr: number[] = Array.from(arr).slice(1).map((x: number) => x + 1);
      const result: number = processedArr.lastIndexOf(21);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0091
     * @tc.desc   Verify lastIndexOf with TypedArray converted to array and filtered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = new Int16Array([1, 2, 3, 2]);
      const filteredArr: number[] = Array.from(arr).filter((x: number) => x > 1);
      const result: number = filteredArr.lastIndexOf(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0092
     * @tc.desc   Verify lastIndexOf after concat TypedArray with normal array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3]);
      const combinedArr: number[] = Array.from(arr).concat([2, 4]);
      const result: number = combinedArr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0093
     * @tc.desc   Verify lastIndexOf on TypedArray after multiple transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 2]);
      const transformed: number[] = Array.from(arr)
        .map((x: number) => x * 2)
        .filter((x: number) => x > 2)
        .reverse();
      const result: number = transformed.lastIndexOf(4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0094
     * @tc.desc   Verify lastIndexOf with TypedArray mapped to object array and find last index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Wrapper {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: Int16Array = new Int16Array([1, 2, 1]);
      const objArr: Wrapper[] = Array.from(arr).map((x: number) => new Wrapper(x));
      const target: Wrapper = objArr[0];
      const result: number = objArr.lastIndexOf(target);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0095
     * @tc.desc   Verify lastIndexOf after fill + map on TypedArray converted to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 2]);
      const processed: number[] = Array.from(arr);
      processed.fill(5, 1, 3).map((x: number) => x * 2);
      const result: number = processed.lastIndexOf(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0096
     * @tc.desc   Verify lastIndexOf on empty TypedArray after map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const mappedArr: number[] = Array.from(arr).map((x: number) => x * 2);
      const result: number = mappedArr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0097
     * @tc.desc   Verify lastIndexOf on TypedArray after flattening nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array[] = [new Int8Array([1, 2]), new Int8Array([3, 1])];
      const flatArr: number[] = arr.flatMap((x: Int8Array) => Array.from(x));
      const result: number = flatArr.lastIndexOf(1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0098
     * @tc.desc   Verify lastIndexOf after TypedArray converted and filtered for even numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 2]);
      const filteredArr: number[] = Array.from(arr).filter((x: number) => x % 2 === 0);
      const result: number = filteredArr.lastIndexOf(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0099
     * @tc.desc   Verify lastIndexOf on TypedArray after map and slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = new Int16Array([5, 10, 5, 20]);
      const processedArr: number[] = Array.from(arr).map((x: number) => x / 5).slice(1);
      const result: number = processedArr.lastIndexOf(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0100
     * @tc.desc   Verify lastIndexOf after TypedArray mapped, filtered, and reversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 2]);
      const processedArr: number[] = Array.from(arr)
        .map((x: number) => x * 2)
        .filter((x: number) => x > 2)
        .reverse();
      const result: number = processedArr.lastIndexOf(4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0101
     * @tc.desc   Verify lastIndexOf with NaN values in normal array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN, 1, NaN];
      const result: number = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayLastIndexOf0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0102
     * @tc.desc   Verify lastIndexOf with +0 and -0 values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, -0, 0];
      const resultPos: number = arr.lastIndexOf(0);
      const resultNeg: number = arr.lastIndexOf(-0);
      expect(resultPos).assertEqual(2);
      expect(resultNeg).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0103
     * @tc.desc   Verify lastIndexOf on array with mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string | boolean)[] = [1, "1", true, 1];
      const resultNum: number = arr.lastIndexOf(1);
      const resultStr: number = arr.lastIndexOf("1");
      const resultBool: number = arr.lastIndexOf(true);
      expect(resultNum).assertEqual(3);
      expect(resultStr).assertEqual(1);
      expect(resultBool).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0104
     * @tc.desc   Verify lastIndexOf on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayLastIndexOfJs0104()).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0105
     * @tc.desc   Verify lastIndexOf on inherited array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyArray extends Array<number> {
      }

      const arr: MyArray = new MyArray(1, 2, 3, 2);
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayLastIndexOf0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0106
     * @tc.desc   Verify lastIndexOf with a large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        arr.push(i % 10);
      }
      const result: number = arr.lastIndexOf(5);
      expect(result).assertEqual(9995);
    });

    /**
     * @tc.name   testArrayLastIndexOf0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0107
     * @tc.desc   Verify lastIndexOf with sparse array having undefined slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[3] = 2;
      arr[5] = 2;
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testArrayLastIndexOf0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0108
     * @tc.desc   Verify lastIndexOf on array of objects by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const obj1: Item = new Item(1);
      const obj2: Item = new Item(2);
      const arr: Item[] = [obj1, obj2, obj1];
      const result: number = arr.lastIndexOf(obj1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayLastIndexOf0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0109
     * @tc.desc   Verify lastIndexOf after map transformation preserving reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Wrapper {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: Wrapper[] = [new Wrapper(1), new Wrapper(2)];
      const mappedArr: Wrapper[] = arr.map((x: Wrapper) => x);
      const result: number = mappedArr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayLastIndexOf0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_LastIndexOf_0110
     * @tc.desc   Verify lastIndexOf on array of different falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayLastIndexOf0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | null | undefined | boolean)[] = [0, false, null, undefined, 0];
      const resultZero: number = arr.lastIndexOf(0);
      const resultFalse: number = arr.lastIndexOf(false);
      const resultNull: number = arr.lastIndexOf(null);
      const resultUndefined: number = arr.lastIndexOf(undefined);
      expect(resultZero).assertEqual(4);
      expect(resultFalse).assertEqual(1);
      expect(resultNull).assertEqual(2);
      expect(resultUndefined).assertEqual(3);
    });
  });
}