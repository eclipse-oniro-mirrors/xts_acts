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

interface Obj010 { value: number }

interface MyObj018 {
  a: number;
}

class MyClass021 {
  value: number = 0;
}

interface Item025 { id: number }

class Nested032 {
  inner: number = 1;
}

interface Item041 { value: number }

class Nested043 {
  inner: number = 5
}

class Item052 {
  value: number = 0
}

class Nested055 {
  value: number = 1
}

class MyObj057 {
  value: number = 1
}

class ArrayLike072 {
  length: int;
  arr: int[];

  constructor(values: int[]) {
    this.arr = values;
    this.length = values.length;
  }

  fill(value: int, start?: int, end?: int): void {
    const s: int = start ?? 0;
    const e: int = end ?? this.length;
    for (let i: int = s; i < e; i++) {
      this.arr[i] = value;
    }
  }

  get(index: int): int {
    return this.arr[index];
  }
}

class Nested073 {
  value: number = 1
}

class MyObj079 {
  value: number = 0
}

class Obj084 {
  value: number = 0
}

class MyArray090 extends Array<int> {
  constructor(num: int, ...d: int[]) {
    super(num, ...d)
  }
}

class Obj094 {
  value: number = 1
}

class Obj098 {
  value: number = 0
}

class MyArray118 extends Array<int> {
  constructor(num: int, ...d: int[]) {
    super(num, ...d)
  }
}

