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
export default function builtinsArrayLowerBoundSearchSecondPrototypebTest(){
  describe('builtinsArrayLowerBoundSearchSecondPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = lowerBoundSearch(arr, 4.0.toFloat());
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat()];
        let result = lowerBoundSearch(arr, 2.0.toFloat());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 3.3.toFloat(), 5.5.toFloat(), 7.7.toFloat()];
        let result = lowerBoundSearch(arr, 5.5.toFloat());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 3.3.toFloat(), 5.5.toFloat(), 7.7.toFloat()];
        let result = lowerBoundSearch(arr, 4.4.toFloat());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0500
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [2.2.toFloat(), 2.2.toFloat(), 2.2.toFloat()];
        let result = lowerBoundSearch(arr, 2.2.toFloat());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0600
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [3.3.toFloat()];
        let result = lowerBoundSearch(arr, 3.3.toFloat());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0700
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat()];
        let result = lowerBoundSearch(arr, 2.2.toFloat());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0800
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = lowerBoundSearch(arr, 1.1.toFloat());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest0900
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest0900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int 全部小于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = lowerBoundSearch(arr, 4.0.toFloat(), 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1000
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int 全部大于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat()];
        let result = lowerBoundSearch(arr, 2.0.toFloat(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int key在中间，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 3.3.toFloat(), 5.5.toFloat(), 7.7.toFloat()];
        let result = lowerBoundSearch(arr, 5.5.toFloat(), 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int key在数组中不存在但在区间内，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 3.3.toFloat(), 5.5.toFloat(), 7.7.toFloat()];
        let result = lowerBoundSearch(arr, 4.4.toFloat(), 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int 全部等于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [2.2.toFloat(), 2.2.toFloat(), 2.2.toFloat()];
        let result = lowerBoundSearch(arr, 2.2.toFloat(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [3.3.toFloat()];
        let result = lowerBoundSearch(arr, 3.3.toFloat(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1500
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat()];
        let result = lowerBoundSearch(arr, 2.2.toFloat(), 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1600
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<float>, key: float, startIndex: int, endIndex: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = lowerBoundSearch(arr, 1.1.toFloat(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1700
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1800
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest1900
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest1900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2000
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [3];
        let result = lowerBoundSearch(arr, 3);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = lowerBoundSearch(arr, 1);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2500
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int 全部小于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2600
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int 全部大于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2700
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int key在中间，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2800
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int key在数组中不存在但在区间内，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest2900
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest2900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int 全部等于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3000
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [3];
        let result = lowerBoundSearch(arr, 3, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<int>, key: int, startIndex: int, endIndex: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = lowerBoundSearch(arr, 1, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3500
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3600
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3700
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3800
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [3];
        let result = lowerBoundSearch(arr, 3);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest3900
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest3900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4000
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = lowerBoundSearch(arr, 1);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int 全部小于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int 全部大于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int key在中间，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int key在数组中不存在但在区间内，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4500
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int 全部等于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4600
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [3];
        let result = lowerBoundSearch(arr, 3, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4700
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4800
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<long>, key: long, startIndex: int, endIndex: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = lowerBoundSearch(arr, 1, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest4900
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest4900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5000
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [3];
        let result = lowerBoundSearch(arr, 3);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5500
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5600
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = lowerBoundSearch(arr, 1);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5700
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int 全部小于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5800
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int 全部大于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest5900
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest5900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int key在中间，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest6000
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest6000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int key在数组中不存在但在区间内，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest6100
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest6100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int 全部等于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest6200
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest6200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [3];
        let result = lowerBoundSearch(arr, 3, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest6300
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest6300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchSecondPrototypebTest6400
     * @tc.name builtinsArrayLowerBoundSearchSecondPrototypebTest6400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<short>, key: short, startIndex: int, endIndex: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = lowerBoundSearch(arr, 1, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}