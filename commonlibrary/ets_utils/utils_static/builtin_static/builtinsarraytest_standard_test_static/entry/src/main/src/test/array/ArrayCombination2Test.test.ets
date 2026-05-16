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
import Utils from '../Util.test';

export default function ArrayConstructor2Test() {
  describe('ArrayConstructor2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   ArrayConstructor2Test001
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new Int32Array([1, 2, 3]);
      const suffix = [4, 5];
      const typedSuffix = new Int32Array([4, 5]);
      const resultArr = arr.concat(suffix).includes(4);
      expect(resultArr).assertEqual(true);
      const mergedArray = new Int32Array(typedArr.length + typedSuffix.length);
      mergedArray.set(typedArr);
      mergedArray.set(typedSuffix, typedArr.length);
      const resultTyped = mergedArray.includes(4);
      expect(resultTyped).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test002
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      const typedArr = new Uint8Array([10, 20]);
      const extra = ['c'];
      const typedExtra = new Uint8Array([30]);
      const idxArr = arr.concat(extra).indexOf('c');
      expect(idxArr).assertEqual(2);
      const mergedArray = new Uint8Array(typedArr.length + typedExtra.length);
      mergedArray.set(typedArr);
      mergedArray.set(typedExtra, typedArr.length);
      const idxTyped = mergedArray.indexOf(30);

      expect(idxTyped).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test003
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 1];
      const typedArr = new Int16Array([5, 6, 5]);
      const tail = [1];
      const typedTail = new Int16Array([5]);
      const lastIdxArr = arr.concat(tail).lastIndexOf(1);
      expect(lastIdxArr).assertEqual(3);
      const mergedArray = new Int16Array(typedArr.length + typedTail.length);
      mergedArray.set(typedArr);
      mergedArray.set(typedTail, typedArr.length);
      const lastIdxTyped = mergedArray.lastIndexOf(5);
      expect(lastIdxTyped).assertEqual(3);
    });

    /**
     * @tc.name   ArrayConstructor2Test004
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40];
      const typedArr = new Float32Array([1.1, 2.2, 3.3, 4.4]);
      const slicedIncludes = arr.slice(1, 3).includes(30);
      expect(slicedIncludes).assertEqual(true);
      const typedSliced = typedArr.slice(1, 3);
      const typedIncludes = typedSliced.includes(3.3);
      expect(typedIncludes).assertEqual(false);
    });

    /**
     * @tc.name   ArrayConstructor2Test005
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['x', 'y', 'z', 'y'];
      const typedArr = new Int8Array([7, 8, 9, 8]);
      const slicedIdx = arr.slice(1).indexOf('y');
      expect(slicedIdx).assertEqual(0);
      const typedSliced = typedArr.slice(1);
      const typedIdx = typedSliced.indexOf(8);
      expect(typedIdx).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test006
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const target = 3;
      const typedArr = new Int32Array([1, 2, 3, 4]);
      const flatIncludes = arr.flat<int>().includes(target);
      expect(flatIncludes).assertEqual(true);
      const typedIncludes = typedArr.includes(target);
      expect(typedIncludes).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test007
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[10], [20, 30]];
      const target = 30;
      const typedArr = new Int16Array([10, 20, 30]);
      const flatIdx = arr.flat<int>().indexOf(target);
      expect(flatIdx).assertEqual(2);
      const typedIdx = typedArr.indexOf(target);
      expect(typedIdx).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test008
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[5, 5], [6], [5]];
      const target = 5;
      const typedArr = new Uint8Array([5, 5, 6, 5]);
      const flatLastIdx = arr.flat<int>().lastIndexOf(target);
      expect(flatLastIdx).assertEqual(3);
      const typedLastIdx = typedArr.lastIndexOf(target);
      expect(typedLastIdx).assertEqual(3);
    });

    /**
     * @tc.name   ArrayConstructor2Test009
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST0900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 2, 4];
      const typedArr = new Int32Array([1, 2, 3, 2, 4]);
      const slicedLastIdx = arr.slice(1, -1).lastIndexOf(2);
      expect(slicedLastIdx).assertEqual(2);

      const typedSliced = typedArr.slice(1, -1);
      const typedLastIdx = typedSliced.lastIndexOf(2);
      expect(typedLastIdx).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test011
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const suffix = [3];
      const typedArr = new Int32Array([1, 2]);
      const typedSuffix = new Int32Array([3]);

      expect(arr.concat(suffix).includes(99)).assertEqual(false);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(99)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayConstructor2Test012
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const suffix = [2, 1];
      const typedArr = new Int32Array([1]);
      const typedSuffix = new Int32Array([2, 1]);

      expect(arr.concat(suffix).indexOf(1)).assertEqual(0);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test013
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [5, 6, 5];
      const suffix = [7, 5];
      const typedArr = new Int16Array([5, 6, 5]);
      const typedSuffix = new Int16Array([7, 5]);

      expect(arr.concat(suffix).lastIndexOf(5)).assertEqual(4);
      const typedConcat = new Int16Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.name   ArrayConstructor2Test014
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40];
      const typedArr = new Int32Array([10, 20, 30, 40]);

      expect(arr.slice(1, -1).includes(30)).assertEqual(true);
      expect(typedArr.slice(1, -1).includes(30)).assertEqual(true);

    });

    /**
     * @tc.name   ArrayConstructor2Test015
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const typedArr = new Uint8Array([1, 2]);

      expect(arr.slice(5, 10).includes(1)).assertEqual(false);
      expect(typedArr.slice(5, 10).includes(1)).assertEqual(false);

    });

    /**
     * @tc.name   ArrayConstructor2Test016
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const typedArr = new Int32Array([1, 2]);

      expect(arr.slice(2).indexOf(1)).assertEqual(-1);
      expect(typedArr.slice(2).indexOf(1)).assertEqual(-1);

    });

    /**
     * @tc.name   ArrayConstructor2Test017
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a'];
      const typedArr = new Int8Array([97]);

      expect(arr.slice(0, 1).lastIndexOf('a')).assertEqual(0);
      expect(typedArr.slice(0, 1).lastIndexOf(97)).assertEqual(0);

    });

    /**
     * @tc.name   ArrayConstructor2Test018
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1]];
      const typedArr = new Int32Array([1, 2]);
      expect(arr.flat<number>().includes(2)).assertEqual(false);
      expect(typedArr.includes(2)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test019
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST1900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[], [1], []];
      const typedArr = new Int32Array([1]);

      expect(arr.flat<number>().includes(1)).assertEqual(true);
      expect(typedArr.includes(1)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test020
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[], [], [5]];
      const typedArr = new Int16Array([5]);

      expect(arr.flat<number>().indexOf(5)).assertEqual(0);
      expect(typedArr.indexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test021
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[3], [], []];
      const typedArr = new Int32Array([3]);

      expect(arr.flat<number>().lastIndexOf(3)).assertEqual(0);
      expect(typedArr.lastIndexOf(3)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test022
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, '2'];
      const suffix = ['3'];
      const typedArr = new Float32Array([1.0, 2.0]);
      const typedSuffix = new Float32Array([3.0]);

      expect(arr.concat(suffix).includes('2')).assertEqual(true);
      const typedConcat = new Float32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(2.0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test023
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const typedArr = new Int32Array([10, 20, 30]);

      expect(arr.slice(-2).indexOf(30)).assertEqual(1);
      expect(typedArr.slice(-2).indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test024
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [7, 8, 7];
      const typedArr = new Int8Array([7, 8, 7]);

      expect(arr.slice().lastIndexOf(7)).assertEqual(2);
      expect(typedArr.slice().lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test025
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2], null, undefined];
      const typedArr = new Int32Array([1, 2, 0, 0]);
      expect(arr.flat<number | null | undefined>().includes(null)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test026
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1];
      const suffix = new Int32Array([2]);
      const typedArr = new Uint8Array([1]);
      const typedSuffix = new Int32Array([2]);

      expect(arr.concat(Array.from(suffix)).indexOf(2)).assertEqual(1);
      const typedConcat = new Uint8Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test027
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.slice(1, 1).includes(2)).assertEqual(false);
      expect(typedArr.slice(1, 1).includes(2)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayConstructor2Test028
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [2]];
      const typedArr = new Int16Array([1, 2, 2]);

      expect(arr.flat<int>().lastIndexOf(2)).assertEqual(2);
      expect(typedArr.lastIndexOf(2)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test029
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST2900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [5, 5];
      const suffix = [5];
      const typedArr = new Int32Array([5, 5]);
      const typedSuffix = new Int32Array([5]);

      expect(arr.concat(suffix).lastIndexOf(5)).assertEqual(2);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(5)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test031
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1]];
      const typedArr = new Int32Array([1]);
      expect(arr.flat<number[]>(0).includes([1])).assertEqual(false);
      expect(typedArr.includes(1)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test032
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const suffix: (number | undefined)[] = [4];
      const typedArr = new Int32Array([1, 0, 3]);
      const typedSuffix = new Int32Array([4]);
      expect(arr.concat(suffix as (number | undefined)[]).includes(undefined)).assertEqual(true);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test033
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 2];
      const typedArr = new Int32Array([1, 2, 3, 2]);
      expect(arr.slice(0, 3).lastIndexOf(2)).assertEqual(1);
      expect(typedArr.slice(0, 3).lastIndexOf(2)).assertEqual(1);

    });

    /**
     * @tc.name   ArrayConstructor2Test034
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [['1'], ['2']];
      const typedArr = new Int32Array([1, 2]);

      expect(arr.flat<string>().indexOf('2')).assertEqual(1);
      expect(typedArr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test035
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const a1 = [2];
      const a2 = [3];
      const typedArr = new Int32Array([1]);
      const t1 = new Int32Array([2]);
      const t2 = new Int32Array([3]);

      expect(arr.concat(a1, a2).indexOf(3)).assertEqual(2);
      const typedConcat = new Int32Array(typedArr.length + t1.length + t2.length);
      typedConcat.set(typedArr);
      typedConcat.set(t1, typedArr.length);
      typedConcat.set(t2, typedArr.length);
      expect(typedConcat.indexOf(3)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test036
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.slice(2, 1).includes(2)).assertEqual(false);
      expect(typedArr.slice(2, 1).includes(2)).assertEqual(false);

    });

    /**
     * @tc.name   ArrayConstructor2Test037
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[true], [false]];
      const typedArr = new Uint8Array([1, 0]);

      expect(arr.flat<boolean>().includes(false)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);

    });

    /**
     * @tc.name   ArrayConstructor2Test038
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [NaN];
      const suffix: number[] = [1];
      const typedArr = new Float32Array([NaN]);
      const typedSuffix = new Float32Array([1]);
      expect(arr.concat(suffix).includes(NaN)).assertEqual(true);
      const typedConcat = new Float32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(NaN)).assertEqual(true);
      expect(arr.concat(suffix).lastIndexOf(NaN)).assertEqual(-1);
      expect(typedConcat.lastIndexOf(NaN)).assertEqual(-1);

    });

    /**
     * @tc.name   ArrayConstructor2Test039
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST3900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [42];
      const typedArr = new Int32Array([42]);

      expect(arr.slice(0, 1).indexOf(42)).assertEqual(0);
      expect(typedArr.slice(0, 1).indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test041
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [100];
      const typedArr = new Int32Array([100]);

      expect(arr.slice(0, 0).indexOf(100)).assertEqual(-1);
      expect(typedArr.slice(0, 0).indexOf(100)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test042
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[5]];
      const typedArr = new Int32Array([5]);

      expect(arr.flat<int>(2).lastIndexOf(5)).assertEqual(0);
      expect(typedArr.lastIndexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test043
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const shared = [99];
      const arr = [1];
      const typedArr = new Int32Array([1]);
      const typedShared = new Int32Array([99]);

      const resultArr = arr.concat(shared);
      expect(resultArr.includes(99)).assertEqual(true);
      expect(arr.length).assertEqual(1);

      const typedConcat = new Int32Array(typedArr.length + typedShared.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedShared, typedArr.length);
      expect(typedConcat.includes(99)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test044
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const typedArr = new Int32Array([1, 2, 3, 4]);
      expect(arr.slice(-5, -1).lastIndexOf(3)).assertEqual(2);
      expect(typedArr.slice(-5, -1).lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test046
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1.1];
      const suffix = [2.2];
      const typedArr = new Float64Array([1.1]);
      const typedSuffix = new Float64Array([2.2]);

      expect(arr.concat(suffix).indexOf(2.2)).assertEqual(1);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(2.2)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test049
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST4900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [200];
      const suffix = [255, 200];
      const typedArr = new Uint8ClampedArray([200]);
      const typedSuffix = new Uint8ClampedArray([255, 200]);

      expect(arr.concat(suffix).lastIndexOf(200)).assertEqual(2);
      const typedConcat = new Uint8ClampedArray(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(200)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test050
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const typedArr = new Int32Array([1]);

      expect(arr.slice(10).includes(1)).assertEqual(false);
      expect(typedArr.slice(10).includes(1)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayConstructor2Test051
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [["0"]];
      const typedArr = new Int32Array([0]);

      expect(arr.flat<string>().includes("0")).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test052
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: number[] = [1];
      const arr2: number[] = [2.5];
      const typed1 = new Int32Array([1]);
      const typed2 = new Float32Array([2.5]);

      expect(arr1.concat(arr2).indexOf(2.5)).assertEqual(1);
      const merged = new Float32Array(new Float32Array(typed1).length + typed2.length);
      merged.set(new Float32Array(typed1));
      merged.set(typed2, new Float32Array(typed1).length);
      expect(merged.indexOf(2.5)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test053
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [7, 7, 7];
      const typedArr = new Int8Array([7, 7, 7]);

      expect(arr.slice(1).lastIndexOf(7)).assertEqual(1);
      expect(typedArr.slice(1).lastIndexOf(7)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test054
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[null]];
      const typedArr = new Int32Array([0]);

      expect(arr.flat<null>().indexOf(null)).assertEqual(0);
      expect(typedArr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test055
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [-0];
      const suffix = [1];
      const typedArr = new Float64Array([-0]);
      const typedSuffix = new Float64Array([1]);

      expect(arr.concat(suffix).includes(-0)).assertEqual(true);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test056
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const big = Number.MAX_SAFE_INTEGER;
      const arr = [big - 1, big];
      const typedArr = new BigInt64Array([BigInt(big - 1), BigInt(big)]);

      expect(arr.slice(1).indexOf(big)).assertEqual(0);
      expect(typedArr.slice(1).indexOf(BigInt(big))).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test057
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]]];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.flat<int>().lastIndexOf(2)).assertEqual(1);
      expect(typedArr.lastIndexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test058
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const suffix = [2];
      const typedArr = new Int32Array([1]);
      const typedSuffix = new Int32Array([2]);

      expect(arr.concat(suffix).includes(2)).assertEqual(true);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(2)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test059
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST5900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [5];
      const typedArr = new Int32Array([5]);

      expect(arr.slice(-0).includes(5)).assertEqual(true);
      expect(typedArr.slice(-0).includes(5)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test060
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[new Boolean(true)]];
      const typedArr = new Uint8Array([1]);

      expect(arr.flat<boolean>().indexOf(new Boolean(true))).assertEqual(0);
      expect(typedArr.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test061
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2];
      const suffix: number[] = [];
      const typedArr = new Int32Array([1, 2]);
      const typedSuffix = new Int32Array([]);

      expect(arr.concat(suffix).lastIndexOf(2)).assertEqual(1);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test062
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const typedArr = new Int32Array([10, 20, 30]);

      expect(arr.slice(Math.floor(0.9).toInt(), Math.floor(2.9).toInt()).indexOf(20)).assertEqual(1);
      expect(typedArr.slice(Math.floor(0.9).toInt(), Math.floor(2.9).toInt()).indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test063
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[Infinity]];
      const typedArr = new Float32Array([Infinity]);

      expect(arr.flat<number>().includes(Infinity)).assertEqual(true);
      expect(typedArr.includes(Infinity)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test064
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [-Infinity];
      const suffix: number[] = [0];
      const typedArr = new Float64Array([-Infinity]);
      const typedSuffix = new Float64Array([0]);

      expect(arr.concat(suffix).includes(-Infinity)).assertEqual(true);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(-Infinity)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test065
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [42];
      const typedArr = new Int32Array([42]);

      expect(arr.slice(0, -1).lastIndexOf(42)).assertEqual(-1);
      expect(typedArr.slice(0, -1).lastIndexOf(42)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test067
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const large: bigint = 9007199254740992n + 1n;
      const arr: number[] = [Number(large)];
      const suffix: number[] = [2];
      const typedArr = new Float64Array([Number(large)]);
      const typedSuffix = new Float64Array([2]);

      expect(arr.concat(suffix).indexOf(Number(large))).assertEqual(0);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(Number(large))).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test068
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [88];
      const typedArr = new Int32Array([88]);

      expect(arr.slice(Math.floor(NaN).toInt()).includes(88)).assertEqual(true);
      expect(typedArr.slice(Math.floor(NaN).toInt()).includes(88)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test069
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST6900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [1, 2]];
      const typedArr = new Int16Array([1, 2, 1, 2]);

      expect(arr.flat<int>().lastIndexOf(1)).assertEqual(2);
      expect(typedArr.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test070
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['😀'];
      const suffix = ['🌍'];
      const typedArr = new Uint16Array([0xD83D, 0xDE00]);

      expect(arr.concat(suffix).includes('🌍')).assertEqual(true);
      const typedSuffix = new Uint16Array([0xD83D, 0xDE0D]);
      const typedConcat = new Uint16Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.length).assertEqual(4);
    });

    /**
     * @tc.name   ArrayConstructor2Test071
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [5];
      const typedArr = new Int32Array([5]);

      expect(arr.slice(Math.floor(-Infinity).toInt()).indexOf(5)).assertEqual(0);
      expect(typedArr.slice(Math.floor(-Infinity).toInt()).indexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test072
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, [4]]]];
      const typedArr = new Int32Array([1, 2, 3, 4]);

      expect(arr.flat<int>(Infinity.toInt()).lastIndexOf(4)).assertEqual(3);
      expect(typedArr.lastIndexOf(4)).assertEqual(3);
    });

    /**
     * @tc.name   ArrayConstructor2Test073
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = [1];
      const suffix = [2];
      const result = original.concat(suffix);
      original.push(99);

      expect(result.includes(99)).assertEqual(false);
      expect(result.includes(2)).assertEqual(true);

      const typedOriginal = new Int32Array([1]);
      const typedSuffix = new Int32Array([2]);
      const typedResult = new Int32Array(typedOriginal.length + typedSuffix.length);
      typedResult.set(typedOriginal);
      typedResult.set(typedSuffix, typedOriginal.length);
      expect(typedResult.includes(2)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test074
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20];
      const typedArr = new Int32Array([10, 20]);

      expect(arr.slice(Math.floor(0).toInt(), Math.floor(Infinity).toInt()).lastIndexOf(20)).assertEqual(1);
      expect(typedArr.slice(Math.floor(0).toInt(), Math.floor(Infinity).toInt()).lastIndexOf(20)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test075
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[undefined]];
      const typedArr = new Float32Array([NaN]);
      expect(arr.flat<undefined>().includes(undefined)).assertEqual(true);
      const typedSim = new Int32Array([0]);
      expect(typedSim.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test077
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const typedArr = new Int32Array([]);

      expect(arr.slice().includes(1)).assertEqual(false);
      expect(typedArr.slice().includes(1)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayConstructor2Test078
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, ['2', true]];
      const typedArr = new Uint8Array([1, 2, 1]);

      expect(arr.flat<number | string | boolean>().indexOf('2')).assertEqual(1);
      expect(typedArr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test079
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST7900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [7];
      const suffix = [8, 7];
      const typedArr = new Int16Array([7]);
      const typedSuffix = new Int16Array([8, 7]);

      expect(arr.concat(suffix).lastIndexOf(7)).assertEqual(2);
      const typedConcat = new Int16Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test080
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const typedArr = new Int32Array([1, 2]);

      expect(arr.slice(2).indexOf(2)).assertEqual(-1);
      expect(typedArr.slice(2).indexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test081
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[false]];
      const typedArr = new Uint8Array([0]);

      expect(arr.flat<boolean>().includes(false)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test083
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.slice(1, -3).lastIndexOf(2)).assertEqual(-1);
      expect(typedArr.slice(1, -3).lastIndexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test084
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [['42']];
      const typedArr = new Int32Array([42]);

      expect(arr.flat<string>().indexOf('42')).assertEqual(0);
      expect(typedArr.indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test085
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const precise = 0.1 + 0.2;
      const arr = [precise];
      const suffix = [0.3];
      const typedArr = new Float32Array([precise]);
      const typedSuffix = new Float32Array([0.3]);

      expect(arr.concat(suffix).includes(precise)).assertEqual(true);
      const typedConcat = new Float32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(precise)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayConstructor2Test087
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[], [5]];
      const typedArr = new Int32Array([5]);

      expect(arr.flat<number>().lastIndexOf(5)).assertEqual(0);
      expect(typedArr.lastIndexOf(5)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test088
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [-0];
      const suffix = [+0];
      const typedArr = new Float64Array([-0]);
      const typedSuffix = new Float64Array([+0]);

      expect(arr.concat(suffix).includes(+0)).assertEqual(true);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(+0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test089
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST8900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.slice(-100).lastIndexOf(1)).assertEqual(0);
      expect(typedArr.slice(-100).lastIndexOf(1)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test090
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1], [2], [3]];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.flat<int>().includes(2)).assertEqual(true);
      expect(typedArr.includes(2)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test091
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [255];
      const suffix = [256];
      const typedArr = new Uint8Array([255]);
      const typedSuffix = new Uint8Array([256]);

      expect(arr.concat(suffix).indexOf(256)).assertEqual(1);
      const typedConcat = new Uint8Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test093
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1], [2, 1]];
      const typedArr = new Int16Array([1, 2, 1]);

      expect(arr.flat<int>().lastIndexOf(1)).assertEqual(2);
      expect(typedArr.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test094
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const big = 123n;
      const arr = [big];
      const suffix = [456n];
      const typedArr = new BigInt64Array([big]);
      const typedSuffix = new BigInt64Array([456n]);

      expect(arr.concat(suffix).includes(456n)).assertEqual(true);
      const typedConcat = new BigInt64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(456n)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test096
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const now = new Date();
      const arr = [[now]];
      const typedArr = new Float64Array([now.getTime()]);

      expect(arr.flat<Date>().includes(now)).assertEqual(true);
      expect(typedArr.includes(now.getTime())).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test097
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp('test');
      const arr = [re];
      const suffix = new Array<RegExp>(new RegExp('end'));
      const typedArr = new Int32Array([1]);

      expect(arr.concat(suffix).lastIndexOf(re)).assertEqual(0);
      expect(typedArr.lastIndexOf(1)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test098
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [55];
      const typedArr = new Int32Array([55]);

      expect(arr.slice(undefined).includes(55)).assertEqual(true);
      expect(typedArr.slice(undefined).includes(55)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test099
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST9900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[-0]];
      const typedArr = new Float64Array([-0]);

      expect(arr.flat<int>().indexOf(-0)).assertEqual(0);
      expect(typedArr.indexOf(-0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test100
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[NaN]];
      const typedArr = new Float64Array([NaN]);
      expect(arr.flat<number>().includes(NaN)).assertEqual(true);
      expect(typedArr.includes(NaN)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test101
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN];
      const typedArr = new Float32Array([NaN]);

      expect(arr.indexOf(NaN)).assertEqual(-1);
      expect(typedArr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test102
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minVal = Number.MIN_VALUE;
      const arr = [minVal];
      const typedArr = new Float64Array([minVal]);

      expect(arr.lastIndexOf(minVal)).assertEqual(0);
      expect(typedArr.lastIndexOf(minVal)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test103
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxVal = Number.MAX_VALUE;
      const arr = [maxVal];
      const suffix = [maxVal];
      const typedArr = new Float64Array([maxVal]);
      const typedSuffix = new Float64Array([maxVal]);
      expect(arr.concat(suffix).includes(maxVal)).assertEqual(true);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(maxVal)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test104
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negMax = -Number.MAX_VALUE;
      const arr = [negMax, 0];
      const typedArr = new Float64Array([negMax, 0]);

      expect(arr.slice(0, 1).indexOf(negMax)).assertEqual(0);
      expect(typedArr.slice(0, 1).indexOf(negMax)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test105
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negMin = -Number.MIN_VALUE;
      const arr = [[negMin]];
      const typedArr = new Float64Array([negMin]);

      expect(arr.flat<number>().includes(negMin)).assertEqual(true);
      expect(typedArr.includes(negMin)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test106
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eps = Number.EPSILON;
      const arr = [eps];
      const suffix: double[] = [1, eps];
      const typedArr = new Float64Array([eps]);
      const typedSuffix = new Float64Array([1, eps]);

      expect(arr.concat(suffix as number[]).lastIndexOf(eps)).assertEqual(2);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(eps)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test107
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const typedArr = new Int32Array([1]);
      expect(arr.slice(0).includes(1)).assertEqual(true);
      expect(typedArr.slice(0).includes(1)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test109
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST10900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(5);
      const arr: number[] = [numObj];
      const suffix: number[] = [6];
      const typedArr = new Int32Array([5]);
      const typedSuffix = new Int32Array([6]);

      expect(arr.concat(suffix).includes(numObj)).assertEqual(true);
      const typedConcat = new Int32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(5)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test110
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Min = -2147483648;
      const arr = [int32Min];
      const typedArr = new Int32Array([int32Min]);

      expect(arr.lastIndexOf(int32Min)).assertEqual(0);
      expect(typedArr.lastIndexOf(int32Min)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test111
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Max = 2147483647;
      const arr = [[int32Max]];
      const typedArr = new Int32Array([int32Max]);

      expect(arr.flat<int>().includes(int32Max)).assertEqual(true);
      expect(typedArr.includes(int32Max)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test112
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const over = 4294967296;
      const arr: number[] = [over];
      const suffix: number[] = [1];
      const typedArr = new Uint32Array([over]);
      const typedSuffix = new Uint32Array([1]);

      expect(arr.concat(suffix).indexOf(over)).assertEqual(0);
      const typedConcat = new Uint32Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test113
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nan1 = NaN;
      const nan2 = 0.0 / 0;
      const arr = [nan1];
      const typedArr = new Float64Array([nan2]);

      expect(arr.slice().includes(NaN)).assertEqual(true);
      expect(typedArr.slice().includes(NaN)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test114
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negZero = -1 / Infinity;
      const arr = [[negZero]];
      const typedArr = new Float64Array([negZero]);

      expect(arr.flat<number>().lastIndexOf(-0)).assertEqual(0);
      expect(typedArr.lastIndexOf(-0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test117
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [["-0"]];
      const typedArr = new Int32Array([0]);

      expect(arr.flat<string>().includes("-0")).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test118
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const expNum = 1e308;
      const arr = [expNum];
      const suffix = [1, expNum];
      const typedArr = new Float64Array([expNum]);
      const typedSuffix = new Float64Array([1, expNum]);

      expect(arr.concat(suffix).lastIndexOf(expNum)).assertEqual(2);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.lastIndexOf(expNum)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test119
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST11900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeNeg = -1e308;
      const arr = [largeNeg];
      const typedArr = new Float64Array([largeNeg]);

      expect(arr.slice().includes(largeNeg)).assertEqual(true);
      expect(typedArr.slice().includes(largeNeg)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test120
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ninf = Number.NEGATIVE_INFINITY;
      const arr = [[ninf]];
      const typedArr = new Float64Array([ninf]);

      expect(arr.flat<number>().indexOf(ninf)).assertEqual(0);
      expect(typedArr.indexOf(ninf)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test121
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sum = 0.1 + 0.2;
      const arr = [sum];
      const suffix = [0.3];
      const typedArr = new Float64Array([sum]);
      const typedSuffix = new Float64Array([0.3]);

      expect(arr.concat(suffix).includes(sum)).assertEqual(true);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(sum)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test122
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pi = Math.PI;
      const arr = [pi, 3.14, pi];
      const typedArr = new Float64Array([pi, 3.14, pi]);

      expect(arr.slice().lastIndexOf(pi)).assertEqual(2);
      expect(typedArr.lastIndexOf(pi)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test123
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pinf = Number.POSITIVE_INFINITY;
      const arr = [[pinf]];
      const typedArr = new Float32Array([pinf]);

      expect(arr.flat<number>().includes(pinf)).assertEqual(true);
      expect(typedArr.includes(pinf)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test124
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tiny = 5e-324;
      const arr: number[] = [tiny];
      const suffix: number[] = [1];
      const typedArr = new Float64Array([tiny]);
      const typedSuffix = new Float64Array([1]);

      expect(arr.concat(suffix).indexOf(tiny)).assertEqual(0);
      const typedConcat = new Float64Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.indexOf(tiny)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test125
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tinyNeg = -5e-324;
      const arr = [tinyNeg];
      const typedArr = new Float64Array([tinyNeg]);

      expect(arr.slice().includes(tinyNeg)).assertEqual(true);
      expect(typedArr.slice().includes(tinyNeg)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test126
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[NaN], [NaN]];
      const typedArr = new Float64Array([NaN, NaN]);
      expect(arr.flat<number>().lastIndexOf(NaN)).assertEqual(-1);
      expect(typedArr.lastIndexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test127
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hex = 0xFF;
      const arr = [hex];
      const suffix = [0x100];
      const typedArr = new Uint8Array([hex]);
      const typedSuffix = new Uint8Array([0x100]);
      expect(arr.concat(suffix).includes(0x100)).assertEqual(true);
      const typedConcat = new Uint8Array(typedArr.length + typedSuffix.length);
      typedConcat.set(typedArr);
      typedConcat.set(typedSuffix, typedArr.length);
      expect(typedConcat.includes(0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test128
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bin = 0b1010;
      const arr = [bin, 0b1111];
      const typedArr = new Int32Array([bin, 0b1111]);

      expect(arr.slice(0, 1).indexOf(10)).assertEqual(0);
      expect(typedArr.slice(0, 1).indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test129
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST12900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [["1e5"]];
      const typedArr = new Float64Array([100000]);

      expect(arr.flat<string>().includes("1e5")).assertEqual(true);
      expect(typedArr.includes(100000)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test133
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const typedArr = new Int32Array([1]);
      const hugeIndex = 4294967295;
      expect(arr.slice(Math.floor(hugeIndex).toInt()).length).assertEqual(0);
      expect(typedArr.slice(Math.floor(hugeIndex).toInt()).length).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test135
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const u8 = new Uint8Array([255]);
      const i16 = new Int16Array([-1]);
      const merged = new Int32Array(u8.length + i16.length);
      merged.set(u8);
      merged.set(i16, u8.length);
      expect(merged.length).assertEqual(2);
      expect(merged[0]).assertEqual(255);
      expect(merged[1]).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test138
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [0, -0, 0];
      const typedArr = new Float64Array([0, -0, 0]);
      expect(arr.includes(0)).assertEqual(true);
      expect(arr.includes(-0)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(true);
      expect(typedArr.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test139
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST13900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, NaN];
      const typedArr = new Float32Array([NaN, NaN]);

      expect(arr.lastIndexOf(NaN)).assertEqual(-1);
      expect(typedArr.lastIndexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   ArrayConstructor2Test141
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.slice(0, -0).length).assertEqual(0);
      expect(typedArr.slice(0, -0).length).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test142
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[""]];
      const typedArr = new Uint8Array([0]);

      expect(arr.flat<string>().indexOf("")).assertEqual(0);
      expect(typedArr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test144
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, undefined, 0];
      const typedArr = new Int32Array([0, 0, 0]);

      expect(arr.indexOf(null)).assertEqual(0);
      expect(typedArr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test145
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj = new Boolean(true);
      const arr = [false, boolObj];
      const typedArr = new Uint8Array([0, 1]);

      expect(arr.lastIndexOf(boolObj)).assertEqual(1);
      expect(typedArr.lastIndexOf(1)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test146
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['__proto__'];
      const suffix = ['constructor'];
      const typedArr = new Int8Array([1]);

      expect(arr.concat(suffix).includes('__proto__')).assertEqual(true);
      expect(typedArr.includes(1)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test147
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base = new ArrayBuffer(8);
      const view = new Int32Array(base, 0, 2);
      const sliced = view.slice(0, 10);

      expect(sliced.length).assertEqual(2);
      expect(sliced.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.name   ArrayConstructor2Test148
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3]]];
      const typedArr = new Int32Array([1, 2, 3]);

      expect(arr.flat<int>(Math.floor(Number.MAX_SAFE_INTEGER).toInt()).lastIndexOf(3)).assertEqual(2);
      expect(typedArr.lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.name   ArrayConstructor2Test149
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST14900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [-0];
      const typedArr = new Float64Array([-0]);
      expect(arr.includes(-0)).assertEqual(true);
      expect(typedArr.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConstructor2Test150
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST15000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, "", 2];
      const typedArr = new Int32Array([1, 0, 2]);
      expect(arr.indexOf("")).assertEqual(1);
      expect(typedArr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor2Test154
     * @tc.number BUILTINS_ARRAY2_COMBINATION_TEST15400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor2Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [Infinity, -Infinity, NaN];
      const typedArr = new Float64Array([Infinity, -Infinity, NaN]);

      expect(arr.lastIndexOf(-Infinity)).assertEqual(1);
      expect(typedArr.lastIndexOf(-Infinity)).assertEqual(1);
    });


  })
}