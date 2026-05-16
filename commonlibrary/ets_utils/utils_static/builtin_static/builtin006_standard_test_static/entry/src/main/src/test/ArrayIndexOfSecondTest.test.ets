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
export default function builtinsArrayIndexOfSecondPrototypebTest(){
  describe('builtinsArrayIndexOfSecondPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0100
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 查找2.2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 2.2.toFloat(), 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0200
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 查找3.3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 3.3.toFloat(), 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0300
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 不存在4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 4.4.toFloat(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0400
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 不存在-1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, -1.1.toFloat(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0500
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0500
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 指定fromIndex后查找3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 3.3.toFloat(), 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0600
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0600
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 指定fromIndex后不包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 1.1.toFloat(), 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0700
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0700
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = indexOf(arr, 1.1.toFloat(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0800
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0800
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 2.2.toFloat(), 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest0900
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest0900
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 查找2.2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 2.2.toFloat());
        expect(result).assertEqual(1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1000
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1000
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 查找3.3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 3.3.toFloat());
        expect(result).assertEqual(2.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1100
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 不存在4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 4.4.toFloat());
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1200
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 不存在-1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, -1.1.toFloat());
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1300
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 指定fromIndex后查找3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 3.3.toFloat(), 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1400
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 指定fromIndex后不包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 1.1.toFloat(), 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1500
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1500
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = indexOf(arr, 1.1.toFloat());
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1600
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1600
     * @tc.desc indexOf(self: FixedArray<float>, val: float, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = indexOf(arr, 2.2.toFloat(), 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1700
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1700
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 查找2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 2, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1800
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1800
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 查找3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 3, 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest1900
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest1900
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 不存在4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 4, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2000
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2000
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 不存在-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, -1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2100
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 指定fromIndex后查找3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2200
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 指定fromIndex后不包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2300
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2400
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2500
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2500
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex?) 查找2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2600
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2600
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex?) 查找3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2700
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2700
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex?) 查找不存在的4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 4);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2800
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2800
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex?) 查找不存在的-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, -1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest2900
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest2900
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 指定fromIndex查找3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3000
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3000
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 指定fromIndex查找不存在的1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3100
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) 空数组查找
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3200
     * @tc.desc indexOf(self: FixedArray<int>, val: int, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3300
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 查找2L的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 2, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3400
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 查找3L的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 3, 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3500
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3500
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 查找不存在的4L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 4, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3600
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3600
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 查找不存在的-1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, -1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3700
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3700
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 指定fromIndex查找3L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3800
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3800
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 指定fromIndex查找不存在的1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest3900
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest3900
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) 空数组查找
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4000
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4000
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4100
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 查找2L的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 2);
        expect(result).assertEqual(1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4200
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 查找3L的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 3);
        expect(result).assertEqual(2.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4300
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 查找不存在的4L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 4);
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4400
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 查找不存在的-1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, -1);
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4500
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4500
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 指定fromIndex查找3L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4600
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4600
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 指定fromIndex查找不存在的1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4700
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4700
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) 空数组查找
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4800
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4800
     * @tc.desc indexOf(self: FixedArray<long>, val: long, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest4900
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest4900
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 查找2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 2, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5000
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5000
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 查找3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 3, 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5100
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 查找不存在的4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 4, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5200
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 查找不存在的-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, -1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5300
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 指定fromIndex查找3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5400
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 指定fromIndex查找不存在的1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5500
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5500
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) 空数组查找
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5600
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5600
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5700
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5700
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 查找2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 2);
        expect(result).assertEqual(1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5800
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5800
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 查找3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 3);
        expect(result).assertEqual(2.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest5900
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest5900
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 查找不存在的4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 4);
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest6000
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest6000
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 查找不存在的-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, -1);
        expect(result).assertEqual(-1.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest6100
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest6100
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 指定fromIndex查找3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest6200
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest6200
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 指定fromIndex查找不存在的1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest6300
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest6300
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) 空数组查找
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfSecondPrototypebTest6400
     * @tc.name builtinsArrayIndexOfSecondPrototypebTest6400
     * @tc.desc indexOf(self: FixedArray<short>, val: short, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}