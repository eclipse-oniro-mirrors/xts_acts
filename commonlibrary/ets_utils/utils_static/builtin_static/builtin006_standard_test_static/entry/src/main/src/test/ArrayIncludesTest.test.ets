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
export default function builtinsArrayIncludesPrototypebTest(){
  describe('builtinsArrayIncludesPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayIncludesPrototypebTest0100
     * @tc.name builtinsArrayIncludesPrototypebTest0100
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean) 数组包含true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, true, false];
        let result = includes(arr, true);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0200
     * @tc.name builtinsArrayIncludesPrototypebTest0200
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean) 数组包含false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, false];
        let result = includes(arr, false);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0300
     * @tc.name builtinsArrayIncludesPrototypebTest0300
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean) 数组不包含true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = includes(arr, true);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0400
     * @tc.name builtinsArrayIncludesPrototypebTest0400
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean) 数组不包含false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = includes(arr, false);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0500
     * @tc.name builtinsArrayIncludesPrototypebTest0500
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean, fromIndex) 指定fromIndex后包含true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true];
        let result = includes(arr, true, 2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0600
     * @tc.name builtinsArrayIncludesPrototypebTest0600
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean, fromIndex) 指定fromIndex后不包含true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, false];
        let result = includes(arr, true, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0700
     * @tc.name builtinsArrayIncludesPrototypebTest0700
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = includes(arr, true);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0800
     * @tc.name builtinsArrayIncludesPrototypebTest0800
     * @tc.desc includes(self: FixedArray<boolean>, val: boolean, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = includes(arr, true, 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest0900
     * @tc.name builtinsArrayIncludesPrototypebTest0900
     * @tc.desc includes(self: FixedArray<byte>, val: byte) 数组包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = includes(arr, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1000
     * @tc.name builtinsArrayIncludesPrototypebTest1000
     * @tc.desc includes(self: FixedArray<byte>, val: byte) 数组包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 0, 2];
        let result = includes(arr, 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1100
     * @tc.name builtinsArrayIncludesPrototypebTest1100
     * @tc.desc includes(self: FixedArray<byte>, val: byte) 数组不包含3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = includes(arr, 3);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1200
     * @tc.name builtinsArrayIncludesPrototypebTest1200
     * @tc.desc includes(self: FixedArray<byte>, val: byte) 数组不包含-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = includes(arr, (-1));
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1300
     * @tc.name builtinsArrayIncludesPrototypebTest1300
     * @tc.desc includes(self: FixedArray<byte>, val: byte, fromIndex) 指定fromIndex后包含2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = includes(arr, 2, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1400
     * @tc.name builtinsArrayIncludesPrototypebTest1400
     * @tc.desc includes(self: FixedArray<byte>, val: byte, fromIndex) 指定fromIndex后不包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = includes(arr, 1, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1500
     * @tc.name builtinsArrayIncludesPrototypebTest1500
     * @tc.desc includes(self: FixedArray<byte>, val: byte) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = includes(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1600
     * @tc.name builtinsArrayIncludesPrototypebTest1600
     * @tc.desc includes(self: FixedArray<byte>, val: byte, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = includes(arr, 2, 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1700
     * @tc.name builtinsArrayIncludesPrototypebTest1700
     * @tc.desc includes(self: FixedArray<char>, val: char) 数组包含c'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'a');
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1800
     * @tc.name builtinsArrayIncludesPrototypebTest1800
     * @tc.desc includes(self: FixedArray<char>, val: char) 数组包含c'c'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'c');
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest1900
     * @tc.name builtinsArrayIncludesPrototypebTest1900
     * @tc.desc includes(self: FixedArray<char>, val: char) 数组不包含c'd'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'd');
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2000
     * @tc.name builtinsArrayIncludesPrototypebTest2000
     * @tc.desc includes(self: FixedArray<char>, val: char) 数组不包含c'z'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'z');
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2100
     * @tc.name builtinsArrayIncludesPrototypebTest2100
     * @tc.desc includes(self: FixedArray<char>, val: char, fromIndex) 指定fromIndex后包含c'c'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'c', 2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2200
     * @tc.name builtinsArrayIncludesPrototypebTest2200
     * @tc.desc includes(self: FixedArray<char>, val: char, fromIndex) 指定fromIndex后不包含c'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'a', 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2300
     * @tc.name builtinsArrayIncludesPrototypebTest2300
     * @tc.desc includes(self: FixedArray<char>, val: char) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = includes(arr, c'a');
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2400
     * @tc.name builtinsArrayIncludesPrototypebTest2400
     * @tc.desc includes(self: FixedArray<char>, val: char, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = includes(arr, c'b', 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2500
     * @tc.name builtinsArrayIncludesPrototypebTest2500
     * @tc.desc includes(self: FixedArray<double>, val: double) 数组包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, 1.1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2600
     * @tc.name builtinsArrayIncludesPrototypebTest2600
     * @tc.desc includes(self: FixedArray<double>, val: double) 数组包含3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, 3.3);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2700
     * @tc.name builtinsArrayIncludesPrototypebTest2700
     * @tc.desc includes(self: FixedArray<double>, val: double) 数组不包含4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, 4.4);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2800
     * @tc.name builtinsArrayIncludesPrototypebTest2800
     * @tc.desc includes(self: FixedArray<double>, val: double) 数组包含NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, NaN, 3.3];
        let result = includes(arr, NaN);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest2900
     * @tc.name builtinsArrayIncludesPrototypebTest2900
     * @tc.desc includes(self: FixedArray<double>, val: double) 数组不包含NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, NaN);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3000
     * @tc.name builtinsArrayIncludesPrototypebTest3000
     * @tc.desc includes(self: FixedArray<double>, val: double, fromIndex) 指定fromIndex后包含3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, 3.3, 2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3100
     * @tc.name builtinsArrayIncludesPrototypebTest3100
     * @tc.desc includes(self: FixedArray<double>, val: double, fromIndex) 指定fromIndex后不包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, 1.1, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3200
     * @tc.name builtinsArrayIncludesPrototypebTest3200
     * @tc.desc includes(self: FixedArray<double>, val: double, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let result = includes(arr, 2.2, 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3300
     * @tc.name builtinsArrayIncludesPrototypebTest3300
     * @tc.desc includes(self: FixedArray<float>, val: float) 数组包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, 1.1.toFloat());
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3400
     * @tc.name builtinsArrayIncludesPrototypebTest3400
     * @tc.desc includes(self: FixedArray<float>, val: float) 数组包含3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, 3.3.toFloat());
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3500
     * @tc.name builtinsArrayIncludesPrototypebTest3500
     * @tc.desc includes(self: FixedArray<float>, val: float) 数组不包含4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, 4.4.toFloat());
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3600
     * @tc.name builtinsArrayIncludesPrototypebTest3600
     * @tc.desc includes(self: FixedArray<float>, val: float) 数组包含NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), NaN.toFloat(), 3.3.toFloat()];
        let result = includes(arr, NaN.toFloat());
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3700
     * @tc.name builtinsArrayIncludesPrototypebTest3700
     * @tc.desc includes(self: FixedArray<float>, val: float) 数组不包含NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, NaN.toFloat());
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3800
     * @tc.name builtinsArrayIncludesPrototypebTest3800
     * @tc.desc includes(self: FixedArray<float>, val: float, fromIndex) 指定fromIndex后包含3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, 3.3.toFloat(), 2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest3900
     * @tc.name builtinsArrayIncludesPrototypebTest3900
     * @tc.desc includes(self: FixedArray<float>, val: float, fromIndex) 指定fromIndex后不包含1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, 1.1.toFloat(), 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4000
     * @tc.name builtinsArrayIncludesPrototypebTest4000
     * @tc.desc includes(self: FixedArray<float>, val: float, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = includes(arr, 2.2.toFloat(), 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4100
     * @tc.name builtinsArrayIncludesPrototypebTest4100
     * @tc.desc includes(self: FixedArray<int>, val: int) 数组包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [0, 1, 2];
        let result = includes(arr, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4200
     * @tc.name builtinsArrayIncludesPrototypebTest4200
     * @tc.desc includes(self: FixedArray<int>, val: int) 数组包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [0, 0, 2];
        let result = includes(arr, 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4300
     * @tc.name builtinsArrayIncludesPrototypebTest4300
     * @tc.desc includes(self: FixedArray<int>, val: int) 数组不包含3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [0, 1, 2];
        let result = includes(arr, 3);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4400
     * @tc.name builtinsArrayIncludesPrototypebTest4400
     * @tc.desc includes(self: FixedArray<int>, val: int) 数组不包含-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [0, 1, 2];
        let result = includes(arr, -1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4500
     * @tc.name builtinsArrayIncludesPrototypebTest4500
     * @tc.desc includes(self: FixedArray<int>, val: int, fromIndex) 指定fromIndex后包含2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = includes(arr, 2, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4600
     * @tc.name builtinsArrayIncludesPrototypebTest4600
     * @tc.desc includes(self: FixedArray<int>, val: int, fromIndex) 指定fromIndex后不包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = includes(arr, 1, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4700
     * @tc.name builtinsArrayIncludesPrototypebTest4700
     * @tc.desc includes(self: FixedArray<int>, val: int) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = includes(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4800
     * @tc.name builtinsArrayIncludesPrototypebTest4800
     * @tc.desc includes(self: FixedArray<int>, val: int, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = includes(arr, 2, 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest4900
     * @tc.name builtinsArrayIncludesPrototypebTest4900
     * @tc.desc includes(self: FixedArray<long>, val: long) 数组包含1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [0, 1, 2];
        let result = includes(arr, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5000
     * @tc.name builtinsArrayIncludesPrototypebTest5000
     * @tc.desc includes(self: FixedArray<long>, val: long) 数组包含0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [0, 0, 2];
        let result = includes(arr, 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5100
     * @tc.name builtinsArrayIncludesPrototypebTest5100
     * @tc.desc includes(self: FixedArray<long>, val: long) 数组不包含3L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [0, 1, 2];
        let result = includes(arr, 3);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5200
     * @tc.name builtinsArrayIncludesPrototypebTest5200
     * @tc.desc includes(self: FixedArray<long>, val: long) 数组不包含-1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [0, 1, 2];
        let result = includes(arr, -1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5300
     * @tc.name builtinsArrayIncludesPrototypebTest5300
     * @tc.desc includes(self: FixedArray<long>, val: long, fromIndex) 指定fromIndex后包含2L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = includes(arr, 2, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5400
     * @tc.name builtinsArrayIncludesPrototypebTest5400
     * @tc.desc includes(self: FixedArray<long>, val: long, fromIndex) 指定fromIndex后不包含1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = includes(arr, 1, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5500
     * @tc.name builtinsArrayIncludesPrototypebTest5500
     * @tc.desc includes(self: FixedArray<long>, val: long) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = includes(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5600
     * @tc.name builtinsArrayIncludesPrototypebTest5600
     * @tc.desc includes(self: FixedArray<long>, val: long, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = includes(arr, 2, 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5700
     * @tc.name builtinsArrayIncludesPrototypebTest5700
     * @tc.desc includes(self: FixedArray<short>, val: short) 数组包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [0, 1, 2];
        let result = includes(arr, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5800
     * @tc.name builtinsArrayIncludesPrototypebTest5800
     * @tc.desc includes(self: FixedArray<short>, val: short) 数组包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [0, 0, 2];
        let result = includes(arr, 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest5900
     * @tc.name builtinsArrayIncludesPrototypebTest5900
     * @tc.desc includes(self: FixedArray<short>, val: short) 数组不包含3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [0, 1, 2];
        let result = includes(arr, 3);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest6000
     * @tc.name builtinsArrayIncludesPrototypebTest6000
     * @tc.desc includes(self: FixedArray<short>, val: short) 数组不包含-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [0, 1, 2];
        let result = includes(arr, (-1));
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest6100
     * @tc.name builtinsArrayIncludesPrototypebTest6100
     * @tc.desc includes(self: FixedArray<short>, val: short, fromIndex) 指定fromIndex后包含2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = includes(arr, 2, 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest6200
     * @tc.name builtinsArrayIncludesPrototypebTest6200
     * @tc.desc includes(self: FixedArray<short>, val: short, fromIndex) 指定fromIndex后不包含1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = includes(arr, 1, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest6300
     * @tc.name builtinsArrayIncludesPrototypebTest6300
     * @tc.desc includes(self: FixedArray<short>, val: short) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = includes(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayIncludesPrototypebTest6400
     * @tc.name builtinsArrayIncludesPrototypebTest6400
     * @tc.desc includes(self: FixedArray<short>, val: short, fromIndex) fromIndex超出数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayIncludesPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayIncludesPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = includes(arr, 2, 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}