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
export default function builtinsArrayKeysPrototypebTest(){
  describe('builtinsArrayKeysPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayKeysPrototypebTest0100
     * @tc.name builtinsArrayKeysPrototypebTest0100
     * @tc.desc keys(self: FixedArray<boolean>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0,1,2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0200
     * @tc.name builtinsArrayKeysPrototypebTest0200
     * @tc.desc keys(self: FixedArray<boolean>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0300
     * @tc.name builtinsArrayKeysPrototypebTest0300
     * @tc.desc keys(self: FixedArray<boolean>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0400
     * @tc.name builtinsArrayKeysPrototypebTest0400
     * @tc.desc keys(self: FixedArray<boolean>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0500
     * @tc.name builtinsArrayKeysPrototypebTest0500
     * @tc.desc keys(self: FixedArray<boolean>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0600
     * @tc.name builtinsArrayKeysPrototypebTest0600
     * @tc.desc keys(self: FixedArray<boolean>) 全部为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0700
     * @tc.name builtinsArrayKeysPrototypebTest0700
     * @tc.desc keys(self: FixedArray<boolean>) 全部为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0800
     * @tc.name builtinsArrayKeysPrototypebTest0800
     * @tc.desc keys(self: FixedArray<boolean>) 交替true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest0900
     * @tc.name builtinsArrayKeysPrototypebTest0900
     * @tc.desc keys(self: FixedArray<byte>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1000
     * @tc.name builtinsArrayKeysPrototypebTest1000
     * @tc.desc keys(self: FixedArray<byte>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [4];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1100
     * @tc.name builtinsArrayKeysPrototypebTest1100
     * @tc.desc keys(self: FixedArray<byte>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1200
     * @tc.name builtinsArrayKeysPrototypebTest1200
     * @tc.desc keys(self: FixedArray<byte>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5, 6];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1300
     * @tc.name builtinsArrayKeysPrototypebTest1300
     * @tc.desc keys(self: FixedArray<byte>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [7, 8, 9, 10, 11];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1400
     * @tc.name builtinsArrayKeysPrototypebTest1400
     * @tc.desc keys(self: FixedArray<byte>) 全部为同一个值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [12, 12, 12];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1500
     * @tc.name builtinsArrayKeysPrototypebTest1500
     * @tc.desc keys(self: FixedArray<byte>) 递增值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [13, 14, 15, 16];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1600
     * @tc.name builtinsArrayKeysPrototypebTest1600
     * @tc.desc keys(self: FixedArray<byte>) 交替值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [17, 18, 17, 18];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1700
     * @tc.name builtinsArrayKeysPrototypebTest1700
     * @tc.desc keys(self: FixedArray<char>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1800
     * @tc.name builtinsArrayKeysPrototypebTest1800
     * @tc.desc keys(self: FixedArray<char>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'z'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest1900
     * @tc.name builtinsArrayKeysPrototypebTest1900
     * @tc.desc keys(self: FixedArray<char>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2000
     * @tc.name builtinsArrayKeysPrototypebTest2000
     * @tc.desc keys(self: FixedArray<char>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'x', c'y'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2100
     * @tc.name builtinsArrayKeysPrototypebTest2100
     * @tc.desc keys(self: FixedArray<char>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2200
     * @tc.name builtinsArrayKeysPrototypebTest2200
     * @tc.desc keys(self: FixedArray<char>) 全部为同一个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'a', c'a'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2300
     * @tc.name builtinsArrayKeysPrototypebTest2300
     * @tc.desc keys(self: FixedArray<char>) 递增字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2400
     * @tc.name builtinsArrayKeysPrototypebTest2400
     * @tc.desc keys(self: FixedArray<char>) 交替字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'a', c'b'];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2500
     * @tc.name builtinsArrayKeysPrototypebTest2500
     * @tc.desc keys(self: FixedArray<double>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2600
     * @tc.name builtinsArrayKeysPrototypebTest2600
     * @tc.desc keys(self: FixedArray<double>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [4.4.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2700
     * @tc.name builtinsArrayKeysPrototypebTest2700
     * @tc.desc keys(self: FixedArray<double>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2800
     * @tc.name builtinsArrayKeysPrototypebTest2800
     * @tc.desc keys(self: FixedArray<double>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5.toDouble(), 6.6.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest2900
     * @tc.name builtinsArrayKeysPrototypebTest2900
     * @tc.desc keys(self: FixedArray<double>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [7.7.toDouble(), 8.8.toDouble(), 9.9.toDouble(), 10.1.toDouble(), 11.11.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3000
     * @tc.name builtinsArrayKeysPrototypebTest3000
     * @tc.desc keys(self: FixedArray<double>) 全部为同一个值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [12.12.toDouble(), 12.12.toDouble(), 12.12.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3100
     * @tc.name builtinsArrayKeysPrototypebTest3100
     * @tc.desc keys(self: FixedArray<double>) 递增值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [13.13.toDouble(), 14.14.toDouble(), 15.15.toDouble(), 16.16.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3200
     * @tc.name builtinsArrayKeysPrototypebTest3200
     * @tc.desc keys(self: FixedArray<double>) 交替值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [17.17.toDouble(), 18.18.toDouble(), 17.17.toDouble(), 18.18.toDouble()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3300
     * @tc.name builtinsArrayKeysPrototypebTest3300
     * @tc.desc keys(self: FixedArray<float>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3400
     * @tc.name builtinsArrayKeysPrototypebTest3400
     * @tc.desc keys(self: FixedArray<float>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [4.4.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3500
     * @tc.name builtinsArrayKeysPrototypebTest3500
     * @tc.desc keys(self: FixedArray<float>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3600
     * @tc.name builtinsArrayKeysPrototypebTest3600
     * @tc.desc keys(self: FixedArray<float>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3700
     * @tc.name builtinsArrayKeysPrototypebTest3700
     * @tc.desc keys(self: FixedArray<float>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [7.7.toFloat(), 8.8.toFloat(), 9.9.toFloat(), 10.1.toFloat(), 11.11.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3800
     * @tc.name builtinsArrayKeysPrototypebTest3800
     * @tc.desc keys(self: FixedArray<float>) 全部为同一个值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [12.12.toFloat(), 12.12.toFloat(), 12.12.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest3900
     * @tc.name builtinsArrayKeysPrototypebTest3900
     * @tc.desc keys(self: FixedArray<float>) 递增值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [13.13.toFloat(), 14.14.toFloat(), 15.15.toFloat(), 16.16.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4000
     * @tc.name builtinsArrayKeysPrototypebTest4000
     * @tc.desc keys(self: FixedArray<float>) 交替值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [17.17.toFloat(), 18.18.toFloat(), 17.17.toFloat(), 18.18.toFloat()];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4100
     * @tc.name builtinsArrayKeysPrototypebTest4100
     * @tc.desc keys(self: FixedArray<int>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4200
     * @tc.name builtinsArrayKeysPrototypebTest4200
     * @tc.desc keys(self: FixedArray<int>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [4];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4300
     * @tc.name builtinsArrayKeysPrototypebTest4300
     * @tc.desc keys(self: FixedArray<int>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4400
     * @tc.name builtinsArrayKeysPrototypebTest4400
     * @tc.desc keys(self: FixedArray<int>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5, 6];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4500
     * @tc.name builtinsArrayKeysPrototypebTest4500
     * @tc.desc keys(self: FixedArray<int>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [7, 8, 9, 10, 11];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4600
     * @tc.name builtinsArrayKeysPrototypebTest4600
     * @tc.desc keys(self: FixedArray<int>) 全部为同一个值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [12, 12, 12];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4700
     * @tc.name builtinsArrayKeysPrototypebTest4700
     * @tc.desc keys(self: FixedArray<int>) 递增值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [13, 14, 15, 16];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4800
     * @tc.name builtinsArrayKeysPrototypebTest4800
     * @tc.desc keys(self: FixedArray<int>) 交替值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [17, 18, 17, 18];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest4900
     * @tc.name builtinsArrayKeysPrototypebTest4900
     * @tc.desc keys(self: FixedArray<long>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5000
     * @tc.name builtinsArrayKeysPrototypebTest5000
     * @tc.desc keys(self: FixedArray<long>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [4];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5100
     * @tc.name builtinsArrayKeysPrototypebTest5100
     * @tc.desc keys(self: FixedArray<long>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5200
     * @tc.name builtinsArrayKeysPrototypebTest5200
     * @tc.desc keys(self: FixedArray<long>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5, 6];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5300
     * @tc.name builtinsArrayKeysPrototypebTest5300
     * @tc.desc keys(self: FixedArray<long>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [7, 8, 9, 10, 11];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5400
     * @tc.name builtinsArrayKeysPrototypebTest5400
     * @tc.desc keys(self: FixedArray<long>) 全部为同一个值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [12, 12, 12];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5500
     * @tc.name builtinsArrayKeysPrototypebTest5500
     * @tc.desc keys(self: FixedArray<long>) 递增值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [13, 14, 15, 16];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5600
     * @tc.name builtinsArrayKeysPrototypebTest5600
     * @tc.desc keys(self: FixedArray<long>) 交替值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [17, 18, 17, 18];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5700
     * @tc.name builtinsArrayKeysPrototypebTest5700
     * @tc.desc keys(self: FixedArray<short>) 普通数组，返回所有索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5800
     * @tc.name builtinsArrayKeysPrototypebTest5800
     * @tc.desc keys(self: FixedArray<short>) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [4];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest5900
     * @tc.name builtinsArrayKeysPrototypebTest5900
     * @tc.desc keys(self: FixedArray<short>) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = Array.from(keys(arr));
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest6000
     * @tc.name builtinsArrayKeysPrototypebTest6000
     * @tc.desc keys(self: FixedArray<short>) 两个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5, 6];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest6100
     * @tc.name builtinsArrayKeysPrototypebTest6100
     * @tc.desc keys(self: FixedArray<short>) 五个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [7, 8, 9, 10, 11];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3, 4] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest6200
     * @tc.name builtinsArrayKeysPrototypebTest6200
     * @tc.desc keys(self: FixedArray<short>) 全部为同一个值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [12, 12, 12];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest6300
     * @tc.name builtinsArrayKeysPrototypebTest6300
     * @tc.desc keys(self: FixedArray<short>) 递增值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [13, 14, 15, 16];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayKeysPrototypebTest6400
     * @tc.name builtinsArrayKeysPrototypebTest6400
     * @tc.desc keys(self: FixedArray<short>) 交替值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayKeysPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayKeysPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [17, 18, 17, 18];
        let result = Array.from(keys(arr));
        expect(result).assertDeepEquals([0, 1, 2, 3] as Array<int>);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}