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
export default function builtinsArrayLowerBoundSearchPrototypebTest(){
  describe('builtinsArrayLowerBoundSearchPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 全false数组查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 全false数组查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 全true数组查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lowerBoundSearch(arr, false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 全true数组查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0500
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 混合数组查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0600
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 混合数组查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0700
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 只有一个元素查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = lowerBoundSearch(arr, false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0800
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean): int 空数组查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest0900
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest0900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 全false数组查找false，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, false, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1000
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 全false数组查找true，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, true, 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 全true数组查找false，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lowerBoundSearch(arr, false, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 全true数组查找true，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lowerBoundSearch(arr, true, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 混合数组查找true，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, true, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 混合数组查找false，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, false, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1500
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 只有一个元素查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = lowerBoundSearch(arr, true, 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1600
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<boolean>, key: boolean, startIndex: int, endIndex: int): int 空数组查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = lowerBoundSearch(arr, false, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1700
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1800
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest1900
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest1900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2000
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [3];
        let result = lowerBoundSearch(arr, 3);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1];
        let result = lowerBoundSearch(arr, 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = lowerBoundSearch(arr, 1);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2500
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int 全部小于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2600
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int 全部大于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5, 6, 7];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2700
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int key在中间，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 5, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2800
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int key在数组中不存在但在区间内，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 3, 5, 7];
        let result = lowerBoundSearch(arr, 4, 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest2900
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest2900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int 全部等于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [2, 2, 2];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3000
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [3];
        let result = lowerBoundSearch(arr, 3, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<byte>, key: byte, startIndex: int, endIndex: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = lowerBoundSearch(arr, 1, 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'a'.toByte(), c'b'.toByte(), c'c'.toByte()];
        let result = lowerBoundSearch(arr, c'd'.toByte());
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'd'.toByte(), c'e'.toByte(), c'f'.toByte()];
        let result = lowerBoundSearch(arr, c'b'.toByte());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3500
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'a'.toByte(), c'c'.toByte(), c'e'.toByte(), c'g'.toByte()];
        let result = lowerBoundSearch(arr, c'e'.toByte());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3600
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'a'.toByte(), c'c'.toByte(), c'e'.toByte(), c'g'.toByte()];
        let result = lowerBoundSearch(arr, c'd'.toByte());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3700
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'b'.toByte(), c'b'.toByte(), c'b'.toByte()];
        let result = lowerBoundSearch(arr, c'b'.toByte());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3800
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'c'.toByte()];
        let result = lowerBoundSearch(arr, c'c'.toByte());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest3900
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest3900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [c'a'.toByte()];
        let result = lowerBoundSearch(arr, c'b'.toByte());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4000
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<char>, key: char): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = lowerBoundSearch(arr, c'a'.toByte());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4100
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) 普通有序数组，key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'c', c'e', c'g', c'i'];
        const result = lowerBoundSearch(arr, c'e', 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4200
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) 只有一个元素，key小于该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b'];
        const result = lowerBoundSearch(arr, c'a', 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4300
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        let errorCaught = false;
        try {
          lowerBoundSearch(arr, c'a', 0, 0);
        } catch (e) {
          errorCaught = true;
          expect(e instanceof RangeError).assertEqual(true);
        }
        expect(errorCaught).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4400
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) 全为同一个值，key等于该值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'd', c'd', c'd', c'd'];
        const result = lowerBoundSearch(arr, c'd', 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4500
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4500
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) 递增数组，key大于所有元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = lowerBoundSearch(arr, c'z', 0, arr.length);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4600
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4600
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) 交替值，key介于两值之间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'c', c'e', c'g'];
        const result = lowerBoundSearch(arr, c'd', 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4700
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4700
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) fromIndex为负数，抛异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        let errorCaught = false;
        try {
          lowerBoundSearch(arr, c'b', -1, arr.length);
        } catch (e) {
          errorCaught = true;
          expect(e instanceof RangeError).assertEqual(true);
        }
        expect(errorCaught).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4800
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4800
     * @tc.desc lowerBoundSearch(self: FixedArray<char>, key: char, startIndex: int, endIndex: int) key小于所有元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'd', c'e'];
        const result = lowerBoundSearch(arr, c'a', 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest4900
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest4900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int 全部小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = lowerBoundSearch(arr, 4.0.toDouble());
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5000
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int 全部大于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5.toDouble(), 6.6.toDouble(), 7.7.toDouble()];
        let result = lowerBoundSearch(arr, 2.0.toDouble());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int key在中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 3.3.toDouble(), 5.5.toDouble(), 7.7.toDouble()];
        let result = lowerBoundSearch(arr, 5.5.toDouble());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int key在数组中不存在但在区间内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 3.3.toDouble(), 5.5.toDouble(), 7.7.toDouble()];
        let result = lowerBoundSearch(arr, 4.4.toDouble());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int 全部等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [2.2.toDouble(), 2.2.toDouble(), 2.2.toDouble()];
        let result = lowerBoundSearch(arr, 2.2.toDouble());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [3.3.toDouble()];
        let result = lowerBoundSearch(arr, 3.3.toDouble());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5500
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5500
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble()];
        let result = lowerBoundSearch(arr, 2.2.toDouble());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5600
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5600
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchCharPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = lowerBoundSearch(arr, 1.1.toDouble());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5700
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5700
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int 全部小于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = lowerBoundSearch(arr, 4.0.toDouble(), 0, arr.length);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5800
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5800
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int 全部大于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5.toDouble(), 6.6.toDouble(), 7.7.toDouble()];
        let result = lowerBoundSearch(arr, 2.0.toDouble(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest5900
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest5900
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int key在中间，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 3.3.toDouble(), 5.5.toDouble(), 7.7.toDouble()];
        let result = lowerBoundSearch(arr, 5.5.toDouble(), 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest6000
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest6000
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int key在数组中不存在但在区间内，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 3.3.toDouble(), 5.5.toDouble(), 7.7.toDouble()];
        let result = lowerBoundSearch(arr, 4.4.toDouble(), 0, arr.length);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest6100
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest6100
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int 全部等于key，完整区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [2.2.toDouble(), 2.2.toDouble(), 2.2.toDouble()];
        let result = lowerBoundSearch(arr, 2.2.toDouble(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest6200
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest6200
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int 只有一个元素且等于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [3.3.toDouble()];
        let result = lowerBoundSearch(arr, 3.3.toDouble(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest6300
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest6300
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int 只有一个元素且小于key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble()];
        let result = lowerBoundSearch(arr, 2.2.toDouble(), 0, arr.length);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLowerBoundSearchPrototypebTest6400
     * @tc.name builtinsArrayLowerBoundSearchPrototypebTest6400
     * @tc.desc function lowerBoundSearch(arr: FixedArray<double>, key: double, startIndex: int, endIndex: int): int 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLowerBoundSearchPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLowerBoundSearchPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = lowerBoundSearch(arr, 1.1.toDouble(), 0, arr.length);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}