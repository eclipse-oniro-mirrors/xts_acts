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
export default function builtinsArrayFillSecondPrototypebTest(){
  describe('builtinsArrayFillSecondPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayFillSecondPrototypebTest0100
     * @tc.name builtinsArrayFillSecondPrototypebTest0100
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) 全部填充为1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 1.1.toFloat(), 0, 3);
        expect(result[0]).assertEqual(1.1.toFloat());
        expect(result[1]).assertEqual(1.1.toFloat());
        expect(result[2]).assertEqual(1.1.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0200
     * @tc.name builtinsArrayFillSecondPrototypebTest0200
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) 部分填充为2.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 2.2.toFloat(), 1, 3);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(2.2.toFloat());
        expect(result[2]).assertEqual(2.2.toFloat());
        expect(result[3]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0300
     * @tc.name builtinsArrayFillSecondPrototypebTest0300
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 4.4.toFloat(), 5.5.toFloat()];
        const result = fill(arr, 9.9.toFloat(), 1, 1);
        expect(result[0]).assertEqual(3.3.toFloat());
        expect(result[1]).assertEqual(4.4.toFloat());
        expect(result[2]).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0400
     * @tc.name builtinsArrayFillSecondPrototypebTest0400
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) 填充部分为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()];
        const result = fill(arr, 5.5.toFloat(), 2, 4);
        expect(result[0]).assertEqual(7.7.toFloat());
        expect(result[1]).assertEqual(7.7.toFloat());
        expect(result[2]).assertEqual(5.5.toFloat());
        expect(result[3]).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0500
     * @tc.name builtinsArrayFillSecondPrototypebTest0500
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 8.8.toFloat(), -2, 3);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(0.0.toFloat());
        expect(result[2]).assertEqual(8.8.toFloat());
        expect(result[3]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0600
     * @tc.name builtinsArrayFillSecondPrototypebTest0600
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 6.6.toFloat(), 1, 10);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(6.6.toFloat());
        expect(result[2]).assertEqual(6.6.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0700
     * @tc.name builtinsArrayFillSecondPrototypebTest0700
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 4.4.toFloat(), -3, -1);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(4.4.toFloat());
        expect(result[2]).assertEqual(4.4.toFloat());
        expect(result[3]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0800
     * @tc.name builtinsArrayFillSecondPrototypebTest0800
     * @tc.desc fill(self: FixedArray<float>, value: float, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = fill(arr, 1.1.toFloat(), 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest0900
     * @tc.name builtinsArrayFillSecondPrototypebTest0900
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) 只传value，全部填充为1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 1.1.toFloat());
        expect(result[0]).assertEqual(1.1.toFloat());
        expect(result[1]).assertEqual(1.1.toFloat());
        expect(result[2]).assertEqual(1.1.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1000
     * @tc.name builtinsArrayFillSecondPrototypebTest1000
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 2.2.toFloat(), 2);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(0.0.toFloat());
        expect(result[2]).assertEqual(2.2.toFloat());
        expect(result[3]).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1100
     * @tc.name builtinsArrayFillSecondPrototypebTest1100
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 3.3.toFloat(), undefined, 2);
        expect(result[0]).assertEqual(3.3.toFloat());
        expect(result[1]).assertEqual(3.3.toFloat());
        expect(result[2]).assertEqual(0.0.toFloat());
        expect(result[3]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1200
     * @tc.name builtinsArrayFillSecondPrototypebTest1200
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) start和end都不传，全部填充为4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()];
        const result = fill(arr, 4.4.toFloat());
        expect(result[0]).assertEqual(4.4.toFloat());
        expect(result[1]).assertEqual(4.4.toFloat());
        expect(result[2]).assertEqual(4.4.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1300
     * @tc.name builtinsArrayFillSecondPrototypebTest1300
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 5.5.toFloat(), -2);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(0.0.toFloat());
        expect(result[2]).assertEqual(5.5.toFloat());
        expect(result[3]).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1400
     * @tc.name builtinsArrayFillSecondPrototypebTest1400
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 6.6.toFloat(), 1, 10);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(6.6.toFloat());
        expect(result[2]).assertEqual(6.6.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1500
     * @tc.name builtinsArrayFillSecondPrototypebTest1500
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = fill(arr, 7.7.toFloat(), -3, -1);
        expect(result[0]).assertEqual(0.0.toFloat());
        expect(result[1]).assertEqual(7.7.toFloat());
        expect(result[2]).assertEqual(7.7.toFloat());
        expect(result[3]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1600
     * @tc.name builtinsArrayFillSecondPrototypebTest1600
     * @tc.desc fill(self: FixedArray<float>, value: float, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = fill(arr, 1.1.toFloat(), 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1700
     * @tc.name builtinsArrayFillSecondPrototypebTest1700
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) 全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0];
        const result = fill(arr, 1 , 0, 3);
        expect(result[0]).assertEqual(1 );
        expect(result[1]).assertEqual(1 );
        expect(result[2]).assertEqual(1 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1800
     * @tc.name builtinsArrayFillSecondPrototypebTest1800
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) 部分填充为2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0, 0];
        const result = fill(arr, 2 , 1, 3);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(2 );
        expect(result[2]).assertEqual(2 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest1900
     * @tc.name builtinsArrayFillSecondPrototypebTest1900
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3 , 4 , 5 ];
        const result = fill(arr, 9 , 1, 1);
        expect(result[0]).assertEqual(3 );
        expect(result[1]).assertEqual(4 );
        expect(result[2]).assertEqual(5 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2000
     * @tc.name builtinsArrayFillSecondPrototypebTest2000
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) 填充部分为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [7 , 7 , 7 , 7 ];
        const result = fill(arr, 5 , 2, 4);
        expect(result[0]).assertEqual(7 );
        expect(result[1]).assertEqual(7 );
        expect(result[2]).assertEqual(5 );
        expect(result[3]).assertEqual(5 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2100
     * @tc.name builtinsArrayFillSecondPrototypebTest2100
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0 , 0 , 0 , 0 ];
        const result = fill(arr, 8 , -2, 3);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(0 );
        expect(result[2]).assertEqual(8 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2200
     * @tc.name builtinsArrayFillSecondPrototypebTest2200
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0 , 0 , 0 ];
        const result = fill(arr, 6 , 1, 10);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(6 );
        expect(result[2]).assertEqual(6 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2300
     * @tc.name builtinsArrayFillSecondPrototypebTest2300
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0 , 0 , 0 , 0 ];
        const result = fill(arr, 4 , -3, -1);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(4 );
        expect(result[2]).assertEqual(4 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2400
     * @tc.name builtinsArrayFillSecondPrototypebTest2400
     * @tc.desc fill(self: FixedArray<int>, value: int, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = fill(arr, 1 , 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2500
     * @tc.name builtinsArrayFillSecondPrototypebTest2500
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) 只传value，全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0];
        const result = fill(arr, 1 );
        expect(result[0]).assertEqual(1 );
        expect(result[1]).assertEqual(1 );
        expect(result[2]).assertEqual(1 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2600
     * @tc.name builtinsArrayFillSecondPrototypebTest2600
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0, 0];
        const result = fill(arr, 2 , 2);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(0 );
        expect(result[2]).assertEqual(2 );
        expect(result[3]).assertEqual(2 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2700
     * @tc.name builtinsArrayFillSecondPrototypebTest2700
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0, 0];
        const result = fill(arr, 3 , undefined, 2);
        expect(result[0]).assertEqual(3 );
        expect(result[1]).assertEqual(3 );
        expect(result[2]).assertEqual(0 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2800
     * @tc.name builtinsArrayFillSecondPrototypebTest2800
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) start和end都不传，全部填充为4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [7 , 7 , 7 ];
        const result = fill(arr, 4 );
        expect(result[0]).assertEqual(4 );
        expect(result[1]).assertEqual(4 );
        expect(result[2]).assertEqual(4 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest2900
     * @tc.name builtinsArrayFillSecondPrototypebTest2900
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0, 0];
        const result = fill(arr, 5 , -2);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(0 );
        expect(result[2]).assertEqual(5 );
        expect(result[3]).assertEqual(5 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3000
     * @tc.name builtinsArrayFillSecondPrototypebTest3000
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0];
        const result = fill(arr, 6 , 1, 10);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(6 );
        expect(result[2]).assertEqual(6 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3100
     * @tc.name builtinsArrayFillSecondPrototypebTest3100
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, 0, 0, 0];
        const result = fill(arr, 7 , -3, -1);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(7 );
        expect(result[2]).assertEqual(7 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3200
     * @tc.name builtinsArrayFillSecondPrototypebTest3200
     * @tc.desc fill(self: FixedArray<int>, value: int, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = fill(arr, 1 , 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3300
     * @tc.name builtinsArrayFillSecondPrototypebTest3300
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) 全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0];
        const result = fill(arr, 1 as long, 0, 3);
        expect(result[0]).assertEqual(1 as long);
        expect(result[1]).assertEqual(1 as long);
        expect(result[2]).assertEqual(1 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3400
     * @tc.name builtinsArrayFillSecondPrototypebTest3400
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) 部分填充为2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0, 0];
        const result = fill(arr, 2 as long, 1, 3);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(2 as long);
        expect(result[2]).assertEqual(2 as long);
        expect(result[3]).assertEqual(0 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3500
     * @tc.name builtinsArrayFillSecondPrototypebTest3500
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3 as long, 4 as long, 5 as long];
        const result = fill(arr, 9 as long, 1, 1);
        expect(result[0]).assertEqual(3 as long);
        expect(result[1]).assertEqual(4 as long);
        expect(result[2]).assertEqual(5 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3600
     * @tc.name builtinsArrayFillSecondPrototypebTest3600
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) 填充部分为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [7 as long, 7 as long, 7 as long, 7 as long];
        const result = fill(arr, 5 as long, 2, 4);
        expect(result[0]).assertEqual(7 as long);
        expect(result[1]).assertEqual(7 as long);
        expect(result[2]).assertEqual(5 as long);
        expect(result[3]).assertEqual(5 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3700
     * @tc.name builtinsArrayFillSecondPrototypebTest3700
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long, 0 as long, 0 as long, 0 as long];
        const result = fill(arr, 8 as long, -2, 3);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(0 as long);
        expect(result[2]).assertEqual(8 as long);
        expect(result[3]).assertEqual(0 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3800
     * @tc.name builtinsArrayFillSecondPrototypebTest3800
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long, 0 as long, 0 as long];
        const result = fill(arr, 6 as long, 1, 10);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(6 as long);
        expect(result[2]).assertEqual(6 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest3900
     * @tc.name builtinsArrayFillSecondPrototypebTest3900
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long, 0 as long, 0 as long, 0 as long];
        const result = fill(arr, 4 as long, -3, -1);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(4 as long);
        expect(result[2]).assertEqual(4 as long);
        expect(result[3]).assertEqual(0 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4000
     * @tc.name builtinsArrayFillSecondPrototypebTest4000
     * @tc.desc fill(self: FixedArray<long>, value: long, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = fill(arr, 1 as long, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4100
     * @tc.name builtinsArrayFillSecondPrototypebTest4100
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) 只传value，全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0];
        const result = fill(arr, 1 as long);
        expect(result[0]).assertEqual(1 as long);
        expect(result[1]).assertEqual(1 as long);
        expect(result[2]).assertEqual(1 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4200
     * @tc.name builtinsArrayFillSecondPrototypebTest4200
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0, 0];
        const result = fill(arr, 2 as long, 2);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(0 as long);
        expect(result[2]).assertEqual(2 as long);
        expect(result[3]).assertEqual(2 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4300
     * @tc.name builtinsArrayFillSecondPrototypebTest4300
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0, 0];
        const result = fill(arr, 3 as long, undefined, 2);
        expect(result[0]).assertEqual(3 as long);
        expect(result[1]).assertEqual(3 as long);
        expect(result[2]).assertEqual(0 as long);
        expect(result[3]).assertEqual(0 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4400
     * @tc.name builtinsArrayFillSecondPrototypebTest4400
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) start和end都不传，全部填充为4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [7 as long, 7 as long, 7 as long];
        const result = fill(arr, 4 as long);
        expect(result[0]).assertEqual(4 as long);
        expect(result[1]).assertEqual(4 as long);
        expect(result[2]).assertEqual(4 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4500
     * @tc.name builtinsArrayFillSecondPrototypebTest4500
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0, 0];
        const result = fill(arr, 5 as long, -2);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(0 as long);
        expect(result[2]).assertEqual(5 as long);
        expect(result[3]).assertEqual(5 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4600
     * @tc.name builtinsArrayFillSecondPrototypebTest4600
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0];
        const result = fill(arr, 6 as long, 1, 10);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(6 as long);
        expect(result[2]).assertEqual(6 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4700
     * @tc.name builtinsArrayFillSecondPrototypebTest4700
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0, 0, 0, 0];
        const result = fill(arr, 7 as long, -3, -1);
        expect(result[0]).assertEqual(0 as long);
        expect(result[1]).assertEqual(7 as long);
        expect(result[2]).assertEqual(7 as long);
        expect(result[3]).assertEqual(0 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4800
     * @tc.name builtinsArrayFillSecondPrototypebTest4800
     * @tc.desc fill(self: FixedArray<long>, value: long, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = fill(arr, 1 as long, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest4900
     * @tc.name builtinsArrayFillSecondPrototypebTest4900
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) 全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 0, 0];
        const result = fill(arr, 1 as short, 0, 3);
        expect(result[0]).assertEqual(1 as short);
        expect(result[1]).assertEqual(1 as short);
        expect(result[2]).assertEqual(1 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5000
     * @tc.name builtinsArrayFillSecondPrototypebTest5000
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) 部分填充为2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 0, 0, 0];
        const result = fill(arr, 2 as short, 1, 3);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(2 as short);
        expect(result[2]).assertEqual(2 as short);
        expect(result[3]).assertEqual(0 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5100
     * @tc.name builtinsArrayFillSecondPrototypebTest5100
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3 as short, 4 as short, 5 as short];
        const result = fill(arr, 9 as short, 1, 1);
        expect(result[0]).assertEqual(3 as short);
        expect(result[1]).assertEqual(4 as short);
        expect(result[2]).assertEqual(5 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5200
     * @tc.name builtinsArrayFillSecondPrototypebTest5200
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) 填充部分为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [7 as short, 7 as short, 7 as short, 7 as short];
        const result = fill(arr, 5 as short, 2, 4);
        expect(result[0]).assertEqual(7 as short);
        expect(result[1]).assertEqual(7 as short);
        expect(result[2]).assertEqual(5 as short);
        expect(result[3]).assertEqual(5 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5300
     * @tc.name builtinsArrayFillSecondPrototypebTest5300
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short, 0 as short];
        const result = fill(arr, 8 as short, -2, 3);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(0 as short);
        expect(result[2]).assertEqual(8 as short);
        expect(result[3]).assertEqual(0 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5400
     * @tc.name builtinsArrayFillSecondPrototypebTest5400
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short];
        const result = fill(arr, 6 as short, 1, 10);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(6 as short);
        expect(result[2]).assertEqual(6 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5500
     * @tc.name builtinsArrayFillSecondPrototypebTest5500
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short, 0 as short];
        const result = fill(arr, 4 as short, -3, -1);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(4 as short);
        expect(result[2]).assertEqual(4 as short);
        expect(result[3]).assertEqual(0 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5600
     * @tc.name builtinsArrayFillSecondPrototypebTest5600
     * @tc.desc fill(self: FixedArray<short>, value: short, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = fill(arr, 1 as short, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5700
     * @tc.name builtinsArrayFillSecondPrototypebTest5700
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) 全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 0, 0];
        const result = fill(arr, 1 as short, 0, 3);
        expect(result[0]).assertEqual(1 as short);
        expect(result[1]).assertEqual(1 as short);
        expect(result[2]).assertEqual(1 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5800
     * @tc.name builtinsArrayFillSecondPrototypebTest5800
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) 部分填充为2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 0, 0, 0];
        const result = fill(arr, 2 as short, 1, 3);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(2 as short);
        expect(result[2]).assertEqual(2 as short);
        expect(result[3]).assertEqual(0 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest5900
     * @tc.name builtinsArrayFillSecondPrototypebTest5900
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) 只传value，全部填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3 as short, 4 as short, 5 as short];
        const result = fill(arr, 9 as short);
        expect(result[0]).assertEqual(9 as short);
        expect(result[1]).assertEqual(9 as short);
        expect(result[2]).assertEqual(9 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest6000
     * @tc.name builtinsArrayFillSecondPrototypebTest6000
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [7 as short, 7 as short, 7 as short, 7 as short];
        const result = fill(arr, 5 as short, 2);
        expect(result[0]).assertEqual(7 as short);
        expect(result[1]).assertEqual(7 as short);
        expect(result[2]).assertEqual(5 as short);
        expect(result[3]).assertEqual(5 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest6100
     * @tc.name builtinsArrayFillSecondPrototypebTest6100
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short, 0 as short];
        const result = fill(arr, 8 as short, -2, 3);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(0 as short);
        expect(result[2]).assertEqual(8 as short);
        expect(result[3]).assertEqual(0 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest6200
     * @tc.name builtinsArrayFillSecondPrototypebTest6200
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short];
        const result = fill(arr, 6 as short, 1, 10);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(6 as short);
        expect(result[2]).assertEqual(6 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest6300
     * @tc.name builtinsArrayFillSecondPrototypebTest6300
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short, 0 as short, 0 as short, 0 as short];
        const result = fill(arr, 4 as short, -3, -1);
        expect(result[0]).assertEqual(0 as short);
        expect(result[1]).assertEqual(4 as short);
        expect(result[2]).assertEqual(4 as short);
        expect(result[3]).assertEqual(0 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillSecondPrototypebTest6400
     * @tc.name builtinsArrayFillSecondPrototypebTest6400
     * @tc.desc fill(self: FixedArray<short>, value: short, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = fill(arr, 1 as short, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}