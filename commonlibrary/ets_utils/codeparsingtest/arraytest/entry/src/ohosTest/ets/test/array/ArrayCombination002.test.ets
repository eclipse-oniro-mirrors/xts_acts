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

export default function ArrayCombinationTest2() {
  describe('ArrayCombinationTest2', () => {
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
     * @tc.name   ArrayCombinationTest2001
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2001
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2001';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const result = arr.concat([4, 5]).slice(1, 4);
      expect(result).assertDeepEquals([2, 3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2002
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2002
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2002';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3]];
      const result = arr.concat([4, [5]]).flat();
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2003
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2003
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2003';
      console.info(`${caseName}, test start`);
      const arr = [10, 20, 30, 40];
      const result = arr.slice(1, 3).concat([50, 60]);
      expect(result).assertDeepEquals([20, 30, 50, 60]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2004
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2004
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2004';
      console.info(`${caseName}, test start`);
      const arr = [[1, 2], [3, 4], [5]];
      const result = arr.slice(0, 2).flat();
      expect(result).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taResult = Array.from(ta.slice(0, 3)).flat();
      expect(taResult).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2005
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2005
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2005';
      console.info(`${caseName}, test start`);
      const arr = [[1], [2, 3]];
      const result = arr.flat().concat([4, 5]);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2006
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2006
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2006';
      console.info(`${caseName}, test start`);
      const arr = [[10, 20], [30, 40], [50]];
      const result = arr.flat().slice(1, 4);
      expect(result).assertDeepEquals([20, 30, 40]);

      const ta = new Int16Array([10, 20, 30, 40, 50]);
      const taResult = Array.from(ta).slice(1, 4);
      expect(taResult).assertDeepEquals([20, 30, 40]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2007
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2007
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2007';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const result = arr.concat([3]).concat([4, 5]);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2008
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2008
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2008';
      console.info(`${caseName}, test start`);
      const arr = [0, 1, 2, 3, 4, 5];
      const result = arr.slice(1, 5).slice(1, 3);
      expect(result).assertDeepEquals([2, 3]);

      const ta = new Uint8Array([0, 1, 2, 3, 4, 5]);
      const taResult = Array.from(ta.slice(1, 5).slice(1, 3));
      expect(taResult).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2009
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2009
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2009';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, [3, [4]]]];
      const result = arr.flat(2).flat();
      expect(result).assertDeepEquals([1, 2, 3, 4]);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = Array.from([ta].flat().flat());
      expect(taResult).assertDeepEquals([new Int16Array([1, 2, 3, 4])]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2010
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2010
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2010';
      console.info(`${caseName}, test start`);
      const arr: number[] = [1, 2, 3];
      arr.push(4);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(10);
      const ta = new Int8Array([1, 2, 3]);
      const ta2 = new Int8Array([...ta, 4]);
      let sum2 = 0;
      ta2.forEach(v => sum2 += v);
      expect(sum2).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2011
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2011
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2011';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3].push(4);
      const result = [1, 2, 3, 4].map(x => x * 2);
      expect(result).assertDeepEquals([2, 4, 6, 8]);
      const ta = new Int8Array([1, 2, 3, 4]).map(x => x * 2);
      expect(ta).assertDeepEquals(new Int8Array([2, 4, 6, 8]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2012
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2012
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2012';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4, 5);
      const result = arr.filter(x => x % 2 === 0);
      expect(result).assertDeepEquals([2, 4]);
      const ta = new Int8Array([1, 2, 3, 4, 5]);
      const filtered = ta.filter(x => x % 2 === 0);
      expect(filtered).assertDeepEquals(new Int8Array([2, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2013
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2013
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2013';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      const result = arr.reduce((a, b) => a + b, 0);
      expect(result).assertEqual(10);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taSum = ta.reduce((a, b) => a + b);
      expect(taSum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2014
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2014
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2014';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      const result = arr.reduceRight((a, b) => a - b);
      expect(result).assertEqual(4 - 3 - 2 - 1);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = ta.reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(4 - 3 - 2 - 1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2015
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2015
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2015';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      const result = arr.some(x => x > 3);
      expect(result).assertEqual(true);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taResult = ta.some(x => x > 3);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2016
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2016
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2016';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3, 4);
      const result = arr.every(x => x > 0);
      expect(result).assertEqual(true);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taResult = ta.every(x => x > 0);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2017
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2017
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2017';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      arr.push(3, 4);
      const val = arr.find(x => x > 2);
      expect(val).assertEqual(3);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taVal = ta.find(x => x > 2);
      expect(taVal).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2018
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2018
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2018';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      const idx = arr.findIndex(x => x === 3);
      expect(idx).assertEqual(2);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taIdx = ta.findIndex(x => x === 3);
      expect(taIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2021
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2021
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2021';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.push(4);
      const result = arr.flatMap(x => [x, x * 2]);
      expect(result).assertDeepEquals([1, 2, 2, 4, 3, 6, 4, 8]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2022
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2022
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2022';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      let sum = 0;
      arr.forEach(x => sum += x);
      expect(sum).assertEqual(6);
      const ta = new Int8Array([1, 2, 3, 4]);
      const arr2 = new Int8Array([...ta.slice(0, -1)]);
      let s = 0;
      arr2.forEach(x => s += x);
      expect(s).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2023
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2023
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2023';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const result = arr.map(x => x * 2);
      expect(result).assertDeepEquals([2, 4]);
      const ta = new Int8Array([1, 2, 3]);
      const mapped = ta.slice(0, -1).map(x => x * 2);
      expect(mapped).assertDeepEquals(new Int8Array([2, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2024
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2024
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2024';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      const result = arr.filter(x => x % 2 === 0);
      expect(result).assertDeepEquals([2]);
      const ta = new Int8Array([1, 2, 3, 4]);
      const filtered = ta.slice(0, -1).filter(x => x % 2 === 0);
      expect(filtered).assertDeepEquals(new Int8Array([2]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2025
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2025
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2025';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      const res = arr.reduce((a, b) => a + b, 0);
      expect(res).assertEqual(6);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = ta.slice(0, -1).reduce((a, b) => a + b);
      expect(taRes).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2026
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2026
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2026';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(3 - 2 - 1);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = ta.slice(0, -1).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(3 - 2 - 1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2027
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2027
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2027';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const result = arr.some(x => x > 2);
      expect(result).assertEqual(false);
      const ta = new Int8Array([1, 2, 3]);
      const taRes = ta.slice(0, -1).some(x => x > 2);
      expect(taRes).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2028
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2028
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2028';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const result = arr.every(x => x > 0);
      expect(result).assertEqual(true);
      const ta = new Int8Array([1, 2, 3]);
      const taRes = ta.slice(0, -1).every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2029
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2029
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2029';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const val = arr.find(x => x > 1);
      expect(val).assertEqual(2);
      const ta = new Int8Array([1, 2, 3]);
      const taVal = ta.slice(0, -1).find(x => x > 1);
      expect(taVal).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2030
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2030
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2030';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.pop();
      const idx = arr.findIndex(x => x === 2);
      expect(idx).assertEqual(1);
      const ta = new Int8Array([1, 2, 3]);
      const taIdx = ta.slice(0, -1).findIndex(x => x === 2);
      expect(taIdx).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2033
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2033
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2033';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.pop();
      const res = arr.flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 2, 4, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2034
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2034
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2034';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      let sum = 0;
      arr.forEach(x => sum += x);
      expect(sum).assertEqual(9);
      const ta = new Int8Array([1, 2, 3, 4]);
      const ta2 = ta.slice(1);
      let total = 0;
      ta2.forEach(x => total += x);
      expect(total).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2035
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2035
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2035';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const res = arr.map(x => x * 3);
      expect(res).assertDeepEquals([6, 9]);
      const ta = new Int8Array([1, 2, 3]);
      const taRes = ta.slice(1).map(x => x * 3);
      expect(taRes).assertDeepEquals(new Int8Array([6, 9]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2036
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2036
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2036';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      const res = arr.filter(x => x % 2 === 0);
      expect(res).assertDeepEquals([2, 4]);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = ta.slice(1).filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals(new Int8Array([2, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2037
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2037
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2037';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(9);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taSum = ta.slice(1).reduce((a, b) => a + b);
      expect(taSum).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2038
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2038
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2038';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(4 - 3 - 2);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taRes = ta.slice(1).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(4 - 3 - 2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2039
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2039
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2039';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const res = arr.some(x => x > 2);
      expect(res).assertEqual(true);
      const ta = new Int8Array([1, 2, 3]);
      const taRes = ta.slice(1).some(x => x > 2);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2040
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2040
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2040';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const res = arr.every(x => x > 0);
      expect(res).assertEqual(true);
      const ta = new Int8Array([1, 2, 3]);
      const taRes = ta.slice(1).every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2041
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2041
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2041';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.shift();
      const val = arr.find(x => x > 2);
      expect(val).assertEqual(3);
      const ta = new Int8Array([1, 2, 3, 4]);
      const taVal = ta.slice(1).find(x => x > 2);
      expect(taVal).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2042
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2042
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2042';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const idx = arr.findIndex(x => x === 2);
      expect(idx).assertEqual(0);
      const ta = new Int8Array([1, 2, 3]);
      const taIdx = ta.slice(1).findIndex(x => x === 2);
      expect(taIdx).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2045
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2045
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2045';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.shift();
      const res = arr.flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([2, 4, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2046
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2046
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2046';
      console.info(`${caseName}, test start`);
      const arr = [2, 3, 4];
      arr.unshift(1);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(10);

      const ta = new Int8Array([2, 3, 4]);
      const newTa = new Int8Array([1, ...ta]);
      let taSum = 0;
      newTa.forEach(v => taSum += v);
      expect(taSum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2047
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2047
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2047';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      const result = arr.unshift(1), mapped = arr.map(x => x * 2);
      expect(mapped).assertDeepEquals([2, 4, 6]);

      const ta = new Int8Array([2, 3]);
      const newTa = new Int8Array([1, ...ta]);
      const taMapped = newTa.map(x => x * 2);
      expect(Array.from(taMapped)).assertDeepEquals([2, 4, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2048
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2048
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2048';
      console.info(`${caseName}, test start`);
      const arr = [2, 3, 4];
      arr.unshift(1);
      const res = arr.filter(x => x % 2 === 0);
      expect(res).assertDeepEquals([2, 4]);

      const ta = new Int8Array([2, 3, 4]);
      const newTa = new Int8Array([1, ...ta]);
      const taRes = Array.from(newTa).filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals([2, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2049
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2049
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2049';
      console.info(`${caseName}, test start`);
      const arr = [2, 3, 4];
      arr.unshift(1);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(10);

      const ta = new Int8Array([2, 3, 4]);
      const newTa = new Int8Array([1, ...ta]);
      const taSum = Array.from(newTa).reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2050
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2050
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2050';
      console.info(`${caseName}, test start`);
      const arr = [3, 4];
      arr.unshift(1, 2);
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(-2);

      const ta = new Int8Array([3, 4]);
      const newTa = new Int8Array([1, 2, ...ta]);
      const taRes = Array.from(newTa).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2051
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2051
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2051';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      const hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);

      const ta = new Int8Array([2, 3]);
      const newTa = new Int8Array([1, ...ta]);
      const taHasEven = Array.from(newTa).some(x => x % 2 === 0);
      expect(taHasEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2052
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2052
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2052';
      console.info(`${caseName}, test start`);
      const arr = [2, 4];
      arr.unshift(6);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);

      const ta = new Int8Array([2, 4]);
      const newTa = new Int8Array([6, ...ta]);
      const taAllEven = Array.from(newTa).every(x => x % 2 === 0);
      expect(taAllEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2053
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2053
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2053';
      console.info(`${caseName}, test start`);
      const arr = [3, 5, 7];
      arr.unshift(2);
      const res = arr.find(x => x > 4);
      expect(res).assertEqual(5);

      const ta = new Int8Array([3, 5, 7]);
      const newTa = new Int8Array([2, ...ta]);
      const taRes = Array.from(newTa).find(x => x > 4);
      expect(taRes).assertEqual(5);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2054
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2054
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2054';
      console.info(`${caseName}, test start`);
      const arr = [2, 4, 5];
      arr.unshift(1);
      const idx = arr.findIndex(x => x === 4);
      expect(idx).assertEqual(2);

      const ta = new Int8Array([2, 4, 5]);
      const newTa = new Int8Array([1, ...ta]);
      const taIdx = Array.from(newTa).findIndex(x => x === 4);
      expect(taIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2057
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2057
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2057';
      console.info(`${caseName}, test start`);
      const arr = [2, 3];
      arr.unshift(1);
      const res = arr.flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 2, 4, 3, 6]);

      const ta = new Int8Array([2, 3]);
      const newTa = new Int8Array([1, ...ta]);
      const taRes = Array.from(newTa).flatMap(x => [x, x * 2]);
      expect(taRes).assertDeepEquals([1, 2, 2, 4, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2058
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2058
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2058';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 2, 9, 10);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(24);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taArr = Array.from(ta);
      taArr.splice(1, 2, 9, 10);
      let taSum = 0;
      taArr.forEach(v => taSum += v);
      expect(taSum).assertEqual(24);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2059
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2059
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2059';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const mapped = arr.splice(2, 1, 9).map(x => x * 2);
      expect(mapped).assertDeepEquals([6]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taArr = Array.from(ta);
      const taMapped = taArr.splice(2, 1, 9).map(x => x * 2);
      expect(taMapped).assertDeepEquals([6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2060
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2060
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2060';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.splice(1, 1, 10);
      const res = arr.filter(x => x > 3);
      expect(res).assertDeepEquals([10, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taArr = Array.from(ta);
      taArr.splice(1, 1, 10);
      const taRes = taArr.filter(x => x > 3);
      expect(taRes).assertDeepEquals([10, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2061
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2061
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2061';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.splice(1, 1, 5);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(9);

      const ta = new Int8Array([1, 2, 3]);
      const taArr = Array.from(ta);
      taArr.splice(1, 1, 5);
      const taSum = taArr.reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2062
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2062
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2062';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.splice(0, 1, 9);
      const diff = arr.reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-8);

      const ta = new Int8Array([1, 2, 3]);
      const taArr = Array.from(ta);
      taArr.splice(0, 1, 9);
      const taDiff = taArr.reduceRight((a, b) => a - b);
      expect(taDiff).assertEqual(-8);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2063
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2063
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2063';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.splice(1, 1, 10);
      const hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const taArr = Array.from(ta);
      taArr.splice(1, 1, 10);
      const taHasEven = taArr.some(x => x % 2 === 0);
      expect(taHasEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2064
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2064
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2064';
      console.info(`${caseName}, test start`);
      const arr = [2, 4, 6];
      arr.splice(1, 1, 8);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);

      const ta = new Int8Array([2, 4, 6]);
      const taArr = Array.from(ta);
      taArr.splice(1, 1, 8);
      const taAllEven = taArr.every(x => x % 2 === 0);
      expect(taAllEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2065
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2065
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2065';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.splice(0, 1, 5);
      const res = arr.find(x => x > 3);
      expect(res).assertEqual(5);

      const ta = new Int8Array([1, 2, 3]);
      const taArr = Array.from(ta);
      taArr.splice(0, 1, 5);
      const taRes = taArr.find(x => x > 3);
      expect(taRes).assertEqual(5);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2066
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2066
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2066';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.splice(1, 1, 9);
      const idx = arr.findIndex(x => x === 9);
      expect(idx).assertEqual(1);

      const ta = new Int8Array([1, 2, 3]);
      const taArr = Array.from(ta);
      taArr.splice(1, 1, 9);
      const taIdx = taArr.findIndex(x => x === 9);
      expect(taIdx).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2069
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2069
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2069';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      arr.splice(1, 1, 4);
      const res = arr.flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 4, 8, 3, 6]);

      const ta = new Int8Array([1, 2, 3]);
      const taArr = Array.from(ta);
      taArr.splice(1, 1, 4);
      const taRes = taArr.flatMap(x => [x, x * 2]);
      expect(taRes).assertDeepEquals([1, 2, 4, 8, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2070
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2070
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2070';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      arr.sort((a, b) => a - b).forEach((v, i) => arr[i] = i -1);
      expect(arr).assertDeepEquals([-1,0,1]);

      const ta = new Int8Array([3, 1, 2]);
      ta.sort().forEach((v, i) => ta[i] = i -1);
      expect(Array.from(ta)).assertDeepEquals([-1,0,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2071
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2071
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2071';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      const res = arr.sort().map(x => x * 2);
      expect(res).assertDeepEquals([2, 4, 6]);

      const ta = new Int8Array([3, 1, 2]);
      const resTA = Array.from(ta.sort()).map(x => x * 2);
      expect(resTA).assertDeepEquals([2, 4, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2072
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2072
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2072';
      console.info(`${caseName}, test start`);
      const arr = [4, 1, 3, 2];
      const res = arr.sort().filter(x => x > 2);
      expect(res).assertDeepEquals([3, 4]);

      const ta = new Int8Array([4, 1, 3, 2]);
      const resTA = Array.from(ta.sort()).filter(x => x > 2);
      expect(resTA).assertDeepEquals([3, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2073
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2073
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2073';
      console.info(`${caseName}, test start`);
      const arr = [5, 1, 4];
      const sum = arr.sort().reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(10);

      const ta = new Int8Array([5, 1, 4]);
      const sumTA = Array.from(ta.sort()).reduce((a, b) => a + b, 0);
      expect(sumTA).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2074
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2074
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2074';
      console.info(`${caseName}, test start`);
      const arr = [2, 1, 3];
      const res = arr.sort().reduceRight((a, b) => a - b);
      expect(res).assertEqual(0);

      const ta = new Int8Array([2, 1, 3]);
      const resTA = Array.from(ta.sort()).reduceRight((a, b) => a - b);
      expect(resTA).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2075
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2075
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2075';
      console.info(`${caseName}, test start`);
      const arr = [3, 2, 1];
      const res = arr.sort().some(x => x === 2);
      expect(res).assertEqual(true);

      const ta = new Int8Array([3, 2, 1]);
      const resTA = Array.from(ta.sort()).some(x => x === 2);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2076
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2076
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2076';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.sort().every(x => x < 5);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = Array.from(ta.sort()).every(x => x < 5);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2077
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2077
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2077';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 4];
      const res = arr.sort().find(x => x > 2);
      expect(res).assertEqual(3);

      const ta = new Int8Array([3, 1, 4]);
      const resTA = Array.from(ta.sort()).find(x => x > 2);
      expect(resTA).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2078
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2078
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2078';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      const res = arr.sort().findIndex(x => x === 2);
      expect(res).assertEqual(1);

      const ta = new Int8Array([3, 1, 2]);
      const resTA = Array.from(ta.sort()).findIndex(x => x === 2);
      expect(resTA).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2081
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2081
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2081';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      const res = arr.sort().flatMap(x => [x, x * 2]);
      expect(res).assertDeepEquals([1, 2, 2, 4, 3, 6]);

      const ta = new Int8Array([3, 1, 2]);
      const resTA = Array.from(ta.sort()).flatMap(x => [x, x * 2]);
      expect(resTA).assertDeepEquals([1, 2, 2, 4, 3, 6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2082
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2082
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2082';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      let res: number[] = [];
      arr.reverse().forEach(v => res.push(v));
      expect(res).assertDeepEquals([3, 2, 1]);

      const ta = new Int8Array([1, 2, 3]);
      let taRes: number[] = [];
      ta.reverse().forEach(v => taRes.push(v));
      expect(taRes).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2083
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2083
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2083';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.reverse().map(v => v * 2);
      expect(res).assertDeepEquals([6, 4, 2]);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = Array.from(ta.reverse()).map(v => v * 2);
      expect(resTA).assertDeepEquals([6, 4, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2084
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2084
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2084';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const res = arr.reverse().filter(v => v % 2 === 0);
      expect(res).assertDeepEquals([4, 2]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const resTA = Array.from(ta.reverse()).filter(v => v % 2 === 0);
      expect(resTA).assertDeepEquals([4, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2085
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2085
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2085';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const sum = arr.reverse().reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(6);

      const ta = new Int8Array([1, 2, 3]);
      const taSum = Array.from(ta.reverse()).reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2086
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2086
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2086';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const diff = arr.reverse().reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-4);

      const ta = new Int8Array([1, 2, 3]);
      const diffTA = Array.from(ta.reverse()).reduceRight((a, b) => a - b);
      expect(diffTA).assertEqual(-4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2087
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2087
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2087';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.reverse().some(v => v > 2);
      expect(res).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = Array.from(ta.reverse()).some(v => v > 2);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2088
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2088
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2088';
      console.info(`${caseName}, test start`);
      const arr = [2, 4, 6];
      const res = arr.reverse().every(v => v % 2 === 0);
      expect(res).assertEqual(true);

      const ta = new Int8Array([2, 4, 6]);
      const resTA = Array.from(ta.reverse()).every(v => v % 2 === 0);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2089
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2089
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2089';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.reverse().find(v => v < 3);
      expect(res).assertEqual(2);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = Array.from(ta.reverse()).find(v => v < 3);
      expect(resTA).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2090
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2090
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2090';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const idx = arr.reverse().findIndex(v => v === 1);
      expect(idx).assertEqual(2);

      const ta = new Int8Array([1, 2, 3]);
      const idxTA = Array.from(ta.reverse()).findIndex(v => v === 1);
      expect(idxTA).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2093
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2093
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2093';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.reverse().flatMap(v => [v, v * 2]);
      expect(res).assertDeepEquals([3, 6, 2, 4, 1, 2]);

      const ta = new Int8Array([1, 2, 3]);
      const resTA = Array.from(ta.reverse()).flatMap(v => [v, v * 2]);
      expect(resTA).assertDeepEquals([3, 6, 2, 4, 1, 2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2094
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2094
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2094';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4, 5];
      let result: number[] = [];
      arr.copyWithin(0, 3).forEach(x => result.push(x));
      expect(result).assertDeepEquals([4, 5, 3, 4, 5]);

      let ta = new Int8Array([1, 2, 3, 4, 5]);
      let taResult: number[] = [];
      ta.copyWithin(0, 3).forEach(x => taResult.push(x));
      expect(taResult).assertDeepEquals([4, 5, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2095
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2095
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2095';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4, 5];
      let mapped = arr.copyWithin(1, 2).map(x => x * 2);
      expect(mapped).assertDeepEquals([1 * 2, 3 * 2, 4 * 2, 5 * 2, 5 * 2]);

      let ta = new Int8Array([1, 2, 3, 4, 5]);
      let taMapped = ta.copyWithin(1, 2).map(x => x * 2);
      expect(Array.from(taMapped)).assertDeepEquals([2, 6, 8, 10, 10]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2096
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2096
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2096';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4, 5];
      let filtered = arr.copyWithin(2, 0).filter(x => x > 2);
      expect(filtered).assertDeepEquals([3]);

      let ta = new Int8Array([1, 2, 3, 4, 5]);
      let taFiltered = ta.copyWithin(2, 0).filter(x => x > 2);
      expect(Array.from(taFiltered)).assertDeepEquals([3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2097
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2097
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2097';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4];
      let sum = arr.copyWithin(1, 2).reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(12);

      let ta = new Int8Array([1, 2, 3, 4]);
      let taSum = ta.copyWithin(1, 2).reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(12);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2098
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2098
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2098';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4];
      let res = arr.copyWithin(0, 2).reduceRight((a, b) => a - b, 0);
      expect(res).assertEqual((((0 - 4) - 3) - 3) - 4);

      let ta = new Int8Array([1, 2, 3, 4]);
      let taRes = ta.copyWithin(0, 2).reduceRight((a, b) => a - b, 0);
      expect(taRes).assertEqual((((0 - 4) - 3) - 3) - 4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2099
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2099
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2099';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4];
      let res = arr.copyWithin(0, 2).some(x => x === 3);
      expect(res).assertEqual(true);

      let ta = new Int8Array([1, 2, 3, 4]);
      let taRes = ta.copyWithin(0, 2).some(x => x === 3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2100
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2100';
      console.info(`${caseName}, test start`);
      let arr = [2, 4, 6];
      let res = arr.copyWithin(1, 2).every(x => x % 2 === 0);
      expect(res).assertEqual(true);

      let ta = new Int8Array([2, 4, 6]);
      let taRes = ta.copyWithin(1, 2).every(x => x % 2 === 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2101
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2101
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2101';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4];
      let found = arr.copyWithin(0, 2).find(x => x === 3);
      expect(found).assertEqual(3);

      let ta = new Int8Array([1, 2, 3, 4]);
      let taFound = ta.copyWithin(0, 2).find(x => x === 3);
      expect(taFound).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2102
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2102
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2102';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3, 4];
      let idx = arr.copyWithin(1, 2).findIndex(x => x === 4);
      expect(idx).assertEqual(2);

      let ta = new Int8Array([1, 2, 3, 4]);
      let taIdx = ta.copyWithin(1, 2).findIndex(x => x === 4);
      expect(taIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2105
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2105
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2105';
      console.info(`${caseName}, test start`);
      let arr = [1, 2, 3];
      let flattened = arr.copyWithin(1, 2).flatMap(x => [x, x * 10]);
      expect(flattened).assertDeepEquals([1, 10, 3, 30, 3, 30]);

      let ta = new Int8Array([1, 2, 3]);
      let taArr = Array.from(ta.copyWithin(1, 2)).flatMap(x => [x, x * 10]);
      expect(taArr).assertDeepEquals([1, 10, 3, 30, 3, 30]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2106
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2106
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2106';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      let res: number[] = [];
      arr.fill(5, 1, 3).forEach(v => res.push(v));
      expect(res).assertDeepEquals([1, 5, 5, 4]);

      const ta = new Int8Array([1, 2, 3, 4]);
      let taRes: number[] = [];
      ta.fill(5, 1, 3).forEach(v => taRes.push(v));
      expect(taRes).assertDeepEquals([1, 5, 5, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2107
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2107
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2107';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const mapped = arr.fill(2).map(x => x * 2);
      expect(mapped).assertDeepEquals([4, 4, 4]);

      const ta = new Int8Array([1, 2, 3]);
      const taMapped = Array.from(ta.fill(2)).map(x => x * 2);
      expect(taMapped).assertDeepEquals([4, 4, 4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2108
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2108
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2108';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const filtered = arr.fill(3, 0, 2).filter(x => x === 3);
      expect(filtered).assertDeepEquals([3, 3, 3]);

      const ta = new Int8Array([1, 2, 3, 4]);
      const taFiltered = Array.from(ta.fill(3, 0, 2)).filter(x => x === 3);
      expect(taFiltered).assertDeepEquals([3, 3, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2109
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2109
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2109';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const sum = arr.fill(2).reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(6);

      const ta = new Int8Array([1, 2, 3]);
      const taSum = Array.from(ta.fill(2)).reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2110
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2110
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2110';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const diff = arr.fill(2).reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-2);

      const ta = new Int8Array([1, 2, 3]);
      const taDiff = Array.from(ta.fill(2)).reduceRight((a, b) => a - b);
      expect(taDiff).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2111
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2111
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2111';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const hasThree = arr.fill(3).some(x => x === 3);
      expect(hasThree).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const taHasThree = Array.from(ta.fill(3)).some(x => x === 3);
      expect(taHasThree).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2112
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2112
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2112';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const allThree = arr.fill(3).every(x => x === 3);
      expect(allThree).assertEqual(true);

      const ta = new Int8Array([1, 2, 3]);
      const taAllThree = Array.from(ta.fill(3)).every(x => x === 3);
      expect(taAllThree).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2113
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2113
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2113';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const found = arr.fill(2).find(x => x === 2);
      expect(found).assertEqual(2);

      const ta = new Int8Array([1, 2, 3]);
      const taFound = Array.from(ta.fill(2)).find(x => x === 2);
      expect(taFound).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest2114
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2114
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2114';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const idx = arr.fill(4).findIndex(x => x === 4);
      expect(idx).assertEqual(0);

      const ta = new Int8Array([1, 2, 3]);
      const taIdx = Array.from(ta.fill(4)).findIndex(x => x === 4);
      expect(taIdx).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest2117
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST2117
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest2117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest2117';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const flattened = arr.fill(2).flatMap(x => [x, x * 3]);
      expect(flattened).assertDeepEquals([2, 6, 2, 6, 2, 6]);

      const ta = new Int8Array([1, 2, 3]);
      const taFlattened = Array.from(ta.fill(2)).flatMap(x => [x, x * 3]);
      expect(taFlattened).assertDeepEquals([2, 6, 2, 6, 2, 6]);
      console.info(`${caseName}, test end`);
    });

  });
}