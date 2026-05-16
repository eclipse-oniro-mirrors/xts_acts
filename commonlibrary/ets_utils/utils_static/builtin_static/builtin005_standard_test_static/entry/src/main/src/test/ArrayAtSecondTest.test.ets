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
export default function builtinsArrayAtSecondPrototypebTest() {
  describe('builtinsArrayAtSecondPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayAtSecondPrototypebTest0100
     * @tc.name builtinsArrayAtSecondPrototypebTest0100
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, 0);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest0200
     * @tc.name builtinsArrayAtSecondPrototypebTest0200
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, 1);
        expect(result).assertEqual(200);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest0300
     * @tc.name builtinsArrayAtSecondPrototypebTest0300
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, -1);
        expect(result).assertEqual(300);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest0400
     * @tc.name builtinsArrayAtSecondPrototypebTest0400
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, -3);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest0700
     * @tc.name builtinsArrayAtSecondPrototypebTest0700
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(999);
        expect(result2).assertEqual(999);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest0800
     * @tc.name builtinsArrayAtSecondPrototypebTest0800
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0];
        const result = at(arr, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest0900
     * @tc.name builtinsArrayAtSecondPrototypebTest0900
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, 0);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1000
     * @tc.name builtinsArrayAtSecondPrototypebTest1000
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, 1);
        expect(result).assertEqual(200);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1100
     * @tc.name builtinsArrayAtSecondPrototypebTest1100
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, -1);
        expect(result).assertEqual(300);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1200
     * @tc.name builtinsArrayAtSecondPrototypebTest1200
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = at(arr, -3);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1500
     * @tc.name builtinsArrayAtSecondPrototypebTest1500
     * @tc.desc at(self: FixedArray<long>, index: int): Long | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [999];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(999);
        expect(result2).assertEqual(999);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1700
     * @tc.name builtinsArrayAtSecondPrototypebTest1700
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, 0);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1800
     * @tc.name builtinsArrayAtSecondPrototypebTest1800
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, 1);
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest1900
     * @tc.name builtinsArrayAtSecondPrototypebTest1900
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, -1);
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest2000
     * @tc.name builtinsArrayAtSecondPrototypebTest2000
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, -3);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest2300
     * @tc.name builtinsArrayAtSecondPrototypebTest2300
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [99];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(99);
        expect(result2).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest2500
     * @tc.name builtinsArrayAtSecondPrototypebTest2500
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, 0);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest2600
     * @tc.name builtinsArrayAtSecondPrototypebTest2600
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, 1);
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest2700
     * @tc.name builtinsArrayAtSecondPrototypebTest2700
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, -1);
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest2800
     * @tc.name builtinsArrayAtSecondPrototypebTest2800
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = at(arr, -3);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtSecondPrototypebTest3100
     * @tc.name builtinsArrayAtSecondPrototypebTest3100
     * @tc.desc at(self: FixedArray<short>, index: int): Short | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [99];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(99);
        expect(result2).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })

  })
}
