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
export default function builtinsArrayIndexOfPrototypebTest(){
  describe('builtinsArrayIndexOfPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayIndexOfPrototypebTest0100
     * @tc.name builtinsArrayIndexOfPrototypebTest0100
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 查找true的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, true, false];
        let result = indexOf(arr, true, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0200
     * @tc.name builtinsArrayIndexOfPrototypebTest0200
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 查找false的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, false];
        let result = indexOf(arr, false, 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0300
     * @tc.name builtinsArrayIndexOfPrototypebTest0300
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 不存在true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = indexOf(arr, true, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0400
     * @tc.name builtinsArrayIndexOfPrototypebTest0400
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 不存在false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = indexOf(arr, false, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0500
     * @tc.name builtinsArrayIndexOfPrototypebTest0500
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 指定fromIndex后查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true];
        let result = indexOf(arr, true, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0600
     * @tc.name builtinsArrayIndexOfPrototypebTest0600
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 指定fromIndex后查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, false];
        let result = indexOf(arr, false, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0700
     * @tc.name builtinsArrayIndexOfPrototypebTest0700
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = indexOf(arr, true, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0800
     * @tc.name builtinsArrayIndexOfPrototypebTest0800
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = indexOf(arr, true, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest0900
     * @tc.name builtinsArrayIndexOfPrototypebTest0900
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 查找true的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, true, false];
        let result = indexOf(arr, true);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1000
     * @tc.name builtinsArrayIndexOfPrototypebTest1000
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 查找false的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, false];
        let result = indexOf(arr, false);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1100
     * @tc.name builtinsArrayIndexOfPrototypebTest1100
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 不存在true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1200
     * @tc.name builtinsArrayIndexOfPrototypebTest1200
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 不存在false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = indexOf(arr, false);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1300
     * @tc.name builtinsArrayIndexOfPrototypebTest1300
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 指定fromIndex后查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true];
        let result = indexOf(arr, true, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1400
     * @tc.name builtinsArrayIndexOfPrototypebTest1400
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 指定fromIndex后查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, false];
        let result = indexOf(arr, false, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1500
     * @tc.name builtinsArrayIndexOfPrototypebTest1500
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1600
     * @tc.name builtinsArrayIndexOfPrototypebTest1600
     * @tc.desc indexOf(self: FixedArray<boolean>, val: boolean, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = indexOf(arr, true, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1700
     * @tc.name builtinsArrayIndexOfPrototypebTest1700
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 查找1的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1800
     * @tc.name builtinsArrayIndexOfPrototypebTest1800
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 查找0的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 0, 2];
        let result = indexOf(arr, 0, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest1900
     * @tc.name builtinsArrayIndexOfPrototypebTest1900
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 不存在3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = indexOf(arr, 3, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2000
     * @tc.name builtinsArrayIndexOfPrototypebTest2000
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 不存在-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = indexOf(arr, (-1), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2100
     * @tc.name builtinsArrayIndexOfPrototypebTest2100
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 指定fromIndex后查找2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = indexOf(arr, 2, 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2200
     * @tc.name builtinsArrayIndexOfPrototypebTest2200
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 指定fromIndex后不包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2300
     * @tc.name builtinsArrayIndexOfPrototypebTest2300
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2400
     * @tc.name builtinsArrayIndexOfPrototypebTest2400
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2500
     * @tc.name builtinsArrayIndexOfPrototypebTest2500
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 查找1的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = indexOf(arr, 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2600
     * @tc.name builtinsArrayIndexOfPrototypebTest2600
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 查找0的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 0, 2];
        let result = indexOf(arr, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2700
     * @tc.name builtinsArrayIndexOfPrototypebTest2700
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 不存在3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = indexOf(arr, 3);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2800
     * @tc.name builtinsArrayIndexOfPrototypebTest2800
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 不存在-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = indexOf(arr, (-1));
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest2900
     * @tc.name builtinsArrayIndexOfPrototypebTest2900
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 指定fromIndex后查找2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = indexOf(arr, 2, 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3000
     * @tc.name builtinsArrayIndexOfPrototypebTest3000
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 指定fromIndex后不包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = indexOf(arr, 1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3100
     * @tc.name builtinsArrayIndexOfPrototypebTest3100
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = indexOf(arr, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3200
     * @tc.name builtinsArrayIndexOfPrototypebTest3200
     * @tc.desc indexOf(self: FixedArray<byte>, val: byte, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3300
     * @tc.name builtinsArrayIndexOfPrototypebTest3300
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 查找c'b'的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'b', 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3400
     * @tc.name builtinsArrayIndexOfPrototypebTest3400
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 查找c'c'的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'c', 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3500
     * @tc.name builtinsArrayIndexOfPrototypebTest3500
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 不存在c'd'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'd', 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3600
     * @tc.name builtinsArrayIndexOfPrototypebTest3600
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 不存在c'z'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'z', 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3700
     * @tc.name builtinsArrayIndexOfPrototypebTest3700
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 指定fromIndex后查找c'c'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'c', 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3800
     * @tc.name builtinsArrayIndexOfPrototypebTest3800
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 指定fromIndex后不包含c'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'a', 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest3900
     * @tc.name builtinsArrayIndexOfPrototypebTest3900
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = indexOf(arr, c'a', 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4000
     * @tc.name builtinsArrayIndexOfPrototypebTest4000
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'b', 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4100
     * @tc.name builtinsArrayIndexOfPrototypebTest4100
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 查找c'b'的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'b');
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4200
     * @tc.name builtinsArrayIndexOfPrototypebTest4200
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 查找c'c'的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'c');
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4300
     * @tc.name builtinsArrayIndexOfPrototypebTest4300
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 不存在c'd'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'd');
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4400
     * @tc.name builtinsArrayIndexOfPrototypebTest4400
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 不存在c'z'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'z');
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4500
     * @tc.name builtinsArrayIndexOfPrototypebTest4500
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 指定fromIndex后查找c'c'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'c', 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4600
     * @tc.name builtinsArrayIndexOfPrototypebTest4600
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 指定fromIndex后不包含c'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'a', 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4700
     * @tc.name builtinsArrayIndexOfPrototypebTest4700
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = indexOf(arr, c'a');
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4800
     * @tc.name builtinsArrayIndexOfPrototypebTest4800
     * @tc.desc indexOf(self: FixedArray<char>, val: char, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = indexOf(arr, c'b', 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest4900
     * @tc.name builtinsArrayIndexOfPrototypebTest4900
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 查找2.2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 2.2, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5000
     * @tc.name builtinsArrayIndexOfPrototypebTest5000
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 查找3.3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 3.3, 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5100
     * @tc.name builtinsArrayIndexOfPrototypebTest5100
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 不存在4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 4.4, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5200
     * @tc.name builtinsArrayIndexOfPrototypebTest5200
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 不存在-1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, -1.1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5300
     * @tc.name builtinsArrayIndexOfPrototypebTest5300
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 指定fromIndex后查找3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 3.3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5400
     * @tc.name builtinsArrayIndexOfPrototypebTest5400
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 指定fromIndex后不包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 1.1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5500
     * @tc.name builtinsArrayIndexOfPrototypebTest5500
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = indexOf(arr, 1.1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5600
     * @tc.name builtinsArrayIndexOfPrototypebTest5600
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 2.2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5700
     * @tc.name builtinsArrayIndexOfPrototypebTest5700
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 查找2.2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 2.2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5800
     * @tc.name builtinsArrayIndexOfPrototypebTest5800
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 查找3.3的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 3.3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest5900
     * @tc.name builtinsArrayIndexOfPrototypebTest5900
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 不存在4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 4.4);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest6000
     * @tc.name builtinsArrayIndexOfPrototypebTest6000
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 不存在-1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, -1.1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest6100
     * @tc.name builtinsArrayIndexOfPrototypebTest6100
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 指定fromIndex后查找3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 3.3, 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest6200
     * @tc.name builtinsArrayIndexOfPrototypebTest6200
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 指定fromIndex后不包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 1.1, 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest6300
     * @tc.name builtinsArrayIndexOfPrototypebTest6300
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = indexOf(arr, 1.1.toDouble());
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIndexOfPrototypebTest6400
     * @tc.name builtinsArrayIndexOfPrototypebTest6400
     * @tc.desc indexOf(self: FixedArray<double>, val: double, fromIndex?) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIndexOfPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIndexOfPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = indexOf(arr, 2.2, 5);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}