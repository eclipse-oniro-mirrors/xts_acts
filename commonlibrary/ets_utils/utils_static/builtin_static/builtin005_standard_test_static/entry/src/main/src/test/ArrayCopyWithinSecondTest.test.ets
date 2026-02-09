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
export default function builtinsArrayCopyWithinSecondPrototypebTest(){
  describe('builtinsArrayCopyWithinSecondPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0100
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([1.1, 1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0200
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, 6.6, 7.7];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([5.5, 6.6, 7.7]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0300
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> target为0，完整复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [8.8, 9.9, 10.1];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([8.8, 9.9, 10.1]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0400
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0500
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.11];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([11.11]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0600
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, -9);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0700
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [7.7, 7.7, 7.7];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([7.7, 7.7, 7.7]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0800
     * @tc.desc copyWithin(self: FixedArray<double>, target: int): FixedArray<double> target为数组长度-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3, 1.1]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest0900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest0900
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 0, 1);
        expect([...result]).assertDeepEquals([2.2, 3.3, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1000
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 0, 2);
        expect([...result]).assertDeepEquals([3.3, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1100
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [4.4, 5.5, 6.6];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([4.4, 4.4, 5.5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1200
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [7.7, 8.8, 9.9];
        const result = copyWithin(arr, 2, 1);
        expect([...result]).assertDeepEquals([7.7, 8.8, 8.8]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1300
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 3, 0);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1400
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1500
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [12.12];
        const result = copyWithin(arr, 0, 0);
        expect([...result]).assertDeepEquals([12.12]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1600
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int): FixedArray<double> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, 5.5, 5.5];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([5.5, 5.5, 5.5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1700
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([1.1, 1.1, 2.2, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1800
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest1900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest1900
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([1.1, 2.2, 1.1, 2.2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2000
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2, 3.3, 4.4];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([2.2, 3.3, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2100
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2200
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([5.5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2300
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2400
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end: int): FixedArray<double> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9, 9.9, 9.9, 9.9];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([9.9, 9.9, 9.9, 9.9]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2500
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([1.1, 1.1, 2.2, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2600
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2700
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([1.1, 2.2, 1.1, 2.2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2800
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2, 3.3, 4.4];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([2.2, 3.3, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest2900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest2900
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3000
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([5.5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3100
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3200
     * @tc.desc copyWithin(self: FixedArray<double>, target: int, start: int, end?: int): FixedArray<double> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9, 9.9, 9.9, 9.9];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([9.9, 9.9, 9.9, 9.9]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3300
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3400
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat()];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3500
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> target为0，完整复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [8.8.toFloat(), 9.9.toFloat(), 10.1.toFloat()];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([8.8.toFloat(), 9.9.toFloat(), 10.1.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3600
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3700
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [11.11.toFloat()];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([11.11.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3800
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, -9);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest3900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest3900
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4000
     * @tc.desc copyWithin(self: FixedArray<float>, target: int): FixedArray<float> target为数组长度-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 1.1.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4100
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 0, 1);
        expect([...result]).assertDeepEquals([2.2.toFloat(), 3.3.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4200
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 0, 2);
        expect([...result]).assertDeepEquals([3.3.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4300
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [4.4.toFloat(), 5.5.toFloat(), 6.6.toFloat()];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([4.4.toFloat(), 4.4.toFloat(), 5.5.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4400
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [7.7.toFloat(), 8.8.toFloat(), 9.9.toFloat()];
        const result = copyWithin(arr, 2, 1);
        expect([...result]).assertDeepEquals([7.7.toFloat(), 8.8.toFloat(), 8.8.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4500
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 3, 0);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4600
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4700
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [12.12.toFloat()];
        const result = copyWithin(arr, 0, 0);
        expect([...result]).assertDeepEquals([12.12.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4800
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int): FixedArray<float> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 5.5.toFloat(), 5.5.toFloat()];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([5.5.toFloat(), 5.5.toFloat(), 5.5.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest4900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest4900
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 1.1.toFloat(), 2.2.toFloat(), 4.4.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5000
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5100
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat(), 2.2.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5200
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5300
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5400
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat()];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([5.5.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5500
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5600
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end: int): FixedArray<float> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat()];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5700
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 1.1.toFloat(), 2.2.toFloat(), 4.4.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5800
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest5900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest5900
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat(), 2.2.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6000
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6100
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6200
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat()];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([5.5.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6300
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6400
     * @tc.desc copyWithin(self: FixedArray<float>, target: int, start: int, end?: int): FixedArray<float> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat()];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6500
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([1, 1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6600
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5, 6, 7];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([5, 6, 7]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6700
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> target为0，完整复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [8, 9, 10];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([8, 9, 10]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6800
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest6900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest6900
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [11];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([11]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7000
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, -9);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7100
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [7, 7, 7];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([7, 7, 7]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7200
     * @tc.desc copyWithin(self: FixedArray<int>, target: int): FixedArray<int> target为数组长度-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([1, 2, 3, 1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7300
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 0, 1);
        expect([...result]).assertDeepEquals([2, 3, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7400
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2);
        expect([...result]).assertDeepEquals([3, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7500
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [4, 5, 6];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([4, 4, 5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7600
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [7, 8, 9];
        const result = copyWithin(arr, 2, 1);
        expect([...result]).assertDeepEquals([7, 8, 8]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7700
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 3, 0);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7800
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest7900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest7900
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest7900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [12];
        const result = copyWithin(arr, 0, 0);
        expect([...result]).assertDeepEquals([12]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8000
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int): FixedArray<int> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5, 5, 5];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([5, 5, 5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8100
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([1, 1, 2, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8200
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8300
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([1, 2, 1, 2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8400
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8500
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8600
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8700
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8700
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8800
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8800
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end: int): FixedArray<int> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [9, 9, 9, 9];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([9, 9, 9, 9]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest8900
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest8900
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([1, 1, 2, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9000
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9000
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9100
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9100
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([1, 2, 1, 2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9200
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9200
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3, 4];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9300
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9300
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9400
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9400
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9500
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9500
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinSecondPrototypebTest9600
     * @tc.name builtinsArrayCopyWithinSecondPrototypebTest9600
     * @tc.desc copyWithin(self: FixedArray<int>, target: int, start: int, end?: int): FixedArray<int> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinSecondPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        let caseName = 'builtinsArrayCopyWithinSecondPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [9, 9, 9, 9];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([9, 9, 9, 9]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}