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
export default function builtinsArrayLastIndexOfPrototypebTest(){
  describe('builtinsArrayLastIndexOfPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0100
     * @tc.desc lastIndexOf 普通数组，查找true，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = lastIndexOf(arr, true, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0200
     * @tc.desc lastIndexOf 普通数组，查找false，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = lastIndexOf(arr, false, arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0300
     * @tc.desc lastIndexOf 只有一个元素，查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true];
        let result = lastIndexOf(arr, true, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0400
     * @tc.desc lastIndexOf 只有一个元素，查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = lastIndexOf(arr, false, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0500
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0500
     * @tc.desc lastIndexOf 空数组，查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = lastIndexOf(arr, true, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0600
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0600
     * @tc.desc lastIndexOf 全为true，查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lastIndexOf(arr, true, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0700
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0700
     * @tc.desc lastIndexOf 全为false，查找false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lastIndexOf(arr, false, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0800
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0800
     * @tc.desc lastIndexOf fromIndex为负数，查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = lastIndexOf(arr, true, -2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest0900
     * @tc.name builtinsArrayLastIndexOfPrototypebTest0900
     * @tc.desc lastIndexOf 普通数组，查找true，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = lastIndexOf(arr, true).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1000
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1000
     * @tc.desc lastIndexOf 普通数组，查找false，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = lastIndexOf(arr, false).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1100
     * @tc.desc lastIndexOf 只有一个元素，查找true，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true];
        let result = lastIndexOf(arr, true).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1200
     * @tc.desc lastIndexOf 只有一个元素，查找false，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = lastIndexOf(arr, false).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1300
     * @tc.desc lastIndexOf 空数组，查找true，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = lastIndexOf(arr, true).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1400
     * @tc.desc lastIndexOf 全为true，查找true，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lastIndexOf(arr, true).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1500
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1500
     * @tc.desc lastIndexOf 全为false，查找false，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lastIndexOf(arr, false).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1600
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1600
     * @tc.desc lastIndexOf fromIndex为负数，查找true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = lastIndexOf(arr, true, -2).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1700
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1700
     * @tc.desc lastIndexOf 普通数组，查找存在的byte，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1800
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1800
     * @tc.desc lastIndexOf 普通数组，查找不存在的byte，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = lastIndexOf(arr, 4, arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest1900
     * @tc.name builtinsArrayLastIndexOfPrototypebTest1900
     * @tc.desc lastIndexOf 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5];
        let result = lastIndexOf(arr, 5, 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2000
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2000
     * @tc.desc lastIndexOf 只有一个元素，查找不存在的byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [6];
        let result = lastIndexOf(arr, 7, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2100
     * @tc.desc lastIndexOf 空数组，查找任意byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = lastIndexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2200
     * @tc.desc lastIndexOf 全为同一个byte，查找该byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [8, 8, 8];
        let result = lastIndexOf(arr, 8, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2300
     * @tc.desc lastIndexOf 递增byte，查找中间的byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3, arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2400
     * @tc.desc lastIndexOf fromIndex为负数，查找存在的byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2500
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2500
     * @tc.desc lastIndexOf 普通数组，查找存在的byte，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2600
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2600
     * @tc.desc lastIndexOf 普通数组，查找不存在的byte，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = lastIndexOf(arr, 4).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2700
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2700
     * @tc.desc lastIndexOf 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5];
        let result = lastIndexOf(arr, 5).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2800
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2800
     * @tc.desc lastIndexOf 只有一个元素，查找不存在的byte，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [6];
        let result = lastIndexOf(arr, 7).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest2900
     * @tc.name builtinsArrayLastIndexOfPrototypebTest2900
     * @tc.desc lastIndexOf 空数组，查找任意byte，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = lastIndexOf(arr, 1).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3000
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3000
     * @tc.desc lastIndexOf 全为同一个byte，查找该byte，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [8, 8, 8];
        let result = lastIndexOf(arr, 8).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3100
     * @tc.desc lastIndexOf 递增byte，查找中间的byte，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 3).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3200
     * @tc.desc lastIndexOf fromIndex为负数，查找存在的byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 2];
        let result = lastIndexOf(arr, 2, -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3300
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 普通数组，查找存在的char，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'b'];
        let result = lastIndexOf(arr, c'b', arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3400
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 普通数组，查找不存在的char，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = lastIndexOf(arr, c'd', arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3500
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3500
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'e'];
        let result = lastIndexOf(arr, c'e', 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3600
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3600
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 只有一个元素，查找不存在的char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'f'];
        let result = lastIndexOf(arr, c'g', 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3700
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3700
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 空数组，查找任意char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = lastIndexOf(arr, c'a', 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3800
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3800
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 全为同一个char，查找该char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'h', c'h', c'h'];
        let result = lastIndexOf(arr, c'h', arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest3900
     * @tc.name builtinsArrayLastIndexOfPrototypebTest3900
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int 递增char，查找中间的char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = lastIndexOf(arr, c'c', arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4000
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4000
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex: int): int fromIndex为负数，查找存在的char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'b'];
        let result = lastIndexOf(arr, c'b', -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4100
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 普通数组，查找存在的char，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'b'];
        let result = lastIndexOf(arr, c'b').toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4200
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 普通数组，查找不存在的char，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = lastIndexOf(arr, c'd').toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4300
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'e'];
        let result = lastIndexOf(arr, c'e').toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4400
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 只有一个元素，查找不存在的char，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'f'];
        let result = lastIndexOf(arr, c'g').toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4500
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4500
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 空数组，查找任意char，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = lastIndexOf(arr, c'a').toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4600
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4600
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 全为同一个char，查找该char，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'h', c'h', c'h'];
        let result = lastIndexOf(arr, c'h').toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4700
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4700
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number 递增char，查找中间的char，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = lastIndexOf(arr, c'c').toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4800
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4800
     * @tc.desc function lastIndexOf(self: FixedArray<char>, element: char, fromIndex?: Number): number fromIndex为负数，查找存在的char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'b'];
        let result = lastIndexOf(arr, c'b', -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest4900
     * @tc.name builtinsArrayLastIndexOfPrototypebTest4900
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 普通数组，查找存在的double，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 2.2.toDouble()];
        let result = lastIndexOf(arr, 2.2.toDouble(), arr.length - 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5000
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5000
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 普通数组，查找不存在的double，fromIndex为末尾
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = lastIndexOf(arr, 4.4.toDouble(), arr.length - 1);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5100
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 只有一个元素，查找该元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5.toDouble()];
        let result = lastIndexOf(arr, 5.5.toDouble(), 0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5200
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 只有一个元素，查找不存在的double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [6.6.toDouble()];
        let result = lastIndexOf(arr, 7.7.toDouble(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5300
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 空数组，查找任意double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = lastIndexOf(arr, 1.1.toDouble(), 0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5400
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 全为同一个double，查找该double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [8.8.toDouble(), 8.8.toDouble(), 8.8.toDouble()];
        let result = lastIndexOf(arr, 8.8.toDouble(), arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5500
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5500
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int 递增double，查找中间的double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble(), 5.5.toDouble()];
        let result = lastIndexOf(arr, 3.3.toDouble(), arr.length - 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5600
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5600
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex: int): int fromIndex为负数，查找存在的double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 2.2.toDouble()];
        let result = lastIndexOf(arr, 2.2.toDouble(), -2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5700
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5700
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 普通数组，查找存在的double，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 2.2.toDouble()];
        let result = lastIndexOf(arr, 2.2.toDouble()).toDouble();
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5800
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5800
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 普通数组，查找不存在的double，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = lastIndexOf(arr, 4.4.toDouble()).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest5900
     * @tc.name builtinsArrayLastIndexOfPrototypebTest5900
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 只有一个元素，查找该元素，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5.toDouble()];
        let result = lastIndexOf(arr, 5.5.toDouble()).toDouble();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest6000
     * @tc.name builtinsArrayLastIndexOfPrototypebTest6000
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 只有一个元素，查找不存在的double，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [6.6.toDouble()];
        let result = lastIndexOf(arr, 7.7.toDouble()).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest6100
     * @tc.name builtinsArrayLastIndexOfPrototypebTest6100
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 空数组，查找任意double，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = lastIndexOf(arr, 1.1.toDouble()).toDouble();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest6200
     * @tc.name builtinsArrayLastIndexOfPrototypebTest6200
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 全为同一个double，查找该double，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [8.8.toDouble(), 8.8.toDouble(), 8.8.toDouble()];
        let result = lastIndexOf(arr, 8.8.toDouble()).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest6300
     * @tc.name builtinsArrayLastIndexOfPrototypebTest6300
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number 递增double，查找中间的double，fromIndex省略
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble(), 5.5.toDouble()];
        let result = lastIndexOf(arr, 3.3.toDouble()).toDouble();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayLastIndexOfPrototypebTest6400
     * @tc.name builtinsArrayLastIndexOfPrototypebTest6400
     * @tc.desc function lastIndexOf(self: FixedArray<double>, element: double, fromIndex?: Number): number fromIndex为负数，查找存在的double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayLastIndexOfPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayLastIndexOfPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 2.2.toDouble()];
        let result = lastIndexOf(arr, 2.2.toDouble(), -2).toDouble();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}