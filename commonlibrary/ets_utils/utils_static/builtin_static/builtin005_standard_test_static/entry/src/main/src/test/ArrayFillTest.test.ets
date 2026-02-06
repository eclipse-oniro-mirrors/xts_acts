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
export default function builtinsArrayFillPrototypebTest(){
  describe('builtinsArrayFillPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayFillPrototypebTest0100
     * @tc.name builtinsArrayFillPrototypebTest0100
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) 全部填充为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = fill(arr, true, 0, 3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0200
     * @tc.name builtinsArrayFillPrototypebTest0200
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) 部分填充为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, 1, 3);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0300
     * @tc.name builtinsArrayFillPrototypebTest0300
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = fill(arr, false, 1, 1);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0400
     * @tc.name builtinsArrayFillPrototypebTest0400
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) 填充部分为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, true];
        const result = fill(arr, false, 2, 4);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(false);
        expect(result[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0500
     * @tc.name builtinsArrayFillPrototypebTest0500
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, -2, 3);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0600
     * @tc.name builtinsArrayFillPrototypebTest0600
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = fill(arr, true, 1, 10);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0700
     * @tc.name builtinsArrayFillPrototypebTest0700
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, -3, -1);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0800
     * @tc.name builtinsArrayFillPrototypebTest0800
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = fill(arr, true, 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest0900
     * @tc.name builtinsArrayFillPrototypebTest0900
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) 只传value，全部填充为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = fill(arr, true);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1000
     * @tc.name builtinsArrayFillPrototypebTest1000
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, 2);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1100
     * @tc.name builtinsArrayFillPrototypebTest1100
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, undefined, 2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(false);
        expect(result[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1200
     * @tc.name builtinsArrayFillPrototypebTest1200
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) start和end都不传，全部填充为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = fill(arr, false);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1300
     * @tc.name builtinsArrayFillPrototypebTest1300
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, -2);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1400
     * @tc.name builtinsArrayFillPrototypebTest1400
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = fill(arr, true, 1, 10);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1500
     * @tc.name builtinsArrayFillPrototypebTest1500
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = fill(arr, true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1600
     * @tc.name builtinsArrayFillPrototypebTest1600
     * @tc.desc fill(self: FixedArray<boolean>, value: boolean, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = fill(arr, true, -3, -1);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1700
     * @tc.name builtinsArrayFillPrototypebTest1700
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) 全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = fill(arr, 1, 0, 3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(1);
        expect(result[2]).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1800
     * @tc.name builtinsArrayFillPrototypebTest1800
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) 部分填充为2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 2 , 1, 3);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(2);
        expect(result[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest1900
     * @tc.name builtinsArrayFillPrototypebTest1900
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 4, 5];
        const result = fill(arr, 9 , 1, 1);
        expect(result[0]).assertEqual(3);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2000
     * @tc.name builtinsArrayFillPrototypebTest2000
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) 填充部分为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [7, 7, 7, 7];
        const result = fill(arr, 5 , 2, 4);
        expect(result[0]).assertEqual(7);
        expect(result[1]).assertEqual(7);
        expect(result[2]).assertEqual(5);
        expect(result[3]).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2100
     * @tc.name builtinsArrayFillPrototypebTest2100
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 8 , -2, 3);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(8);
        expect(result[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2200
     * @tc.name builtinsArrayFillPrototypebTest2200
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = fill(arr, 6 , 1, 10);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(6);
        expect(result[2]).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2300
     * @tc.name builtinsArrayFillPrototypebTest2300
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 4 , -3, -1);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(4);
        expect(result[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2400
     * @tc.name builtinsArrayFillPrototypebTest2400
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = fill(arr, 1 , 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2500
     * @tc.name builtinsArrayFillPrototypebTest2500
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) 只传value，全部填充为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = fill(arr, 1 );
        expect(result[0]).assertEqual(1 );
        expect(result[1]).assertEqual(1 );
        expect(result[2]).assertEqual(1 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2600
     * @tc.name builtinsArrayFillPrototypebTest2600
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 2 , 2);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(0 );
        expect(result[2]).assertEqual(2 );
        expect(result[3]).assertEqual(2 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2700
     * @tc.name builtinsArrayFillPrototypebTest2700
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 3 , undefined, 2);
        expect(result[0]).assertEqual(3 );
        expect(result[1]).assertEqual(3 );
        expect(result[2]).assertEqual(0 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2800
     * @tc.name builtinsArrayFillPrototypebTest2800
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) start和end都不传，全部填充为4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [7 , 7 , 7 ];
        const result = fill(arr, 4 );
        expect(result[0]).assertEqual(4 );
        expect(result[1]).assertEqual(4 );
        expect(result[2]).assertEqual(4 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest2900
     * @tc.name builtinsArrayFillPrototypebTest2900
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 5 , -2);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(0 );
        expect(result[2]).assertEqual(5 );
        expect(result[3]).assertEqual(5 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3000
     * @tc.name builtinsArrayFillPrototypebTest3000
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = fill(arr, 6 , 1, 10);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(6 );
        expect(result[2]).assertEqual(6 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3100
     * @tc.name builtinsArrayFillPrototypebTest3100
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        const result = fill(arr, 7 , -3, -1);
        expect(result[0]).assertEqual(0 );
        expect(result[1]).assertEqual(7 );
        expect(result[2]).assertEqual(7 );
        expect(result[3]).assertEqual(0 );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3200
     * @tc.name builtinsArrayFillPrototypebTest3200
     * @tc.desc fill(self: FixedArray<byte>, value: byte, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = fill(arr, 1 , 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3300
     * @tc.name builtinsArrayFillPrototypebTest3300
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) 全部填充为'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'b', c'b'];
        const result = fill(arr, c'a', 0, 3);
        expect(result[0]).assertEqual(c'a');
        expect(result[1]).assertEqual(c'a');
        expect(result[2]).assertEqual(c'a');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3400
     * @tc.name builtinsArrayFillPrototypebTest3400
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) 部分填充为'c'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'b', c'b', c'b'];
        const result = fill(arr, c'c', 1, 3);
        expect(result[0]).assertEqual(c'b');
        expect(result[1]).assertEqual(c'c');
        expect(result[2]).assertEqual(c'c');
        expect(result[3]).assertEqual(c'b');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3500
     * @tc.name builtinsArrayFillPrototypebTest3500
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y', c'z'];
        const result = fill(arr, c'w', 1, 1);
        expect(result[0]).assertEqual(c'x');
        expect(result[1]).assertEqual(c'y');
        expect(result[2]).assertEqual(c'z');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3600
     * @tc.name builtinsArrayFillPrototypebTest3600
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) 填充部分为同一字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'd', c'd', c'd', c'd'];
        const result = fill(arr, c'e', 2, 4);
        expect(result[0]).assertEqual(c'd');
        expect(result[1]).assertEqual(c'd');
        expect(result[2]).assertEqual(c'e');
        expect(result[3]).assertEqual(c'e');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3700
     * @tc.name builtinsArrayFillPrototypebTest3700
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'f', c'f', c'f', c'f'];
        const result = fill(arr, c'g', -2, 3);
        expect(result[0]).assertEqual(c'f');
        expect(result[1]).assertEqual(c'f');
        expect(result[2]).assertEqual(c'g');
        expect(result[3]).assertEqual(c'f');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3800
     * @tc.name builtinsArrayFillPrototypebTest3800
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'h', c'h', c'h'];
        const result = fill(arr, c'i', 1, 10);
        expect(result[0]).assertEqual(c'h');
        expect(result[1]).assertEqual(c'i');
        expect(result[2]).assertEqual(c'i');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest3900
     * @tc.name builtinsArrayFillPrototypebTest3900
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'j', c'j', c'j', c'j'];
        const result = fill(arr, c'k', -3, -1);
        expect(result[0]).assertEqual(c'j');
        expect(result[1]).assertEqual(c'k');
        expect(result[2]).assertEqual(c'k');
        expect(result[3]).assertEqual(c'j');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4000
     * @tc.name builtinsArrayFillPrototypebTest4000
     * @tc.desc fill(self: FixedArray<char>, value: char, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = fill(arr, c'z', 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4100
     * @tc.name builtinsArrayFillPrototypebTest4100
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) 只传value，全部填充为'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'b', c'b'];
        const result = fill(arr, c'a');
        expect(result[0]).assertEqual(c'a');
        expect(result[1]).assertEqual(c'a');
        expect(result[2]).assertEqual(c'a');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4200
     * @tc.name builtinsArrayFillPrototypebTest4200
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'b', c'b', c'b'];
        const result = fill(arr, c'c', 2);
        expect(result[0]).assertEqual(c'b');
        expect(result[1]).assertEqual(c'b');
        expect(result[2]).assertEqual(c'c');
        expect(result[3]).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4300
     * @tc.name builtinsArrayFillPrototypebTest4300
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'b', c'b', c'b'];
        const result = fill(arr, c'd', undefined, 2);
        expect(result[0]).assertEqual(c'd');
        expect(result[1]).assertEqual(c'd');
        expect(result[2]).assertEqual(c'b');
        expect(result[3]).assertEqual(c'b');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4400
     * @tc.name builtinsArrayFillPrototypebTest4400
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) start和end都不传，全部填充为'e'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'f', c'f', c'f'];
        const result = fill(arr, c'e');
        expect(result[0]).assertEqual(c'e');
        expect(result[1]).assertEqual(c'e');
        expect(result[2]).assertEqual(c'e');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4500
     * @tc.name builtinsArrayFillPrototypebTest4500
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'g', c'g', c'g', c'g'];
        const result = fill(arr, c'h', -2);
        expect(result[0]).assertEqual(c'g');
        expect(result[1]).assertEqual(c'g');
        expect(result[2]).assertEqual(c'h');
        expect(result[3]).assertEqual(c'h');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4600
     * @tc.name builtinsArrayFillPrototypebTest4600
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'i', c'i', c'i'];
        const result = fill(arr, c'j', 1, 10);
        expect(result[0]).assertEqual(c'i');
        expect(result[1]).assertEqual(c'j');
        expect(result[2]).assertEqual(c'j');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4700
     * @tc.name builtinsArrayFillPrototypebTest4700
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'k', c'k', c'k', c'k'];
        const result = fill(arr, c'l', -3, -1);
        expect(result[0]).assertEqual(c'k');
        expect(result[1]).assertEqual(c'l');
        expect(result[2]).assertEqual(c'l');
        expect(result[3]).assertEqual(c'k');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4800
     * @tc.name builtinsArrayFillPrototypebTest4800
     * @tc.desc fill(self: FixedArray<char>, value: char, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = fill(arr, c'z', 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest4900
     * @tc.name builtinsArrayFillPrototypebTest4900
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) 全部填充为1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0];
        const result = fill(arr, 1.1.toDouble(), 0, 3);
        expect(result[0]).assertEqual(1.1.toDouble());
        expect(result[1]).assertEqual(1.1.toDouble());
        expect(result[2]).assertEqual(1.1.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5000
     * @tc.name builtinsArrayFillPrototypebTest5000
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) 部分填充为2.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0, 0.0];
        const result = fill(arr, 2.2.toDouble(), 1, 3);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(2.2.toDouble());
        expect(result[2]).assertEqual(2.2.toDouble());
        expect(result[3]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5100
     * @tc.name builtinsArrayFillPrototypebTest5100
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) start和end相等，不填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 4.4.toDouble(), 5.5.toDouble()];
        const result = fill(arr, 9.9.toDouble(), 1, 1);
        expect(result[0]).assertEqual(3.3.toDouble());
        expect(result[1]).assertEqual(4.4.toDouble());
        expect(result[2]).assertEqual(5.5.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5200
     * @tc.name builtinsArrayFillPrototypebTest5200
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) 填充部分为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [7.7.toDouble(), 7.7.toDouble(), 7.7.toDouble(), 7.7.toDouble()];
        const result = fill(arr, 5.5.toDouble(), 2, 4);
        expect(result[0]).assertEqual(7.7.toDouble());
        expect(result[1]).assertEqual(7.7.toDouble());
        expect(result[2]).assertEqual(5.5.toDouble());
        expect(result[3]).assertEqual(5.5.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5300
     * @tc.name builtinsArrayFillPrototypebTest5300
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) start为负数，end为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        const result = fill(arr, 8.8.toDouble(), -2, 3);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(0.0.toDouble());
        expect(result[2]).assertEqual(8.8.toDouble());
        expect(result[3]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5400
     * @tc.name builtinsArrayFillPrototypebTest5400
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        const result = fill(arr, 6.6.toDouble(), 1, 10);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(6.6.toDouble());
        expect(result[2]).assertEqual(6.6.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5500
     * @tc.name builtinsArrayFillPrototypebTest5500
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        const result = fill(arr, 4.4.toDouble(), -3, -1);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(4.4.toDouble());
        expect(result[2]).assertEqual(4.4.toDouble());
        expect(result[3]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5600
     * @tc.name builtinsArrayFillPrototypebTest5600
     * @tc.desc fill(self: FixedArray<double>, value: double, start: int, end: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = fill(arr, 1.1.toDouble(), 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5700
     * @tc.name builtinsArrayFillPrototypebTest5700
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) 只传value，全部填充为1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0];
        const result = fill(arr, 1.1.toDouble());
        expect(result[0]).assertEqual(1.1.toDouble());
        expect(result[1]).assertEqual(1.1.toDouble());
        expect(result[2]).assertEqual(1.1.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5800
     * @tc.name builtinsArrayFillPrototypebTest5800
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) 只传value和start，部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0, 0.0];
        const result = fill(arr, 2.2.toDouble(), 2);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(0.0.toDouble());
        expect(result[2]).assertEqual(2.2.toDouble());
        expect(result[3]).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest5900
     * @tc.name builtinsArrayFillPrototypebTest5900
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) 只传value和end，前半部分填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0, 0.0];
        const result = fill(arr, 3.3.toDouble(), undefined, 2);
        expect(result[0]).assertEqual(3.3.toDouble());
        expect(result[1]).assertEqual(3.3.toDouble());
        expect(result[2]).assertEqual(0.0.toDouble());
        expect(result[3]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest6000
     * @tc.name builtinsArrayFillPrototypebTest6000
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) start和end都不传，全部填充为4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [7.7.toDouble(), 7.7.toDouble(), 7.7.toDouble()];
        const result = fill(arr, 4.4.toDouble());
        expect(result[0]).assertEqual(4.4.toDouble());
        expect(result[1]).assertEqual(4.4.toDouble());
        expect(result[2]).assertEqual(4.4.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest6100
     * @tc.name builtinsArrayFillPrototypebTest6100
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) start为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0, 0.0];
        const result = fill(arr, 5.5.toDouble(), -2);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(0.0.toDouble());
        expect(result[2]).assertEqual(5.5.toDouble());
        expect(result[3]).assertEqual(5.5.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest6200
     * @tc.name builtinsArrayFillPrototypebTest6200
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) end超过数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0];
        const result = fill(arr, 6.6.toDouble(), 1, 10);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(6.6.toDouble());
        expect(result[2]).assertEqual(6.6.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest6300
     * @tc.name builtinsArrayFillPrototypebTest6300
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) start和end都为负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 0.0, 0.0, 0.0];
        const result = fill(arr, 7.7.toDouble(), -3, -1);
        expect(result[0]).assertEqual(0.0.toDouble());
        expect(result[1]).assertEqual(7.7.toDouble());
        expect(result[2]).assertEqual(7.7.toDouble());
        expect(result[3]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFillPrototypebTest6400
     * @tc.name builtinsArrayFillPrototypebTest6400
     * @tc.desc fill(self: FixedArray<double>, value: double, start?: int, end?: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFillPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFillPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = fill(arr, 1.1.toDouble(), 0, 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}