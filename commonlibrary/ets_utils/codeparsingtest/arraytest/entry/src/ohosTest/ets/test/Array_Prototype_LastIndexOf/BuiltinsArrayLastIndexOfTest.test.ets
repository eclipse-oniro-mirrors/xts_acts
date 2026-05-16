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
import Utils from '../Util.test';

function isUnique(arr: number[], elem: number): boolean {
  return arr.indexOf(elem) === arr.lastIndexOf(elem);
}

export default function BuiltinsArrayPrototypeLastIndexOfTest(): void {
  describe("BuiltinsArrayPrototypeLastIndexOfTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0100
     * @tc.desc    Verify that LastIndexOf() finds existing element and returns correct index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0200
     * @tc.desc    Verify that LastIndexOf() finds the first element and returns index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30, 40];
      const result: number = arr.lastIndexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0300
     * @tc.desc    Verify that LastIndexOf() finds the last element and returns correct index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30, 40];
      const result: number = arr.lastIndexOf(40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0400
     * @tc.desc    Verify that LastIndexOf() returns -1 for element not in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0500
     * @tc.desc    Verify that LastIndexOf() returns -1 for similar but different element (strict equality)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | string)[] = [1, 2, 3, "4", 5];
      const result: number = arr.lastIndexOf(4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0600
     * @tc.desc    Verify that LastIndexOf() returns last matching index when multiple duplicates exist
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1, 2, 3];
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0700
     * @tc.desc    Verify that LastIndexOf() returns last index when all elements are the same
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 5, 5, 5, 5];
      const result: number = arr.lastIndexOf(5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0800
     * @tc.desc    Verify that LastIndexOf() returns last of adjacent duplicate elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 2, 3, 4];
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_0900
     * @tc.desc    Verify that LastIndexOf() returns number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(2);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1000
     * @tc.desc    Verify that LastIndexOf() returns accurate index for element position
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ["a", "b", "c", "d", "e"];
      const result: number = arr.lastIndexOf("c");
      expect(result === 2).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1100
     * @tc.desc    Verify that LastIndexOf() works with number type parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1200
     * @tc.desc    Verify that LastIndexOf() works with string type parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ["apple", "banana", "cherry"];
      const result: number = arr.lastIndexOf("banana");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1300
     * @tc.desc    Verify that LastIndexOf() works with boolean type parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true, false];
      const result: number = arr.lastIndexOf(true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1400
     * @tc.desc    Verify that LastIndexOf() works with object reference parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      interface Obj {
        id: number;
      }
      const obj: Obj = { id: 1 };
      const arr: Obj[] = [{ id: 1 }, { id: 2 }, obj];
      const result: number = arr.lastIndexOf(obj);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1500
     * @tc.desc    Verify that LastIndexOf() works with positive fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const result: number = arr.lastIndexOf(2, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1600
     * @tc.desc    Verify that LastIndexOf() works when fromIndex is 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const result: number = arr.lastIndexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1700
     * @tc.desc    Verify that LastIndexOf() works with negative fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(3, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1800
     * @tc.desc    Verify that LastIndexOf() works when fromIndex exceeds array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.lastIndexOf(2, 100);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_1900
     * @tc.desc    Verify that LastIndexOf() works when fromIndex is less than negative array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.lastIndexOf(2, -100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2000
     * @tc.desc    Verify that LastIndexOf() works with both searchElement and fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1, 2];
      const result: number = arr.lastIndexOf(2, 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2100
     * @tc.desc    Verify that LastIndexOf() works with only searchElement provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2200
     * @tc.desc    Verify that LastIndexOf() works when fromIndex is omitted
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2300
     * @tc.desc    Verify that LastIndexOf() returns -1 when searching empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2400
     * @tc.desc    Verify that LastIndexOf() returns 0 when finding element in single-element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [42];
      const result: number = arr.lastIndexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2500
     * @tc.desc    Verify that LastIndexOf() returns -1 when element not found in single-element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [42];
      const result: number = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2600
     * @tc.desc    Verify that LastIndexOf() works with fromIndex in single-element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      const result: number = arr.lastIndexOf(5, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2700
     * @tc.desc    Verify that LastIndexOf() finds first element at index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30, 40];
      const result: number = arr.lastIndexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2800
     * @tc.desc    Verify that LastIndexOf() finds last element at index length-1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30, 40];
      const result: number = arr.lastIndexOf(40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_2900
     * @tc.desc    Verify that LastIndexOf() works when fromIndex is set to maximum valid index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(5, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3000
     * @tc.desc    Verify that LastIndexOf() works when fromIndex equals array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.lastIndexOf(3, 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3100
     * @tc.desc    Verify that LastIndexOf() works when fromIndex exceeds array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.lastIndexOf(2, 999);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3200
     * @tc.desc    Verify that LastIndexOf() works when fromIndex is -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.lastIndexOf(5, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3300
     * @tc.desc    Verify that LastIndexOf() works when fromIndex is negative array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.lastIndexOf(1, -4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3400
     * @tc.desc    Verify that LastIndexOf() returns -1 when fromIndex is less than negative array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr.lastIndexOf(2, -100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3500
     * @tc.desc    Verify that LastIndexOf() cannot find NaN (NaN !== NaN)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [1, NaN, 3];
      const result: number = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3600
     * @tc.desc    Verify that LastIndexOf() finds undefined in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined];
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3700
     * @tc.desc    Verify that LastIndexOf() finds undefined at end of array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, 2, 3, undefined];
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3800
     * @tc.desc    Verify that LastIndexOf() cannot find undefined in sparse array holes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, , , 4];
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_3900
     * @tc.desc    Verify that LastIndexOf() finds null in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [1, null, 3, null];
      const result: number = arr.lastIndexOf(null);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4000
     * @tc.desc    Verify that LastIndexOf() works with mixed null and undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (null | undefined)[] = [null, undefined, null, undefined];
      const result1: number = arr.lastIndexOf(null);
      const result2: number = arr.lastIndexOf(undefined);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4100
     * @tc.desc    Verify that LastIndexOf() finds positive zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [0, 1, 0, 2];
      const result: number = arr.lastIndexOf(0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4200
     * @tc.desc    Verify that LastIndexOf() finds negative zero (-0 equals 0)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [0, -0, 0];
      const result: number = arr.lastIndexOf(-0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4300
     * @tc.desc    Verify that LastIndexOf() treats +0 and -0 as same value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [0, -0, 0];
      const result1: number = arr.lastIndexOf(0);
      const result2: number = arr.lastIndexOf(-0);
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4400
     * @tc.desc    Verify that LastIndexOf() finds Infinity in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, Infinity, 3, Infinity];
      const result: number = arr.lastIndexOf(Infinity);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4500
     * @tc.desc    Verify that LastIndexOf() finds -Infinity in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, -Infinity, 3, -Infinity];
      const result: number = arr.lastIndexOf(-Infinity);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4600
     * @tc.desc    Verify that LastIndexOf() distinguishes between Infinity and -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [Infinity, -Infinity, Infinity];
      const result1: number = arr.lastIndexOf(Infinity);
      const result2: number = arr.lastIndexOf(-Infinity);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4700
     * @tc.desc    Verify that LastIndexOf() finds number type element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4800
     * @tc.desc    Verify that LastIndexOf() finds string type element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ["a", "b", "c", "b", "a"];
      const result: number = arr.lastIndexOf("b");
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_4900
     * @tc.desc    Verify that LastIndexOf() finds boolean type element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true];
      const result: number = arr.lastIndexOf(true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5000
     * @tc.desc    Verify that LastIndexOf() finds BigInt type element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: bigint[] = [1n, 2n, 3n, 2n];
      const result: number = arr.lastIndexOf(2n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5100
     * @tc.desc    Verify that LastIndexOf() finds array reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inner: number[] = [1, 2];
      const arr: number[][] = [[1, 2], inner, [1, 2]];
      const result: number = arr.lastIndexOf(inner);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5200
     * @tc.desc    Verify that LastIndexOf() finds function reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const func: () => void = () => {};
      const arr: (() => void)[] = [() => {}, func, () => {}];
      const result: number = arr.lastIndexOf(func);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5300
     * @tc.desc    Verify that LastIndexOf() works with mixed primitive types (strict equality)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | string | boolean)[] = [1, "1", true, 1];
      const result: number = arr.lastIndexOf(1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5400
     * @tc.desc    Verify that LastIndexOf() cannot find element in sparse array holes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, , , 4];
      const result: number = arr.lastIndexOf(2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5500
     * @tc.desc    Verify that LastIndexOf() finds existing element in sparse array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      const result: number = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5600
     * @tc.desc    Verify that LastIndexOf() cannot find undefined in sparse array holes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, , , 4];
      const result: number = arr.lastIndexOf(undefined);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5700
     * @tc.desc    Verify that LastIndexOf() does not modify array during search
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const originalLength: number = arr.length;
      arr.lastIndexOf(3);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5800
     * @tc.desc    Verify that LastIndexOf() does not change array content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const copy: number[] = [1, 2, 3];
      arr.lastIndexOf(2);
      expect(arr[0]).assertEqual(copy[0]);
      expect(arr[1]).assertEqual(copy[1]);
      expect(arr[2]).assertEqual(copy[2]);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_5900
     * @tc.desc    Verify that LastIndexOf() finds element in large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array<number>(10000);
      for (let i: number = 0; i < 10000; i++) {
        arr[i] = i;
      }
      const result: number = arr.lastIndexOf(9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6000
     * @tc.desc    Verify that LastIndexOf() returns -1 when element not found in large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array<number>(10000);
      for (let i: number = 0; i < 10000; i++) {
        arr[i] = i;
      }
      const result: number = arr.lastIndexOf(10000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6100
     * @tc.desc    Verify that LastIndexOf() finds last occurrence of duplicate elements in large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array<number>(10000);
      for (let i: number = 0; i < 10000; i++) {
        arr[i] = 42;
      }
      const result: number = arr.lastIndexOf(42);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6200
     * @tc.desc    Compare indexOf and lastIndexOf results for same element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const first: number = arr.indexOf(2);
      const last: number = arr.lastIndexOf(2);
      expect(first).assertEqual(1);
      expect(last).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6300
     * @tc.desc    Verify indexOf and lastIndexOf return same value for single occurrence
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const first: number = arr.indexOf(3);
      const last: number = arr.lastIndexOf(3);
      expect(first === last).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6400
     * @tc.desc    Verify both return -1 when element not found
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const first: number = arr.indexOf(99);
      const last: number = arr.lastIndexOf(99);
      expect(first === last).assertTrue();
      expect(first).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6500
     * @tc.desc    Use includes to check existence before lastIndexOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let index: number = -1;
      if (arr.includes(3)) {
        index = arr.lastIndexOf(3);
      }
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6600
     * @tc.desc    Verify difference in NaN handling between includes and lastIndexOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [1, NaN, 3];
      const includesResult: boolean = arr.includes(NaN);
      const lastIndexOfResult: number = arr.lastIndexOf(NaN);
      expect(includesResult).assertTrue();
      expect(lastIndexOfResult).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6700
     * @tc.desc    Find element in sliced array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const slice: number[] = arr.slice(1, 4);
      const result: number = slice.lastIndexOf(3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6800
     * @tc.desc    Slice array after finding last index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const lastIndex: number = arr.lastIndexOf(2);
      const slice: number[] = arr.slice(0, lastIndex);
      expect(slice.length).assertEqual(3);
      expect(slice[0]).assertEqual(1);
      expect(slice[1]).assertEqual(2);
      expect(slice[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_6900
     * @tc.desc    Find element in mapped array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const mapped: number[] = [];
      for (let i: number = 0; i < arr.length; i++) {
        mapped.push(arr[i] * 2);
      }
      const result: number = mapped.lastIndexOf(6);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7000
     * @tc.desc    Find element in filtered array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const filtered: number[] = [];
      for (let i: number = 0; i < arr.length; i++) {
        if (arr[i] > 2) {
          filtered.push(arr[i]);
        }
      }
      const result: number = filtered.lastIndexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7100
     * @tc.desc    Find element in concatenated arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [3, 4, 5];
      const combined: number[] = arr1.concat(arr2);
      const result: number = combined.lastIndexOf(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7200
     * @tc.desc    Find element in reversed array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const reversed: number[] = [];
      for (let i: number = arr.length - 1; i >= 0; i--) {
        reversed.push(arr[i]);
      }
      const result: number = reversed.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7300
     * @tc.desc    Find last error in logs array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const logs: string[] = [
        "INFO: Start",
        "ERROR: Failed",
        "INFO: Retry",
        "ERROR: Failed",
        "INFO: Success"
      ];
      const lastError: number = logs.lastIndexOf("ERROR: Failed");
      expect(lastError).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7400
     * @tc.desc    Find last occurrence of "user" in path array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const path: string[] = ["root", "home", "user", "documents", "user"];
      const lastUser: number = path.lastIndexOf("user");
      expect(lastUser).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7500
     * @tc.desc    Find first element in large array (from end)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array<number>(100000);
      for (let i: number = 0; i < 100000; i++) {
        arr[i] = i;
      }
      const result: number = arr.lastIndexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7600
     * @tc.desc    Find last element in large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array<number>(100000);
      for (let i: number = 0; i < 100000; i++) {
        arr[i] = i;
      }
      const result: number = arr.lastIndexOf(99999);
      expect(result).assertEqual(99999);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7700
     * @tc.desc    Find non-existent element in large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array<number>(100000);
      for (let i: number = 0; i < 100000; i++) {
        arr[i] = i;
      }
      const result: number = arr.lastIndexOf(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7800
     * @tc.desc    Find subarray in nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inner: number[] = [1, 2];
      const arr: number[][] = [[1, 2], [3, 4], inner, [5, 6]];
      const result: number = arr.lastIndexOf(inner);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest7900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_7900
     * @tc.desc    Find all matching indices using lastIndexOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1, 2];
      const indices: number[] = [];
      let index: number = arr.lastIndexOf(2);
      while (index !== -1) {
        indices.unshift(index);
        index = index > 0 ? arr.lastIndexOf(2, index - 1) : -1;
      }
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(3);
      expect(indices[2]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest8000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_8000
     * @tc.desc    Check if element is unique using indexOf and lastIndexOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 1];
      expect(isUnique(arr, 2)).assertFalse();
      expect(isUnique(arr, 3)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest8100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_8100
     * @tc.desc    Find last occurrence of elements from first array in second array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3, 4, 5];
      const arr2: number[] = [5, 4, 3, 2, 1];
      let found: boolean = false;
      for (let i: number = 0; i < arr1.length; i++) {
        const lastIndex: number = arr2.lastIndexOf(arr1[i]);
        if (lastIndex !== -1) {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeLastIndexOfTest8200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_LAST_INDEX_OF_TEST_8200
     * @tc.desc    Remove last occurrence of element using lastIndexOf and splice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeLastIndexOfTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 2, 4];
      const lastIndex: number = arr.lastIndexOf(2);
      if (lastIndex !== -1) {
        arr.splice(lastIndex, 1);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
    });

  })
}
