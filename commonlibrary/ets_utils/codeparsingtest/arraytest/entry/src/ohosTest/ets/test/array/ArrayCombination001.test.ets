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

export default function ArrayCombinationTest1() {
  describe('ArrayCombinationTest1', () => {
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
     * @tc.name   ArrayCombinationTest0001
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0001
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0001';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const mapped = arr.map(x => x * 2);
      let sum = 0;
      mapped.forEach(x => sum += x);
      expect(sum).assertEqual(12);

      const ta = new Int8Array([1, 2, 3]);
      const taMapped = Array.from(ta).map(x => x * 2);
      let taSum = 0;
      taMapped.forEach(x => taSum += x);
      expect(taSum).assertEqual(12);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0002
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0002
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0002';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => x + 1).map(x => x * 2);
      expect(res).assertDeepEquals([4, 6, 8]);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => x + 1).map(x => x * 2);
      expect(taRes).assertDeepEquals([4, 6, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0003
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0003
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0003';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.map(x => x * 3).filter(x => x > 6);
      expect(res).assertDeepEquals([9, 12]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).map(x => x * 3).filter(x => x > 6);
      expect(taRes).assertDeepEquals([9, 12]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0004
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0004
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0004';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => x + 1).reduce((a, b) => a + b, 0);
      expect(res).assertEqual(9);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => x + 1).reduce((a, b) => a + b, 0);
      expect(taRes).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0005
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0005
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0005';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => x * 2).reduceRight((a, b) => a - b);
      expect(res).assertEqual(0);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => x * 2).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0006
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0006
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0006';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => x * 3).some(x => x > 8);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => x * 3).some(x => x > 8);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0007
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0007
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0007';
      console.info(`${caseName}, test start`);
      const arr = [2, 4, 6];
      const res = arr.map(x => x / 2).every(x => x >= 1);
      expect(res).assertEqual(true);

      const ta = new Int8Array([2, 4, 6]);
      const taRes = Array.from(ta).map(x => x / 2).every(x => x >= 1);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0008
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0008
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0008';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => x + 5).find(x => x === 7);
      expect(res).assertEqual(7);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => x + 5).find(x => x === 7);
      expect(taRes).assertEqual(7);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0009
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0009
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0009';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => x * 2).findIndex(x => x === 4);
      expect(res).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => x * 2).findIndex(x => x === 4);
      expect(taRes).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0012
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0012
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0012';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.map(x => [x, x + 1]).flatMap(x => x);
      expect(res).assertDeepEquals([1, 2, 2, 3, 3, 4]);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).map(x => [x, x + 1]).flatMap(x => x);
      expect(taRes).assertDeepEquals([1, 2, 2, 3, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0013
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0013
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0013';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const filtered = arr.filter(x => x % 2 === 0);
      let sum = 0;
      filtered.forEach(x => sum += x);
      expect(sum).assertEqual(6);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taFiltered = Array.from(ta).filter(x => x % 2 === 0);
      let taSum = 0;
      taFiltered.forEach(x => taSum += x);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0014
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0014
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0014';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 2).map(x => x * 2);
      expect(res).assertDeepEquals([6, 8]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 2).map(x => x * 2);
      expect(taRes).assertDeepEquals([6, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0015
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0015
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0015';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 1).filter(x => x < 4);
      expect(res).assertDeepEquals([2, 3]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 1).filter(x => x < 4);
      expect(taRes).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0016
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0016
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0016';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x % 2 === 0).reduce((a, b) => a + b);
      expect(res).assertEqual(6);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x % 2 === 0).reduce((a, b) => a + b);
      expect(taRes).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0017
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0017
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0017';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 1).reduceRight((a, b) => a - b);
      expect(res).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 1).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0018
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0018
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0018';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 2).some(x => x === 4);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 2).some(x => x === 4);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0019
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0019
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0019';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 1).every(x => x > 1);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 1).every(x => x > 1);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0020
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0020
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0020';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 2).find(x => x === 4);
      expect(res).assertEqual(4);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 2).find(x => x === 4);
      expect(taRes).assertEqual(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0021
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0021
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0021';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.filter(x => x > 1).findIndex(x => x === 3);
      expect(res).assertEqual(1);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).filter(x => x > 1).findIndex(x => x === 3);
      expect(taRes).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0024
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0024
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0024';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.filter(x => x > 1).flatMap(x => [x, x * 10]);
      expect(res).assertDeepEquals([2, 20, 3, 30]);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).filter(x => x > 1).flatMap(x => [x, x * 10]);
      expect(taRes).assertDeepEquals([2, 20, 3, 30]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0025
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0025
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0025';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.flatMap(x => [x, x + 1]);
      let sum = 0;
      res.forEach(x => sum += x);
      expect(sum).assertEqual(8);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]);
      let taSum = 0;
      taRes.forEach(x => taSum += x);
      expect(taSum).assertEqual(8);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0026
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0026
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0026';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.flatMap(x => [x, x + 1]).map(x => x * 2);
      expect(res).assertDeepEquals([2, 4, 4, 6]);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]).map(x => x * 2);
      expect(taRes).assertDeepEquals([2, 4, 4, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0027
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0027
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0027';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.flatMap(x => [x, x * 2]).filter(x => x > 2);
      expect(res).assertDeepEquals([4, 3, 6]);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).flatMap(x => [x, x * 2]).filter(x => x > 2);
      expect(taRes).assertDeepEquals([4, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0028
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0028
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0028';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.flatMap(x => [x, x + 1]).reduce((a, b) => a + b);
      expect(res).assertEqual(8);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]).reduce((a, b) => a + b);
      expect(taRes).assertEqual(8);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0029
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0029
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0029';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.flatMap(x => [x, x + 1]).reduceRight((a, b) => a - b);
      expect(res).assertEqual(-2);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0030
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0030
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0030';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.flatMap(x => [x, x * 2]).some(x => x === 6);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).flatMap(x => [x, x * 2]).some(x => x === 6);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0031
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0031
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0031';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.flatMap(x => [x, x + 1]).every(x => x > 0);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]).every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0032
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0032
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0032';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.flatMap(x => [x, x + 1]).find(x => x === 4);
      expect(res).assertEqual(4);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]).find(x => x === 4);
      expect(taRes).assertEqual(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0033
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0033
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0033';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.flatMap(x => [x, x + 1]).findIndex(x => x === 3);
      expect(res).assertEqual(3);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).flatMap(x => [x, x + 1]).findIndex(x => x === 3);
      expect(taRes).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0036
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0036
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0036';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.flatMap(x => [x, x * 2]).flatMap(x => [x, x + 10]);
      expect(res).assertDeepEquals([1, 11, 2, 12, 2, 12, 4, 14]);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).flatMap(x => [x, x * 2]).flatMap(x => [x, x + 10]);
      expect(taRes).assertDeepEquals([1, 11, 2, 12, 2, 12, 4, 14]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0037
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0037
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0037';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const result = arr.map(x => x * 2).includes(4);
      expect(result).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const taResult = Array.from(ta).map(x => x * 2).includes(4);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0038
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0038
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0038';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const index = arr.map(x => x + 1).indexOf(3);
      expect(index).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      const taIndex = Array.from(ta).map(x => x + 1).indexOf(3);
      expect(taIndex).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0039
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0039
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0039';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 2];
      const index = arr.map(x => x * 2).lastIndexOf(4);
      expect(index).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 2]);
      const taIndex = Array.from(ta).map(x => x * 2).lastIndexOf(4);
      expect(taIndex).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0040
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0040
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0040';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const result = arr.filter(x => x % 2 === 0).includes(4);
      expect(result).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taResult = Array.from(ta).filter(x => x % 2 === 0).includes(4);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0041
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0041
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0041';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const index = arr.filter(x => x > 2).indexOf(4);
      expect(index).assertEqual(1);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taIndex = Array.from(ta).filter(x => x > 2).indexOf(4);
      expect(taIndex).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0042
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0042
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0042';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 3];
      const index = arr.filter(x => x >= 3).lastIndexOf(3);
      expect(index).assertEqual(2);

      const ta = new Int8Array([1, 2, 3, 4, 3]);
      const taIndex = Array.from(ta).filter(x => x >= 3).lastIndexOf(3);
      expect(taIndex).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0043
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0043
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0043';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const result = arr.flatMap(x => [x, x + 2]).includes(4);
      expect(result).assertEqual(true);

      const ta = new Int8Array([1, 2]);
      const taResult = Array.from(ta).flatMap(x => [x, x + 2]).includes(4);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0044
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0044
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0044';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const index = arr.flatMap(x => [x, x + 1]).indexOf(3);
      expect(index).assertEqual(3);

      const ta = new Int8Array([1, 2]);
      const taIndex = Array.from(ta).flatMap(x => [x, x + 1]).indexOf(3);
      expect(taIndex).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0045
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0045
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0045';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const index = arr.flatMap(x => [x, x * 2]).lastIndexOf(2);
      expect(index).assertEqual(2);

      const ta = new Int8Array([1, 2, 3]);
      const taIndex = Array.from(ta).flatMap(x => [x, x * 2]).lastIndexOf(2);
      expect(taIndex).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0046
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0046
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0046';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.concat([3, 4]);
      let sum = 0;
      res.forEach(x => sum += x);
      expect(sum).assertEqual(10);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).concat([3, 4]);
      let taSum = 0;
      taRes.forEach(x => taSum += x);
      expect(taSum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0047
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0047
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0047';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.concat([3, 4]).map(x => x * 2);
      expect(res).assertDeepEquals([2, 4, 6, 8]);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).concat([3, 4]).map(x => x * 2);
      expect(taRes).assertDeepEquals([2, 4, 6, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0048
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0048
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0048';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.concat([5, 6]).filter(x => x % 2 === 0);
      expect(res).assertDeepEquals([2, 4, 6]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).concat([5, 6]).filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals([2, 4, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0049
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0049
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0049';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.concat([3, 4]).reduce((a, b) => a + b, 0);
      expect(res).assertEqual(10);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).concat([3, 4]).reduce((a, b) => a + b, 0);
      expect(taRes).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0050
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0050
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0050';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.concat([4]).reduceRight((a, b) => a - b);
      expect(res).assertEqual(-2);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).concat([4]).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0051
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0051
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0051';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.concat([3, 4]).some(x => x > 3);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).concat([3, 4]).some(x => x > 3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0052
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0052
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0052';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.concat([3, 4]).every(x => x > 0);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).concat([3, 4]).every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0053
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0053
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0053';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.concat([4, 5]).find(x => x === 4);
      expect(res).assertEqual(4);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).concat([4, 5]).find(x => x === 4);
      expect(taRes).assertEqual(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0054
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0054
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0054';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.concat([4, 5]).findIndex(x => x === 5);
      expect(res).assertEqual(4);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).concat([4, 5]).findIndex(x => x === 5);
      expect(taRes).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0057
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0057
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0057';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const res = arr.concat([3, 4]).flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 2, 4, 3, 6, 4, 8]);

      const ta = new Int8Array([1, 2]);
      const taRes = Array.from(ta).concat([3, 4]).flatMap(x => [x, x * 2]);
      expect(taRes).assertDeepEquals([1, 2, 2, 4, 3, 6, 4, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0058
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0058
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0058';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 3);
      let sum = 0;
      res.forEach(x => sum += x);
      expect(sum).assertEqual(5);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 3);
      let taSum = 0;
      taRes.forEach(x => taSum += x);
      expect(taSum).assertEqual(5);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0059
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0059
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0059';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 3).map(x => x * 2);
      expect(res).assertDeepEquals([4, 6]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 3).map(x => x * 2);
      expect(taRes).assertDeepEquals([4, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0060
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0060
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0060';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      const res = arr.slice(2, 5).filter(x => x % 2 === 0);
      expect(res).assertDeepEquals([4]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      const taRes = Array.from(ta).slice(2, 5).filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals([4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0061
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0061
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0061';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 4).reduce((a, b) => a + b, 0);
      expect(res).assertEqual(9);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 4).reduce((a, b) => a + b, 0);
      expect(taRes).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0062
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0062
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0062';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 4).reduceRight((a, b) => a - b);
      expect(res).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 4).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0063
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0063
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0063';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 3).some(x => x === 3);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 3).some(x => x === 3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0064
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0064
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0064';
      console.info(`${caseName}, test start`);
      const arr = [2, 4, 6];
      const res = arr.slice(0, 2).every(x => x % 2 === 0);
      expect(res).assertEqual(true);

      const ta = new Int8Array([2, 4, 6]);
      const taRes = Array.from(ta).slice(0, 2).every(x => x % 2 === 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0065
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0065
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0065';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 4).find(x => x === 3);
      expect(res).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 4).find(x => x === 3);
      expect(taRes).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0066
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0066
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0066';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.slice(1, 4).findIndex(x => x === 4);
      expect(res).assertEqual(2);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).slice(1, 4).findIndex(x => x === 4);
      expect(taRes).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0069
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0069
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0069';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.slice(0, 3).flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 2, 4, 3, 6]);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).slice(0, 3).flatMap(x => [x, x * 2]);
      expect(taRes).assertDeepEquals([1, 2, 2, 4, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0070
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0070
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0070';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat();
      let sum = 0;
      res.forEach(x => sum += x);
      expect(sum).assertEqual(10);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat();
      let taSum = 0;
      taRes.forEach(x => taSum += x);
      expect(taSum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0071
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0071
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0071';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().map(x => x * 2);
      expect(res).assertDeepEquals([2, 4, 6, 8]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().map(x => x * 2);
      expect(taRes).assertDeepEquals([2, 4, 6, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0072
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0072
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0072';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4, 5]];
      const res = arr.flat().filter(x => x % 2 === 0);
      expect(res).assertDeepEquals([2, 4]);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      const taRes = Array.from(ta).flat().filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals([2, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0073
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0073
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0073';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().reduce((a, b) => a + b, 0);
      expect(res).assertEqual(10);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().reduce((a, b) => a + b, 0);
      expect(taRes).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0074
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0074
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0074';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().reduceRight((a, b) => a - b);
      expect(res).assertEqual(-2);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0075
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0075
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0075';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().some(x => x > 3);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().some(x => x > 3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0076
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0076
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0076';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().every(x => x > 0);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0077
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0077
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0077';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().find(x => x === 3);
      expect(res).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().find(x => x === 3);
      expect(taRes).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0078
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0078
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0078';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]];
      const res = arr.flat().findIndex(x => x === 4);
      expect(res).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = Array.from(ta).flat().findIndex(x => x === 4);
      expect(taRes).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0081
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0081
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0081';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3]];
      const res = arr.flat().flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 2, 4, 3, 6]);

      const ta = new Int8Array([1, 2, 3]);
      const taRes = Array.from(ta).flat().flatMap(x => [x, x * 2]);
      expect(taRes).assertDeepEquals([1, 2, 2, 4, 3, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0082
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0082
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0082';
      console.info(`${caseName}, test start`);
      const result = [1, 2].concat([3, 4]).includes(3);
      expect(result).assertEqual(true);
      const result2 = [1, 2].concat([3, 4]).includes(5);
      expect(result2).assertEqual(false);

      const ta = new Int8Array([1, 2]);
      const taResult = Array.from(ta).concat([3, 4]).includes(3);
      expect(taResult).assertEqual(true);
      const taResult2 = Array.from(ta).concat([3, 4]).includes(5);
      expect(taResult2).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0083
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0083
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0083';
      console.info(`${caseName}, test start`);
      const index = [1, 2].concat([2, 3, 4]).indexOf(3);
      expect(index).assertEqual(3);
      const index2 = [1, 2].concat([2, 3, 4]).indexOf(5);
      expect(index2).assertEqual(-1);

      const ta = new Int8Array([1, 2]);
      const taIndex = Array.from(ta).concat([2, 3, 4]).indexOf(3);
      expect(taIndex).assertEqual(3);
      const taIndex2 = Array.from(ta).concat([2, 3, 4]).indexOf(5);
      expect(taIndex2).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0084
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0084
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0084';
      console.info(`${caseName}, test start`);
      const lastIdx = [1, 2].concat([2, 3, 4]).lastIndexOf(2);
      expect(lastIdx).assertEqual(2);

      const ta = new Int8Array([1, 2]);
      const taLastIdx = Array.from(ta).concat([2, 3, 4]).lastIndexOf(2);
      expect(taLastIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0085
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0085
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0085';
      console.info(`${caseName}, test start`);
      const result = [10, 20, 30, 40].slice(1, 3).includes(30);
      expect(result).assertEqual(true);
      const result2 = [10, 20, 30, 40].slice(1, 3).includes(10);
      expect(result2).assertEqual(false);

      const ta = new Int8Array([10, 20, 30, 40]);
      const taResult = Array.from(ta).slice(1, 3).includes(30);
      expect(taResult).assertEqual(true);
      const taResult2 = Array.from(ta).slice(1, 3).includes(10);
      expect(taResult2).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0086
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0086
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0086';
      console.info(`${caseName}, test start`);
      const index = [5, 6, 7, 8, 9].slice(2).indexOf(8);
      expect(index).assertEqual(1);
      const index2 = [5, 6, 7, 8, 9].slice(2).indexOf(5);
      expect(index2).assertEqual(-1);

      const ta = new Int8Array([5, 6, 7, 8, 9]);
      const taIndex = Array.from(ta).slice(2).indexOf(8);
      expect(taIndex).assertEqual(1);
      const taIndex2 = Array.from(ta).slice(2).indexOf(5);
      expect(taIndex2).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0087
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0087
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0087';
      console.info(`${caseName}, test start`);
      const index = [5, 6, 7, 8, 7].slice(1).lastIndexOf(7);
      expect(index).assertEqual(3);

      const ta = new Int8Array([5, 6, 7, 8, 7]);
      const taIndex = Array.from(ta).slice(1).lastIndexOf(7);
      expect(taIndex).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0088
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0088
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0088';
      console.info(`${caseName}, test start`);
      const result = [1, [2, 3], [4, 5]].flat().includes(4);
      expect(result).assertEqual(true);
      const result2 = [1, [2, 3], [4, 5]].flat().includes(6);
      expect(result2).assertEqual(false);

      const ta = new Int8Array([1, 2, 3, 4, 5]);
      const taResult = Array.from(ta).flat().includes(4);
      expect(taResult).assertEqual(true);
      const taResult2 = Array.from(ta).flat().includes(6);
      expect(taResult2).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0089
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0089
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0089';
      console.info(`${caseName}, test start`);
      const index = [1, [2, 3], [4]].flat().indexOf(3);
      expect(index).assertEqual(2);
      const index2 = [1, [2, 3], [4]].flat().indexOf(6);
      expect(index2).assertEqual(-1);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taIndex = Array.from(ta).flat().indexOf(3);
      expect(taIndex).assertEqual(2);
      const taIndex2 = Array.from(ta).flat().indexOf(6);
      expect(taIndex2).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0090
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0090
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0090';
      console.info(`${caseName}, test start`);
      const index = [1, [2, 3], [2, 4]].flat().lastIndexOf(2);
      expect(index).assertEqual(3);

      const ta = new Int8Array([1, 2, 3, 2, 4]);
      const taIndex = Array.from(ta).flat().lastIndexOf(2);
      expect(taIndex).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest0091
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0091
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0091';
      console.info(`${caseName}, test start`);
      const arr = [1, 2].concat([3, 4]);
      const len = arr.push(5);
      expect(len).assertEqual(5);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0092
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0092
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0092';
      console.info(`${caseName}, test start`);
      const arr = [1, 2].concat([3, 4]);
      const popped = arr.pop();
      expect(popped).assertEqual(4);
      expect(arr).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0093
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0093
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0093';
      console.info(`${caseName}, test start`);
      const arr = [10, 20].concat([30, 40]);
      const shifted = arr.shift();
      expect(shifted).assertEqual(10);
      expect(arr).assertDeepEquals([20, 30, 40]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0094
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0094
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0094';
      console.info(`${caseName}, test start`);
      const arr = [3, 4].concat([5, 6]);
      const len = arr.unshift(1, 2);
      expect(len).assertEqual(6);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0095
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0095
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0095';
      console.info(`${caseName}, test start`);
      const arr = [1, 2].concat([3, 4, 5]);
      const removed = arr.splice(1, 2, 9, 9);
      expect(removed).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 9, 9, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0096
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0096
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0096';
      console.info(`${caseName}, test start`);
      const arr = [3, 1].concat([5, 4, 2]).sort();
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      const ta = new Int8Array([3, 1, 5, 4, 2]).sort();
      expect(ta).assertDeepEquals(new Int8Array([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0097
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0097
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0097';
      console.info(`${caseName}, test start`);
      const arr = [1, 2].concat([3, 4, 5]).reverse();
      expect(arr).assertDeepEquals([5, 4, 3, 2, 1]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).reverse();
      expect(ta).assertDeepEquals(new Int8Array([5, 4, 3, 2, 1]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0098
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0098
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0098';
      console.info(`${caseName}, test start`);
      const arr = [1, 2].concat([3, 4, 5]).copyWithin(1, 3);
      expect(arr).assertDeepEquals([1, 4, 5, 4, 5]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).copyWithin(1, 3);
      expect(ta).assertDeepEquals(new Int8Array([1, 4, 5, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0099
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0099
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0099';
      console.info(`${caseName}, test start`);
      const arr = [1, 2].concat([3, 4, 5]).fill(9, 2, 4);
      expect(arr).assertDeepEquals([1, 2, 9, 9, 5]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).fill(9, 2, 4);
      expect(ta).assertDeepEquals(new Int8Array([1, 2, 9, 9, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0100
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0100';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4].slice(1, 3);
      const len = arr.push(9);
      expect(len).assertEqual(3);
      expect(arr).assertDeepEquals([2, 3, 9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0101
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0101
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0101';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4].slice(1, 4);
      const popped = arr.pop();
      expect(popped).assertEqual(4);
      expect(arr).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0102
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0102
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0102';
      console.info(`${caseName}, test start`);
      const arr = [10, 20, 30, 40].slice(1, 3);
      const shifted = arr.shift();
      expect(shifted).assertEqual(20);
      expect(arr).assertDeepEquals([30]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0103
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0103
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0103';
      console.info(`${caseName}, test start`);
      const arr = [3, 4, 5, 6].slice(1, 3);
      const len = arr.unshift(1, 2);
      expect(len).assertEqual(4);
      expect(arr).assertDeepEquals([1, 2, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0104
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0104
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0104';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5].slice(1, 4);
      const removed = arr.splice(1, 1, 9);
      expect(removed).assertDeepEquals([3]);
      expect(arr).assertDeepEquals([2, 9, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0105
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0105
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0105';
      console.info(`${caseName}, test start`);
      const arr = [5, 4, 3, 2, 1].slice(1, 4).sort();
      expect(arr).assertDeepEquals([2, 3, 4]);
      const ta = new Int8Array([5, 4, 3, 2, 1]).slice(1, 4).sort();
      expect(ta).assertDeepEquals(new Int8Array([2, 3, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0106
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0106
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0106';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5].slice(1, 4).reverse();
      expect(arr).assertDeepEquals([4, 3, 2]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).slice(1, 4).reverse();
      expect(ta).assertDeepEquals(new Int8Array([4, 3, 2]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0107
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0107
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0107';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5].slice().copyWithin(1, 3);
      expect(arr).assertDeepEquals([1, 4, 5, 4, 5]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).slice().copyWithin(1, 3);
      expect(ta).assertDeepEquals(new Int8Array([1, 4, 5, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0108
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0108
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0108';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5].slice().fill(9, 1, 3);
      expect(arr).assertDeepEquals([1, 9, 9, 4, 5]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).slice().fill(9, 1, 3);
      expect(ta).assertDeepEquals(new Int8Array([1, 9, 9, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0109
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0109
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0109';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3], [4]].flat();
      arr.push(9);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0110
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0110
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0110';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2], [3, 4]].flat();
      const val = arr.pop();
      expect(val).assertEqual(4);
      expect(arr).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0111
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0111
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0111';
      console.info(`${caseName}, test start`);
      const arr = [[10, 20], [30, 40]].flat();
      const val = arr.shift();
      expect(val).assertEqual(10);
      expect(arr).assertDeepEquals([20, 30, 40]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0112
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0112
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0112';
      console.info(`${caseName}, test start`);
      const arr = [[2, 3], [4, 5]].flat();
      const len = arr.unshift(0, 1);
      expect(len).assertEqual(6);
      expect(arr).assertDeepEquals([0, 1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0113
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0113
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0113';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2, 3], [4, 5]].flat();
      const removed = arr.splice(2, 2, 9, 9);
      expect(removed).assertDeepEquals([3, 4]);
      expect(arr).assertDeepEquals([1, 2, 9, 9, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0114
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0114
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0114';
      console.info(`${caseName}, test start`);
      const arr = [[5, 2], [4, 1, 3]].flat().sort();
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      const ta = new Int8Array([5, 2, 4, 1, 3]).sort();
      expect(ta).assertDeepEquals(new Int8Array([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0115
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0115
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0115';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2, 3], [4, 5]].flat().reverse();
      expect(arr).assertDeepEquals([5, 4, 3, 2, 1]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).reverse();
      expect(ta).assertDeepEquals(new Int8Array([5, 4, 3, 2, 1]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0116
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0116
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0116';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2, 3, 4, 5], [6]].flat().copyWithin(2, 4);
      expect(arr).assertDeepEquals([1, 2, 5, 6, 5, 6]);
      const ta = new Int8Array([1, 2, 3, 4, 5, 6]).copyWithin(2, 4);
      expect(ta).assertDeepEquals(new Int8Array([1, 2, 5, 6, 5, 6]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest0117
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST0117
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest0117';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2, 3, 4, 5]].flat().fill(0, 2, 4);
      expect(arr).assertDeepEquals([1, 2, 0, 0, 5]);
      const ta = new Int8Array([1, 2, 3, 4, 5]).fill(0, 2, 4);
      expect(ta).assertDeepEquals(new Int8Array([1, 2, 0, 0, 5]));
      console.info(`${caseName}, test end`);
    });

  });
}