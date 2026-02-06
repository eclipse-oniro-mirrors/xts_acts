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
export default function builtinsArrayCopyWithinPrototypebTest(){
  describe('builtinsArrayCopyWithinPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayCopyWithinPrototypebTest0100
     * @tc.name builtinsArrayCopyWithinPrototypebTest0100
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> target为0，完整复制自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0200
     * @tc.name builtinsArrayCopyWithinPrototypebTest0200
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> target为1，后移一位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([true, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0300
     * @tc.name builtinsArrayCopyWithinPrototypebTest0300
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> target为2，后移两位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 2);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0400
     * @tc.name builtinsArrayCopyWithinPrototypebTest0400
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = copyWithin(arr, -1);
        expect([...result]).assertDeepEquals([false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0500
     * @tc.name builtinsArrayCopyWithinPrototypebTest0500
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([true, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0600
     * @tc.name builtinsArrayCopyWithinPrototypebTest0600
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0700
     * @tc.name builtinsArrayCopyWithinPrototypebTest0700
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0800
     * @tc.name builtinsArrayCopyWithinPrototypebTest0800
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int): FixedArray<boolean> target为0，全部为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([false, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest0900
     * @tc.name builtinsArrayCopyWithinPrototypebTest0900
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0, 1);
        expect([...result]).assertDeepEquals([false, true, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1000
     * @tc.name builtinsArrayCopyWithinPrototypebTest1000
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0, 2);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1100
     * @tc.name builtinsArrayCopyWithinPrototypebTest1100
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([false, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1200
     * @tc.name builtinsArrayCopyWithinPrototypebTest1200
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 2, 1);
        expect([...result]).assertDeepEquals([true, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1300
     * @tc.name builtinsArrayCopyWithinPrototypebTest1300
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
        const result = copyWithin(arr, 3, 0);
        expect([...result]).assertDeepEquals([true, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1400
     * @tc.name builtinsArrayCopyWithinPrototypebTest1400
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1500
     * @tc.name builtinsArrayCopyWithinPrototypebTest1500
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = copyWithin(arr, 0, 0);
        expect([...result]).assertDeepEquals([true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1600
     * @tc.name builtinsArrayCopyWithinPrototypebTest1600
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int): FixedArray<boolean> start=2, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 1, 2);
        expect([...result]).assertDeepEquals([true, true, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1700
     * @tc.name builtinsArrayCopyWithinPrototypebTest1700
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([true, true, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1800
     * @tc.name builtinsArrayCopyWithinPrototypebTest1800
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest1900
     * @tc.name builtinsArrayCopyWithinPrototypebTest1900
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([true, false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2000
     * @tc.name builtinsArrayCopyWithinPrototypebTest2000
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2100
     * @tc.name builtinsArrayCopyWithinPrototypebTest2100
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2200
     * @tc.name builtinsArrayCopyWithinPrototypebTest2200
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2300
     * @tc.name builtinsArrayCopyWithinPrototypebTest2300
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2400
     * @tc.name builtinsArrayCopyWithinPrototypebTest2400
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end: int): FixedArray<boolean> 全部为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([false, false, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2500
     * @tc.name builtinsArrayCopyWithinPrototypebTest2500
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> target和start为number类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([true, true, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2600
     * @tc.name builtinsArrayCopyWithinPrototypebTest2600
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> end省略，默认到末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0, 1);
        expect([...result]).assertDeepEquals([false, true, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2700
     * @tc.name builtinsArrayCopyWithinPrototypebTest2700
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> 浮点数参数自动取整
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([true, true, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2800
     * @tc.name builtinsArrayCopyWithinPrototypebTest2800
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> end小于start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest2900
     * @tc.name builtinsArrayCopyWithinPrototypebTest2900
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3000
     * @tc.name builtinsArrayCopyWithinPrototypebTest3000
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3100
     * @tc.name builtinsArrayCopyWithinPrototypebTest3100
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3200
     * @tc.name builtinsArrayCopyWithinPrototypebTest3200
     * @tc.desc copyWithin(self: FixedArray<boolean>, target: int, start: int, end?: int): FixedArray<boolean> 全部为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([false, false, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3300
     * @tc.name builtinsArrayCopyWithinPrototypebTest3300
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> target为0，完整复制自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 0);
        const target: FixedArray<byte> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3400
     * @tc.name builtinsArrayCopyWithinPrototypebTest3400
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> target为1，后移一位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 1);
        const target: FixedArray<byte> = [1, 1, 2];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3500
     * @tc.name builtinsArrayCopyWithinPrototypebTest3500
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> target为2，后移两位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 2);
        const target: FixedArray<byte> = [1, 2, 1];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3600
     * @tc.name builtinsArrayCopyWithinPrototypebTest3600
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 4];
        const result = copyWithin(arr, -66);      //这里 -1  会Out of bounds
        const target: FixedArray<byte> = [2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3700
     * @tc.name builtinsArrayCopyWithinPrototypebTest3700
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 3);
        const target: FixedArray<byte> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3800
     * @tc.name builtinsArrayCopyWithinPrototypebTest3800
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest3900
     * @tc.name builtinsArrayCopyWithinPrototypebTest3900
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5];
        const result = copyWithin(arr, 0);
        const target: FixedArray<byte> = [5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4000
     * @tc.name builtinsArrayCopyWithinPrototypebTest4000
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int): FixedArray<byte> 全部为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = copyWithin(arr, 0);
        const target: FixedArray<byte> = [0, 0, 0];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4100
     * @tc.name builtinsArrayCopyWithinPrototypebTest4100
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 0, 1);
        const target: FixedArray<byte> = [2, 3, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4200
     * @tc.name builtinsArrayCopyWithinPrototypebTest4200
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 0, 2);
        const target: FixedArray<byte> = [3, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4300
     * @tc.name builtinsArrayCopyWithinPrototypebTest4300
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 4];
        const result = copyWithin(arr, 1, 0);
        const target: FixedArray<byte> = [2, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4400
     * @tc.name builtinsArrayCopyWithinPrototypebTest4400
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 2, 1);
        const target: FixedArray<byte> = [1, 2, 2];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4500
     * @tc.name builtinsArrayCopyWithinPrototypebTest4500
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = copyWithin(arr, 3, 0);
        const target: FixedArray<byte> = [1, 2, 3];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4600
     * @tc.name builtinsArrayCopyWithinPrototypebTest4600
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4700
     * @tc.name builtinsArrayCopyWithinPrototypebTest4700
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5];
        const result = copyWithin(arr, 0, 0);
        const target: FixedArray<byte> = [5];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypebTest4800
     * @tc.name builtinsArrayCopyWithinPrototypebTest4800
     * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int): FixedArray<byte> 全部为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = copyWithin(arr, 0, 0);
        const target: FixedArray<byte> = [0, 0, 0];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

      /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest4900
         * @tc.name builtinsArrayCopyWithinPrototypebTest4900
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> 正常区间复制
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest4900';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3, 4];
            const result = copyWithin(arr, 1, 0, 2);
            const target: FixedArray<byte> = [1, 1, 2, 4];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5000
         * @tc.name builtinsArrayCopyWithinPrototypebTest5000
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> end<=start无变化
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5000';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3];
            const result = copyWithin(arr, 0, 2, 1);
            const target: FixedArray<byte> = [1, 2, 3];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5100
         * @tc.name builtinsArrayCopyWithinPrototypebTest5100
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> target>start反向复制
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5100';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3, 4];
            const result = copyWithin(arr, 2, 0, 3);
            const target: FixedArray<byte> = [1, 2, 1, 2];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5200
         * @tc.name builtinsArrayCopyWithinPrototypebTest5200
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> target超界
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5200';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [2, 3, 4];
            const result = copyWithin(arr, 5, 0, 2);
            const target: FixedArray<byte> = [2, 3, 4];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5300
         * @tc.name builtinsArrayCopyWithinPrototypebTest5300
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> 空数组
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5300';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [];
            const result = copyWithin(arr, 0, 0, 1);
            expect(result.length).assertEqual(0);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5400
         * @tc.name builtinsArrayCopyWithinPrototypebTest5400
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> 单元素数组
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5400';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [5];
            const result = copyWithin(arr, 0, 0, 1);
            const target: FixedArray<byte> = [5];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5500
         * @tc.name builtinsArrayCopyWithinPrototypebTest5500
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> start和end都超界
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5500';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3];
            const result = copyWithin(arr, 0, 5, 10);
            const target: FixedArray<byte> = [1, 2, 3];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5600
         * @tc.name builtinsArrayCopyWithinPrototypebTest5600
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end: int): FixedArray<byte> 全部为0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5600';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [0, 0, 0, 0];
            const result = copyWithin(arr, 1, 0, 3);
            const target: FixedArray<byte> = [0, 0, 0, 0];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5700
         * @tc.name builtinsArrayCopyWithinPrototypebTest5700
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> 正常区间复制
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5700';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3, 4];
            const result = copyWithin(arr, 1, 0, 2);
            const target: FixedArray<byte> = [1, 1, 2, 4];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5800
         * @tc.name builtinsArrayCopyWithinPrototypebTest5800
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> end<=start无变化
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5800';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3];
            const result = copyWithin(arr, 0, 2, 1);
            const target: FixedArray<byte> = [1, 2, 3];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest5900
         * @tc.name builtinsArrayCopyWithinPrototypebTest5900
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> target>start反向复制
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest5900';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3, 4];
            const result = copyWithin(arr, 2, 0, 3);
            const target: FixedArray<byte> = [1, 2, 1, 2];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest6000
         * @tc.name builtinsArrayCopyWithinPrototypebTest6000
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> target超界
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest6000';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [2, 3, 4];
            const result = copyWithin(arr, 5, 0, 2);
            const target: FixedArray<byte> = [2, 3, 4];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest6100
         * @tc.name builtinsArrayCopyWithinPrototypebTest6100
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> 空数组
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest6100';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [];
            const result = copyWithin(arr, 0, 0, 1);
            expect(result.length).assertEqual(0);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest6200
         * @tc.name builtinsArrayCopyWithinPrototypebTest6200
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> 单元素数组
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest6200';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [5];
            const result = copyWithin(arr, 0, 0, 1);
            const target: FixedArray<byte> = [5];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest6300
         * @tc.name builtinsArrayCopyWithinPrototypebTest6300
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> start和end都超界
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest6300';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [1, 2, 3];
            const result = copyWithin(arr, 0, 5, 10);
            const target: FixedArray<byte> = [1, 2, 3];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

        /**
         * @tc.number builtinsArrayCopyWithinPrototypebTest6400
         * @tc.name builtinsArrayCopyWithinPrototypebTest6400
         * @tc.desc copyWithin(self: FixedArray<byte>, target: int, start: int, end?: int): FixedArray<byte> 全部为0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('builtinsArrayCopyWithinPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
          async (Done: () => void): Promise<void> => {
            const caseName = 'builtinsArrayCopyWithinPrototypebTest6400';
            console.info(`${caseName}, test start`);
            const arr: FixedArray<byte> = [0, 0, 0, 0];
            const result = copyWithin(arr, 1, 0, 3);
            const target: FixedArray<byte> = [0, 0, 0, 0];
            expect([...result]).assertDeepEquals([...target]);
            console.info(`${caseName}, test end`);
            Done();
          })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest6500
     * @tc.name builtinsArrayCopyWithinPrototypecTest6500
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([c'a', c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest6600
     * @tc.name builtinsArrayCopyWithinPrototypecTest6600
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> target大于等于数组长度，无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y', c'z'];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([c'x', c'y', c'z']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest6700
     * @tc.name builtinsArrayCopyWithinPrototypecTest6700
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> target为0，完整复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'm', c'n', c'o'];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([c'm', c'n', c'o']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest6800
     * @tc.name builtinsArrayCopyWithinPrototypecTest6800
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest6900
     * @tc.name builtinsArrayCopyWithinPrototypecTest6900
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'q'];
        const result = copyWithin(arr, 0);
        expect([...result]).assertDeepEquals([c'q']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7000
     * @tc.name builtinsArrayCopyWithinPrototypecTest7000
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> target为负数，等价于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, -9);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7100
     * @tc.name builtinsArrayCopyWithinPrototypecTest7100
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> 全部为同一字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'x', c'x'];
        const result = copyWithin(arr, 1);
        expect([...result]).assertDeepEquals([c'x', c'x', c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7200
     * @tc.name builtinsArrayCopyWithinPrototypecTest7200
     * @tc.desc copyWithin(self: FixedArray<char>, target: int): FixedArray<char> target为数组长度-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = copyWithin(arr, 3);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c', c'a']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7300
     * @tc.name builtinsArrayCopyWithinPrototypecTest7300
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> 从start=1开始复制到target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 0, 1);
        expect([...result]).assertDeepEquals([c'b', c'c', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7400
     * @tc.name builtinsArrayCopyWithinPrototypecTest7400
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> start=2, target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 0, 2);
        expect([...result]).assertDeepEquals([c'c', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7500
     * @tc.name builtinsArrayCopyWithinPrototypecTest7500
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> start=0, target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y', c'z'];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([c'x', c'x', c'y']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7600
     * @tc.name builtinsArrayCopyWithinPrototypecTest7600
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> start=1, target=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 2, 1);
        expect([...result]).assertDeepEquals([c'a', c'b', c'b']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7700
     * @tc.name builtinsArrayCopyWithinPrototypecTest7700
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> start=0, target=3(超界)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 3, 0);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7800
     * @tc.name builtinsArrayCopyWithinPrototypecTest7800
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = copyWithin(arr, 0, 0);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest7900
     * @tc.name builtinsArrayCopyWithinPrototypecTest7900
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest7900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'z'];
        const result = copyWithin(arr, 0, 0);
        expect([...result]).assertDeepEquals([c'z']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8000
     * @tc.name builtinsArrayCopyWithinPrototypecTest8000
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int): FixedArray<char> 全部为同一字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'x', c'x'];
        const result = copyWithin(arr, 1, 0);
        expect([...result]).assertDeepEquals([c'x', c'x', c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8100
     * @tc.name builtinsArrayCopyWithinPrototypecTest8100
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([c'a', c'a', c'b', c'd']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8200
     * @tc.name builtinsArrayCopyWithinPrototypecTest8200
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8300
     * @tc.name builtinsArrayCopyWithinPrototypecTest8300
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([c'a', c'b', c'a', c'b']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8400
     * @tc.name builtinsArrayCopyWithinPrototypecTest8400
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y', c'z'];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([c'x', c'y', c'z']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8500
     * @tc.name builtinsArrayCopyWithinPrototypecTest8500
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8600
     * @tc.name builtinsArrayCopyWithinPrototypecTest8600
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'z'];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([c'z']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8700
     * @tc.name builtinsArrayCopyWithinPrototypecTest8700
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8800
     * @tc.name builtinsArrayCopyWithinPrototypecTest8800
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end: int): FixedArray<char> 全部为同一字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'x', c'x', c'x'];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([c'x', c'x', c'x', c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest8900
     * @tc.name builtinsArrayCopyWithinPrototypecTest8900
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> 正常区间复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest8900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = copyWithin(arr, 1, 0, 2);
        expect([...result]).assertDeepEquals([c'a', c'a', c'b', c'd']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9000
     * @tc.name builtinsArrayCopyWithinPrototypecTest9000
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> end<=start无变化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 0, 2, 1);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9100
     * @tc.name builtinsArrayCopyWithinPrototypecTest9100
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> target>start反向复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = copyWithin(arr, 2, 0, 3);
        expect([...result]).assertDeepEquals([c'a', c'b', c'a', c'b']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9200
     * @tc.name builtinsArrayCopyWithinPrototypecTest9200
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> target超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y', c'z'];
        const result = copyWithin(arr, 5, 0, 2);
        expect([...result]).assertDeepEquals([c'x', c'y', c'z']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9300
     * @tc.name builtinsArrayCopyWithinPrototypecTest9300
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = copyWithin(arr, 0, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9400
     * @tc.name builtinsArrayCopyWithinPrototypecTest9400
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'z'];
        const result = copyWithin(arr, 0, 0, 1);
        expect([...result]).assertDeepEquals([c'z']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9500
     * @tc.name builtinsArrayCopyWithinPrototypecTest9500
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> start和end都超界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = copyWithin(arr, 0, 5, 10);
        expect([...result]).assertDeepEquals([c'a', c'b', c'c']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyWithinPrototypecTest9600
     * @tc.name builtinsArrayCopyWithinPrototypecTest9600
     * @tc.desc copyWithin(self: FixedArray<char>, target: int, start: int, end?: int): FixedArray<char> 全部为同一字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyWithinPrototypecTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyWithinPrototypecTest9600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'x', c'x', c'x'];
        const result = copyWithin(arr, 1, 0, 3);
        expect([...result]).assertDeepEquals([c'x', c'x', c'x', c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}