export default function ArrayFillTest() {
  describe('ArrayFillTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0001
     * @tc.name testArrayFill0001
     * @tc.desc fill entire array with a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(5);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([5, 5, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0002
     * @tc.name testArrayFill0002
     * @tc.desc fill part of array with a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c", "d"];
      arr.fill("x", 1, 3);
      expect(arr).assertDeepEquals(["a", "x", "x", "d"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0003
     * @tc.name testArrayFill0003
     * @tc.desc fill array with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.fill(false);
      expect(arr).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0004
     * @tc.name testArrayFill0004
     * @tc.desc fill with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, 2, 3];
      arr.fill(undefined);
      expect(arr).assertDeepEquals([undefined, undefined, undefined]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0005
     * @tc.name testArrayFill0005
     * @tc.desc fill with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | null)[] = ["a", "b", "c"];
      arr.fill(null, 0, 2);
      expect(arr).assertDeepEquals([null, null, "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0006
     * @tc.name testArrayFill0006
     * @tc.desc fill empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.fill(9);
      const arr1: Array<number> = [];
      expect(arr).assertDeepEquals(arr1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0007
     * @tc.name testArrayFill0007
     * @tc.desc fill array with start index greater than end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 2, 1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0008
     * @tc.name testArrayFill0008
     * @tc.desc fill array with negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("z", -2);
      expect(arr).assertDeepEquals(["a", "z", "z"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0009
     * @tc.name testArrayFill0009
     * @tc.desc fill array with negative end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 0, 0, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0010
     * @tc.name testArrayFill0010
     * @tc.desc fill array with object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const o: Obj010 = { value: 1 };
      const arr: Obj010[] = [{ value: 0 }, { value: 0 }];
      arr.fill(o);
      expect(arr[0]).assertEqual(o);
      expect(arr[1]).assertEqual(o);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0011
     * @tc.name testArrayFill0011
     * @tc.desc fill array with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(NaN);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([NaN, NaN, NaN]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0012
     * @tc.name testArrayFill0012
     * @tc.desc fill array with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(Infinity);
      expect(arr).assertDeepEquals([Infinity, Infinity, Infinity]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0013
     * @tc.name testArrayFill0013
     * @tc.desc fill part of sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, undefined, 3]; // sparse
      arr.fill(0, 0, 2);
      expect(arr).assertDeepEquals([0, 0, 3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0014
     * @tc.name testArrayFill0014
     * @tc.desc fill array with start and end index equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      arr.fill(9, 1, 1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0015
     * @tc.name testArrayFill0015
     * @tc.desc fill array with large start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2];
      arr.fill(0, 10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0016
     * @tc.name testArrayFill0016
     * @tc.desc fill array with large negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2];
      arr.fill(0, -10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([0, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0017
     * @tc.name testArrayFill0017
     * @tc.desc fill array with large negative end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      arr.fill(5, 0, -10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0018
     * @tc.name testArrayFill0018
     * @tc.desc fill array with same value object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: MyObj018 = { a: 1 };
      const arr: MyObj018[] = [{ a: 0 }, { a: 0 }];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0019
     * @tc.name testArrayFill0019
     * @tc.desc fill array with values on negative and positive indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3, 4];
      arr.fill(9, -3, 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 9, 9, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0020
     * @tc.name testArrayFill0020
     * @tc.desc fill array with mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, "b", 3];
      arr.fill("x", 1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, "x", "x"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0021
     * @tc.name testArrayFill0021
     * @tc.desc fill array with object using class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new MyClass021();
      const arr: MyClass021[] = [new MyClass021(), new MyClass021()];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0022
     * @tc.name testArrayFill0022
     * @tc.desc fill array with function references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const fn = () => 42;
      const arr: (() => int)[] = [() => 1, () => 2, () => 3];
      arr.fill(fn, 1);
      expect(arr[0]()).assertEqual(1);
      expect(arr[1]()).assertEqual(42);
      expect(arr[2]()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0023
     * @tc.name testArrayFill0023
     * @tc.desc fill array with start index equal to array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0024
     * @tc.name testArrayFill0024
     * @tc.desc fill array with end index greater than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 1, 10);
      expect(arr).assertDeepEquals(["a", "x", "x"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0025
     * @tc.name testArrayFill0025
     * @tc.desc fill array multiple times to test reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: Item025 = { id: 1 };
      const arr: Item025[] = [{ id: 0 }, { id: 0 }, { id: 0 }];
      arr.fill(obj, 0, 2);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2].id).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0026
     * @tc.name testArrayFill0026
     * @tc.desc fill array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5];
      arr.fill(0);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0027
     * @tc.name testArrayFill0027
     * @tc.desc fill array of length 0 with any value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.fill(1);
      const arr1: Array<number> = [];
      expect(arr).assertDeepEquals(arr1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0028
     * @tc.name testArrayFill0028
     * @tc.desc fill array with mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, "a", 3];
      arr.fill("z", 0, 2);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify(["z", "z", 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0029
     * @tc.name testArrayFill0029
     * @tc.desc fill array with boolean false using negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, true, true];
      arr.fill(false, -2);
      expect(arr).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0030
     * @tc.name testArrayFill0030
     * @tc.desc fill array with numbers using negative end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 0, 0, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0031
     * @tc.name testArrayFill0031
     * @tc.desc fill sparse array partially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, undefined, 3, undefined, 5]; // sparse
      arr.fill(0, 1, 4);
      expect(arr).assertDeepEquals([1, 0, 0, 0, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0032
     * @tc.name testArrayFill0032
     * @tc.desc fill array with object having nested property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new Nested032();
      const arr: Nested032[] = [new Nested032(), new Nested032()];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0033
     * @tc.name testArrayFill0033
     * @tc.desc fill array with float numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0.1, 0.2, 0.3];
      arr.fill(1.5, 0, 2);
      expect(arr).assertDeepEquals([1.5, 1.5, 0.3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0034
     * @tc.name testArrayFill0034
     * @tc.desc fill array with string "test" on all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("test");
      expect(arr).assertDeepEquals(["test", "test", "test"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0035
     * @tc.name testArrayFill0035
     * @tc.desc fill array with null on middle segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, 2, 3, 4, 5];
      arr.fill(null, 1, 4);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, null, null, null, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0036
     * @tc.name testArrayFill0036
     * @tc.desc fill array with boolean true entirely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, false];
      arr.fill(true);
      expect(arr).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0037
     * @tc.name testArrayFill0037
     * @tc.desc fill array using zero start and zero end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 0);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0038
     * @tc.name testArrayFill0038
     * @tc.desc fill array with same string reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "shared";
      const arr: string[] = ["a", "b", "c"];
      arr.fill(str, 1);
      expect(arr).assertDeepEquals(["a", "shared", "shared"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0039
     * @tc.name testArrayFill0039
     * @tc.desc fill array with start and end negative exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, -10, -5);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0040
     * @tc.name testArrayFill0040
     * @tc.desc fill array with undefined in sparse array segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      arr.fill(undefined, 1, 4);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, undefined, undefined, undefined, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0041
     * @tc.name testArrayFill0041
     * @tc.desc fill array with multiple object references using interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: Item041 = { value: 42 };
      const arr: Item041[] = [{ value: 1 }, { value: 2 }, { value: 3 }];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0042
     * @tc.name testArrayFill0042
     * @tc.desc fill array using negative start and end indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, -3, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 0, 0, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0043
     * @tc.name testArrayFill0043
     * @tc.desc fill array with nested objects using class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new Nested043();
      const arr: Nested043[] = [new Nested043(), new Nested043(), new Nested043()];
      arr.fill(obj, 1);
      expect(arr[0].inner).assertEqual(5);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0044
     * @tc.name testArrayFill0044
     * @tc.desc fill array with boolean using start index only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.fill(false, 1);
      expect(arr).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0045
     * @tc.name testArrayFill0045
     * @tc.desc fill array of strings with negative start exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", -10);
      expect(arr).assertDeepEquals(["x", "x", "x"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0046
     * @tc.name testArrayFill0046
     * @tc.desc fill array with same string reference using end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "shared";
      const arr: string[] = ["a", "b", "c"];
      arr.fill(str, 0, 2);
      expect(arr).assertDeepEquals(["shared", "shared", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0047
     * @tc.name testArrayFill0047
     * @tc.desc fill sparse array entirely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined, undefined,]; // sparse array of length 3
      arr.fill(1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 1, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0048
     * @tc.name testArrayFill0048
     * @tc.desc fill array with NaN using start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(NaN, 1, 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, NaN, NaN, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0049
     * @tc.name testArrayFill0049
     * @tc.desc fill array with Infinity using negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(Infinity, -3, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, Infinity, Infinity, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0050
     * @tc.name testArrayFill0050
     * @tc.desc fill array with start index beyond array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0051
     * @tc.name testArrayFill0051
     * @tc.desc fill array with end index beyond array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 0, 10);
      expect(arr).assertDeepEquals(["x", "x", "x"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0052
     * @tc.name testArrayFill0052
     * @tc.desc fill array with objects using class references repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new Item052();
      const arr: Item052[] = [new Item052(), new Item052(), new Item052()];
      arr.fill(obj, 0, 2);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2].value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0053
     * @tc.name testArrayFill0053
     * @tc.desc fill array with multiple types using tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: [number, string, boolean][] = [[1, "a", true], [2, "b", false]];
      arr.fill([0, "x", false], 1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([[1, "a", true], [0, "x", false]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0054
     * @tc.name testArrayFill0054
     * @tc.desc fill array partially with zero start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 0);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0055
     * @tc.name testArrayFill0055
     * @tc.desc fill array with nested objects using negative start exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new Nested055();
      const arr: Nested055[] = [new Nested055(), new Nested055()];
      arr.fill(obj, -10);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0056
     * @tc.name testArrayFill0056
     * @tc.desc fill sparse array completely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined, undefined,];
      arr.fill(9);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([9, 9, 9]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0057
     * @tc.name testArrayFill0057
     * @tc.desc fill array with object, verify reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new MyObj057();
      const arr: MyObj057[] = [new MyObj057(), new MyObj057()];
      arr.fill(obj);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0058
     * @tc.name testArrayFill0058
     * @tc.desc fill only part of sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, undefined, 3, undefined, 5];
      arr.fill(0, 1, 4);
      expect(arr).assertDeepEquals([1, 0, 0, 0, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0059
     * @tc.name testArrayFill0059
     * @tc.desc fill array using end index equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([9, 9, 9]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0060
     * @tc.name testArrayFill0060
     * @tc.desc fill array using end index greater than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 0, 10);
      expect(arr).assertDeepEquals(["x", "x", "x"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0061
     * @tc.name testArrayFill0061
     * @tc.desc fill array using negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, -2);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 0, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0062
     * @tc.name testArrayFill0062
     * @tc.desc fill array with negative end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 0, 0, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0063
     * @tc.name testArrayFill0063
     * @tc.desc fill array with start index beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0064
     * @tc.name testArrayFill0064
     * @tc.desc fill array with end index less than start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 2, 1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0065
     * @tc.name testArrayFill0065
     * @tc.desc fill array with function references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const fn = () => 42;
      const arr: (() => int)[] = [() => 1, () => 2];
      arr.fill(fn);
      expect(arr[0]).assertEqual(fn);
      expect(arr[1]).assertEqual(fn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0066
     * @tc.name testArrayFill0066
     * @tc.desc fill array with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, 2, 3];
      arr.fill(null);
      expect(arr).assertDeepEquals([null, null, null]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0067
     * @tc.name testArrayFill0067
     * @tc.desc fill array with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, 2, 3];
      arr.fill(undefined);
      expect(arr).assertDeepEquals([undefined, undefined, undefined]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0068
     * @tc.name testArrayFill0068
     * @tc.desc fill array with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(NaN);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([NaN, NaN, NaN]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0069
     * @tc.name testArrayFill0069
     * @tc.desc fill array with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(Infinity);
      expect(arr).assertDeepEquals([Infinity, Infinity, Infinity]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0070
     * @tc.name testArrayFill0070
     * @tc.desc fill array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5];
      arr.fill(0);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0071
     * @tc.name testArrayFill0071
     * @tc.desc fill array with negative start exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, -10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([9, 9, 9]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0072
     * @tc.name testArrayFill0072
     * @tc.desc fill array-like object with length property using class wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new ArrayLike072([1, 2, 3]);
      obj.fill(9, 1);
      expect(obj.get(0)).assertEqual(1);
      expect(obj.get(1)).assertEqual(9);
      expect(obj.get(2)).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0073
     * @tc.name testArrayFill0073
     * @tc.desc fill array with nested objects in sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new Nested073();
      const arr: (Nested073 | undefined)[] = [undefined, new Nested073(),];
      arr.fill(obj);
      expect(arr[0]).assertDeepEquals(obj);
      expect(arr[1]).assertDeepEquals(obj);
      try {
        arr[2];
        expect().assertFail();
      } catch(err) {
        expect((err as RangeError).message).assertContain('Out of bounds');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0074
     * @tc.name testArrayFill0074
     * @tc.desc fill array with zero start and zero end (no change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9, 0, 0);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0075
     * @tc.name testArrayFill0075
     * @tc.desc fill array partially using negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(0, 1, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 0, 0, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0076
     * @tc.name testArrayFill0076
     * @tc.desc fill array with multiple types (number | string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string)[] = [1, "a", 2];
      arr.fill("x", 0, 2);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify(["x", "x", 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0077
     * @tc.name testArrayFill0077
     * @tc.desc fill array using negative start and end exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, -10, -5);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0078
     * @tc.name testArrayFill0078
     * @tc.desc fill array with floating point numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0.1, 0.2, 0.3];
      arr.fill(1.5, 0, 2);
      expect(arr).assertDeepEquals([1.5, 1.5, 0.3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0079
     * @tc.name testArrayFill0079
     * @tc.desc fill array with objects partially in sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new MyObj079();
      const arr: (MyObj079 | undefined)[] = [undefined, new MyObj079(), undefined,];
      arr.fill(obj, 1, 3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
      try {
        arr[3];
        expect().assertFail();
      } catch(err) {
        expect((err as RangeError).message).assertContain('Out of bounds');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0080
     * @tc.name testArrayFill0080
     * @tc.desc fill array then map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(5);
      const mapped = arr.map(v => v * 2);
      expect(JSON.stringify(mapped)).assertDeepEquals(JSON.stringify([10, 10, 10, 10]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0081
     * @tc.name testArrayFill0081
     * @tc.desc fill sparse array and use forEach to sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined, undefined,];
      arr.fill(2);
      let sum = 0;
      arr.forEach((v): void => sum += v!);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0082
     * @tc.name testArrayFill0082
     * @tc.desc fill array and filter values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.fill(3, 1, 4);
      const filtered = arr.filter(v => v === 3);
      expect(JSON.stringify(filtered)).assertDeepEquals(JSON.stringify([3, 3, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0083
     * @tc.name testArrayFill0083
     * @tc.desc fill array then slice values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(9, 1, 3);
      const sliced = arr.slice(0, 3);
      expect(JSON.stringify(sliced)).assertDeepEquals(JSON.stringify([1, 9, 9]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0084
     * @tc.name testArrayFill0084
     * @tc.desc fill nested object array then map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const o = new Obj084();
      const arr: Obj084[] = [new Obj084(), new Obj084()];
      arr.fill(o);
      const mapped = arr.map((v: Obj084) => v.value + 1);
      expect(JSON.stringify(mapped)).assertDeepEquals(JSON.stringify([1, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0085
     * @tc.name testArrayFill0085
     * @tc.desc fill array and concat with another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [1, 2, 3];
      arr.fill(0, 1);
      const result = arr.concat([4, 5]);
      expect(result).assertDeepEquals([1, 0, 0, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0086
     * @tc.name testArrayFill0086
     * @tc.desc fill array with function then call each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const fn = () => 1;
      const arr: (() => int)[] = [() => 0, () => 0];
      arr.fill(fn);
      let sum = 0;
      arr.forEach((f): void => sum += f());
      expect(sum).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0087
     * @tc.name testArrayFill0087
     * @tc.desc fill array then reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(9, 1, 3);
      arr.reverse();
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([4, 9, 9, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0088
     * @tc.name testArrayFill0088
     * @tc.desc fill array then join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(0, 1);
      const str = arr.join("-");
      expect(str).assertEqual("1-0-0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0089
     * @tc.name testArrayFill0089
     * @tc.desc fill array partially with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(5, -3, -1);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 5, 5, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0090
     * @tc.name testArrayFill0090
     * @tc.desc fill prototype array and verify instance inherit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new MyArray090(1, 2, 3);
      arr.fill(9, 1);
      expect(arr).assertDeepEquals([1, 9, 9]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0091
     * @tc.name testArrayFill0091
     * @tc.desc fill array then map and filter combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(2, 1, 3);
      const result = arr.map(v => v * 2).filter(v => v > 3);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([4, 4, 8]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0092
     * @tc.name testArrayFill0092
     * @tc.desc fill array then sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 1, 4];
      arr.fill(2, 0, 2);
      arr.sort((a, b) => (a - b).toInt());
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([2, 2, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0093
     * @tc.name testArrayFill0093
     * @tc.desc fill array then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(5, 1);
      const sum = arr.reduce((a:number, b:number) => a + b, 0);
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0094
     * @tc.name testArrayFill0094
     * @tc.desc fill array of objects and forEach modify property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const o = new Obj094();
      const arr: Obj094[] = [new Obj094(), new Obj094()];
      arr.fill(o);
      arr.forEach((v):void => v.value += 1);
      expect(arr[0].value).assertEqual(3);
      expect(arr[1].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0095
     * @tc.name testArrayFill0095
     * @tc.desc fill array then slice and fill again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const slice = arr.slice(1, 3);
      slice.fill(9);
      expect(JSON.stringify(slice)).assertDeepEquals(JSON.stringify([9, 9]));
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0096
     * @tc.name testArrayFill0096
     * @tc.desc fill array with booleans then map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      arr.fill(false);
      const result = arr.map(v => v ? 1 : 0);
      expect(result).assertDeepEquals([0, 0, 0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0097
     * @tc.name testArrayFill0097
     * @tc.desc fill array then concat multiple arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<int> = [1, 2];
      arr.fill(0);
      const result = arr.concat([3, 4], [5]);
      expect(result).assertDeepEquals([0, 0, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0098
     * @tc.name testArrayFill0098
     * @tc.desc fill nested object array partially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const o1 = new Obj098();
      const o2 = new Obj098();
      const arr: Obj098[] = [o1, o2, o1];
      arr.fill(o2, 1, 3);
      expect(arr[0]).assertEqual(o1);
      expect(arr[1]).assertEqual(o2);
      expect(arr[2]).assertEqual(o2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0099
     * @tc.name testArrayFill0099
     * @tc.desc fill array with strings then join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      arr.fill("x", 1);
      const result = arr.join(",");
      expect(result).assertEqual("a,x,x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0100
     * @tc.name testArrayFill0100
     * @tc.desc fill array then every check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(7);
      const allSevens = arr.every(v => v === 7);
      expect(allSevens).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0101
     * @tc.name testArrayFill0101
     * @tc.desc fill array then some check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(2, 1);
      const hasTwo = arr.some(v => v === 2);
      expect(hasTwo).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0102
     * @tc.name testArrayFill0102
     * @tc.desc fill array then find index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(5, 2);
      const idx = arr.findIndex(v => v === 5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0103
     * @tc.name testArrayFill0103
     * @tc.desc fill array then find value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(9);
      const value = arr.find(v => v === 9);
      expect(value).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0104
     * @tc.name testArrayFill0104
     * @tc.desc fill array then reverse and map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(2, 1, 3);
      arr.reverse();
      const mapped = arr.map(v => v * 2);
      expect(JSON.stringify(mapped)).assertDeepEquals(JSON.stringify([8, 4, 4, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0105
     * @tc.name testArrayFill0105
     * @tc.desc fill array then reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.fill(1);
      const sum = arr.reduceRight((a:number, b:number) => a + b, 0);
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0106
     * @tc.name testArrayFill0106
     * @tc.desc fill array then flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      arr.fill([0, 0], 1);
      const flat = arr.flat();
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, 2, 0, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0107
     * @tc.name testArrayFill0107
     * @tc.desc fill array then splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.fill(9, 1, 3);
      const spliced = arr.splice(1, 2);
      expect(JSON.stringify(spliced)).assertDeepEquals(JSON.stringify([9, 9]));
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0108
     * @tc.name testArrayFill0108
     * @tc.desc fill array then flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [1, 2, 3];
      arr.fill(0, 1);
      const result = arr.flatMap((v: int) => [v, v + 1]);
      expect(result).assertDeepEquals([1, 2, 0, 1, 0, 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0109
     * @tc.name testArrayFill0109
     * @tc.desc fill array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.fill(0, 1, 4);
      arr.copyWithin(3, 0, 2);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 0, 0, 1, 0]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0111
     * @tc.name testArrayFill0111
     * @tc.desc create array, fill, then find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(5).fill(0).map((_: int, i: int): int => i + 1);
      arr.fill(3, 1, 4);
      const found: int | undefined = arr.find((v: int): boolean => v === 3);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0112
     * @tc.name testArrayFill0112
     * @tc.desc create array, fill, then map to double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(4).fill(0).map((_: int, i: int): int => i);
      arr.fill(2, 1);
      const mapped: int[] = arr.map((v: int): int => v * 2);
      expect(mapped).assertDeepEquals([0, 4, 4, 4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0113
     * @tc.name testArrayFill0113
     * @tc.desc fill then filter and reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(5).fill(0).map((_: int, i: int): int => i + 1);
      arr.fill(3, 1, 4);
      const sum: int =
        arr.filter((v: int): boolean => v === 3).reduce((a: int, b: int): int => a + b, 0);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0114
     * @tc.name testArrayFill0114
     * @tc.desc fill then reverse and find index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(4).fill(0).map((_: int, i: int): int => i + 1);
      arr.fill(7, 1, 3);
      arr.reverse();
      const idx: int = arr.findIndex((v: int): boolean => v === 7);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0115
     * @tc.name testArrayFill0115
     * @tc.desc fill, slice, then map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(6).fill(0).map((_: int, i: int): int => i);
      arr.fill(5, 2, 5);
      const mapped: int[] = arr.slice(1, 5).map((v: int): int => v * 2);
      expect(mapped).assertDeepEquals([2, 10, 10, 10]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0118
     * @tc.name testArrayFill0118
     * @tc.desc Verify fill on inherited array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: MyArray118 = new MyArray118(1, 2, 3);
      arr.fill(7);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(7);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0119
     * @tc.name testArrayFill0119
     * @tc.desc Verify fill on sparse array fills empty slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = new Array<number | undefined>(5);
      arr[1] = 2;
      arr[3] = 4;
      arr.fill(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0120
     * @tc.name testArrayFill0120
     * @tc.desc Verify fill on Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(9);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0121
     * @tc.name testArrayFill0121
     * @tc.desc Verify fill combined with map returns transformed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = new Array<int>(3).fill(2).map((x: int, i: int) => x + i);
      expect(arr).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0123
     * @tc.name testArrayFill0123
     * @tc.desc Verify fill on large array for performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = new Array<int>(10000);
      arr.fill(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[9999]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0124
     * @tc.name testArrayFill0124
     * @tc.desc Verify fill partially with start and end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.fill(9, 1, 4);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 9, 9, 9, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_0125
     * @tc.name testArrayFill0125
     * @tc.desc Verify fill combined with find returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testArrayFill0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = new Array<int>(5).fill(3);
      const filled: int = arr.find((x: int) => x === 3) as int;
      expect(filled).assertEqual(3);
    });

  });
}