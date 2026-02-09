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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import * as Array1 from './ArrayCombination1';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function builtinsArrayConstructor1Test() {
  describe('BuiltinsArrayConstructor1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   builtinsArrayConstructor1Test001
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([]);
      const typedArr = new Int32Array([]);
      expect(arr.map(x => x).sort()).assertDeepEquals([]);
      expect(Int32Array.from(typedArr.map(x => x)).sort()).assertDeepEquals(Int32Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test002
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array([1, 2, 3]);
      expect(arr.filter(x => x > 10).reverse()).assertDeepEquals([]);
      expect(Int32Array.from(typedArr.filter(x => x > 10)).reverse()).assertDeepEquals(Int32Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test003
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1]]);
      const typedArr = Array.from([new Float32Array([5])]);

      const r2 = Float32Array.from(Array.from(typedArr).flatMap(x => Array.from(x))).fill(99);
      expect(Array.from(arr).flatMap(x => x).fill(99)).assertDeepEquals([99]);
      expect(r2).assertDeepEquals(Float32Array.from([99]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test004
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const typedArr = new Int32Array([1, 2]);
      const r1 = arr.map(x => x).copyWithin(10, 0);
      const r2 = Int32Array.from(typedArr.map(x => x)).copyWithin(10, 0);
      expect(r1).assertDeepEquals([1, 2]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2]));
    });



    /**
     * @tc.name   builtinsArrayConstructor1Test005
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([NaN, 2, 1]);
      const typedArr: Float32Array = new Float32Array([NaN, 2, 1]);
      const r1 = arr.filter(x => true).sort();
      const r2 = Float32Array.from(typedArr.filter(x => true)).sort((a, b) => {
        if (Number.isNaN(a) && Number.isNaN(b)) return 0;
        if (Number.isNaN(a)) return 1;
        if (Number.isNaN(b)) return -1;
        return a - b;
      });
      expect(r1[0]).assertEqual(1);
      expect(r1[1]).assertEqual(2);
      expect(Number.isNaN(r1[2])).assertTrue();
      expect(r2[0]).assertEqual(1);
      expect(r2[1]).assertEqual(2);
      expect(Number.isNaN(r2[2])).assertTrue();
    });


    /**
     * @tc.name   builtinsArrayConstructor1Test006
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[], [1], []]);
      const typedArr = Array.from([new Int32Array([]), new Int32Array([1]), new Int32Array([])]);
      const r1 = Array.from(arr).flatMap(x => x).reverse();
      const flattened: number[] = Array.from([]);
      for (const arr of typedArr) {
        for (let i = 0; i < arr.length; i++) {
          flattened.push(arr[i]);
        }
      }
      const r2 = flattened.reverse();
      expect(r1).assertDeepEquals([1]);
      expect(r2).assertDeepEquals([1]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test007
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test007()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test008
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([10, 20, 30, 40]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => x >= 20).copyWithin(-1, 0, 1);
      const r2 = Int32Array.from(typedArr.filter(x => x >= 20)).copyWithin(-1, 0, 1);
      expect(r1).assertDeepEquals([20, 30, 20]);
      expect(r2).assertDeepEquals(Int32Array.from([20, 30, 20]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test009
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([42]);
      const typedArr = new Int32Array(arr);
      expect(arr.map(x => x).reverse()).assertDeepEquals([42]);
      expect(Int32Array.from(typedArr.map(x => x)).reverse()).assertDeepEquals(Int32Array.from([42]));

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test010
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[Infinity], [-Infinity], [0]]);
      const typedArr = Array.from([new Float32Array([Infinity]), new Float32Array([-Infinity]), new Float32Array([0])]);
      const r1 = Array.from(arr).flatMap(x => x).sort((a, b) => a - b);
      const r2 = Float32Array.from(typedArr.flatMap(x => Array.from(x))).sort((a, b) => a - b);
      expect(r1).assertDeepEquals([-Infinity, 0, Infinity]);
      expect(r2).assertDeepEquals(Float32Array.from([-Infinity, 0, Infinity]));

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test011
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => true).fill(999, 2, 2);
      const r2 = Int32Array.from(typedArr.filter(x => true)).fill(999, 2, 2);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test012
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.map(x => x).copyWithin(0, 2, 1);
      const r2 = Int32Array.from(typedArr.map(x => x)).copyWithin(0, 2, 1);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test013
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[[1]], [[2]]]);
      const r1 = arr.flatMap(x => x).reverse();
      expect(r1).assertDeepEquals([[2], [1]]);
      const typedSim = Array.from([new Int32Array([1]), new Int32Array([2])]);
      const r2 = Int32Array.from(typedSim.flatMap(x => Array.from(x))).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test014
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([5, 5, 5]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => true).sort();
      const r2 = Int32Array.from(typedArr.filter(x => true)).sort();
      expect(r1).assertDeepEquals([5, 5, 5]);
      expect(r2).assertDeepEquals(Int32Array.from([5, 5, 5]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test015
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.map(x => x).fill(88, 0, 10);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(88, 0, 10);
      expect(r1).assertDeepEquals([88]);
      expect(r2).assertDeepEquals(Int32Array.from([88]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test016
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2, 3]]);
      const typedArr = Array.from([new Int32Array([1, 2, 3])]);
      const r1 = arr.flatMap(x => x).copyWithin(1, 0, 2);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(1, 0, 2);
      expect(r1).assertDeepEquals([1, 1, 2]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 1, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test017
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, undefined, 3]);
      const r1 = arr.filter(x => x !== undefined).reverse();
      expect(r1).assertDeepEquals([3, 1]);
      const typedArr =new Float32Array([1, NaN, 3]);
      const r2 = Float32Array.from(typedArr.filter(x => !Number.isNaN(x))).reverse();
      expect(r2).assertDeepEquals(Float32Array.from([3, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test018
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 2]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.map(x => x).sort(() => 0);
      expect(r1.length).assertEqual(3);
      expect(r1.every(x => [1,2,3].includes(x))).assertTrue();
      const r2 = Int32Array.from(typedArr.map(x => x)).sort(() => 0);
      expect(r2.length).assertEqual(3);
      expect(r2.every(x => [1,2,3].includes(x))).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test019
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([['a'], ['b']]);
      const r1 = arr.flatMap(x => x).fill('X', 1);
      expect(r1).assertDeepEquals(['a', 'X']);
      const typedArr = Array.from([new Int32Array([10]), new Int32Array([20])]);
      const r2 = Int32Array.from(
        typedArr.flatMap(x => Array.from(x))
      ).fill(999, 1);

      expect(r2).assertDeepEquals(Int32Array.from([10, 999]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test020
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => x === 2).copyWithin(0, 0);
      const r2 = Int32Array.from(typedArr.filter(x => x === 2)).copyWithin(0, 0);
      expect(r1).assertDeepEquals([2]);
      expect(r2).assertDeepEquals(Int32Array.from([2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test021
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test021()).assertDeepEquals([[1, -0, 0], true, [1, -0, 0], true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test022
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[], [], []]);
      const typedArr = Array.from([new Int32Array([]), new Int32Array([]), new Int32Array([])]);
      const r1 = Array.from(arr).flatMap(x => x).sort();
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).sort();
      expect(r1).assertDeepEquals([]);
      expect(r2).assertDeepEquals(Int32Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test023
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr =new Float32Array([1, 2, 3]);
      const r1 = arr.filter(x => x > 1).fill(NaN);
      const r2 = Float32Array.from(typedArr.filter(x => x > 1)).fill(NaN);
      expect(r1.length).assertEqual(2);
      expect(Number.isNaN(r1[0])).assertTrue();
      expect(Number.isNaN(r1[1])).assertTrue();
      expect(r2.length).assertEqual(2);
      expect(Number.isNaN(r2[0])).assertTrue();
      expect(Number.isNaN(r2[1])).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test024
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([10, 20]);
      const typedArr = new Int32Array([10, 20]);
      const r1 = arr.map(x => x).copyWithin(-5, 0, 1);
      const r2 = Int32Array.from(typedArr.map(x => x)).copyWithin(-5, 0, 1);
      expect(r1).assertDeepEquals([10, 20]);
      expect(r2).assertDeepEquals(Int32Array.from([10, 20]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test025
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(['ab']);
      const r1 = arr.flatMap(x => x.split('')).reverse();
      expect(r1).assertDeepEquals(['b', 'a']);
      const typedArr = Array.from([new Int32Array([1, 2])]);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test026
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test026()).assertDeepEquals([[10, 20, 30, 40, 50, 60, 70, 80, 90, 100], [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test027
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const typedArr = new Int32Array([1, 2, 3, 4]);
      const r1 = arr.map(x => x).fill(777, -2);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(777, -2);
      expect(r1).assertDeepEquals([1, 2, 777, 777]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 777, 777]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test028
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2, 3]]);
      const typedArr = Array.from([new Int32Array([1, 2, 3])]);
      const r1 = Array.from(arr).flatMap(x => x).copyWithin(0, 1, 1);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(0, 1, 1);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test029
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 4, 1, 5]);
      const typedArr = new Int32Array([3, 1, 4, 1, 5]);
      const r1 = arr.filter(x => true).reverse();
      const r2 = Int32Array.from(typedArr.filter(x => true)).reverse();
      expect(r1).assertDeepEquals([5, 1, 4, 1, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([5, 1, 4, 1, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test030
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test030()).assertDeepEquals([true, true, [0, 0]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test031
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught = false;
      try {
        [1, 2].map(x => { if (x === 2) throw new Error("boom"); return x; }).sort();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      try {
        new Int32Array([1, 2]).map(x => { if (x === 2) throw new Error("boom"); return x; });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test032
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test032()).assertDeepEquals([[999, 999], [999, 999]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test033
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["hi"]);
      const r1 = arr.flatMap(x => x).reverse();
      expect(r1).assertDeepEquals(["hi"]);
      const typedSim =new Int32Array([1, 2]);
      const r2 = Int32Array.from(typedSim.map(x => x)).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test034
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const orig = Array.from([1, 2, 3]);
      const result = orig.map(x => x * 2).copyWithin(0, 1);
      expect(orig).assertDeepEquals([1, 2, 3]);
      expect(result).assertDeepEquals([4, 6, 6]);
      const typedOrig = new Int32Array([1, 2, 3]);
      const temp = Int32Array.from(typedOrig.map(x => x * 2));
      const typedResult = temp.copyWithin(0, 1);
      expect(Array.from(typedOrig)).assertDeepEquals([1, 2, 3]);
      expect(typedResult).assertDeepEquals(Int32Array.from([4, 6, 6]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test035
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 2]);
      const r1 = arr.filter(x => true).sort(() => NaN);
      expect(r1.length).assertEqual(3);
      expect([1,2,3].includes(r1[0])).assertTrue();
      const typedArr = new Int32Array([3,1,2]);
      const r2 = Int32Array.from(typedArr.filter(x => true)).sort(() => NaN);
      expect(r2.length).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test036
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test036()).assertDeepEquals([[1, null], [1, null]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test037
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r1 = arr.map(x => x).reverse().map(x => x * 10);
      expect(r1).assertDeepEquals([20, 10]);
      const typedArr = new Int32Array([1, 2]);
      const r2 = Int32Array.from(typedArr.map(x => x)).reverse().map(x => x * 10);
      expect(r2).assertDeepEquals(Int32Array.from([20, 10]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test038
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = Array.from([10, 20, 30]);
      const filtered = a.filter(x => x > 10);
      const copied = filtered.copyWithin(0, 1);
      expect(a).assertDeepEquals([10, 20, 30]);
      expect(filtered).assertDeepEquals([30, 30]);
      expect(copied).assertDeepEquals([30,30]);
      const typedA = new Int32Array([10,20,30]);
      const tFiltered = Int32Array.from(typedA.filter(x => x > 10));
      const tCopied = tFiltered.copyWithin(0, 1);
      expect(typedA).assertDeepEquals(Int32Array.from([10,20,30]));
      expect(tFiltered).assertDeepEquals(Int32Array.from([30,30]));
      expect(tCopied).assertDeepEquals(Int32Array.from([30,30]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test039
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r1 = arr.flatMap(x => []);
      expect(r1.sort()).assertDeepEquals([]);
      const typedArr = new Int32Array([1, 2, 3]);
      const r2 = Array.from(Array.from(typedArr).flatMap(x => []));
      expect(r2.sort()).assertDeepEquals(Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test040
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const r1 = arr.map(x => x).fill(888, 1.7, 3.9);
      expect(r1).assertDeepEquals([1, 888, 888, 4]);
      const typedArr = new Int32Array([1,2,3,4]);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(888, 1.7, 3.9);
      expect(r2).assertDeepEquals(Int32Array.from([1, 888, 888, 4]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test041
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      let count = 0;
      const r1 = arr.filter(x => {
        count++;
        return x > 1;
      }).reverse();
      expect(count).assertEqual(3);
      expect(r1).assertDeepEquals([3, 2]);
      const typedArr = new Int32Array([1,2,3]);
      count = 0;
      const r2 = Int32Array.from(typedArr.filter(x => {
        count++;
        return x > 1;
      })).reverse();
      expect(count).assertEqual(3);
      expect(r2).assertDeepEquals(Int32Array.from([3, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test042
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r1 = arr.copyWithin(100, 0, 1);
      expect(r1).assertDeepEquals([1, 2]);
      const typedArr = new Int32Array([1, 2]);
      const r2 = typedArr.copyWithin(100, 0, 1);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2]));
    });
    /**
     * @tc.name   builtinsArrayConstructor1Test043
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let factor = -1;
      const arr = Array.from([1, 3, 2]);
      const r1 = arr.map(x => x).sort((a, b) => factor * (a - b));
      expect(r1).assertDeepEquals([3, 2, 1]);
      factor = 1;
      const typedArr = new Int32Array([1,3,2]);
      const r2 = Int32Array.from(typedArr.map(x => x)).sort((a, b) => factor * (a - b));
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test044
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test044()).assertDeepEquals([{ "a": 1 }, { "a": 1 }, [999, 999]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test045
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test045()).assertDeepEquals([['y', 'x'], [20, 10]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test046
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4, 5]);
      const r1 = arr
        .map(x => x * 2)
        .filter(x => x > 4)
        .copyWithin(0, 1);
      expect(r1).assertDeepEquals([8, 10, 10]);
      const typedArr = new Int32Array([1,2,3,4,5]);
      const temp = Int32Array.from(typedArr.map(x => x * 2)).filter(x => x > 4);
      const r2 = temp.copyWithin(0, 1);
      expect(r2).assertDeepEquals(Int32Array.from([8, 10, 10]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test047
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([true, false, true]);
      const r1 = arr.filter(x => x).sort();
      expect(r1).assertDeepEquals([true, true]);
      const typedArr = new Uint8Array([1, 0, 1]);
      const r2 = Uint8Array.from(typedArr.filter(x => x === 1)).sort();
      expect(r2).assertDeepEquals(Uint8Array.from([1, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test048
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2, 3, 4]]);
      const r1 = arr.flatMap(x => x).fill(0, -3, -1);
      expect(r1).assertDeepEquals([1, 0, 0, 4]);
      const typedArr = Array.from([new Int32Array([1,2,3,4])]);
      const r2 = Int32Array.from(
        typedArr.flatMap(x => Array.from(x))
      ).fill(0, -3, -1);
      expect(r2).assertDeepEquals(Int32Array.from([1, 0, 0, 4]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test049
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const timestamp2020 = 1577836800;
      const timestamp2021 = 1609459200;
      const d1 = new Date(timestamp2020*1000);
      const d2 = new Date(timestamp2021*1000);
      const r1: Date[] = Array.from([d2, d1]);

      expect(r1[0].toISOString()).assertEqual("2021-01-01T00:00:00.000Z");
      expect(r1[1].toISOString()).assertEqual("2020-01-01T00:00:00.000Z");

      const typedArr =new Float32Array([timestamp2020, timestamp2021]);
      const r2 = Array.from([typedArr[1], typedArr[0]]);
      expect(r2[0]).assertEqual(timestamp2021);
      expect(r2[1]).assertEqual(timestamp2020);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test050
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const r1 = arr.filter(x => true).copyWithin(0, 2);
      expect(r1).assertDeepEquals([3, 4, 3, 4]);
      const typedArr = new Int32Array([1,2,3,4]);
      const r2 = Int32Array.from(typedArr.filter(x => true)).copyWithin(0, 2);
      expect(r2).assertDeepEquals(Int32Array.from([3, 4, 3, 4]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test051
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[null], [2], [1]]);
      const r1 = arr.flatMap(x => x).sort((a, b) => {
        if (a === null) return -1;
        if (b === null) return 1;
        return a - b;
      });
      expect(r1).assertDeepEquals([null, 1, 2]);
      const typedArr = Array.from([new Int32Array([0]), new Int32Array([2]), new Int32Array([1])]);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).sort((a, b) => a - b);
      expect(r2).assertDeepEquals(Int32Array.from([0, 1, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test052
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r1 = arr.map(x => x).fill(999, Infinity);
      expect(r1).assertDeepEquals([1, 2]);
      const typedArr = new Int32Array([1,2]);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(999, Infinity);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test053
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([0, 1, "", "hello", null, 42]);
      const r1 = arr.filter(x => Boolean(x)).reverse();
      expect(r1).assertDeepEquals([42, "hello", 1]);
      const typedArr = new Int32Array([0, 1, 0, 5, 0, 42]);
      const r2 = Int32Array.from(typedArr.filter(x => x !== 0)).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([42, 5, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test054
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2]]);
      expect(Array.from(arr).flatMap(x => x).copyWithin(0, 0, 0)).assertDeepEquals([1, 2]);
      const typedArr = Array.from([new Int32Array([1,2])]);
      const r2 = Int32Array.from(
        typedArr.flatMap(x => Array.from(x))).copyWithin(0, 0, 0);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test055
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 2]);
      const r1 = arr.map(x => x).sort().sort((a, b) => b - a);
      expect(r1).assertDeepEquals([3, 2, 1]);
      const typedArr = new Int32Array([3,1,2]);
      const r2 = Int32Array.from(typedArr.map(x => x)).sort().sort((a, b) => b - a);
      expect(r2).assertDeepEquals(Int32Array.from([3, 2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test056
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r1 = arr.filter(x => x < 3).fill(-Infinity);
      expect(r1).assertDeepEquals([-Infinity, -Infinity]);
      const typedArr =new Float32Array([1,2,3]);
      const r2 = Float32Array.from(typedArr.filter(x => x < 3)).fill(-Infinity);
      expect(r2).assertDeepEquals(Float32Array.from([-Infinity, -Infinity]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test057
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test057()).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test058
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test058()).assertDeepEquals([[10, 20, 10], [10, 20, 10]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test060
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1], [2]]);
      const step1 = arr.flatMap(x => x).fill(0);
      const step2 = Array.from([Array.from(arr).flatMap(x => x).fill(0)].flatMap(x => x));
      expect(step2).assertDeepEquals([0, 0]);
      const typedArr = Array.from([new Int32Array([1]), new Int32Array([2])]);
      const t1 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).fill(0);
      const t2 = Int32Array.from([t1].flatMap(x => Array.from(x)));
      expect(t2).assertDeepEquals(Int32Array.from([0, 0]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test061
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Int8Array([127, 128, -129]);
      const r = Int8Array.from(arr.map(x => x)).sort((a, b) => a - b);
      expect(r).assertDeepEquals(Int8Array.from([-128, 127, 127]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test062
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray([0, 0]);
      const filtered = Uint8ClampedArray.from(arr.filter(_ => true));
      const filled = filtered.fill(300);
      expect(filled).assertDeepEquals(Uint8ClampedArray.from([300, 300]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test063
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([new Float32Array([0.1 + 0.2])]);
      const r = Float32Array.from(arr.flatMap(x => Array.from(x))).reverse();
      expect(r.length).assertEqual(1);
      expect(Math.abs(r[0] - 0.3) < 1e-6).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test064
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ta = new Int32Array([10, 20, 30]);
      const result = Int32Array.from(ta.map(x => {
        ta[0] = 999;
        return x;
      })).copyWithin(1, 0, 1);
      expect(result).assertDeepEquals(Int32Array.from([10, 10, 30]));
      expect(ta[0]).assertEqual(999);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test065
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test065()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test067
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test067()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test068
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4, 5]);
      const r = arr.filter(x => x > 2).copyWithin(0, -2, -3);
      expect(r).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test069
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[NaN], [NaN]]);
      const r1 = arr.flatMap(x => x).sort();
      expect(r1.length).assertEqual(2);
      expect(Number.isNaN(r1[0])).assertTrue();
      expect(Number.isNaN(r1[1])).assertTrue();
      const ta = Array.from([new Float32Array([NaN]),new Float32Array([NaN])]);
      const r2 = Float32Array.from(ta.flatMap(x => Array.from(x))).sort();
      expect(r2.length).assertEqual(2);
      expect(Number.isNaN(r2[0])).assertTrue();
      expect(Number.isNaN(r2[1])).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test070
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test070()).assertDeepEquals([[undefined, undefined], [0, 0], undefined]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test071
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([new Number(1), new Number(0), new Number(2)]);
      const r = arr.filter(x => x.valueOf() > 0).reverse();
      expect(r.length).assertEqual(2);
      expect(r[0].valueOf()).assertEqual(2);
      expect(r[1].valueOf()).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test072
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2]]);
      const r = arr.flatMap(x => x).copyWithin(0, 1, 10);
      expect(r).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test073
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test073()).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test076
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test076()).assertDeepEquals([[20, 20, 30], true]);
    });


    /**
     * @tc.name   builtinsArrayConstructor1Test077
     * @tc.number builtinsArrayConstructor1Test077
     * @tc.desc   builtinsArrayConstructor1Test077
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["ab"]);
      const r = arr.flatMap(x => x.split('')).sort();
      expect(r).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test078
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1], [2]]);
      const r = arr.flatMap(x => x).fill(99);
      expect(r).assertDeepEquals([99, 99]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test079
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([/a/, /b/]);
      const r = arr.map(x => x).reverse();
      expect(r[0]).assertDeepEquals(/b/);
      expect(r[1]).assertDeepEquals(/a/);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test080
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const f = arr.filter(x => x % 2 === 0);
      f[0] = 99;
      const r = f.copyWithin(1, 0, 1);
      expect(r).assertDeepEquals([99, 99]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test081
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["ab"]);

      expect(Array.from(arr).flatMap(x => x.split('')).sort()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test082
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test082()).assertDeepEquals([10, 888, 888]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test083
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r = arr.filter(x => x > 10).reverse();
      expect(r).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test084
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2, 3]]);
      expect(Array.from(arr).flatMap(x => x).copyWithin(1.9, 0, 1)).assertDeepEquals([1, 1, 3]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test086
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const r = arr.filter(x => true).fill(0, 1, -1);
      expect(r).assertDeepEquals([1, 0, 0, 4]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test088
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const r = arr.map(x => x).copyWithin(2, 0, 1).copyWithin(3, 2, 3);
      expect(r).assertDeepEquals([1, 2, 1, 1]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test089
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST8900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Int32Array([NaN, Infinity, -Infinity, 0, -0]);
      const r = Int32Array.from(arr.filter(x => true).sort((a, b) => {
        if (Number.isNaN(a) && Number.isNaN(b)) return 0;
        if (Number.isNaN(a)) return 1;
        if (Number.isNaN(b)) return -1;
        return a - b;
      }));
      expect(r).assertDeepEquals(Int32Array.from([-Infinity,0,0,Infinity,NaN]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test090
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1], [2], [3]]);

      expect(Array.from(arr).flatMap(x => x).fill(arr.length)).assertDeepEquals([3, 3, 3]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test091
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const mapped = arr.map(async x => x * 2);
      const r = mapped.sort();
      expect(r.length).assertEqual(2);
      expect(r[0] instanceof Promise).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test093
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test093()).assertDeepEquals([true, [99, 99]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test094
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught = false;
      try {
        new Int32Array(-1);
      } catch {
        caught = true;
      }
      expect(caught).assertTrue();
      try {
        new Array(-1);
      } catch {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test095
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ta =new Float32Array([3.1, 2.2]);
      const arr = Array.from([1.0]);
      const combined = arr.concat(Array.from(ta));
      const r = combined.filter(x => true).sort((a, b) => a - b);
      expect(r).assertDeepEquals([1,2.200000047683716,3.0999999046325684]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test096
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test096()).assertDeepEquals([2,1]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test097
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test097()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test099
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST9900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[Number.MAX_VALUE], [Number.MIN_VALUE]]);

      expect(Array.from(arr).flatMap(x => x).copyWithin(1, 0, 1)[0]).assertEqual(Number.MAX_VALUE);
      expect(Array.from(arr).flatMap(x => x).copyWithin(1, 0, 1)[1]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test100
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      arr.map(x => x * 2).reverse();
      expect(arr).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test101
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([0, -0, NaN, 1]);
      const r = arr.filter(x => true).sort();
      expect(r.includes(NaN)).assertTrue();
      expect(r.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test103
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r = arr.map(x => x).copyWithin(0, Math.pow(2, 32));
      expect(r).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test104
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      let i = 0;
      const r = arr.filter(x => {
        if (i++ === 1) arr.length = 2;
        return x > 0;
      }).reverse();
      expect(r).assertDeepEquals([2, 1]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test105
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const f1 = () => {};
      const f2 = () => {};
      const arr = Array.from([[f1], [f2]]);
      expect(Array.from(arr).flatMap(x => x).sort().length).assertEqual(2);

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test106
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test106()).assertDeepEquals([42, 42]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test107
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const r = arr.filter(x => true).copyWithin(1, 2);
      expect(r).assertDeepEquals([1, 3, 4, 4]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test108
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test108()).assertDeepEquals([20, 10]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test109
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST10900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["1e2", "2e1", "30"]);
      const r = arr.map(x => x).sort();
      expect(r).assertDeepEquals(["1e2", "2e1", "30"]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test110
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1]);
      const r = arr.filter(x => true).fill(9, 0, 5);
      expect(r).assertDeepEquals([9]);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test111
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[[1, 2]], [[3, 4]]]);
      const flat = arr.flatMap(x => x);
      const r = flat.flatMap(inner => inner).copyWithin(2, 0, 2);
      expect(r).assertDeepEquals([1, 2, 1, 2]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test112
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught = false;
      try {
        [1, 2n].map(x => x).reverse();
      } catch {
        caught = true;
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test113
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r = arr.filter(x => true).sort(() => 1);
      expect(r.length).assertEqual(3);
      expect(r[0] !== 1 || r[1] !== 2 || r[2] !== 3).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test114
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test114()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test115
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test115()).assertDeepEquals([20, 20]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test116
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(8);
      const ta1 = new Int32Array(buf, 0, 2);
      ta1.set([100, 200]);
      const ta2 = new Int32Array(buf, 4, 1);
      const filtered = Int32Array.from(ta1).filter(x => x > 150);
      const r = filtered.reverse();
      expect(r).assertDeepEquals(Int32Array.from([200]));
      expect(ta1[1]).assertEqual(200);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test117
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      expect(Array.from(arr).flatMap(x => []).sort()).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test118
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test118()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test119
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST11900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r = arr.filter(x => true).copyWithin(0, 1, undefined);
      expect(r).assertDeepEquals([2, 3, 3]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test120
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["ab"]);

      expect(Array.from(arr).flatMap(x => x + "0").reverse()).assertDeepEquals(["ab0"]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test121
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test121()).assertDeepEquals([[1, 2, 3],[3, 1, 2]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test122
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["😀", "🌍", "🚀"]);
      const r = arr.filter(x => x.length === 2).reverse();
      expect(r).assertDeepEquals(["🚀", "🌍", "😀"]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test123
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count = 0;
      let caught = false;
      try {
        [1, 2, 3].flatMap(x => {
          count++;
          if (x === 2) throw new Error("boom");
          return [x];
        });
      } catch {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test124
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([]);
      const r = arr.map(x => x).copyWithin(0, 0);
      expect(r).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test126
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test126()).assertDeepEquals([ { "0": 10, "length": -5 } ]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test127
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([100]);
      const r = arr.map(x => x).fill(88);
      expect(r).assertDeepEquals([88]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test128
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r = arr.filter(x => true).copyWithin(0, 10);
      expect(r).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test129
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST12900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test129()).assertDeepEquals([{ "val": 1 }, { "val": 1 }]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test131
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const taInt = new Int32Array([NaN]);
      const taFloat = new Float32Array([NaN]);
      const r1 = Int32Array.from(taInt.filter(x => true)).fill(1);
      const r2 = Float32Array.from(taFloat.filter(x => true)).fill(1);
      expect(r1).assertDeepEquals(Int32Array.from([1]));
      expect(Number.isNaN(r2[0])).assertFalse();
      expect(taInt[0]).assertEqual(0);
      expect(Number.isNaN(taFloat[0])).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test132
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1]]);
      expect(Array.from(arr).flatMap(x => x).copyWithin(1, 0, 1)).assertDeepEquals([1]);
      expect(Array.from(arr).flatMap(x => x).copyWithin(1, 0, 1).length).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test133
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([Infinity, -Infinity, 0]);
      const r = arr.map(x => x).sort((a, b) => a - b);
      expect(r).assertDeepEquals([-Infinity, 0, Infinity]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test134
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);

      expect(Array.from(arr).filter(() => {}).reverse()).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test135
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test135()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test136
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r = arr.map(x => x).fill(0).copyWithin(2, 0, 1);
      expect(r).assertDeepEquals([0, 0, 0]);

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test137
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([null, undefined, 1]);
      const r = arr.filter(x => true).sort();
      expect(r).assertDeepEquals([1, null, undefined]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test138
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test138()).assertDeepEquals([6, 5]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test139
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST13900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test139()).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test141
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[42]]);
      expect(Array.from(arr).flatMap(x => x).sort()).assertDeepEquals([42]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test142
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const d1 = new Date('2020-01-01');
      const d2 = new Date('2021-01-01');
      const r = Array.from([d2, d1]);
      expect(r[0].toISOString()).assertEqual("2021-01-01T00:00:00.000Z");
      expect(r[1].toISOString()).assertEqual("2020-01-01T00:00:00.000Z");
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test143
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r = arr.filter(x => true).fill(99, Infinity);
      expect(r).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test144
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      expect(Array.from(arr).flatMap(x => []).copyWithin(0, 0)).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test145
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["ä", "z", "a"]);
      let r: Array<string>;
      try {
        const collator = new Intl.Collator('de', { sensitivity: 'base' });
        r = arr.map(x => x).sort(collator.compare);
      } catch {
        r = arr.map(x => x).sort();
      }
      expect(r.length).assertEqual(3);
      expect(r.includes("ä")).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test146
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r = arr.filter(x => x === 2).reverse();
      expect(r).assertDeepEquals([2]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test147
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1], [2]]);

      expect(Math.abs(Array.from(arr).flatMap(x => x).fill(Math.PI)[0] - Math.PI) < 1e-10).assertTrue();
      expect(Math.abs(Array.from(arr).flatMap(x => x).fill(Math.PI)[1] - Math.PI) < 1e-10).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test148
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([10, 20]);
      const r = arr.map(x => x).copyWithin(-Infinity, 1);
      expect(r).assertDeepEquals([20, 20]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test149
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([true, false, true]);
      const r = arr.filter(x => true).sort((a, b) => Number(a) - Number(b));
      expect(r).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test150
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST15000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2]]);
      const originalRef = Array.from([1, 2]);

      expect(Array.from(arr).flatMap(x => x).reverse()).assertDeepEquals([2, 1]);
      expect(arr[0]).assertDeepEquals(originalRef);
      expect(arr).assertDeepEquals([[1, 2]]);
    });

  })
}