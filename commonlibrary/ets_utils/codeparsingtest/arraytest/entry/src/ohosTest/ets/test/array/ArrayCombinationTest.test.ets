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
  Fn004_ArrayCombinationTest,
  Fn016_ArrayCombinationTest,
  Fn019_ArrayCombinationTest,
  Fn024_ArrayCombinationTest,
  Fn073_ArrayCombinationTest,
  Fn080_ArrayCombinationTest,
  Fn084_ArrayCombinationTest,
  Fn102_ArrayCombinationTest,
  Fn105_ArrayCombinationTest
} from './ArrayCombinationTest';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function ArrayCombinationTest() {
  describe('ArrayCombinationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.name   ArrayCombinationTest001
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr {
        key: string
      }

      const original: Array<number | string | arr> = [3, 'a', 1, { key: 'val' }, 5, 2];

      const result = original
        .filter(item => typeof item === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .concat(6)
        .slice(1);

      result[1] = 10;

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 10, 5, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest002
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1 = [10, 20];
      const arr2 = [30, 40, 50];

      const result = arr1
        .concat(arr2)
        .slice(1, 4)
        .reverse()
        .fill(0, 1, 2)
        .map(item => item * 2);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([80, 0, 40]));
    });

    /**
     * @tc.name   ArrayCombinationTest003
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [9, 8, 7, 6, 5]
        .sort((a, b) => a - b)
        .filter(x => x % 2 === 1)
        .concat(10)
        .map((x, i, arr) => i === arr.length - 1 ? 15 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 7, 9, 15]));
    });

    /**
     * @tc.name   ArrayCombinationTest004
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn004_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 3, 5, 7]));
    });

    /**
     * @tc.name   ArrayCombinationTest005
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = [5, 2, 8, 1];

      const result = original.slice()
        .splice(1, 2, 3)
        .concat(original)
        .sort((a, b) => a - b)
        .reverse();

      const corrected = original.slice();
      corrected.splice(1, 2, 3);
      const result2 = corrected.sort((a, b) => a - b).reverse();

      expect(JSON.stringify(result2)).assertEqual(JSON.stringify([5, 3, 1]));
    });

    /**
     * @tc.name   ArrayCombinationTest006
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sparseArr = [1, , 3, , 5];

      const result = sparseArr
        .filter(item => item !== undefined)
        .fill(0, 1, 2)
        .concat(7);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 0, 5, 7]));
    });

    /**
     * @tc.name   ArrayCombinationTest007
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mixedArr = [2, -3, 4];

      const result = mixedArr
        .filter(num => num > 0 ? num : Math.abs(num))
        .sort((a, b) => a - b)
        .concat(5);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-3, 2, 4, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest008
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const arr3 = [5, 6];

      const result = arr1
        .concat(arr2, arr3)
        .slice(1, 5)
        .map(num => num * 2)
        .slice(0, -1);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 6, 8]));
    });

    /**
     * @tc.name   ArrayCombinationTest009
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_0900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numArr = [3, 7, 2, 8, 4];

      const targetIndex = numArr.findIndex(num => num > 5);
      const result = numArr
        .slice(0, targetIndex)
        .concat(numArr.slice(targetIndex + 1))
        .concat(6)
        .sort((a, b) => a - b);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 4, 6, 8]));
    });

    /**
     * @tc.name   ArrayCombinationTest010
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dirtyArr = [null, 3, undefined, 1, null, 5];

      const result = dirtyArr
        .filter(item => item != null)
        .sort((a, b) => Number(a) - Number(b))
        .concat(7, 9);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 3, 5, 7, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest011
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const baseArr = [1, 2, 3];

      const sum = baseArr.reduce((acc, curr) => acc + curr, 0);
      const result = Array.of(sum, sum * 2, sum * 3)
        .sort((a, b) => b - a);
      result[1] = 10;

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([18, 10, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest012
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strNumArr = [3, 1, 4, 2];

      const result = strNumArr
        .join(',')
        .split(',')
        .map(Number)
        .sort((a, b) => a - b)
        .slice(1)
        .concat(5);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 4, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest013
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr {
        name: string,
        age: number
      };
      const userArr: Array<arr> = [
        { name: 'b', age: 20 },
        { name: 'a', age: 25 },
        { name: 'c', age: 18 }
      ];

      const result = userArr
        .filter(user => user.age > 19)
        .sort((a, b) => a.name.localeCompare(b.name));
      result[0].age = 30;
      const ageArr = result.map(user => user.age);

      expect(JSON.stringify(ageArr)).assertEqual(JSON.stringify([30, 20]));
    });

    /**
     * @tc.name   ArrayCombinationTest014
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strArr = ['a', 'bc', 'def', 'gh', 'ijkl'];

      const result = strArr
        .filter(str => str.length > 2)
        .sort((a, b) => a.localeCompare(b))
        .concat('mn')
        .slice(0, -1);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['def', 'ijkl']));
    });

    /**
     * @tc.name   ArrayCombinationTest015
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numArr = [2, 4, 5, 6, 9];

      const allEven = numArr.every(num => num % 2 === 0);
      const processed = allEven ? numArr : numArr.map(num => num % 2 !== 0 ? num + 1 : num);
      const result = processed
        .sort((a, b) => a - b)
        .concat(0)
        .slice(1);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 6, 6, 10, 0]));
    });

    /**
     * @tc.name   ArrayCombinationTest016
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn016_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([11, 20, 15]));
    });

    /**
     * @tc.name   ArrayCombinationTest017
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mixedNums = [-3, 2, -1, 4, 0];

      const hasNegative = mixedNums.some(num => num < 0);
      const processed = hasNegative ? mixedNums.map(num => Math.abs(num)) : mixedNums;
      const result = processed
        .sort((a, b) => a - b)
        .concat(-1)
        .sort((a, b) => a - b);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-1, 0, 1, 2, 3, 4]));
    });

    /**
     * @tc.name   ArrayCombinationTest018
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ['a', 5, 'b', 10, 'c', 15, true, 20, false, 25]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => ![1, 3].includes(i))
        .concat(8, 22)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 1 ? 7 : (i === 3 ? 23 : x));

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 7, 15, 23, 25]));
    });

    /**
     * @tc.name   ArrayCombinationTest019
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_1900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn019_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
    });

    /**
     * @tc.name   ArrayCombinationTest020
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numStrArr = [7, 2, 5];

      const str = numStrArr.join(',');
      const result = str
        .split(',')
        .map(Number)
        .sort((a, b) => a - b);
      result[0] = 0;
      result.push(numStrArr.length);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 5, 7, 3]));
    });

    /**
     * @tc.name   ArrayCombinationTest021
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolArr = [true, false, true, false, true];

      const result = boolArr
        .filter(b => b)
        .map(() => 1)
        .concat(0)
        .sort((a, b) => a - b);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 1, 1]));
    });

    /**
     * @tc.name   ArrayCombinationTest022
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [2, 6, 3, 7, 4, 8];

      const targetIndex = nums.findIndex(num => num > 5);
      const remaining = nums
        .slice(0, targetIndex)
        .concat(nums.slice(targetIndex + 1))
        .filter((_, i) => i !== targetIndex - 1 && i !== targetIndex + 1);
      const sorted = remaining.sort((a, b) => a - b);
      const avg = sorted.reduce((acc, curr) => acc + curr, 0) / sorted.length;
      sorted.push(avg);

      expect(JSON.stringify(sorted)).assertEqual(JSON.stringify([3, 4, 8, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest023
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arrA = [1, 2];
      const arrB = [3, 4, 5];

      const merged = arrA.concat(arrB);
      const filled = merged.slice().fill(9, 0, 3);
      const result = filled
        .filter(num => num !== 9)
        .concat(9)
        .sort((a, b) => a - b);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 5, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest024
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let withoutMiddle: Array<number> = Fn024_ArrayCombinationTest();
      expect(JSON.stringify(withoutMiddle)).assertEqual(JSON.stringify([2, 8, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest025
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const origin = [3, 5, 7, 4];

      const result = origin
        .map(num => num * 2)
        .filter(num => num > 10)
        .sort((a, b) => a - b);
      result[result.length - 1] = 0;

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0]));
    });

    /**
     * @tc.name   ArrayCombinationTest026
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const factors = [2, 3, 4];

      const product = factors.reduceRight((acc, curr) => acc * curr, 1);
      const result = factors
        .concat(product)
        .sort((a, b) => a - b)
        .slice(1);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 4, 24]));
    });

    /**
     * @tc.name   ArrayCombinationTest027
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const words = ['cat', 'a', 'ab', 'dog', 'bc'];

      const sortedByLen = words.sort((a, b) => a.length - b.length);
      const result = sortedByLen
        .filter(str => str.length === 2)
        .concat('fox')
        .sort((a, b) => a.length - b.length);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['ab', 'bc', 'fox']));
    });

    /**
     * @tc.name   ArrayCombinationTest028
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numbers = [1, 2, 3, 4, 5, 6];

      const withoutIndex2 = numbers.slice(0, 2).concat(numbers.slice(3));
      const result = withoutIndex2
        .filter(num => num % 2 === 0)
        .sort((a, b) => a - b)
        .concat(6, 8, 10);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 4, 6, 6, 8, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest029
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_2900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dirty = [4, undefined, 1, undefined, 3, 2];
      const another = [6, 5];

      const result = dirty
        .filter(item => item !== undefined)
        .sort((a, b) => Number(a) - Number(b))
        .concat(another)
        .slice(0, -1);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest030
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dirty = [4, undefined, 1, undefined, 3, 2];
      const another = [6, 5];

      const result = dirty
        .filter(item => item !== undefined)
        .sort((a, b) => Number(a) - Number(b))
        .concat(another)
        .slice(0, -1);

      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest031
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [5, 3, 1, 4, 2]
        .sort((a, b) => a - b)
        .filter((x, i) => i !== 0)
        .map((x, i) => i === 1 ? 10 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 10, 4, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest032
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, 20, 30]
        .filter(x => x % 2 === 0)
        .sort((a, b) => a - b)
        .concat(50)
        .filter(x => x !== 10);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([20, 30, 50]));
    });

    /**
     * @tc.name   ArrayCombinationTest033
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [7, 1, 9, 4]
        .slice(1, 3)
        .sort((a, b) => a - b)
        .concat(2)
        .sort((a, b) => a - b)
        .filter(x => x !== 9);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   ArrayCombinationTest034
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 50, 200]
        .sort((a, b) => a - b)
        .slice(0, 2)
        .concat(150);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([50, 100, 150]));
    });

    /**
     * @tc.name   ArrayCombinationTest035
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 3, 5, 7]
        .filter(x => x % 2 === 1)
        .concat(9)
        .filter(x => x !== 1);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 5, 7, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest036
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [8, 4, 2, 6]
        .sort((a, b) => a - b)
        .slice(0, 3)
        .concat(10)
        .filter(x => x !== 6);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 4, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest037
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, 2, 5, 8]
        .filter(x => x > 5)
        .sort((a, b) => a - b)
        .concat(6)
        .sort((a, b) => a - b)
        .filter(x => x !== 8);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([6, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest038
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [3, 6, 9, 12]
        .sort((a, b) => a - b)
        .slice(2)
        .concat(15)
        .filter(x => x !== 9);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([12, 15]));
    });

    /**
     * @tc.name   ArrayCombinationTest039
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_3900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [11, 22, 33, 44]
        .filter(x => x % 2 === 0)
        .concat(55)
        .map((x, i) => i === 0 ? 66 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([66, 44, 55]));
    });

    /**
     * @tc.name   ArrayCombinationTest040
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 2, 3, 4, 5]
        .sort((a, b) => a - b)
        .filter((x, i) => i !== 0)
        .map((x, i, arr) => i === arr.length - 1 ? 10 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 4, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest041
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [5, 4, 3, 2, 1]
        .sort((a, b) => a - b)
        .filter(x => x !== 1 && x !== 5)
        .concat(0)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 2, 3, 4]));
    });

    /**
     * @tc.name   ArrayCombinationTest042
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 200, 300]
        .sort((a, b) => a - b)
        .slice(1, 2)
        .concat(150)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([150, 200]));
    });

    /**
     * @tc.name   ArrayCombinationTest043
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [7, 5, 3, 1]
        .sort((a, b) => a - b)
        .filter(x => x !== 1 && x !== 7)
        .concat(4)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 4, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest044
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 10, 100, 1000]
        .filter(x => x < 100)
        .sort((a, b) => a - b)
        .concat(50)
        .filter(x => x !== 10);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 50]));
    });

    /**
     * @tc.name   ArrayCombinationTest045
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [2, 4, 6, 8]
        .sort((a, b) => a - b)
        .slice(0, 3)
        .filter(x => x !== 4)
        .concat(3)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest046
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, 20, 30, 40]
        .sort((a, b) => a - b)
        .filter((x, i) => i !== 0)
        .map((x, i) => i === 0 ? 15 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([15, 30, 40]));
    });

    /**
     * @tc.name   ArrayCombinationTest047
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [15, 5, 25, 10]
        .sort((a, b) => a - b)
        .filter(x => x !== 5 && x !== 25)
        .concat(20)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 15, 20]));
    });

    /**
     * @tc.name   ArrayCombinationTest048
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 2, 3, 4, 5, 6]
        .filter(x => x % 2 === 0)
        .sort((a, b) => a - b)
        .concat(8)
        .filter(x => x !== 6);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 4, 8]));
    });

    /**
     * @tc.name   ArrayCombinationTest049
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_4900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [9, 8, 7, 6]
        .sort((a, b) => a - b)
        .slice(0, 3)
        .concat(10)
        .filter(x => x !== 8);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([6, 7, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest050
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 200, 300, 400]
        .sort((a, b) => a - b)
        .slice(1, 3)
        .concat(250)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([200, 250, 300]));
    });

    /**
     * @tc.name   ArrayCombinationTest051
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, -5, 20, 0, 15, -3, 25, 30, -10, 5]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(1, 2)
        .filter((x, i) => i !== 0)
        .map((x, i) => i === 1 ? 0 : x)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-5, 0, 1, 2]));
    });

    /**
     * @tc.name   ArrayCombinationTest052
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 50, 200, 75, 150, 25, 300, 125, 350, 225]
        .sort((a, b) => a - b)
        .slice(3, 8)
        .filter(x => x !== 150 && x !== 225)
        .concat(175, 275)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([100, 125, 175, 200, 275]));
    });

    /**
     * @tc.name   ArrayCombinationTest053
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        .filter(x => x % 2 === 1)
        .sort((a, b) => a - b)
        .filter(x => x !== 5 && x !== 9)
        .concat(0, 2, 4, 6, 8)
        .sort((a, b) => a - b)
        .map((x, i) => i === 3 ? 10 : (i === 5 ? 12 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2, 10, 4, 12, 7, 8]));
    });

    /**
     * @tc.name   ArrayCombinationTest054
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [-10, 5, 0, 15, -5, 20, 10, -15, 25, 30]
        .sort((a, b) => a - b)
        .slice(1, -1)
        .concat(7, 12)
        .sort((a, b) => a - b)
        .filter(x => x !== 0 && x !== 15);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-10, -5, 5, 7, 10, 12, 20, 25]));
    });

    /**
     * @tc.name   ArrayCombinationTest055
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
        .filter(x => x > 400)
        .sort((a, b) => a - b)
        .concat(450, 550)
        .sort((a, b) => a - b)
        .filter(x => x !== 500 && x !== 900);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([450, 550, 600, 700, 800, 1000]));
    });

    /**
     * @tc.name   ArrayCombinationTest056
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, -2, 3, -4, 5, -6, 7, -8, 9, -10]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(0, 2)
        .filter(x => x !== -8 && x !== -4)
        .map((x, i) => i === 0 ? 10 : x)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-6, -2, 0, 2, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest057
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, -2, 3, -4, 5, -6, 7, -8, 9, -10]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(0, 2)
        .filter(x => x !== -8 && x !== -4)
        .map((x, i) => i === 0 ? 10 : x)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-6, -2, 0, 2, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest058
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        .filter(x => x % 2 === 0)
        .sort((a, b) => a - b)
        .slice(1, -1)
        .concat(15, 95)
        .sort((a, b) => a - b)
        .filter(x => x !== 30 && x !== 80);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([15, 20, 40, 50, 60, 70, 90, 95]));
    });

    /**
     * @tc.name   ArrayCombinationTest059
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_5900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [5, 1, 7, 3, 9, 2, 4, 6, 8, 10]
        .sort((a, b) => a - b)
        .slice(1, 7)
        .filter(x => x !== 3 && x !== 7)
        .concat(11, 12)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 15 : (i === 3 ? 16 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 4, 15, 16, 11, 12]));
    });

    /**
     * @tc.name   ArrayCombinationTest060
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [-20, -15, -10, -5, 0, 5, 10, 15, 20, 25]
        .sort((a, b) => a - b)
        .filter(x => x >= 0)
        .concat(-1, 30)
        .sort((a, b) => a - b)
        .filter(x => x !== 10 && x !== 25);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-1, 0, 5, 15, 20, 30]));
    });

    /**
     * @tc.name   ArrayCombinationTest061
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10]
        .sort((a, b) => a - b)
        .slice(0, 5)
        .concat(55, 65)
        .filter(x => x !== 20 && x !== 50)
        .map((x, i) => i === 0 ? 5 : x)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 30, 40, 55, 65]));
    });

    /**
     * @tc.name   ArrayCombinationTest062
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
        .filter(x => x < 10)
        .sort((a, b) => a - b)
        .concat(10, 12, 14)
        .filter(x => x !== 5 && x !== 9)
        .map((x, i) => i === 1 ? 2 : (i === 3 ? 8 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 7, 8, 12, 14]));
    });

    /**
     * @tc.name   ArrayCombinationTest063
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [25, 50, 75, 100, 125, 150, 175, 200, 225, 250]
        .sort((a, b) => a - b)
        .filter((x, i) => i % 2 === 1)
        .filter(x => x !== 100 && x !== 200)
        .concat(75, 175)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 125 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([50, 75, 125, 175, 250]));
    });

    /**
     * @tc.name   ArrayCombinationTest064
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        .filter(x => x % 2 !== 0)
        .concat(1, 3, 5, 7, 9)
        .filter(x => x !== 3 && x !== 7);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 5, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest065
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [15, 25, 35, 45, 55, 65, 75, 85, 95, 105]
        .sort((a, b) => a - b)
        .slice(2, 8)
        .concat(40, 70)
        .sort((a, b) => a - b)
        .filter(x => x !== 45 && x !== 75);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([35, 40, 55, 65, 70, 85]));
    });

    /**
     * @tc.name   ArrayCombinationTest066
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [-30, -20, -10, 0, 10, 20, 30, 40, 50, 60]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(-5, 5)
        .filter(x => x !== -20 && x !== -10)
        .map((x, i) => i === 0 ? -25 : x)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-25, -5, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest067
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 150, 200, 250, 300, 350, 400, 450, 500]
        .sort((a, b) => a - b)
        .slice(1, 6)
        .filter(x => x !== 200 && x !== 350)
        .concat(175, 325)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([150, 175, 250, 300, 325]));
    });

    /**
     * @tc.name   ArrayCombinationTest068
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        .filter(x => x % 2 === 1)
        .sort((a, b) => a - b)
        .filter(x => x !== 5 && x !== 11)
        .concat(0, 2, 4, 6, 8, 10)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2, 3, 4, 6, 7, 8, 9, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest069
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_6900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
        .sort((a, b) => a - b)
        .filter((x, i) => i % 2 === 0)
        .filter(x => x !== 15 && x !== 45)
        .concat(10, 40)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 10, 25, 35, 40]));
    });

    /**
     * @tc.name   ArrayCombinationTest070
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, -20, 30, -40, 50, -60, 70, -80, 90, -100]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(0, 20)
        .filter(x => x !== -80 && x !== -40)
        .map((x, i) => i === 0 ? -90 : x)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-90, -60, -20, 0, 20]));
    });

    /**
     * @tc.name   ArrayCombinationTest071
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = [5, 1, 7, 3, 9];
      const result = original.slice().sort((a, b) => a - b).slice(1, 4).concat();
      result[1] = 10;
      const final = result.concat(2).sort((a, b) => a - b);
      expect(JSON.stringify(final)).assertEqual(JSON.stringify([2, 3, 7, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest072
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr { v: number };
      const objArr: Array<arr> = [{ v: 3 }, { v: 1 }, { v: 5 }, { v: 2 }];
      const sorted = objArr.slice().sort((a, b) => a.v - b.v);
      const filtered = sorted.filter(item => item.v > 2);
      filtered[0].v = 6;
      const withNew = filtered.concat({ v: 4 }).sort((a, b) => a.v - b.v);
      const result = withNew.map(item => item.v);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 5, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest073
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn073_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 4, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest074
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mixed = [2, '3', 5, '1', 4];
      const nums = mixed.map(item => Number(item));
      const sorted = nums.slice().sort((a, b) => a - b);
      const withoutIndex2 = sorted.slice(0, 2).concat(sorted.slice(3));
      const with6 = withoutIndex2.concat(6);
      const first3 = with6.slice(0, 3);
      first3[2] = 7;
      expect(JSON.stringify(first3)).assertEqual(JSON.stringify([1, 2, 7]));
    });

    /**
     * @tc.name   ArrayCombinationTest075
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sparse = [1, , null, 3, , 5];
      const valid = sparse.filter(item => item != null);
      const result = valid.slice().sort((a, b) => Number(a) - Number(b)).concat(2).concat();
      result[1] = 0;
      result.sort((a, b) => Number(a) - Number(b));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 2, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest076
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [1, 2, 3, 4];
      const sum = nums.reduce((acc, curr) => acc + curr, 0);
      const generated = [sum, sum * 2];
      const result = generated.filter(num => num > 10).concat(5).sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 20]));
    });

    /**
     * @tc.name   ArrayCombinationTest077
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fruits = ['apple', 'banana', 'cherry', 'date'];
      const sortedByLen = fruits.slice().sort((a, b) => a.length - b.length);
      const filtered = sortedByLen.filter(str => str.length > 5);
      filtered[0] = 'grape';
      const result = filtered.concat('kiwi').sort((a, b) => a.localeCompare(b));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['cherry', 'grape', 'kiwi']));
    });

    /**
     * @tc.name   ArrayCombinationTest078
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bools = [true, false, true, true, false];
      const nums = bools.map(b => b ? 1 : 0);
      const result = nums.filter(num => num === 1)
        .slice()
        .sort((a, b) => a - b)
        .concat(0)
        .slice(1)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 1, 1]));
    });

    /**
     * @tc.name   ArrayCombinationTest079
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_7900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr {
        name: string,
        age: number
      }

      const users = [
        { name: '张三', age: 20 } as arr,
        { name: '李四', age: 17 } as arr,
        { name: '王五', age: 25 } as arr
      ];
      const adults = users.filter(u => u.age >= 18);
      const sortedAdults = adults.slice().sort((a, b) => a.age - b.age);
      const withNew = sortedAdults.concat({ name: '赵六', age: 19 });
      const reSorted = withNew.sort((a, b) => a.age - b.age);
      const result = reSorted.map(u => u.name);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['赵六', '张三', '王五']));
    });

    /**
     * @tc.name   ArrayCombinationTest080
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn080_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 0, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest081
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [7, 2, 8, 2, 9];
      const lastIndex = nums.lastIndexOf(2);
      const sliced = nums.slice(lastIndex);
      const result = sliced.slice().sort((a, b) => a - b).concat(3).concat();
      result[0] = 1;
      result.sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 3, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest082
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const evens = [4, 6, 8, 10];
      const allEven = evens.every(num => num % 2 === 0);
      const doubled = allEven ? evens.map(num => num * 2) : evens;
      const result = doubled.slice()
        .sort((a, b) => a - b)
        .concat(1)
        .slice(0, 1)
        .concat(doubled.slice(2));
      result.sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([8, 16, 20]));
    });

    /**
     * @tc.name   ArrayCombinationTest083
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr { x: number }

      const mixed: Array<number | string | arr> = [3, 'a', { x: 2 }, 5, 'b'];
      const numbers = mixed.filter(item => typeof item === 'number');
      const result = numbers.slice().sort((a, b) => Number(a) - Number(b)).concat(10).slice(0, 2);
      result[1] = 7;
      result.push(2);
      result.sort((a, b) => Number(a) - Number(b));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 7]));
    });

    /**
     * @tc.name   ArrayCombinationTest084
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn084_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 5, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest085
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const animals = ['cat', 'dog', 'bird', 'fish'];
      const upper = animals.map(str => str.toUpperCase());
      const sorted = upper.slice().sort();
      const withI = sorted.filter(str => str.includes('I'));
      const result = withI.concat('ZEBRA').sort();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['BIRD', 'FISH', 'ZEBRA']));
    });

    /**
     * @tc.name   ArrayCombinationTest086
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [10, 20, 30, 40];
      const with15 = nums.slice();
      with15.splice(2, 0, 15);
      const filtered = with15.filter(num => num > 25);
      const result = filtered.slice().sort((a, b) => a - b).concat(5).concat();
      result[result.length - 1] = 25;
      result.sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([25, 30, 40]));
    });

    /**
     * @tc.name   ArrayCombinationTest087
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr { id: number };
      const objs = [{ id: 2 } as arr, { id: 5 } as arr, { id: 3 } as arr, { id: 1 } as arr];
      const targetIndex = objs.findIndex(obj => obj.id === 3);
      const withoutTarget = objs.slice(0, targetIndex).concat(objs.slice(targetIndex + 1));
      const with4 = withoutTarget.concat({ id: 4 });
      const sorted = with4.sort((a, b) => a.id - b.id);
      const result = sorted.map(obj => obj.id);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 4, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest088
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negatives = [-3, 2, -5, 1, -1];
      const absValues = negatives.map(num => Math.abs(num));
      const result = absValues.slice()
        .sort((a, b) => a - b)
        .filter(num => num > 2)
        .concat(0)
        .slice(1)
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest089
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_8900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, -5, 20, 0, 15, -3, 25, 30, -10, 5, 1.5, -2.5]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(0.5, -1)
        .slice(1, -1)
        .map((x, i) => i === 1 ? 1 : (i === 2 ? -1 : x))
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-5, -1, 0.5, 1]));
    });

    /**
     * @tc.name   ArrayCombinationTest090
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, -50, 200, 75, -25, 150, -100, 300, 50, -75]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(0, 100)
        .slice(1, -1)
        .map((x, i) => i === 1 ? 20 : (i === 3 ? 30 : x))
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-75, -25, 20, 30]));
    });

    /**
     * @tc.name   ArrayCombinationTest091
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [5, 15, 25, 35, 45, 55, 65, 75, 85, 95]
        .filter(x => x % 5 === 0)
        .sort((a, b) => a - b)
        .slice(2, 8)
        .filter(x => x !== 35 && x !== 65)
        .concat(30, 70)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 40 : (i === 4 ? 60 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([25, 30, 40, 55, 60, 75]));
    });

    /**
     * @tc.name   ArrayCombinationTest092
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [-10, 5, 0, 15, -5, 20, 10, -15, 25, 30, -20, 35]
        .sort((a, b) => a - b)
        .filter((x, i) => ![0, 3, 5, 7, 9, 11].includes(i))
        .concat(-2, 40)
        .sort((a, b) => a - b)
        .filter(x => x !== 5 && x !== 25);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-15, -10, -2, 0, 10, 20, 30, 40]));
    });

    /**
     * @tc.name   ArrayCombinationTest093
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        .filter(x => x > 5)
        .sort((a, b) => a - b)
        .concat(5.5, 11.5)
        .filter(x => x !== 6 && x !== 12)
        .sort((a, b) => a - b)
        .map((x, i) => i === 3 ? 8.5 : (i === 5 ? 10.5 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5.5, 7, 8, 8.5, 10, 10.5, 11.5]));
    });

    /**
     * @tc.name   ArrayCombinationTest094
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 'apple', 2, 'banana', 3, 'cherry', true, false, null, undefined]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => ![0, 2].includes(i))
        .concat(4, 5)
        .map((x, i) => i === 1 ? 3 : x)
        .sort((a, b) => Number(a) - Number(b));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest095
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]
        .sort((a, b) => a - b)
        .filter(x => Math.abs(x) > 5)
        .concat(6, 7)
        .filter(x => x !== -10 && x !== -7)
        .map((x, i) => i === 0 ? 10 : (i === 3 ? 15 : x))
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-8, -6, 7, 10, 15]));
    });

    /**
     * @tc.name   ArrayCombinationTest096
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]
        .filter(x => x < 15)
        .sort((a, b) => a - b)
        .concat(14, 16)
        .filter(x => x !== 5 && x !== 13)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 8 : (i === 5 ? 15 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 3, 8, 9, 11, 15, 16]));
    });

    /**
     * @tc.name   ArrayCombinationTest097
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200]
        .filter(x => x > 600)
        .sort((a, b) => a - b)
        .concat(650, 1050)
        .sort((a, b) => a - b)
        .filter(x => x !== 700 && x !== 1100);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([650, 800, 900, 1000, 1050, 1200]));
    });

    /**
     * @tc.name   ArrayCombinationTest098
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]
        .filter(x => x % 2 !== 0)
        .concat(1, 3, 5, 7, 9, 11)
        .filter(x => x !== 5 && x !== 11)
        .map((x, i) => i === 1 ? 2 : (i === 2 ? 8 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 8, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest099
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_9900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [15, 25, 35, 45, 55, 65, 75, 85, 95, 105, 115, 125]
        .sort((a, b) => a - b)
        .filter((x, i) => [1, 3, 5, 7, 9, 11].includes(i))
        .filter(x => x !== 45 && x !== 105)
        .concat(30, 90)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 70 : (i === 4 ? 80 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([25, 30, 70, 85, 80, 125]));
    });

    /**
     * @tc.name   ArrayCombinationTest100
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        .filter(x => x > 5)
        .sort((a, b) => a - b)
        .concat(5.5, 6.5, 7.5)
        .filter(x => x !== 6 && x !== 12)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 15 : (i === 5 ? 20 : x))
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5.5, 6.5, 7.5, 8, 10, 11, 15, 20]));
    });

    /**
     * @tc.name   ArrayCombinationTest101
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dates = [new Date(2023, 5, 1), new Date(2024, 2, 15), new Date(2023, 11, 30)];
      const sorted = dates.slice().sort((a, b) => Number(a) - Number(b));
      const filtered = sorted.filter(d => d.getFullYear() < 2024);
      filtered[0] = new Date(2023, 8, 1);
      const withNew = filtered.concat(new Date(2024, 0, 10));
      const result = withNew.sort((a, b) => Number(a) - Number(b));
      expect(JSON.stringify(result))
        .assertEqual(JSON.stringify([new Date(2023, 8, 1), new Date(2023, 11, 30), new Date(2024, 0, 10)]));
    });

    /**
     * @tc.name   ArrayCombinationTest102
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn102_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([25, 36, 49]));
    });

    /**
     * @tc.name   ArrayCombinationTest103
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mixed = [6, '8', 3, '5', 9];
      const hasStr = mixed.some(item => typeof item === 'string');
      const nums = hasStr ? mixed.map(item => Number(item)) : mixed;
      const sorted = nums.slice().sort((a, b) => Number(a) - Number(b));
      const withoutIndex3 = sorted.slice(0, 3).concat(sorted.slice(4));
      const with7 = withoutIndex3.concat(7);
      const result = with7.sort((a, b) => Number(a) - Number(b));
      result[2] = 10;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 5, 10, 7, 9]));
    });

    /**
     * @tc.name   ArrayCombinationTest104
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const funcs: Array<(a: number) => number> = [(a) => a + 1, (a) => a * 2, (a) => a - 3];
      const results = funcs.map(fn => fn(5));
      const sorted = results.slice().sort((a, b) => a - b);
      const filtered = sorted.filter(num => num > 5);
      const with15 = filtered.concat(15);
      const result = with15.concat();
      result[1] = 8;
      result.sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([6, 8, 15]));
    });

    /**
     * @tc.name   ArrayCombinationTest105
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: Array<number> = Fn105_ArrayCombinationTest();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 8, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest106
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fruits = ['orange', 'Banana', 'apple', 'Grape'];
      const lower = fruits.map(str => str.toLowerCase());
      const sortedByChar = lower.slice().sort();
      const filtered = sortedByChar.filter(str => str[0] >= 'a' && str[0] <= 'd');
      const withDate = filtered.concat('date');
      const result = withDate.sort((a, b) => a.length - b.length);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['date', 'apple', 'banana']));
    });

    /**
     * @tc.name   ArrayCombinationTest107
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fruits = ['orange', 'Banana', 'apple', 'Grape'];
      const lower = fruits.map(str => str.toLowerCase());
      const sortedByChar = lower.slice().sort();
      const filtered = sortedByChar.filter(str => str[0] >= 'a' && str[0] <= 'd');
      const withDate = filtered.concat('date');
      const result = withDate.sort((a, b) => a.length - b.length);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['date', 'apple', 'banana']));
    });

    /**
     * @tc.name   ArrayCombinationTest108
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const withNaN = [3, NaN, 1, NaN, 5];
      const filtered = withNaN.filter(num => !isNaN(num));
      const sorted = filtered.slice().sort((a, b) => a - b);
      const with7 = sorted.concat(7);
      const result = with7.concat();
      result[2] = 0;
      result.sort((a, b) => a - b);
      result.push(NaN);
      const final = result.filter(num => !isNaN(num));
      expect(JSON.stringify(final)).assertEqual(JSON.stringify([0, 1, 3, 7]));
    });

    /**
     * @tc.name   ArrayCombinationTest109
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_10900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface arr1 { val: number }

      interface arr2 { data: arr1 }

      const nestedObjs: Array<arr2> = [{ data: { val: 4 } }, { data: { val: 2 } }, { data: { val: 6 } }];
      const sorted = nestedObjs.slice().sort((a, b) => a.data.val - b.data.val);
      const filtered = sorted.filter(obj => obj.data.val > 3);
      filtered[0].data.val = 5;
      const withNew = filtered.concat({ data: { val: 3 } });
      const reSorted = withNew.sort((a, b) => a.data.val - b.data.val);
      const result = reSorted.map(obj => obj.data.val);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 5, 6]));
    });

    /**
     * @tc.name   ArrayCombinationTest110
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ofArr = Array.of(9, 3, 7, 1, 5);
      const reversed = ofArr.slice().reverse();
      const filled = reversed.slice().fill(0, 1, 4);
      const filtered = filled.filter(num => num > 0);
      const with13 = filtered.concat(13);
      const sorted = with13.sort((a, b) => a - b);
      const result = sorted.concat();
      result[1] = 7;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 7, 13]));
    });

    /**
     * @tc.name   ArrayCombinationTest111
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 50, 200, 75, 150, 25, 300, 125, 350, 225, 400, 450]
        .sort((a, b) => a - b)
        .slice(2, 10)
        .filter(x => x !== 125 && x !== 350)
        .concat(175, 275)
        .sort((a, b) => a - b)
        .map((x, i) => i === 1 ? 90 : (i === 5 ? 240 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([75, 90, 150, 175, 200, 240, 275, 300]));
    });

    /**
     * @tc.name   ArrayCombinationTest112
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, -2, 3, -4, 5, -6, 7, -8, 9, -10, 11, -12]
        .sort((a, b) => a - b)
        .filter(x => x < 0)
        .concat(0, 2)
        .filter(x => x !== -10 && x !== -4)
        .map((x, i) => i === 0 ? -15 : (i === 3 ? -5 : x))
        .sort((a, b) => a - b);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-15, -8, -6, -5, 0, 2]));
    });

    /**
     * @tc.name   ArrayCombinationTest113
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200]
        .filter(x => x > 600)
        .sort((a, b) => a - b)
        .slice(2, 6)
        .filter(x => x !== 1000 && x !== 1200)
        .concat(950, 1150)
        .sort((a, b) => a - b)
        .map((x, i) => i === 1 ? 925 : (i === 2 ? 1075 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([900, 925, 1075, 1150]));
    });

    /**
     * @tc.name   ArrayCombinationTest114
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [5, 1, 7, 3, 9, 2, 4, 6, 8, 10, 12, 14]
        .sort((a, b) => a - b)
        .filter((x, i) => [1, 3, 5, 7, 9, 11].includes(i))
        .filter(x => x !== 4 && x !== 10)
        .concat(1.5, 13.5)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 7 : (i === 4 ? 12 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1.5, 2, 7, 8, 12, 14]));
    });

    /**
     * @tc.name   ArrayCombinationTest115
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [-20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35]
        .sort((a, b) => a - b)
        .filter(x => x > 0)
        .filter((x, i) => ![0, 2, 4].includes(i))
        .concat(-5, 40)
        .sort((a, b) => a - b)
        .map((x, i) => i === 1 ? 15 : (i === 3 ? 32 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-5, 15, 20, 32, 35, 40]));
    });

    /**
     * @tc.name   ArrayCombinationTest116
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [15, 25, 35, 45, 55, 65, 75, 85, 95, 105, 115, 125]
        .sort((a, b) => a - b)
        .filter((x, i) => [0, 2, 4, 6, 8, 10].includes(i))
        .filter(x => x !== 35 && x !== 95)
        .concat(20, 100)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 60 : (i === 4 ? 90 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([15, 20, 60, 75, 90, 115]));
    });

    /**
     * @tc.name   ArrayCombinationTest117
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
        .filter(x => x % 2 === 0)
        .sort((a, b) => a - b)
        .filter((x, i) => ![1, 3, 5, 7, 9, 11].includes(i))
        .concat(15, 105)
        .sort((a, b) => a - b)
        .filter(x => x !== 50 && x !== 105);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 15, 30, 70, 90, 110]));
    });

    /**
     * @tc.name   ArrayCombinationTest118
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]
        .filter(x => x < 15)
        .sort((a, b) => a - b)
        .filter((x, i) => [0, 2, 4, 6].includes(i))
        .filter(x => x !== 5 && x !== 13)
        .concat(2, 4, 6, 8, 10)
        .sort((a, b) => a - b)
        .map((x, i) => i === 2 ? 3 : (i === 5 ? 7 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 6, 8, 7, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest119
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_11900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 5, 15]
        .sort((a, b) => a - b)
        .filter(x => x > 30)
        .filter((x, i) => ![2, 4, 6].includes(i))
        .concat(35, 85)
        .sort((a, b) => a - b)
        .map((x, i) => i === 1 ? 45 : (i === 4 ? 80 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([35, 45, 50, 70, 80, 90]));
    });

    /**
     * @tc.name   ArrayCombinationTest120
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [10, -5, 20, 0, 15, -3, 25, 30, -10, 5, 1.5, -2.5]
        .sort((a, b) => a - b)
        .filter(x => Math.abs(x) > 5)
        .filter((x, i) => ![1, 5].includes(i))
        .concat(7.5, 22.5)
        .sort((a, b) => a - b)
        .map((x, i) => i === 3 ? 18 : (i === 6 ? 27 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([-10, 7.5, 15, 18, 22.5, 25]));
    });

    /**
     * @tc.name   ArrayCombinationTest121
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12100
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, 'apple', 2, 'banana', 3, 'cherry', true, false, null, undefined]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => ![0, 2].includes(i))
        .concat(4, 5)
        .map((x, i) => i === 1 ? 3 : x)
        .sort((a, b) => Number(a) - Number(b));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 5]));
    });

    /**
     * @tc.name   ArrayCombinationTest122
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12200
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [true, '10', false, '20', 30, '40', 50, '60', 70, '80']
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => [0, 2].includes(i))
        .filter(x => x !== 70)
        .concat(40, 60)
        .map((x, i) => i === 1 ? 35 : x)
        .sort((a, b) => Number(a) - Number(b));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([30, 35, 60]));
    });

    /**
     * @tc.name   ArrayCombinationTest123
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12300
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ['a', 5, 'b', 10, 'c', 15, true, 20, false, 25]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => ![1, 3].includes(i))
        .concat(8, 22)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 1 ? 7 : (i === 3 ? 23 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 7, 15, 23, 25]));
    });

    /**
     * @tc.name   ArrayCombinationTest124
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12400
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [null, 100, undefined, 200, '300', 400, '500', 600]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .slice(1, 4)
        .filter((x, i) => ![0, 2].includes(i))
        .concat(300, 500)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 1 ? 450 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([300, 450, 500]));
    });

    /**
     * @tc.name   ArrayCombinationTest125
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12500
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [true, '5', false, '10', 15, '20', 25, '30', 35, '40']
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => ![0, 2].includes(i))
        .concat(20, 30)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 0 ? 18 : (i === 2 ? 32 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([18, 25, 32]));
    });

    /**
     * @tc.name   ArrayCombinationTest126
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12600
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [1, '2', 3, '4', 5, '6', '7', 8, '9', 10]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter(x => x !== 3 && x !== 8)
        .concat(2, 9)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 2 ? 4 : (i === 3 ? 8 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 4, 8, 10]));
    });

    /**
     * @tc.name   ArrayCombinationTest127
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12700
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [null, 2.5, undefined, 3.7, '4.1', 5.3, '6.9', 7.5]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => [0, 2, 3].includes(i))
        .filter(x => x !== 5.3)
        .concat(3.0, 6.0)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 1 ? 2.8 : (i === 2 ? 5.5 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2.5, 2.8, 5.5, 7.5]));
    });

    /**
     * @tc.name   ArrayCombinationTest128
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12800
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [true, 'a', false, 'b', 10, 'c', 20, 'd', 30]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => i !== 1)
        .concat(15, 25)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 1 ? 12 : (i === 2 ? 22 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 12, 22, 30]));
    });

    /**
     * @tc.name   ArrayCombinationTest129
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_12900
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ['x', 100, 'y', 200, 'z', 300, true, 400, false, 500]
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => [1, 3].includes(i))
        .filter(x => x !== 200)
        .concat(150, 350)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 1 ? 300 : x);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([150, 300, 400]));
    });

    /**
     * @tc.name   ArrayCombinationTest130
     * @tc.number SUB_BUILTINS_ARRAYCOMBINATION_TEST_13000
     * @tc.desc   Combination use case of all interfaces in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = [null, '1', undefined, '2', 3, '4', 5, '6', 7, '8']
        .filter(x => typeof x === 'number')
        .sort((a, b) => Number(a) - Number(b))
        .filter((x, i) => ![0, 1].includes(i))
        .concat(4, 6)
        .sort((a, b) => Number(a) - Number(b))
        .map((x, i) => i === 0 ? 5 : (i === 2 ? 8 : x));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([5, 6, 8]));
    });
  })
}