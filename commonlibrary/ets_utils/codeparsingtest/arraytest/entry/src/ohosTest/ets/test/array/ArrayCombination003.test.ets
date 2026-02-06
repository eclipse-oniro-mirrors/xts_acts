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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayCombinationTest3() {
  describe('ArrayCombinationTest3', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   ArrayCombinationTest3001
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3001
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3001';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      arr.concat([4, 5]);
      expect(arr).assertDeepEquals([1, 2, 3]); // push 修改原数组
      const concatRes = arr.concat([4, 5]);
      expect(concatRes).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3002
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3002
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3002';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3003
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3003
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3003';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3]];
      arr.push([4, 5]);
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(arr).assertDeepEquals([1, [2, 3], [4, 5]]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3004
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3004
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3004';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const popped = arr.pop();
      expect(popped).assertEqual(3);
      const res = arr.concat([4, 5]);
      expect(res).assertDeepEquals([1, 2, 4, 5]);
      expect(arr).assertDeepEquals([1, 2]);

      const ta = new Int8Array([1, 2, 3]);
      const taPopped = ta.slice(0, ta.length - 1);
      const taRes = new Int8Array([...taPopped, 4, 5]);
      expect(Array.from(taRes)).assertDeepEquals([1, 2, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3005
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3005
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3005';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const res = arr.slice(0, 2);
      expect(res).assertDeepEquals([1, 2]);
      expect(arr).assertDeepEquals([1, 2]);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = ta.slice(0, 2);
      expect(Array.from(resTA)).assertDeepEquals([1, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3006
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3006
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3006';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4, 5]];
      arr.pop();
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 2, 3]);
      expect(arr).assertDeepEquals([1, [2, 3]]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3007
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3007
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3007';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const shifted = arr.shift();
      expect(shifted).assertEqual(1);
      const res = arr.concat([4, 5]);
      expect(res).assertDeepEquals([2, 3, 4, 5]);
      expect(arr).assertDeepEquals([2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      const taShifted = ta.slice(1);
      const taRes = new Int8Array([...taShifted, 4, 5]);
      expect(Array.from(taRes)).assertDeepEquals([2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3008
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3008
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3008';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const res = arr.slice(0, 2);
      expect(res).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = ta.slice(0, 2);
      expect(Array.from(resTA)).assertDeepEquals([1, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3009
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3009
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3009';
      console.info(`${caseName}, test start`);
      const arr = [[1], 2, [3, 4]];
      arr.shift();
      const res = arr.flat();
      expect(res).assertDeepEquals([2, 3, 4]);
      expect(arr).assertDeepEquals([2, [3, 4]]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3010
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3010
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3010';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      expect(arr).assertDeepEquals([1, 2, 3]);
      const res = arr.concat([4, 5]);
      expect(res).assertDeepEquals([1, 2, 3, 4, 5]);

      const ta = new Int8Array([2, 3]);
      const taRes = new Int8Array([1, ...ta, 4, 5]);
      expect(Array.from(taRes)).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3011
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3011
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3011';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3012
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3012
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3012';
      console.info(`${caseName}, test start`);
      const arr = [[2], 3];
      arr.unshift([1]);
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 2, 3]);
      expect(arr).assertDeepEquals([[1], [2], 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3013
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3013
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3013';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const removed = arr.splice(1, 2, 5, 6);
      expect(removed).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 5, 6, 4]);
      const res = arr.concat([7, 8]);
      expect(res).assertDeepEquals([1, 5, 6, 4, 7, 8]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = new Int8Array([1, 5, 6, 4, 7, 8]);
      expect(Array.from(taRes)).assertDeepEquals([1, 5, 6, 4, 7, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3014
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3014
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3014';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals([5, 6]);
      expect(arr).assertDeepEquals([1, 5, 6, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3015
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3015
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3015';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], 4];
      arr.splice(1, 1, [5, 6]);
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 5, 6, 4]);
      expect(arr).assertDeepEquals([1, [5, 6], 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3016
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3016
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3016';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 2, 3]);
      const res = arr.concat([4, 5]);
      expect(res).assertDeepEquals([1, 2, 3, 4, 5]);

      const ta = new Int8Array([3, 1, 2]);
      const taSorted = ta.sort();
      expect(Array.from(taSorted)).assertDeepEquals([1, 2, 3]);
      const taRes = new Int8Array([...taSorted, 4, 5]);
      expect(Array.from(taRes)).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3017
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3017
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3017';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort((a, b) => a - b);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 2, 3]);

      const ta = new Int8Array([3, 1, 2]);
      const taSorted = ta.sort();
      const resTA = taSorted.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3018
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3018
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3018';
      console.info(`${caseName}, test start`);
      const arr = [[3], 1, [2, 4]];
      arr.sort((a: number|number[], b: number|number[]) => {
        const aVal = Array.isArray(a) ? a[0] : a;
        const bVal = Array.isArray(b) ? b[0] : b;
        return aVal - bVal;
      });
      expect(arr).assertDeepEquals([1, [2, 4], [3]]);
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 2, 4, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3019
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3019
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3019';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.reverse();
      expect(arr).assertDeepEquals([3, 2, 1]);
      const res = arr.concat([4, 5]);
      expect(res).assertDeepEquals([3, 2, 1, 4, 5]);

      const ta = new Int8Array([1, 2, 3]);
      const taReversed = ta.reverse();
      expect(Array.from(taReversed)).assertDeepEquals([3, 2, 1]);
      const taRes = new Int8Array([...taReversed, 4, 5]);
      expect(Array.from(taRes)).assertDeepEquals([3, 2, 1, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3020
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3020
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3020';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.reverse();
      const res = arr.slice(0, 2);
      expect(res).assertDeepEquals([3, 2]);
      expect(arr).assertDeepEquals([3, 2, 1]);

      const ta = new Int8Array([1, 2, 3]);
      const taReversed = ta.reverse();
      const resTA = taReversed.slice(0, 2);
      expect(Array.from(resTA)).assertDeepEquals([3, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3021
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3021
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3021';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2], 3, [4, 5]];
      arr.reverse();
      const res = arr.flat();
      expect(res).assertDeepEquals([4, 5, 3, 1, 2]);
      expect(arr).assertDeepEquals([[4, 5], 3, [1, 2]]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3022
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3022
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3022';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals([4, 5, 3, 4, 5]);
      const res = arr.concat([6, 7]);
      expect(res).assertDeepEquals([4, 5, 3, 4, 5, 6, 7]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      const taCopied = ta.copyWithin(0, 3);
      expect(Array.from(taCopied)).assertDeepEquals([4, 5, 3, 4, 5]);
      const taRes = new Int8Array([...taCopied, 6, 7]);
      expect(Array.from(taRes)).assertDeepEquals([4, 5, 3, 4, 5, 6, 7]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3023
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3023
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3023';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      arr.copyWithin(1, 3);
      const res = arr.slice(2, 5);
      expect(res).assertDeepEquals([5, 4, 5]);
      expect(arr).assertDeepEquals([1, 4, 5, 4, 5]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      ta.copyWithin(1, 3);
      const resTA = ta.slice(2, 5);
      expect(Array.from(resTA)).assertDeepEquals([5, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3024
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3024
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3024';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4, 5]];
      arr.copyWithin(1, 2);
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 4, 5, 4, 5]);
      expect(arr).assertDeepEquals([1, [4, 5], [4, 5]]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3025
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3025
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3025';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.fill(5, 1, 3);
      expect(arr).assertDeepEquals([1, 5, 5]);
      const res = arr.concat([6, 7]);
      expect(res).assertDeepEquals([1, 5, 5, 6, 7]);

      const ta = new Int8Array([1, 2, 3]);
      ta.fill(5, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 5, 5]);
      const taRes = new Int8Array([...ta, 6, 7]);
      expect(Array.from(taRes)).assertDeepEquals([1, 5, 5, 6, 7]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3026
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3026
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3026';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.fill(4);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals([4, 4]);
      expect(arr).assertDeepEquals([4, 4, 4]);

      const ta = new Int8Array([1, 2, 3]);
      ta.fill(4);
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([4, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3027
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3027
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3027';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], 4];
      arr.fill([5,6], 1, 2);
      const res = arr.flat();
      expect(res).assertDeepEquals([1, 5, 6, 4]);
      expect(arr).assertDeepEquals([1, [5,6], 4]);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest3028
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3028
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3028';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      expect(arr.includes(3)).assertEqual(true);
      expect(arr.includes(4)).assertEqual(false);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.includes(3)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3029
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3029
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3029';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      expect(arr.indexOf(3)).assertEqual(2);
      expect(arr.indexOf(4)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.indexOf(3)).assertEqual(2);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3030
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3030
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3030';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      arr.push(2);
      expect(arr.lastIndexOf(2)).assertEqual(4);
      expect(arr.lastIndexOf(5)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 2]);
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3031
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3031
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3031';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const popped = arr.pop();
      expect(popped).assertEqual(3);
      expect(arr.includes(3)).assertEqual(false);
      expect(arr.includes(2)).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.includes(3)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3032
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3032
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3032';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      expect(arr.indexOf(3)).assertEqual(-1);
      expect(arr.indexOf(2)).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.indexOf(3)).assertEqual(2);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3033
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3033
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3033';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      arr.pop();
      expect(arr.lastIndexOf(2)).assertEqual(1);
      expect(arr.lastIndexOf(3)).assertEqual(2);

      const ta = new Int8Array([1, 2, 3, 2]);
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3034
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3034
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3034';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const shifted = arr.shift();
      expect(shifted).assertEqual(1);
      expect(arr.includes(1)).assertEqual(false);
      expect(arr.includes(2)).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.includes(1)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3035
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3035
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3035';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      expect(arr.indexOf(1)).assertEqual(-1);
      expect(arr.indexOf(2)).assertEqual(0);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.indexOf(1)).assertEqual(0);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3036
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3036
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3036';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      arr.shift();
      expect(arr.lastIndexOf(2)).assertEqual(2);
      expect(arr.lastIndexOf(1)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 2]);
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3037
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3037
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3037';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      expect(arr.includes(1)).assertEqual(true);
      expect(arr.includes(4)).assertEqual(false);

      const ta = new Int8Array([2, 3]);
      expect(ta.includes(2)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3038
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3038
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3038';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf(4)).assertEqual(-1);

      const ta = new Int8Array([2, 3]);
      expect(ta.indexOf(2)).assertEqual(0);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3039
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3039
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3039';
      console.info(`${caseName}, test start`);
      const arr = [2, 3, 2];
      arr.unshift(1);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(1)).assertEqual(0);

      const ta = new Int8Array([2, 3, 2]);
      expect(ta.lastIndexOf(2)).assertEqual(2);
      expect(ta.lastIndexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3040
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3040
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3040';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      expect(arr.includes(2)).assertEqual(false);
      expect(arr.includes(5)).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(ta.includes(2)).assertEqual(true);
      expect(ta.includes(5)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3041
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3041
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3041';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      expect(arr.indexOf(2)).assertEqual(-1);
      expect(arr.indexOf(5)).assertEqual(1);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(ta.indexOf(2)).assertEqual(1);
      expect(ta.indexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3042
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3042
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3042';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      arr.splice(1, 2, 5, 6);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(3)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 2]);
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3043
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3043
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3043';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort((a, b) => a - b);
      expect(arr.includes(2)).assertEqual(true);
      expect(arr.includes(4)).assertEqual(false);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort();
      expect(ta.includes(2)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3044
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3044
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3044';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      expect(arr.sort((a, b) => a - b).indexOf(2)).assertEqual(1);
      expect(arr.sort((a, b) => a - b).indexOf(4)).assertEqual(-1);

      const ta = new Int8Array([3, 1, 2]);
      expect(ta.sort().indexOf(2)).assertEqual(1);
      expect(ta.sort().indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3045
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3045
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3045';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2, 2];
      expect(arr.sort((a, b) => a - b).lastIndexOf(2)).assertEqual(2);
      expect(arr.sort((a, b) => a - b).lastIndexOf(4)).assertEqual(-1);

      const ta = new Int8Array([3, 1, 2, 2]);
      expect(ta.sort().lastIndexOf(2)).assertEqual(2);
      expect(ta.sort().lastIndexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3046
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3046
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3046';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      expect(arr.reverse().includes(2)).assertEqual(true);
      expect(arr.reverse().includes(4)).assertEqual(false);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.reverse().includes(2)).assertEqual(true);
      expect(ta.reverse().includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3047
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3047
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3047';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      expect(arr.reverse().indexOf(2)).assertEqual(1);
      expect(arr.reverse().indexOf(4)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.reverse().indexOf(2)).assertEqual(1);
      expect(ta.reverse().indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3048
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3048
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3048';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      expect(arr.reverse().lastIndexOf(2)).assertEqual(2);
      expect(arr.reverse().lastIndexOf(4)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 2]);
      expect(ta.reverse().lastIndexOf(2)).assertEqual(2);
      expect(ta.reverse().lastIndexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3049
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3049
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3049';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      expect(arr.copyWithin(0, 3).includes(2)).assertEqual(false);
      expect(arr.copyWithin(0, 3).includes(4)).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      expect(ta.copyWithin(0, 3).includes(2)).assertEqual(false);
      expect(ta.copyWithin(0, 3).includes(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3050
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3050
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3050';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      expect(arr.copyWithin(0, 3).indexOf(3)).assertEqual(2);
      expect(arr.copyWithin(0, 3).indexOf(2)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      expect(ta.copyWithin(0, 3).indexOf(3)).assertEqual(2);
      expect(ta.copyWithin(0, 3).indexOf(2)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3051
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3051
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3051';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      expect(arr.copyWithin(1, 3).lastIndexOf(4)).assertEqual(3);
      expect(arr.copyWithin(1, 3).lastIndexOf(2)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      expect(ta.copyWithin(1, 3).lastIndexOf(4)).assertEqual(3);
      expect(ta.copyWithin(1, 3).lastIndexOf(2)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3052
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3052
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3052';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      expect(arr.fill(5, 1, 3).includes(5)).assertEqual(true);
      expect(arr.fill(5, 1, 3).includes(2)).assertEqual(false);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.fill(5, 1, 3).includes(5)).assertEqual(true);
      expect(ta.fill(5, 1, 3).includes(2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3053
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3053
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3053';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      expect(arr.fill(4).indexOf(4)).assertEqual(0);
      expect(arr.fill(4).indexOf(1)).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3]);
      expect(ta.fill(4).indexOf(4)).assertEqual(0);
      expect(ta.fill(4).indexOf(1)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3054
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3054
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3054';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      expect(arr.fill(9, 1, 3).lastIndexOf(9)).assertEqual(2);
      expect(arr.fill(9, 1, 3).lastIndexOf(2)).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 2]);
      expect(ta.fill(9, 1, 3).lastIndexOf(9)).assertEqual(2);
      expect(ta.fill(9, 1, 3).lastIndexOf(2)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest3055
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3055
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3055';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      arr.push(4);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3056
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3056
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3056';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      const p = arr.pop();
      expect(p).assertEqual(3);
      expect(arr).assertDeepEquals([1, 2]);

      const ta = new Int8Array([1, 2, 3]);
      const pTA = ta[ta.length-1];
      expect(pTA).assertEqual(3);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3057
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3057
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3057';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      const s = arr.shift();
      expect(s).assertEqual(1);
      expect(arr).assertDeepEquals([2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3058
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3058
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3058';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.push(4);
      arr.unshift(1);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int8Array([2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3059
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3059
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3059';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3);
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals([1, 5, 3]);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3060
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3060
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3060';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.push(4);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int8Array([3, 1, 2, 4]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3061
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3061
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3061';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      arr.reverse();
      expect(arr).assertDeepEquals([4, 3, 2, 1]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3062
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3062
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3062';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.push(5);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals([4, 5, 3, 4, 5]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      ta.copyWithin(0, 3);
      expect(Array.from(ta)).assertDeepEquals([4, 5, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3063
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3063
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3063';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals([1, 9, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3064
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3064
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3064';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const p = arr.pop();
      arr.push(4);
      expect(arr).assertDeepEquals([1, 2, 4]);
      expect(p).assertEqual(3);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3065
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3065
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3065';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const p1 = arr.pop();
      const p2 = arr.pop();
      expect(arr).assertDeepEquals([1]);
      expect(p1).assertEqual(3);
      expect(p2).assertEqual(2);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3066
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3066
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3066';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const s = arr.shift();
      expect(arr).assertDeepEquals([2]);
      expect(s).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3067
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3067
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3067';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.pop();
      arr.unshift(1);
      expect(arr).assertDeepEquals([1, 2]);

      const ta = new Int8Array([2, 3]);
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3068
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3068
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3068';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals([1, 5, 3]);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3069
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3069
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3069';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.pop();
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 3]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3070
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3070
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3070';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      arr.reverse();
      expect(arr).assertDeepEquals([2, 1]);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3071
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3071
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3071';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals([3, 2, 3]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3072
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3072
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3072';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals([1, 9, 9]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3073
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3073
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3073';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const s = arr.shift();
      arr.push(4);
      expect(arr).assertDeepEquals([2, 3, 4]);
      expect(s).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3074
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3074
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3074';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const p = arr.pop();
      expect(arr).assertDeepEquals([2]);
      expect(p).assertEqual(3);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3075
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3075
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3075';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const s1 = arr.shift();
      const s2 = arr.shift();
      expect(arr).assertDeepEquals([3]);
      expect(s1).assertEqual(1);
      expect(s2).assertEqual(2);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3076
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3076
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3076';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.shift();
      arr.unshift(1);
      expect(arr).assertDeepEquals([1, 3]);

      const ta = new Int8Array([2, 3]);
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3077
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3077
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3077';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals([2, 5, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3078
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3078
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3078';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.shift();
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 2]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3079
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3079
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3079';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      arr.reverse();
      expect(arr).assertDeepEquals([3, 2]);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3080
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3080
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3080';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals([4, 3, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3081
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3081
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3081';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals([2, 9, 9]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3082
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3082
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3082';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      arr.push(4);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int8Array([2, 3]);
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3083
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3083
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3083';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      const p = arr.pop();
      expect(arr).assertDeepEquals([1, 2]);
      expect(p).assertEqual(3);

      const ta = new Int8Array([2, 3]);
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3084
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3084
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3084';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      const s = arr.shift();
      expect(arr).assertDeepEquals([2, 3]);
      expect(s).assertEqual(1);

      const ta = new Int8Array([2, 3]);
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3085
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3085
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3085';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      arr.unshift(0);
      expect(arr).assertDeepEquals([0, 1, 2, 3]);

      const ta = new Int8Array([2, 3]);
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3086
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3086
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3086';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.unshift(0);
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals([0, 5, 2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3087
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3087
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3087';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.unshift(0);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([0, 1, 2, 3]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3088
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3088
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3088';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.unshift(0);
      arr.reverse();
      expect(arr).assertDeepEquals([3, 2, 1, 0]);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3089
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3089
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3089';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.unshift(0);
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals([2, 3, 4, 3, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3090
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3090
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3090';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.unshift(0);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals([0, 9, 9, 3]);

      const ta = new Int8Array([1, 2, 3]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3091
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3091
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3091';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      arr.push(7);
      expect(arr).assertDeepEquals([1, 5, 6, 4, 7]);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3092
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3092
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3092';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      const p = arr.pop();
      expect(arr).assertDeepEquals([1, 5, 6]);
      expect(p).assertEqual(4);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3093
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3093
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3093';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      const s = arr.shift();
      expect(arr).assertDeepEquals([5, 6, 4]);
      expect(s).assertEqual(1);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3094
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3094
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3094';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      arr.unshift(0);
      expect(arr).assertDeepEquals([0, 1, 5, 6, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3095
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3095
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3095';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      arr.splice(2, 1, 9);
      expect(arr).assertDeepEquals([1, 5, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3096
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3096
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3096';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 4, 2];
      arr.splice(1, 2, 5, 6);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([2, 3, 5, 6]);

      const ta = new Int8Array([3, 1, 4, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3097
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3097
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3097';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      arr.reverse();
      expect(arr).assertDeepEquals([4, 6, 5, 1]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3098
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3098
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3098';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      arr.splice(1, 2, 6, 7);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals([4, 5, 7, 4, 5]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      ta.copyWithin(0, 3);
      expect(Array.from(ta)).assertDeepEquals([4, 5, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3099
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3099
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3099';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 5, 6);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals([1, 9, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3100
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3100';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort().push(4);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3101
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3101
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3101';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2, 4];
      const popped = arr.sort().pop();
      expect(arr).assertDeepEquals([1, 2, 3]);
      expect(popped).assertEqual(4);

      const ta = new Int8Array([3, 1, 2, 4]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3102
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3102
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3102';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2, 4];
      const shifted = arr.sort().shift();
      expect(arr).assertDeepEquals([2, 3, 4]);
      expect(shifted).assertEqual(1);

      const ta = new Int8Array([3, 1, 2, 4]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3103
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3103
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3103';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort().unshift(0);
      expect(arr).assertDeepEquals([0, 1, 2, 3]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3104
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3104
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3104';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 4, 2];
      arr.sort().splice(1, 2, 9);
      expect(arr).assertDeepEquals([1, 9, 4]);

      const ta = new Int8Array([3, 1, 4, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3105
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3105
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3105';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 4, 2];
      arr.sort().sort((a, b) => b - a);
      expect(arr).assertDeepEquals([4, 3, 2, 1]);

      const ta = new Int8Array([3, 1, 4, 2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3106
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3106
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3106';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort().reverse();
      expect(arr).assertDeepEquals([3, 2, 1]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort().reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3107
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3107
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3107';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2, 4];
      arr.sort().copyWithin(0, 2);
      expect(arr).assertDeepEquals([3, 4, 3, 4]);

      const ta = new Int8Array([3, 1, 2, 4]);
      ta.sort();
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3108
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3108
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3108';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2, 4];
      arr.sort().fill(9, 1, 3);
      expect(arr).assertDeepEquals([1, 9, 9, 4]);

      const ta = new Int8Array([3, 1, 2, 4]);
      ta.sort();
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3109
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3109
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3109';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.reverse().push(4);
      expect(arr).assertDeepEquals([3, 2, 1, 4]);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3110
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3110
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3110';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const p = arr.reverse().pop();
      expect(arr).assertDeepEquals([3, 2]);
      expect(p).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3111
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3111
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3111';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const s = arr.reverse().shift();
      expect(arr).assertDeepEquals([2, 1]);
      expect(s).assertEqual(3);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3112
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3112
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3112';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.reverse().unshift(0);
      expect(arr).assertDeepEquals([0, 3, 2, 1]);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3113
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3113
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3113';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.reverse().splice(1, 2, 9);
      expect(arr).assertDeepEquals([4, 9, 1]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3114
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3114
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3114';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.reverse().sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 2, 3]);

      const ta = new Int8Array([3, 1, 2]);
      ta.reverse();
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3115
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3115
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3115';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.reverse().reverse();
      expect(arr).assertDeepEquals([1, 2, 3]);

      const ta = new Int8Array([1, 2, 3]);
      ta.reverse().reverse();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3116
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3116
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3116';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.reverse().copyWithin(0, 2);
      expect(arr).assertDeepEquals([2, 1, 2, 1]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.reverse();
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([2, 1, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3117
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3117
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3117';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.reverse().fill(9, 1, 3);
      expect(arr).assertDeepEquals([4, 9, 9, 1]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.reverse();
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([4, 9, 9, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3118
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3118
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3118';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.copyWithin(0, 2).push(5);
      expect(arr).assertDeepEquals([3, 4, 3, 4, 5]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3119
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3119
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3119';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const p = arr.copyWithin(0, 2).pop();
      expect(arr).assertDeepEquals([3, 4, 3]);
      expect(p).assertEqual(4);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3120
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3120
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3120';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const s = arr.copyWithin(0, 2).shift();
      expect(arr).assertDeepEquals([4, 3, 4]);
      expect(s).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3121
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3121
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3121';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.copyWithin(0, 2).unshift(0);
      expect(arr).assertDeepEquals([0, 3, 4, 3, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3122
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3122
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3122';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.copyWithin(0, 2).splice(1, 2, 9);
      expect(arr).assertDeepEquals([3, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3123
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3123
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3123';
      console.info(`${caseName}, test start`);
      const arr = [4, 3, 1, 2];
      arr.copyWithin(0, 2).sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 1, 2, 2]);

      const ta = new Int8Array([4, 3, 1, 2]);
      ta.copyWithin(0, 2);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 1, 2, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3124
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3124
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3124';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.copyWithin(0, 2).reverse();
      expect(arr).assertDeepEquals([4, 3, 4, 3]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 3, 4, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3125
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3125
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3125';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(arr).assertDeepEquals([3, 4, 5, 4, 5]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      ta.copyWithin(0, 2).copyWithin(1, 3);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 5, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3126
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3126
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3126';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.copyWithin(0, 2).fill(9, 1, 3);
      expect(arr).assertDeepEquals([3, 9, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.copyWithin(0, 2).fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([3, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3127
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3127
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3127';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(9, 1, 3).push(5);
      expect(arr).assertDeepEquals([1, 9, 9, 4, 5]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3128
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3128
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3128';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const p = arr.fill(9, 1, 3).pop();
      expect(arr).assertDeepEquals([1, 9, 9]);
      expect(p).assertEqual(4);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3129
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3129
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3129';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const s = arr.fill(9, 1, 3).shift();
      expect(arr).assertDeepEquals([9, 9, 4]);
      expect(s).assertEqual(1);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3130
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3130
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3130';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(9, 1, 3).unshift(0);
      expect(arr).assertDeepEquals([0, 1, 9, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3131
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3131
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3131';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(9, 1, 3).splice(2, 1, 5);
      expect(arr).assertDeepEquals([1, 9, 5, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3132
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3132
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3132';
      console.info(`${caseName}, test start`);
      const arr = [4, 2, 3, 1];
      arr.fill(9, 1, 3).sort((a, b) => a - b);
      expect(arr).assertDeepEquals([1, 4, 9, 9]);

      const ta = new Int8Array([4, 2, 3, 1]);
      ta.fill(9, 1, 3);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 4, 9, 9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3133
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3133
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3133';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(9, 1, 3).reverse();
      expect(arr).assertDeepEquals([4, 9, 9, 1]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 9, 9, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3134
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3134
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3134';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(9, 1, 3).copyWithin(0, 2);
      expect(arr).assertDeepEquals([9, 4, 9, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3).copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([9, 4, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest3135
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST3135
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest3135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest3135';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(9, 1, 3).fill(0, 2, 4);
      expect(arr).assertDeepEquals([1, 9, 0, 0]);

      const ta = new Int8Array([1, 2, 3, 4]);
      ta.fill(9, 1, 3).fill(0, 2, 4);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 0, 0]);
      console.info(`${caseName}, test end`);
    });


  });
}