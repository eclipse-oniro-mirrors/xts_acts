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
  testArrayFindIndexJs0009,
  testArrayFindIndexJs0023,
  testArrayFindIndexJs0029,
  testArrayFindIndexJs0047,
  testArrayFindIndexJs0051,
  testArrayFindIndexJs0054,
  testArrayFindIndexJs0062,
  testArrayFindIndexJs0064,
  testArrayFindIndexJs0074,
  testArrayFindIndexJs0076,
  testArrayFindIndexJs0079,
  testArrayFindIndexJs0092,
  testArrayFindIndexJs0101,
  testArrayFindIndexJs0102,
  testArrayFindIndexJs0110,
  testArrayFindIndexJs0111
} from './ArrayFindIndex';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayFindIndexTest() {
  describe('ArrayFindIndexTest', () => {
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
     * @tc.name   testArrayFindIndex0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0001
     * @tc.desc   Should return index of first element greater than 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 12, 8, 20];
      const index: number = arr.findIndex((x: number): boolean => x > 10);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0002
     * @tc.desc   Should return -1 when no element matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const index: number = arr.findIndex((x: number): boolean => x > 5);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0003
     * @tc.desc   Should find index in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[2] = 5;
      arr[5] = 10;
      const index: number = arr.findIndex((x: number | undefined): boolean => x === 10);
      expect(index).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFindIndex0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0004
     * @tc.desc   Should find first object by property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: Obj[] = [new Obj(1), new Obj(2)];
      const index: number = arr.findIndex((x: Obj): boolean => x.val === 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0005
     * @tc.desc   Should find element using string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["apple", "banana", "cherry"];
      const index: number = arr.findIndex((x: string): boolean => x.startsWith("b"));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0006
     * @tc.desc   Should find boolean false in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, true, false];
      const index: number = arr.findIndex((x: boolean): boolean => x === false);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0007
     * @tc.desc   Should find first undefined in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const index: number = arr.findIndex((x: number | undefined): boolean => x === undefined);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0008
     * @tc.desc   Should find NaN in array using isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN, 0, 1];
      const index: number = arr.findIndex((x: number): boolean => isNaN(x));
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0009
     * @tc.desc   Should find symbol in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0009()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0010
     * @tc.desc   Should find element in multidimensional array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const index: number = arr.findIndex((x: number[]): boolean => x.includes(4));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0011
     * @tc.desc   Should find first element greater than average
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const avg: number = arr.reduce((sum: number, val: number): number => sum + val, 0) / arr.length;
      const index: number = arr.findIndex((x: number): boolean => x > avg);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0012
     * @tc.desc   Should return -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const index: number = arr.findIndex((x: number): boolean => x > 0);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0013
     * @tc.desc   Should find first element in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const index: number = arr.findIndex((x: number): boolean => x === 500);
      expect(index).assertEqual(500);
    });

    /**
     * @tc.name   testArrayFindIndex0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0014
     * @tc.desc   Should find object in array where multiple properties match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        a: number;
        b: number;

        constructor(a: number, b: number) {
          this.a = a;
          this.b = b;
        }
      }

      const arr: Obj[] = [new Obj(1, 2), new Obj(3, 4)];
      const index: number = arr.findIndex((x: Obj): boolean => x.a === 3 && x.b === 4);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0015
     * @tc.desc   Should find first string containing substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["abc", "def", "xyz"];
      const index: number = arr.findIndex((x: string): boolean => x.includes("d"));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0016
     * @tc.desc   Should find first truthy string in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["", "", "ok"];
      const index: number = arr.findIndex((x: string): boolean => Boolean(x));
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0017
     * @tc.desc   Should find first non-zero number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 0, 3, 4];
      const index: number = arr.findIndex((x: number): boolean => x !== 0);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0018
     * @tc.desc   Should find first element divisible by 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 14, 21];
      const index: number = arr.findIndex((x: number): boolean => x % 7 === 0);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0019
     * @tc.desc   Should find first negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, -2, 3, -4];
      const index: number = arr.findIndex((x: number): boolean => x < 0);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0020
     * @tc.desc   Should find first element equal to a specific object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const a = new Obj(1);
      const b = new Obj(2);
      const arr: Obj[] = [a, b];
      const index: number = arr.findIndex((x: Obj): boolean => x === b);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0021
     * @tc.desc   Should find first element after array modification in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const index: number = arr.findIndex((x: number, i: number, a: number[]): boolean => {
        if (i === 0) {
          a[2] = 10;
        }
        return x === 10;
      });
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0022
     * @tc.desc   Should find element in large array of 10000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const index: number = arr.findIndex((x: number): boolean => x === 9999);
      expect(index).assertEqual(9999);
    });

    /**
     * @tc.name   testArrayFindIndex0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0023
     * @tc.desc   Should return -1 if array is frozen and element not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0023()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0024
     * @tc.desc   Should find first element using thisArg context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Context {
        threshold: number = 10;
      }

      const ctx: Context = new Context();
      const arr: number[] = [5, 12, 8];
      const index: number = arr.findIndex((x: number): boolean => x > ctx.threshold);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0025
     * @tc.desc   Should find element after fill operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 0, 0];
      arr.fill(7);
      const index: number = arr.findIndex((x: number): boolean => x === 7);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0026
     * @tc.desc   Should find element after map operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3].map((x: number): number => x * 2);
      const index: number = arr.findIndex((x: number): boolean => x === 4);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0027
     * @tc.desc   Should find element after filter operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4].filter((x: number): boolean => x % 2 === 0);
      const index: number = arr.findIndex((x: number): boolean => x === 4);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0028
     * @tc.desc   Should find first nested array containing 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const index: number = arr.findIndex((x: number[]): boolean => x.includes(5));
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0029
     * @tc.desc   Should find first object with nested property value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0029()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0030
     * @tc.desc   Should find first element that is odd after map and fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 0, 0].map((x: number): number => x + 1);
      arr.fill(3, 1);
      const index: number = arr.findIndex((x: number): boolean => x % 2 !== 0);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0031
     * @tc.desc   Should find first element greater than 50 in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const index: number = arr.findIndex((x: number): boolean => x > 50);
      expect(index).assertEqual(51);
    });

    /**
     * @tc.name   testArrayFindIndex0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0032
     * @tc.desc   Should find first string matching regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["foo", "bar", "baz"];
      const index: number = arr.findIndex((x: string): boolean => /ba/.test(x));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0033
     * @tc.desc   Should find first boolean true value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [false, false, true, false];
      const index: number = arr.findIndex((x: boolean): boolean => x);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0034
     * @tc.desc   Should return -1 if callback throws and never matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      let errorCaught: boolean = false;
      try {
        arr.findIndex((x: number): boolean => {
          throw new Error("fail");
        });
      } catch (e) {
        errorCaught = true;
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFindIndex0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0035
     * @tc.desc   Should find first element after deletion in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const index: number = arr.findIndex((x: number, i: number, a: number[]): boolean => {
        if (i === 0) {
          a.pop();
        }
        return x === 2;
      });
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0036
     * @tc.desc   Should find first element in nested object array using map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: Item[] = [new Item(1), new Item(5)];
      const index: number = arr.map((x: Item) => x.val).findIndex((x: number) => x === 5);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0037
     * @tc.desc   Should find first element after filter with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const filtered: number[] = arr.filter((x: number) => x % 2 === 0 && x > 2);
      const index: number = filtered.findIndex((x: number) => x === 4);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0038
     * @tc.desc   Should find element in array of objects with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        a: number;

        constructor(a: number) {
          this.a = a;
        }
      }

      const o1 = new Obj(1);
      const o2 = new Obj(2);
      const arr: Obj[] = [o1, o2];
      const index: number = arr.findIndex((x: Obj) => x === o2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0039
     * @tc.desc   Should find first string matching length condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "ab", "abc"];
      const index: number = arr.findIndex((x: string) => x.length === 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0040
     * @tc.desc   Should find first element after multiple map and fill operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 0, 0].map(x => x + 1);
      arr.fill(5, 1, 3);
      const index: number = arr.findIndex(x => x === 5);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0041
     * @tc.desc   Should return -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const index: number = arr.findIndex((x: number) => x > 0);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0042
     * @tc.desc   Should find first element in array with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, NaN, 2];
      const index: number = arr.findIndex((x: number) => Number.isNaN(x));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0043
     * @tc.desc   Should return -1 if callback never matches in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const index: number = arr.findIndex((x: number) => x < 0);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0044
     * @tc.desc   Should find element in array of mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string | boolean)[] = [true, "test", 5];
      const index: number = arr.findIndex((x: number | string | boolean) => typeof x === "string");
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0045
     * @tc.desc   Should find first element in nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const index: number = arr.findIndex((x: number[]) => x[0] === 3);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0046
     * @tc.desc   Should find element after modifying array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const index: number = arr.findIndex((x: number, i: number, a: number[]) => {
        if (i === 0) {
          a.length = 2;
        }
        return x === 3;
      });
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0047
     * @tc.desc   Should find first element after deleting another element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0047()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0048
     * @tc.desc   Should find element using complex condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: Item[] = [new Item(1), new Item(4), new Item(7)];
      const index: number = arr.findIndex((x: Item) => x.val % 2 === 0 && x.val > 3);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0049
     * @tc.desc   Should return -1 if array contains only undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined];
      const index: number = arr.findIndex((x: number | undefined) => x !== undefined);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0050
     * @tc.desc   Should find element in array after combining map and filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5].map(x => x * 2).filter(x => x > 4);
      const index: number = arr.findIndex((x: number) => x === 6);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0051
     * @tc.desc   Should return -1 when called on non-array object without length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0051()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0052
     * @tc.desc   Should find first element in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[2] = 5;
      arr[5] = 10;
      const index: number = arr.findIndex((x: number | undefined) => x === 10);
      expect(index).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFindIndex0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0053
     * @tc.desc   Should handle large sparse array efficiently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      arr[999] = 1;
      const index: number = arr.findIndex(x => x === 1);
      expect(index).assertEqual(999);
    });

    /**
     * @tc.name   testArrayFindIndex0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0054
     * @tc.desc   Should throw error if callback is not a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0054()).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFindIndex0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0055
     * @tc.desc   Should find element in array after chained map and fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 1, 2].map(x => x + 1);
      arr.fill(5, 1, 3);
      const index: number = arr.findIndex(x => x === 5);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0056
     * @tc.desc   Should find element in array of objects using reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Obj {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const o1 = new Obj(1);
      const o2 = new Obj(2);
      const arr: Obj[] = [o1, o2];
      const index: number = arr.findIndex(x => x === o2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0057
     * @tc.desc   Should return -1 when all elements are undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined, undefined];
      const index: number = arr.findIndex(x => x !== undefined);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0058
     * @tc.desc   Should find first element with complex numeric condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6];
      const index: number = arr.findIndex(x => x > 2 && x % 2 === 0);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0059
     * @tc.desc   Should find element in array of booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [false, false, true, false];
      const index: number = arr.findIndex(x => x);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0060
     * @tc.desc   Should find first string starting with "a"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["b", "a", "abc"];
      const index: number = arr.findIndex(x => x.startsWith("a"));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0061
     * @tc.desc   Should return correct index in readonly array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: readonly number[] = [1, 2, 3, 4];
      const index: number = arr.findIndex(x => x === 3);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0062
     * @tc.desc   Should return correct index in frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0062()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0063
     * @tc.desc   Should find element in nested object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: Item[] = [new Item(1), new Item(2), new Item(3)];
      const index: number = arr.findIndex(x => x.val === 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0064
     * @tc.desc   Should skip deleted element during findIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0064()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0065
     * @tc.desc   Should find element after modifying array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const index: number = arr.findIndex((x: number, i: number, a: number[]) => {
        if (i === 0) {
          a.length = 2;
        }
        return x === 4;
      });
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0066
     * @tc.desc   Should find element in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const index: number = arr.findIndex(x => x === 9999);
      expect(index).assertEqual(9999);
    });

    /**
     * @tc.name   testArrayFindIndex0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0067
     * @tc.desc   Should find element in array after mapping and filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5].map(x => x * 2).filter(x => x > 4);
      const index: number = arr.findIndex(x => x === 6);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0068
     * @tc.desc   Should return -1 when no element satisfies condition in nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const index: number = arr.findIndex(x => x[0] === 5);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0069
     * @tc.desc   Should find first element in boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [false, false, true, false];
      const index: number = arr.findIndex(x => x);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0070
     * @tc.desc   Should find first string element starting with "a"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["b", "a", "abc"];
      const index: number = arr.findIndex(x => x.startsWith("a"));
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0071
     * @tc.desc   Should find element in sparse array after fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[3] = 7;
      arr.fill(5, 0, 2);
      const index: number = arr.findIndex(x => x === 7);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0072
     * @tc.desc   Should find object by reference in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const o1 = new Item(1);
      const o2 = new Item(2);
      const arr: Item[] = [o1, o2];
      const index: number = arr.findIndex(x => x === o2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0073
     * @tc.desc   Should catch error when callback throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      let errorCaught: boolean = false;
      try {
        arr.findIndex(x => {
          throw new Error("fail");
        });
      } catch (e) {
        errorCaught = true;
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFindIndex0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0074
     * @tc.desc   Should find element in array after modifying prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0074()).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0075
     * @tc.desc   Should find element in array after chaining map and filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4].map(x => x * 2).filter(x => x > 4);
      const index: number = arr.findIndex(x => x === 6);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0076
     * @tc.desc   Should find element in array after deleting multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0076()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0077
     * @tc.desc   Should return -1 for empty sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[5] = undefined;
      const index: number = arr.findIndex(x => x !== undefined);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0078
     * @tc.desc   Should find element after inserting new elements at beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.unshift(1);
      const index: number = arr.findIndex(x => x === 1);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0079
     * @tc.desc   Should find element in array of objects with nested property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0079()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0080
     * @tc.desc   Should find element in array after reversing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4].reverse();
      const index: number = arr.findIndex(x => x === 1);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0081
     * @tc.desc   Should find element after chaining fill and map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 0, 0].fill(2).map(x => x + 1);
      const index: number = arr.findIndex(x => x === 3);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0082
     * @tc.desc   Should find first even element after filtering odd numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6].filter(x => x % 2 === 0);
      const index: number = arr.findIndex(x => x > 3);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0083
     * @tc.desc   Should find element in nested array after flat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const flatArr: number[] = ([] as number[]).concat(...arr);
      const index: number = flatArr.findIndex(x => x === 4);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0084
     * @tc.desc   Should find element in array of mixed types using typeof guard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string | boolean)[] = [1, "a", true, 2];
      const index: number = arr.findIndex(x => typeof x === "string");
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0085
     * @tc.desc   Should find first number >1000 in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const index: number = arr.findIndex(x => x > 1000);
      expect(index).assertEqual(1001);
    });

    /**
     * @tc.name   testArrayFindIndex0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0086
     * @tc.desc   Should find first string longer than 3 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "ab", "abc", "abcd"];
      const index: number = arr.findIndex(x => x.length > 3);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0087
     * @tc.desc   Should find first non-null element in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | null)[] = [null, null, 5, null];
      const index: number = arr.findIndex(x => x !== null);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0088
     * @tc.desc   Should find element in array after reverse and fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3].reverse();
      arr.fill(5, 0, 1);
      const index: number = arr.findIndex(x => x === 5);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0089
     * @tc.desc   Should return -1 when no element satisfies complex condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const index: number = arr.findIndex(x => x > 10 && x < 20);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0090
     * @tc.desc   Should find element in array with objects after map transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(v: number) {
          this.val = v;
        }
      }

      const arr: Item[] = [1, 2, 3].map(x => new Item(x));
      const index: number = arr.findIndex(x => x.val === 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0091
     * @tc.desc   Should find element in array of nested objects with chained properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Inner { value: number };

      interface Nested { nested: Inner };

      class Item {
        data: Nested;

        constructor(v: number) {
          this.data = { nested: { value: v } };
        }
      }

      const arr: Item[] = [new Item(1), new Item(2), new Item(3)];
      const index: number = arr.findIndex(x => x.data.nested.value === 3);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0092
     * @tc.desc   Should find element after deleting element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0092()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0093
     * @tc.desc   Shouldn't find element after adding new element at end during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const index: number = arr.findIndex((x, i, a) => {
        if (i === 1) {
          a.push(4);
        }
        return x === 4;
      });
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0094
     * @tc.desc   Should find element in array created from non-array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface ArrLike {
        __0: number;
        __1: number;
        length: number;
      }

      const obj: ArrLike = { __0: 1, __1: 2, length: 2 };
      const arr: number[] = [obj.__0, obj.__1];
      const index: number = arr.findIndex(x => x === 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0095
     * @tc.desc   Should find first element after fill and reverse combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 0, 0].fill(2).reverse();
      const index: number = arr.findIndex(x => x === 2);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0096
     * @tc.desc   Should return -1 when searching in empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const index: number = arr.findIndex(x => x === 1);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0097
     * @tc.desc   Should find element after chaining filter, map, and fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5].filter(x => x > 2).map(x => x * 2).fill(10, 1, 2);
      const index: number = arr.findIndex(x => x === 10);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0098
     * @tc.desc   Should find element in array after shifting elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.shift();
      const index: number = arr.findIndex(x => x === 2);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0099
     * @tc.desc   Should find element after slicing array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5].slice(1, 4);
      const index: number = arr.findIndex(x => x === 4);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0100
     * @tc.desc   Should find element in large sparse array after fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = Array(1000);
      arr[500] = 999;
      const index: number = arr.findIndex(x => x === 999);
      expect(index).assertEqual(500);
    });

    /**
     * @tc.name   testArrayFindIndex0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0101
     * @tc.desc   Verify findIndex on Proxy array intercepting get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0101()).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0102
     * @tc.desc   Verify findIndex after modifying array prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0102()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0103
     * @tc.desc   Verify findIndex on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      const result: number = arr.findIndex((x: number) => x === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0104
     * @tc.desc   Verify findIndex on sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[3] = 4;
      const result: number = arr.findIndex((x: number | undefined) => x === 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0105
     * @tc.desc   Verify findIndex on large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        arr.push(i);
      }
      const result: number = arr.findIndex((x: number) => x === 9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.name   testArrayFindIndex0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0106
     * @tc.desc   Verify findIndex with array.fill + findIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(5).fill(3);
      const result: number = arr.findIndex((x: number) => x === 3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0107
     * @tc.desc   Verify findIndex on array of objects by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Item {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const obj1: Item = new Item(1);
      const obj2: Item = new Item(2);
      const arr: Item[] = [obj1, obj2, obj1];
      const result: number = arr.findIndex((x: Item) => x === obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0108
     * @tc.desc   Verify findIndex after map preserves reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Wrapper {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: Wrapper[] = [new Wrapper(1), new Wrapper(2)];
      const mappedArr: Wrapper[] = arr.map((x: Wrapper) => x);
      const result: number = mappedArr.findIndex((x: Wrapper) => x === arr[1]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0109
     * @tc.desc   Verify findIndex on typed Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      const result: number = arr.findIndex((x: number) => x === 2.2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0110
     * @tc.desc   Verify findIndex on Proxy with added elements dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0110()).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0111
     * @tc.desc   Verify findIndex on frozen array with existing value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayFindIndexJs0111()).assertEqual(1);
    });

    /**
     * @tc.name   testArrayFindIndex0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0112
     * @tc.desc   Verify findIndex on inherited array class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyArray extends Array<number> {
      }

      const arr: MyArray = new MyArray(1, 2, 3, 4);
      const result: number = arr.findIndex((x: number) => x === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0113
     * @tc.desc   Verify findIndex on array with multiple NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN, 1, NaN, 2];
      const result: number = arr.findIndex((x: number) => x !== x); // check for NaN
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFindIndex0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0115
     * @tc.desc   Verify findIndex on array after map returns new references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Wrapper {
        val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: Wrapper[] = [new Wrapper(1), new Wrapper(2)];
      const mappedArr: Wrapper[] = arr.map((x: Wrapper) => new Wrapper(x.val));
      const result: number = mappedArr.findIndex((x: Wrapper) => x === arr[0]);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayFindIndex0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0116
     * @tc.desc   Verify findIndex on large typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(10000);
      arr[9999] = 42;
      const result: number = arr.findIndex((x: number) => x === 42);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.name   testArrayFindIndex0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0117
     * @tc.desc   Verify findIndex on sparse typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(5);
      arr[3] = 5;
      const result: number = arr.findIndex((x: number) => x === 5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFindIndex0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0118
     * @tc.desc   Verify findIndex after using fill and map combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array(5).fill(2).map((x: number, i: number) => x + i);
      const result: number = arr.findIndex((x: number) => x === 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFindIndex0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INDEX_0119
     * @tc.desc   Verify findIndex on array of objects with nested properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testArrayFindIndex0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Inner { val: number };

      class Item {
        data: Inner;

        constructor(val: number) {
          this.data = { val };
        }
      }

      const obj1: Item = new Item(1);
      const obj2: Item = new Item(2);
      const arr: Item[] = [obj1, obj2];
      const result: number = arr.findIndex((x: Item) => x.data.val === 2);
      expect(result).assertEqual(1);
    });
  });
}