/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsArrayLastIndexOfSecondPrototypebTest(){
  describe('builtinsArrayLastIndexOfSecondPrototypebTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0100
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 普通数组，查找存在的float，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 2.2.toFloat()];
        let result = lastIndexOf(arr, 2.2.toFloat(), arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0200
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 普通数组，查找不存在的float，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = lastIndexOf(arr, 4.4.toFloat(), arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0300
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat()];
        let result = lastIndexOf(arr, 5.5.toFloat(), 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0400
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 只有一个元素，查找不存在的float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [6.6.toFloat()];
        let result = lastIndexOf(arr, 7.7.toFloat(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0500
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0500
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 空数组，查找任意float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = lastIndexOf(arr, 1.1.toFloat(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0600
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0600
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 全为同一个float，查找该float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [8.8.toFloat(), 8.8.toFloat(), 8.8.toFloat()];
        let result = lastIndexOf(arr, 8.8.toFloat(), arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0700
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0700
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int 递增float，查找中间的float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 5.5.toFloat()];
        let result = lastIndexOf(arr, 3.3.toFloat(), arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0800
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0800
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex: int): int fromIndex为负数，查找存在的float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 2.2.toFloat()];
        let result = lastIndexOf(arr, 2.2.toFloat(), -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest0900
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest0900
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 普通数组，查找存在的float，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 2.2.toFloat()];
        let result = lastIndexOf(arr, 2.2.toFloat()).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1000
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1000
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 普通数组，查找不存在的float，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = lastIndexOf(arr, 4.4.toFloat()).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1100
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat()];
        let result = lastIndexOf(arr, 5.5.toFloat()).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1200
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 只有一个元素，查找不存在的float，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [6.6.toFloat()];
        let result = lastIndexOf(arr, 7.7.toFloat()).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1300
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 空数组，查找任意float，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = lastIndexOf(arr, 1.1.toFloat()).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1400
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 全为同一个float，查找该float，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [8.8.toFloat(), 8.8.toFloat(), 8.8.toFloat()];
        let result = lastIndexOf(arr, 8.8.toFloat()).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1500
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1500
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number 递增float，查找中间的float，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 5.5.toFloat()];
        let result = lastIndexOf(arr, 3.3.toFloat()).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1600
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1600
     * @tc.desc function lastIndexOf(self: FixedArray<float>, element: float, fromIndex?: Number): number fromIndex为负数，查找存在的float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 2.2.toFloat()];
        let result = lastIndexOf(arr, 2.2.toFloat(), -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1700
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1700
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 普通数组，查找存在的int，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1800
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1800
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 普通数组，查找不存在的int，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = lastIndexOf(arr, 4, arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest1900
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest1900
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5];
        let result = lastIndexOf(arr, 5, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2000
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2000
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 只有一个元素，查找不存在的int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [6];
        let result = lastIndexOf(arr, 7, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2100
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 空数组，查找任意int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = lastIndexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2200
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 全为同一个int，查找该int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [8, 8, 8];
        let result = lastIndexOf(arr, 8, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2300
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int 递增int，查找中间的int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2400
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex: int): int fromIndex为负数，查找存在的int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2500
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2500
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 普通数组，查找存在的long，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2600
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2600
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 普通数组，查找不存在的long，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = lastIndexOf(arr, 4).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2700
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2700
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5];
        let result = lastIndexOf(arr, 5).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2800
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2800
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 只有一个元素，查找不存在的long，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [6];
        let result = lastIndexOf(arr, 7).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest2900
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest2900
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 空数组，查找任意long，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = lastIndexOf(arr, 1).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3000
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3000
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 全为同一个long，查找该long，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [8, 8, 8];
        let result = lastIndexOf(arr, 8).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3100
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number 递增long，查找中间的long，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3200
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex?: Number): number fromIndex为负数，查找存在的long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3300
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 普通数组，查找存在的int，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3400
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 普通数组，查找不存在的int，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = lastIndexOf(arr, 4).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3500
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3500
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5];
        let result = lastIndexOf(arr, 5).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3600
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3600
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 只有一个元素，查找不存在的int，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [6];
        let result = lastIndexOf(arr, 7).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3700
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3700
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 空数组，查找任意int，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = lastIndexOf(arr, 1).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3800
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3800
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 全为同一个int，查找该int，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [8, 8, 8];
        let result = lastIndexOf(arr, 8).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest3900
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest3900
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number 递增int，查找中间的int，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4000
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4000
     * @tc.desc function lastIndexOf(self: FixedArray<int>, element: int, fromIndex?: Number): number fromIndex为负数，查找存在的int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4100
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 普通数组，查找存在的long，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4200
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 普通数组，查找不存在的long，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = lastIndexOf(arr, 4, arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4300
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5];
        let result = lastIndexOf(arr, 5, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4400
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 只有一个元素，查找不存在的long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [6];
        let result = lastIndexOf(arr, 7, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4500
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4500
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 空数组，查找任意long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = lastIndexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4600
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4600
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 全为同一个long，查找该long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [8, 8, 8];
        let result = lastIndexOf(arr, 8, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4700
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4700
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int 递增long，查找中间的long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4800
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4800
     * @tc.desc function lastIndexOf(self: FixedArray<long>, element: long, fromIndex: int): int fromIndex为负数，查找存在的long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest4900
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest4900
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 普通数组，查找存在的short，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5000
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5000
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 普通数组，查找不存在的short，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = lastIndexOf(arr, 4, arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5100
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5];
        let result = lastIndexOf(arr, 5, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5200
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 只有一个元素，查找不存在的short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [6];
        let result = lastIndexOf(arr, 7, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5300
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 空数组，查找任意short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = lastIndexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5400
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 全为同一个short，查找该short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [8, 8, 8];
        let result = lastIndexOf(arr, 8, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5500
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5500
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int 递增short，查找中间的short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5600
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5600
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex: int): int fromIndex为负数，查找存在的short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5700
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5700
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 普通数组，查找存在的short，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5800
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5800
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 普通数组，查找不存在的short，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = lastIndexOf(arr, 4).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest5900
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest5900
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5];
        let result = lastIndexOf(arr, 5).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest6000
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest6000
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 只有一个元素，查找不存在的short，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [6];
        let result = lastIndexOf(arr, 7).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest6100
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest6100
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 空数组，查找任意short，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = lastIndexOf(arr, 1).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest6200
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest6200
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 全为同一个short，查找该short，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [8, 8, 8];
        let result = lastIndexOf(arr, 8).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest6300
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest6300
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number 递增short，查找中间的short，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfSecondPrototypebTest6400
     * @tc.name builtinsArrayLastIndexOfSecondPrototypebTest6400
     * @tc.desc function lastIndexOf(self: FixedArray<short>, element: short, fromIndex?: Number): number fromIndex为负数，查找存在的short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}