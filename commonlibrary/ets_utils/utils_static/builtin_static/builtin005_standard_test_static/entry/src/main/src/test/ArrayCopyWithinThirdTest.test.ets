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
export default function builtinsArrayCopyWithinThirdPrototypebTest(){
  describe('builtinsArrayCopyWithinThirdPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0100
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0100
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1);
        const target: FixedArray<long> = [1, 1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0200
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0200
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5, 6, 7];
        const result = copyWithin(arr, 3);
        const target: FixedArray<long> = [5, 6, 7];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0300
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0300
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> target为0，完整复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [8, 9, 10];
        const result = copyWithin(arr, 0);
        const target: FixedArray<long> = [8, 9, 10];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0400
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0400
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0500
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0500
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [11];
        const result = copyWithin(arr, 0);
        const target: FixedArray<long> = [11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0600
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0600
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, -9);
        const target: FixedArray<long> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0700
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0700
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [7, 7, 7];
        const result = copyWithin(arr, 1);
        const target: FixedArray<long> = [7, 7, 7];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0800
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0800
     * @tc.desc copyWithin(self: FixedArray<long>, target: int): FixedArray<long> target为数组长度-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = copyWithin(arr, 3);
        const target: FixedArray<long> = [1, 2, 3, 1];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest0900
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest0900
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 0, 1);
        const target: FixedArray<long> = [2, 3, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1000
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1000
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2);
        const target: FixedArray<long> = [3, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1100
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1100
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [4, 5, 6];
        const result = copyWithin(arr, 1, 0);
        const target: FixedArray<long> = [4, 4, 5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1200
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1200
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [7, 8, 9];
        const result = copyWithin(arr, 2, 1);
        const target: FixedArray<long> = [7, 8, 8];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1300
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1300
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 3, 0);
        const target: FixedArray<long> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1400
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1400
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1500
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1500
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [12];
        const result = copyWithin(arr, 0, 0);
        const target: FixedArray<long> = [12];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1600
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1600
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int): FixedArray<long> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5, 5, 5];
        const result = copyWithin(arr, 1, 0);
        const target: FixedArray<long> = [5, 5, 5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1700
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1700
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1, 0, 2);
        const target: FixedArray<long> = [1, 1, 2, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1800
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1800
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2, 1);
        const target: FixedArray<long> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest1900
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest1900
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = copyWithin(arr, 2, 0, 3);
        const target: FixedArray<long> = [1, 2, 1, 2];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2000
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2000
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [2, 3, 4];
        const result = copyWithin(arr, 5, 0, 2);
        const target: FixedArray<long> = [2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2100
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2100
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2200
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2200
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5];
        const result = copyWithin(arr, 0, 0, 1);
        const target: FixedArray<long> = [5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2300
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2300
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 0, 5, 10);
        const target: FixedArray<long> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2400
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2400
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end: int): FixedArray<long> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [9, 9, 9, 9];
        const result = copyWithin(arr, 1, 0, 3);
        const target: FixedArray<long> = [9, 9, 9, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2500
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2500
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1, 0, 2);
        const target: FixedArray<long> = [1, 1, 2, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2600
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2600
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2, 1);
        const target: FixedArray<long> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2700
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2700
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = copyWithin(arr, 2, 0, 3);
        const target: FixedArray<long> = [1, 2, 1, 2];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2800
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2800
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [2, 3, 4];
        const result = copyWithin(arr, 5, 0, 2);
        const target: FixedArray<long> = [2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest2900
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest2900
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest3000
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest3000
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5];
        const result = copyWithin(arr, 0, 0, 1);
        const target: FixedArray<long> = [5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest3100
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest3100
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = copyWithin(arr, 0, 5, 10);
        const target: FixedArray<long> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinThirdPrototypebTest3200
     * @tc.name builtinsArrayCopyWithinThirdPrototypebTest3200
     * @tc.desc copyWithin(self: FixedArray<long>, target: int, start: int, end?: int): FixedArray<long> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinThirdPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinThirdPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [9, 9, 9, 9];
        const result = copyWithin(arr, 1, 0, 3);
        const target: FixedArray<long> = [9, 9, 9, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3300
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3300
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 0, 1);
        const target: FixedArray<short> = [2, 3, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3400
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3400
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2);
        const target: FixedArray<short> = [3, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3500
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3500
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [4, 5, 6];
        const result = copyWithin(arr, 1, 0);
        const target: FixedArray<short> = [4, 4, 5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3600
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3600
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [7, 8, 9];
        const result = copyWithin(arr, 2, 1);
        const target: FixedArray<short> = [7, 8, 8];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3700
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3700
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 3, 0);
        const target: FixedArray<short> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3800
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3800
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest3900
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest3900
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12];
        const result = copyWithin(arr, 0, 0);
        const target: FixedArray<short> = [12];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4000
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4000
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int): FixedArray<short> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 5, 5];
        const result = copyWithin(arr, 1, 0);
        const target: FixedArray<short> = [5, 5, 5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4100
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4100
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1);
        const target: FixedArray<short> = [1, 1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4200
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4200
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 6, 7];
        const result = copyWithin(arr, 3);
        const target: FixedArray<short> = [5, 6, 7];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4300
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4300
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> target为0，完整复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [8, 9, 10];
        const result = copyWithin(arr, 0);
        const target: FixedArray<short> = [8, 9, 10];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4400
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4400
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4500
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4500
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [11];
        const result = copyWithin(arr, 0);
        const target: FixedArray<short> = [11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4600
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4600
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, -9);
        const target: FixedArray<short> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4700
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4700
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [7, 7, 7];
        const result = copyWithin(arr, 1);
        const target: FixedArray<short> = [7, 7, 7];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4800
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4800
     * @tc.desc copyWithin(self: FixedArray<short>, target: int): FixedArray<short> target为数组长度-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = copyWithin(arr, 3);
        const target: FixedArray<short> = [1, 2, 3, 1];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest4900
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest4900
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1, 0, 2);
        const target: FixedArray<short> = [1, 1, 2, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5000
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5000
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2, 1);
        const target: FixedArray<short> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5100
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5100
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = copyWithin(arr, 2, 0, 3);
        const target: FixedArray<short> = [1, 2, 1, 2];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5200
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5200
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 3, 4];
        const result = copyWithin(arr, 5, 0, 2);
        const target: FixedArray<short> = [2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5300
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5300
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5400
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5400
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5];
        const result = copyWithin(arr, 0, 0, 1);
        const target: FixedArray<short> = [5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5500
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5500
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 0, 5, 10);
        const target: FixedArray<short> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5600
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5600
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end: int): FixedArray<short> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [9, 9, 9, 9];
        const result = copyWithin(arr, 1, 0, 3);
        const target: FixedArray<short> = [9, 9, 9, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5700
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5700
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = copyWithin(arr, 1, 0, 2);
        const target: FixedArray<short> = [1, 1, 2, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5800
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5800
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2, 1);
        const target: FixedArray<short> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest5900
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest5900
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = copyWithin(arr, 2, 0, 3);
        const target: FixedArray<short> = [1, 2, 1, 2];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest6000
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest6000
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [2, 3, 4];
        const result = copyWithin(arr, 5, 0, 2);
        const target: FixedArray<short> = [2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest6100
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest6100
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest6200
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest6200
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5];
        const result = copyWithin(arr, 0, 0, 1);
        const target: FixedArray<short> = [5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest6300
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest6300
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = copyWithin(arr, 0, 5, 10);
        const target: FixedArray<short> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinFourthPrototypebTest6400
     * @tc.name builtinsArrayCopyWithinFourthPrototypebTest6400
     * @tc.desc copyWithin(self: FixedArray<short>, target: int, start: int, end?: int): FixedArray<short> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinFourthPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinFourthPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [9, 9, 9, 9];
        const result = copyWithin(arr, 1, 0, 3);
        const target: FixedArray<short> = [9, 9, 9, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}