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
import * as Array2 from './ArrayCombination2';
import { collections } from '@kit.ArkTS';
function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function builtinsArrayConstructor2Test() {
  describe('BuiltinsArrayConstructor2Test', () => {
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
     * @tc.name   builtinsArrayConstructor2Test001
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array(arr);
      const suffix = collections.Array.from([4, 5]);
      const typedSuffix = new collections.Int32Array(suffix);
      const resultArr = arr.concat(suffix).includes(4);
      expect(resultArr).assertEqual(true);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      const resultTyped = typedConcat.includes(4);
      expect(resultTyped).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test002
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['a', 'b']);
      const typedArr = new collections.Uint8Array([10, 20]);
      const extra = collections.Array.from(['c']);
      const typedExtra = new collections.Uint8Array([30]);
      const idxArr = arr.concat(extra).indexOf('c');
      expect(idxArr).assertEqual(2);
      const typedConcat = collections.Uint8Array.from([...typedArr, ...typedExtra]);
      const idxTyped = typedConcat.indexOf(30);
      expect(idxTyped).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test003
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 1]);
      const typedArr = new collections.Int16Array([5, 6, 5]);
      const tail = collections.Array.from([1]);
      const typedTail = new collections.Int16Array([5]);
      const lastIdxArr = arr.concat(tail).lastIndexOf(1);
      expect(lastIdxArr).assertEqual(3);
      const typedConcat = collections.Int16Array.from([...typedArr, ...typedTail]);
      const lastIdxTyped = typedConcat.lastIndexOf(5);
      expect(lastIdxTyped).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test004
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30, 40]);
      const typedArr = new collections.Float32Array([1.1, 2.2, 3.3, 4.4]);
      const slicedIncludes = arr.slice(1, 3).includes(30);
      expect(slicedIncludes).assertEqual(true);
      const typedSliced = typedArr.slice(1, 3);
      const typedIncludes = typedSliced.includes(3.3);
      expect(typedIncludes).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test005
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['x', 'y', 'z', 'y']);
      const typedArr = new collections.Int8Array([7, 8, 9, 8]);
      const slicedIdx = arr.slice(1).indexOf('y');
      expect(slicedIdx).assertEqual(0);
      const typedSliced = typedArr.slice(1);
      const typedIdx = typedSliced.indexOf(8);
      expect(typedIdx).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test006
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 4]);
      const target = 3;
      const typedArr = new collections.Int32Array([1,2,3,4]);

      expect(Array.from(arr).flat().includes(target)).assertEqual(true);
      const typedIncludes = typedArr.includes(target);
      expect(typedIncludes).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test007
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30]);
      const target = 30;
      const typedArr = new collections.Int16Array([10, 20, 30]);
      expect(Array.from(arr).flat().indexOf(target)).assertEqual(2);
      const typedIdx = typedArr.indexOf(target);
      expect(typedIdx).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test008
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5, 5, 6, 5]);
      const target = 5;
      const typedArr = new collections.Uint8Array([5, 5, 6, 5]);
      expect(Array.from(arr).flat(0).lastIndexOf(target)).assertEqual(3);
      const typedLastIdx = typedArr.lastIndexOf(target);
      expect(typedLastIdx).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test009
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 2, 4]);
      const typedArr = new collections.Int32Array(arr);
      const slicedLastIdx = arr.slice(1, -1).lastIndexOf(2);
      expect(slicedLastIdx).assertEqual(2);

      const typedSliced = typedArr.slice(1, -1);
      const typedLastIdx = typedSliced.lastIndexOf(2);
      expect(typedLastIdx).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test010
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test010()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test011
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const suffix = collections.Array.from([3]);
      const typedArr = new collections.Int32Array(arr);
      const typedSuffix = new collections.Int32Array(suffix);

      expect(arr.concat(suffix).includes(99)).assertEqual(false);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(99)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test012
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const suffix = collections.Array.from([2, 1]);
      const typedArr = new collections.Int32Array(arr);
      const typedSuffix = new collections.Int32Array(suffix);

      expect(arr.concat(suffix).indexOf(1)).assertEqual(0);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test013
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5, 6, 5]);
      const suffix = collections.Array.from([7, 5]);
      const typedArr = new collections.Int16Array([5, 6, 5]);
      const typedSuffix = new collections.Int16Array([7, 5]);

      expect(arr.concat(suffix).lastIndexOf(5)).assertEqual(4);
      const typedConcat = collections.Int16Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test014
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30, 40]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(1, -1).includes(30)).assertEqual(true);
      expect(typedArr.slice(1, -1).includes(30)).assertEqual(true);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test015
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const typedArr = new collections.Uint8Array([1, 2]);

      expect(arr.slice(5, 10).includes(1)).assertEqual(false);
      expect(typedArr.slice(5, 10).includes(1)).assertEqual(false);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test016
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(2).indexOf(1)).assertEqual(-1);
      expect(typedArr.slice(2).indexOf(1)).assertEqual(-1);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test017
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['a']);
      const typedArr = new collections.Int8Array([97]);

      expect(arr.slice(0, 1).lastIndexOf('a')).assertEqual(0);
      expect(typedArr.slice(0, 1).lastIndexOf(97)).assertEqual(0);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test018
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const typedArr = new collections.Int32Array([1]);
      expect(Array.from(arr).flat().includes(2)).assertEqual(false);
      expect(typedArr.includes(2)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test019
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([ , 1,  ]);
      const typedArr = new collections.Int32Array([1]);

      expect(Array.from(arr).flat().includes(1)).assertEqual(true);
      expect(typedArr.includes(1)).assertEqual(true);
    });


    /**
     * @tc.name   builtinsArrayConstructor2Test020
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, '2']);
      const suffix = collections.Array.from(['3']);
      const typedArr = new collections.Float32Array([1.0, 2.0]);
      const typedSuffix = new collections.Float32Array([3.0]);

      expect(arr.concat(suffix).includes('2')).assertEqual(true);
      const typedConcat = collections.Float32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(2.0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test021
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(-2).indexOf(30)).assertEqual(1);
      expect(typedArr.slice(-2).indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test022
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([7, 8, 7]);
      const typedArr = new collections.Int8Array([7, 8, 7]);

      expect(arr.slice().lastIndexOf(7)).assertEqual(2);
      expect(typedArr.slice().lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test023
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, null, null]);
      const typedArr = new collections.Int32Array([1, 2]);
      expect(Array.from(arr).flat().includes(null)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test024
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const suffix = new collections.Int32Array([2]);
      const typedArr = new collections.Uint8Array([1]);
      const typedSuffix = new collections.Int32Array([2]);

      expect(arr.concat(suffix).indexOf(2)).assertEqual(-1);
      const typedConcat = collections.Uint8Array.from([...typedArr, ...new collections.Uint8Array(typedSuffix)]);
      expect(typedConcat.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test025
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(1, 1).includes(2)).assertEqual(false);
      expect(typedArr.slice(1, 1).includes(2)).assertEqual(false);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test026
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5, 5]);
      const suffix = collections.Array.from([5]);
      const typedArr = new collections.Int32Array(arr);
      const typedSuffix = new collections.Int32Array(suffix);

      expect(arr.concat(suffix).lastIndexOf(5)).assertEqual(2);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(5)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test027
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test030()).assertDeepEquals([9, 9]);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test028
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, , 3]);
      const suffix = collections.Array.from([4]);
      const typedArr = new collections.Int32Array([1,3]);
      const typedSuffix = new collections.Int32Array(suffix);
      expect(arr.concat(suffix).includes(undefined)).assertEqual(true);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(0)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test029
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 2]);
      const typedArr = new collections.Int32Array(arr);
      expect(arr.slice(0, 3).lastIndexOf(2)).assertEqual(1);
      expect(typedArr.slice(0, 3).lastIndexOf(2)).assertEqual(1);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test030
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['1', '2']);
      const typedArr = new collections.Int32Array([1, 2]);

      expect(Array.from(arr).flat().indexOf('2')).assertEqual(1);
      expect(typedArr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test031
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const a1 = collections.Array.from([2]);
      const a2 = collections.Array.from([3]);
      const typedArr = new collections.Int32Array(arr);
      const t1 = new collections.Int32Array(a1);
      const t2 = new collections.Int32Array(a2);

      expect(arr.concat(a1, a2).indexOf(3)).assertEqual(2);
      const typedConcat = collections.Int32Array.from([...typedArr, ...t1, ...t2]);
      expect(typedConcat.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test032
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(2, 1).includes(2)).assertEqual(false);
      expect(typedArr.slice(2, 1).includes(2)).assertEqual(false);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test033
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([true, false]);
      const typedArr = new collections.Uint8Array([1, 0]);

      expect(Array.from(arr).flat().includes(false)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test034
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([NaN]);
      const suffix = collections.Array.from([1]);
      const typedArr = new collections.Float32Array([NaN]);
      const typedSuffix = new collections.Float32Array([1]);
      expect(arr.concat(suffix).includes(NaN)).assertEqual(true);
      const typedConcat = collections.Float32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(NaN)).assertEqual(true);
      expect(arr.concat(suffix).lastIndexOf(NaN)).assertEqual(-1);
      expect(typedConcat.lastIndexOf(NaN)).assertEqual(-1);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test035
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([42]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(0, 1).indexOf(42)).assertEqual(0);
      expect(typedArr.slice(0, 1).indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test036
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test040()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test037
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([100]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(0, 0).indexOf(100)).assertEqual(-1);
      expect(typedArr.slice(0, 0).indexOf(100)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test038
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5]);
      const typedArr = new collections.Int32Array([5]);

      expect(Array.from(arr).flat(2).lastIndexOf(5)).assertEqual(0);
      expect(typedArr.lastIndexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test039
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const shared = collections.Array.from([99]);
      const arr = collections.Array.from([1]);
      const typedArr = new collections.Int32Array(arr);
      const typedShared = new collections.Int32Array(shared);

      const resultArr = arr.concat(shared);
      expect(resultArr.includes(99)).assertEqual(true);
      expect(arr.length).assertEqual(1);

      const typedConcat = collections.Int32Array.from([...typedArr, ...typedShared]);
      expect(typedConcat.includes(99)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test040
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 4]);
      const typedArr = new collections.Int32Array(arr);
      expect(arr.slice(-5, -1).lastIndexOf(3)).assertEqual(2);
      expect(typedArr.slice(-5, -1).lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test041
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test045()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test042
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1.1]);

      const suffix = collections.Array.from([2.2]);
      const typedArr =new collections.Float32Array([1.1]);
      const typedSuffix =new collections.Float32Array([2.2]);

      expect(arr.concat(suffix).indexOf(2.2)).assertEqual(1);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(2.2)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test043
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test047()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test044
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test048()).assertDeepEquals([-1, 1, 1, 1]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test045
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([200]);
      const suffix = collections.Array.from([255, 200]);
      const typedArr = new collections.Uint8ClampedArray([200]);
      const typedSuffix = new collections.Uint8ClampedArray([255, 200]);

      expect(arr.concat(suffix).lastIndexOf(200)).assertEqual(2);
      const typedConcat = collections.Uint8ClampedArray.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(200)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test046
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(10).includes(1)).assertEqual(false);
      expect(typedArr.slice(10).includes(1)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test047
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(["0"]);
      const typedArr = new collections.Int32Array([0]);

      expect(Array.from(arr).flat().includes("0")).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test048
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1 = collections.Array.from([1]);
      const arr2 = collections.Array.from([2.5]);
      const typed1 = new collections.Int32Array([1]);
      const typed2 = new collections.Float32Array([2.5]);

      expect(arr1.concat(arr2).indexOf(2.5)).assertEqual(1);
      const merged = collections.Float32Array.from([...new collections.Float32Array(typed1), ...typed2]);
      expect(merged.indexOf(2.5)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test049
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([7, 7, 7]);
      const typedArr = new collections.Int8Array([7, 7, 7]);

      expect(arr.slice(1).lastIndexOf(7)).assertEqual(1);
      expect(typedArr.slice(1).lastIndexOf(7)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test050
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([null]);
      const typedArr = new collections.Int32Array([0]);

      expect(Array.from(arr).flat().indexOf(null)).assertEqual(0);
      expect(typedArr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test051
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([-0]);
      const suffix = collections.Array.from([1]);
      const typedArr =new collections.Float32Array([-0]);
      const typedSuffix =new collections.Float32Array([1]);

      expect(arr.concat(suffix).includes(-0)).assertEqual(true);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test052
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const big = Number.MAX_SAFE_INTEGER;
      const arr = collections.Array.from([big - 1, big]);
      const typedArr = new BigInt64Array([BigInt(big - 1), BigInt(big)]);

      expect(arr.slice(1).indexOf(big)).assertEqual(0);
      expect(typedArr.slice(1).indexOf(BigInt(big))).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test053
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array([1, 2, 3]);

      expect(Array.from(arr).flat().lastIndexOf(2)).assertEqual(1);
      expect(typedArr.lastIndexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test054
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const suffix = collections.Array.from([2]);
      const typedArr = new collections.Int32Array([1]);
      const typedSuffix = new collections.Int32Array([2]);

      expect(arr.concat(suffix).includes(2)).assertEqual(true);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(2)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test055
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5]);
      const typedArr = new collections.Int32Array([5]);

      expect(arr.slice(-0).includes(5)).assertEqual(true);
      expect(typedArr.slice(-0).includes(5)).assertEqual(true);
    });


    /**
     * @tc.name   builtinsArrayConstructor2Test056
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const suffix = collections.Array.from([]);
      const typedArr = new collections.Int32Array([1, 2]);
      const typedSuffix = new collections.Int32Array([]);

      expect(arr.concat(suffix).lastIndexOf(2)).assertEqual(1);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test057
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30]);
      const typedArr = new collections.Int32Array([10, 20, 30]);

      expect(arr.slice(0.9, 2.9).indexOf(20)).assertEqual(1);
      expect(typedArr.slice(0.9, 2.9).indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test058
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([Infinity]);
      const typedArr = new collections.Float32Array([Infinity]);

      expect(Array.from(arr).flat().includes(Infinity)).assertEqual(true);
      expect(typedArr.includes(Infinity)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test059
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([-Infinity]);
      const suffix = collections.Array.from([0]);
      const typedArr =new collections.Float32Array([-Infinity]);
      const typedSuffix =new collections.Float32Array([0]);

      expect(arr.concat(suffix).includes(-Infinity)).assertEqual(true);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(-Infinity)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test060
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([42]);
      const typedArr = new collections.Int32Array([42]);

      expect(arr.slice(0, -1).lastIndexOf(42)).assertEqual(-1);
      expect(typedArr.slice(0, -1).lastIndexOf(42)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test061
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test066()).assertDeepEquals([-1, 0, 0, 0]);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test062
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const large = 9007199254740992n + 1n;
      const arr = collections.Array.from([Number(large)]);
      const suffix = collections.Array.from([2]);
      const typedArr =new collections.Float32Array([Number(large)]);
      const typedSuffix =new collections.Float32Array([2]);

      expect(arr.concat(suffix).indexOf(Number(large))).assertEqual(0);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(Number(large))).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test063
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([88]);
      const typedArr = new collections.Int32Array([88]);

      expect(arr.slice(NaN).includes(88)).assertEqual(true);
      expect(typedArr.slice(NaN).includes(88)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test064
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 1, 2]);
      const typedArr = new collections.Int16Array([1, 2, 1, 2]);

      expect(Array.from(arr).flat().lastIndexOf(1)).assertEqual(2);
      expect(typedArr.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test065
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['😀']);
      const suffix = collections.Array.from(['🌍']);
      const typedArr = new collections.Uint16Array([0xD83D, 0xDE00]);

      expect(arr.concat(suffix).includes('🌍')).assertEqual(true);
      const typedSuffix = new collections.Uint16Array([0xD83D, 0xDE0D]);
      const typedConcat = collections.Uint16Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.length).assertEqual(4);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test066
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5]);
      const typedArr = new collections.Int32Array([5]);

      expect(arr.slice(-Infinity).indexOf(5)).assertEqual(0);
      expect(typedArr.slice(-Infinity).indexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test067
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 4]);
      const typedArr = new collections.Int32Array([1, 2, 3, 4]);

      expect(Array.from(arr).flat(Infinity).lastIndexOf(4)).assertEqual(3);
      expect(typedArr.lastIndexOf(4)).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test068
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = collections.Array.from([1]);
      const suffix = collections.Array.from([2]);
      const result = original.concat(suffix);
      original.push(99);

      expect(result.includes(99)).assertEqual(false);
      expect(result.includes(2)).assertEqual(true);

      const typedOriginal = new collections.Int32Array([1]);
      const typedSuffix = new collections.Int32Array([2]);
      const typedResult = collections.Int32Array.from([...typedOriginal, ...typedSuffix]);
      expect(typedResult.includes(2)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test069
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20]);
      const typedArr = new collections.Int32Array([10, 20]);

      expect(arr.slice(0, Infinity).lastIndexOf(20)).assertEqual(1);
      expect(typedArr.slice(0, Infinity).lastIndexOf(20)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test070
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([undefined]);
      const typedArr = new collections.Float32Array([NaN]);
      expect(Array.from(arr).flat().includes(undefined)).assertEqual(true);
      const typedSim = new collections.Int32Array([0]);
      expect(typedSim.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test071
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test076()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test072
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([]);
      const typedArr = new collections.Int32Array([]);


      expect(typedArr.slice().includes(1)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test073
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, '2', true]);
      const typedArr = new collections.Uint8Array([1, 2, 1]);

      expect(Array.from(arr).flat().indexOf('2')).assertEqual(1);
      expect(typedArr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test074
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([7]);
      const suffix = collections.Array.from([8, 7]);
      const typedArr = new collections.Int16Array([7]);
      const typedSuffix = new collections.Int16Array([8, 7]);

      expect(arr.concat(suffix).lastIndexOf(7)).assertEqual(2);
      const typedConcat = collections.Int16Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test075
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const typedArr = new collections.Int32Array([1, 2]);

      expect(arr.slice(2).indexOf(2)).assertEqual(-1);
      expect(typedArr.slice(2).indexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test076
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([false]);
      const typedArr = new collections.Uint8Array([0]);

      expect(Array.from(arr).flat().includes(false)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test077
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test082()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test078
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array([1, 2, 3]);

      expect(arr.slice(1, -3).lastIndexOf(2)).assertEqual(-1);
      expect(typedArr.slice(1, -3).lastIndexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test079
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['42']);
      const typedArr = new collections.Int32Array([42]);

      expect(Array.from(arr).flat().indexOf('42')).assertEqual(0);
      expect(typedArr.indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test080
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const precise = 0.1 + 0.2;
      const arr = collections.Array.from([precise]);
      const suffix = collections.Array.from([0.3]);
      const typedArr = new collections.Float32Array([precise]);
      const typedSuffix = new collections.Float32Array([0.3]);

      expect(arr.concat(suffix).includes(precise)).assertEqual(true);
      const typedConcat = collections.Float32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(precise)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test081
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base = new collections.Int32Array([10, 20, 30, 40]);
      const view = base.subarray(1, 3);
      const arr = collections.Array.from([10, 20, 30, 40]);

      expect(arr.slice(1, 3).indexOf(30)).assertEqual(1);
      expect(view.slice().indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test082
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([ , 5]);
      const typedArr = new collections.Int32Array([5]);

      expect(Array.from(arr).flat().lastIndexOf(5)).assertEqual(1);
      expect(typedArr.lastIndexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test083
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([-0]);
      const suffix = collections.Array.from([+0]);
      const typedArr =new collections.Float32Array([-0]);
      const typedSuffix =new collections.Float32Array([+0]);

      expect(arr.concat(suffix).includes(+0)).assertEqual(true);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(+0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test084
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array([1, 2, 3]);

      expect(arr.slice(-100).lastIndexOf(1)).assertEqual(0);
      expect(typedArr.slice(-100).lastIndexOf(1)).assertEqual(0);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test085
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([255]);
      const suffix = collections.Array.from([256]);
      const typedArr = new collections.Uint8Array([255]);
      const typedSuffix = new collections.Uint8Array([256]);

      expect(arr.concat(suffix).indexOf(256)).assertEqual(1);
      const typedConcat = collections.Uint8Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(0)).assertEqual(1);
    });




    /**
     * @tc.name   builtinsArrayConstructor2Test086
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 1]);
      const typedArr = new collections.Int16Array([1, 2, 1]);

      expect(Array.from(arr).flat().lastIndexOf(1)).assertEqual(2);
      expect(typedArr.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test087
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const big = 123n;
      const arr = collections.Array.from([big]);
      const suffix = collections.Array.from([456n]);
      const typedArr = new BigInt64Array([big]);
      const typedSuffix = new BigInt64Array([456n]);

      expect(arr.concat(suffix).includes(456n)).assertEqual(true);
      const typedConcat = BigInt64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(456n)).assertEqual(true);
    });




    /**
     * @tc.name   builtinsArrayConstructor2Test088
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([55]);
      const typedArr = new collections.Int32Array([55]);

      expect(arr.slice(undefined).includes(55)).assertEqual(true);
      expect(typedArr.slice(undefined).includes(55)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test089
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([-0]);
      const typedArr =new collections.Float32Array([-0]);

      expect(Array.from(arr).flat().indexOf(-0)).assertEqual(0);
      expect(typedArr.indexOf(-0)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test090
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([NaN]);
      const typedArr =new collections.Float32Array([NaN]);
      expect(Array.from(arr).flat().includes(NaN)).assertEqual(true);
      expect(typedArr.includes(NaN)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test091
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([NaN]);
      const typedArr = new collections.Float32Array([NaN]);

      expect(arr.indexOf(NaN)).assertEqual(-1);
      expect(typedArr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test092
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minVal = Number.MIN_VALUE;
      const arr = collections.Array.from([minVal]);
      const typedArr =new collections.Float32Array([minVal]);

      expect(arr.lastIndexOf(minVal)).assertEqual(0);
      expect(typedArr.lastIndexOf(minVal)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test093
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST09300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxVal = Number.MAX_VALUE;
      const arr = collections.Array.from([maxVal]);
      const suffix = collections.Array.from([maxVal]);
      const typedArr =new collections.Float32Array([maxVal]);
      const typedSuffix =new collections.Float32Array([maxVal]);
      expect(arr.concat(suffix).includes(maxVal)).assertEqual(true);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(maxVal)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test094
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negMax = -Number.MAX_VALUE;
      const arr = collections.Array.from([negMax, 0]);
      const typedArr =new collections.Float32Array([negMax, 0]);

      expect(arr.slice(0, 1).indexOf(negMax)).assertEqual(0);
      expect(typedArr.slice(0, 1).indexOf(negMax)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test095
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negMin = -Number.MIN_VALUE;
      const arr = collections.Array.from([negMin]);
      const typedArr =new collections.Float32Array([negMin]);

      expect(Array.from(arr).flat().includes(negMin)).assertEqual(true);
      expect(typedArr.includes(negMin)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test096
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eps = Number.EPSILON;
      const arr = collections.Array.from([eps]);
      const suffix = collections.Array.from([1, eps]);
      const typedArr =new collections.Float32Array([eps]);
      const typedSuffix =new collections.Float32Array([1, eps]);

      expect(arr.concat(suffix).lastIndexOf(eps)).assertEqual(2);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(eps)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test097
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const typedArr = new collections.Int32Array([1]);
      expect(arr.slice(0).includes(1)).assertEqual(true);
      expect(typedArr.slice(0).includes(1)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test098
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test108()).assertDeepEquals([0, 0]);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test099
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Min = -2147483648;
      const arr = collections.Array.from([int32Min]);
      const typedArr = new collections.Int32Array([int32Min]);

      expect(arr.lastIndexOf(int32Min)).assertEqual(0);
      expect(typedArr.lastIndexOf(int32Min)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test100
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Max = 2147483647;
      const arr = collections.Array.from([int32Max]);
      const typedArr = new collections.Int32Array([int32Max]);

      expect(Array.from(arr).flat().includes(int32Max)).assertEqual(true);
      expect(typedArr.includes(int32Max)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test101
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const over = 4294967296;
      const arr = collections.Array.from([over]);
      const suffix = collections.Array.from([1]);
      const typedArr = new collections.Uint32Array([over]);
      const typedSuffix = new collections.Uint32Array([1]);

      expect(arr.concat(suffix).indexOf(over)).assertEqual(0);
      const typedConcat = collections.Uint32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test102
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nan1 = NaN;
      const nan2 = 0 / 0;
      const arr = collections.Array.from([nan1]);
      const typedArr =new collections.Float32Array([nan2]);

      expect(arr.slice().includes(NaN)).assertEqual(true);
      expect(typedArr.slice().includes(NaN)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test103
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negZero = -1 / Infinity;
      const arr = collections.Array.from([negZero]);
      const typedArr =new collections.Float32Array([negZero]);

      expect(Array.from(arr).flat().lastIndexOf(-0)).assertEqual(0);
      expect(typedArr.lastIndexOf(-0)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test104
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test116()).assertDeepEquals([-1, -1]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test105
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(["-0"]);
      const typedArr = new collections.Int32Array([0]);

      expect(Array.from(arr).flat().includes("-0")).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test106
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const expNum = 1e308;
      const arr = collections.Array.from([expNum]);
      const suffix = collections.Array.from([1, expNum]);
      const typedArr =new collections.Float32Array([expNum]);
      const typedSuffix =new collections.Float32Array([1, expNum]);

      expect(arr.concat(suffix).lastIndexOf(expNum)).assertEqual(2);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(expNum)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test107
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeNeg = -1e308;
      const arr = collections.Array.from([largeNeg]);
      const typedArr =new collections.Float32Array([largeNeg]);

      expect(arr.slice().includes(largeNeg)).assertEqual(true);
      expect(typedArr.slice().includes(largeNeg)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test108
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ninf = Number.NEGATIVE_INFINITY;
      const arr = collections.Array.from([ninf]);
      const typedArr =new collections.Float32Array([ninf]);

      expect(Array.from(arr).flat().indexOf(ninf)).assertEqual(0);
      expect(typedArr.indexOf(ninf)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test109
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sum = 0.1 + 0.2;
      const arr = collections.Array.from([sum]);
      const suffix = collections.Array.from([0.3]);
      const typedArr =new collections.Float32Array([sum]);
      const typedSuffix =new collections.Float32Array([0.3]);

      expect(arr.concat(suffix).includes(sum)).assertEqual(true);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(sum)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test110
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pi = Math.PI;
      const arr = collections.Array.from([pi, 3.14, pi]);
      const typedArr =new collections.Float32Array([pi, 3.14, pi]);

      expect(arr.slice().lastIndexOf(pi)).assertEqual(2);
      expect(typedArr.lastIndexOf(pi)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test111
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pinf = Number.POSITIVE_INFINITY;
      const arr = collections.Array.from([pinf]);
      const typedArr = new collections.Float32Array([pinf]);

      expect(Array.from(arr).flat().includes(pinf)).assertEqual(true);
      expect(typedArr.includes(pinf)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test112
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tiny = 5e-324;
      const arr = collections.Array.from([tiny]);
      const suffix = collections.Array.from([1]);
      const typedArr =new collections.Float32Array([tiny]);
      const typedSuffix =new collections.Float32Array([1]);

      expect(arr.concat(suffix).indexOf(tiny)).assertEqual(0);
      const typedConcat = Float64Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(tiny)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test113
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tinyNeg = -5e-324;
      const arr = collections.Array.from([tinyNeg]);
      const typedArr =new collections.Float32Array([tinyNeg]);

      expect(arr.slice().includes(tinyNeg)).assertEqual(true);
      expect(typedArr.slice().includes(tinyNeg)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test114
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([NaN, NaN]);
      const typedArr =new collections.Float32Array([NaN, NaN]);
      expect(Array.from(arr).flat().lastIndexOf(NaN)).assertEqual(-1);
      expect(typedArr.lastIndexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test115
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hex = 0xFF;
      const arr = collections.Array.from([hex]);
      const suffix = collections.Array.from([0x100]);
      const typedArr = new collections.Uint8Array([hex]);
      const typedSuffix = new collections.Uint8Array([0x100]);
      expect(arr.concat(suffix).includes(0x100)).assertEqual(true);
      const typedConcat = collections.Uint8Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test116
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bin = 0b1010;
      const arr = collections.Array.from([bin, 0b1111]);
      const typedArr = new collections.Int32Array([bin, 0b1111]);

      expect(arr.slice(0, 1).indexOf(10)).assertEqual(0);
      expect(typedArr.slice(0, 1).indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test117
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(["1e5"]);
      const typedArr =new collections.Float32Array([100000]);

      expect(Array.from(arr).flat().includes("1e5")).assertEqual(true);
      expect(typedArr.includes(100000)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test118
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test130()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test119
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test131()).assertDeepEquals([-1, 0]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test120
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const typedArr = new collections.Int32Array([1]);
      const hugeIndex = 4294967295;
      expect(arr.slice(hugeIndex).length).assertEqual(0);
      expect(typedArr.slice(hugeIndex).length).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test121
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test134()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test122
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const u8 = new collections.Uint8Array([255]);
      const i16 = new collections.Int16Array([-1]);
      const merged = collections.Int32Array.from([...u8, ...i16]);
      expect(merged.length).assertEqual(2);
      expect(merged[0]).assertEqual(255);
      expect(merged[1]).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test123
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test137()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test124
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([0, -0, 0]);
      const typedArr =new collections.Float32Array([0, -0, 0]);
      expect(arr.includes(0)).assertEqual(true);
      expect(arr.includes(-0)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
      expect(typedArr.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test125
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([NaN, NaN]);
      const typedArr = new collections.Float32Array([NaN, NaN]);

      expect(arr.lastIndexOf(NaN)).assertEqual(-1);
      expect(typedArr.lastIndexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test126
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test140()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test127
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array([1, 2, 3]);

      expect(arr.slice(0, -0).length).assertEqual(0);
      expect(typedArr.slice(0, -0).length).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test128
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([""]);
      const typedArr = new collections.Uint8Array([0]);

      expect(Array.from(arr).flat().indexOf("")).assertEqual(0);
      expect(typedArr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test129
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test143()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test130
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([null, undefined, 0]);
      const typedArr = new collections.Int32Array([0, 0, 0]);

      expect(arr.indexOf(null)).assertEqual(0);
      expect(typedArr.indexOf(0)).assertEqual(0);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test131
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['__proto__']);
      const suffix = collections.Array.from(['constructor']);
      const typedArr = new collections.Int8Array([1]);

      expect(arr.concat(suffix).includes('__proto__')).assertEqual(true);
      expect(typedArr.includes(1)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test132
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base = new collections.ArrayBuffer(8);
      const view = new collections.Int32Array(base, 0, 2);
      const sliced = view.slice(0, 10);

      expect(sliced.length).assertEqual(2);
      expect(sliced.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test133
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array([1, 2, 3]);

      expect(Array.from(arr).flat(Number.MAX_SAFE_INTEGER).lastIndexOf(3)).assertEqual(2);
      expect(typedArr.lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test134
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([-0]);
      const typedArr =new collections.Float32Array([-0]);
      expect(arr.includes(-0)).assertEqual(true);
      expect(typedArr.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test135
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, "", 2]);
      const typedArr = new collections.Int32Array([1, 0, 2]);
      expect(arr.indexOf("")).assertEqual(1);
      expect(typedArr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test136
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test151()).assertDeepEquals([0, 1, 0]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test137
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test152()).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test138
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test153()).assertDeepEquals([false, true, true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test139
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([Infinity, -Infinity, NaN]);
      const typedArr =new collections.Float32Array([Infinity, -Infinity, NaN]);

      expect(arr.lastIndexOf(-Infinity)).assertEqual(1);
      expect(typedArr.lastIndexOf(-Infinity)).assertEqual(1);
    });


  })
}