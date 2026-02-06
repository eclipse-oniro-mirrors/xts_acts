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
export default function builtinsArrayEveryPrototypebTest(){
  describe('builtinsArrayEveryPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayEveryPrototypebTest0100
     * @tc.name builtinsArrayEveryPrototypebTest0100
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 所有元素都为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = every(arr, (val) => val === true);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0200
     * @tc.name builtinsArrayEveryPrototypebTest0200
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 部分元素为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = every(arr, (val) => val === true);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0300
     * @tc.name builtinsArrayEveryPrototypebTest0300
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = every(arr, (val) => val === true);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0400
     * @tc.name builtinsArrayEveryPrototypebTest0400
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = every(arr, (val) => val === true);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0500
     * @tc.name builtinsArrayEveryPrototypebTest0500
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = every(arr, (val) => val === true);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0600
     * @tc.name builtinsArrayEveryPrototypebTest0600
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = every(arr, (val) => val === true);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0700
     * @tc.name builtinsArrayEveryPrototypebTest0700
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = new FixedArray<boolean>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = true;
        }
        const result = every(arr, (val) => val === true);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0800
     * @tc.name builtinsArrayEveryPrototypebTest0800
     * @tc.desc every(self: FixedArray<boolean>, predicate: (value: boolean, index: number, array: FixedArray<boolean>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest0900
     * @tc.name builtinsArrayEveryPrototypebTest0900
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 所有元素都大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [11, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1000
     * @tc.name builtinsArrayEveryPrototypebTest1000
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 部分元素大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1100
     * @tc.name builtinsArrayEveryPrototypebTest1100
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1200
     * @tc.name builtinsArrayEveryPrototypebTest1200
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1300
     * @tc.name builtinsArrayEveryPrototypebTest1300
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [20];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1400
     * @tc.name builtinsArrayEveryPrototypebTest1400
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1500
     * @tc.name builtinsArrayEveryPrototypebTest1500
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = new FixedArray<byte>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = (i + 1).toByte();
        }
        const result = every(arr, (val) => val > 0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1600
     * @tc.name builtinsArrayEveryPrototypebTest1600
     * @tc.desc every(self: FixedArray<byte>, predicate: (value: byte, index: number, array: FixedArray<byte>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1700
     * @tc.name builtinsArrayEveryPrototypebTest1700
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 所有元素都是'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'a', c'a'];
        const result = every(arr, (val) => val === c'a');
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1800
     * @tc.name builtinsArrayEveryPrototypebTest1800
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 部分元素是'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'a'];
        const result = every(arr, (val) => val === c'a');
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest1900
     * @tc.name builtinsArrayEveryPrototypebTest1900
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'd'];
        const result = every(arr, (val) => val === c'a');
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2000
     * @tc.name builtinsArrayEveryPrototypebTest2000
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = every(arr, (val) => val === c'a');
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2100
     * @tc.name builtinsArrayEveryPrototypebTest2100
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a'];
        const result = every(arr, (val) => val === c'a');
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2200
     * @tc.name builtinsArrayEveryPrototypebTest2200
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b'];
        const result = every(arr, (val) => val === c'a');
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2300
     * @tc.name builtinsArrayEveryPrototypebTest2300
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = new FixedArray<char>(100);
        const chars = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        for (let i = 0; i < 100; i++) {
          arr[i] = chars.charAt(i);
        }
        const result = every(arr, (val) => val === c'a');
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2400
     * @tc.name builtinsArrayEveryPrototypebTest2400
     * @tc.desc every(self: FixedArray<char>, predicate: (value: char, index: number, array: FixedArray<char>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2500
     * @tc.name builtinsArrayEveryPrototypebTest2500
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 所有元素都大于10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, 20.2, 30.3];
        const result = every(arr, (val) => val > 10.0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2600
     * @tc.name builtinsArrayEveryPrototypebTest2600
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 部分元素大于10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, 20.2, 30.3];
        const result = every(arr, (val) => val > 10.0);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2700
     * @tc.name builtinsArrayEveryPrototypebTest2700
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = every(arr, (val) => val > 10.0);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2800
     * @tc.name builtinsArrayEveryPrototypebTest2800
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = every(arr, (val) => val > 10.0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest2900
     * @tc.name builtinsArrayEveryPrototypebTest2900
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [20.2];
        const result = every(arr, (val) => val > 10.0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3000
     * @tc.name builtinsArrayEveryPrototypebTest3000
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5];
        const result = every(arr, (val) => val > 10.0);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3100
     * @tc.name builtinsArrayEveryPrototypebTest3100
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = new FixedArray<double>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i + 1.1;
        }
        const result = every(arr, (val) => val > 0.0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3200
     * @tc.name builtinsArrayEveryPrototypebTest3200
     * @tc.desc every(self: FixedArray<double>, predicate: (value: double, index: number, array: FixedArray<double>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3300
     * @tc.name builtinsArrayEveryPrototypebTest3300
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 所有元素都大于10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [11.1.toFloat(), 20.2.toFloat(), 30.3.toFloat()];
        const result = every(arr, (val) => val > 10.0.toFloat());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3400
     * @tc.name builtinsArrayEveryPrototypebTest3400
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 部分元素大于10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 20.2.toFloat(), 30.3.toFloat()];
        const result = every(arr, (val) => val > 10.0.toFloat());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3500
     * @tc.name builtinsArrayEveryPrototypebTest3500
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = every(arr, (val) => val > 10.0.toFloat());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3600
     * @tc.name builtinsArrayEveryPrototypebTest3600
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = every(arr, (val) => val > 10.0.toFloat());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3700
     * @tc.name builtinsArrayEveryPrototypebTest3700
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [20.2.toFloat()];
        const result = every(arr, (val) => val > 10.0.toFloat());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3800
     * @tc.name builtinsArrayEveryPrototypebTest3800
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat()];
        const result = every(arr, (val) => val > 10.0.toFloat());
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest3900
     * @tc.name builtinsArrayEveryPrototypebTest3900
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = new FixedArray<float>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = (i + 1.1).toFloat();
        }
        const result = every(arr, (val) => val > 0.0.toFloat());
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4000
     * @tc.name builtinsArrayEveryPrototypebTest4000
     * @tc.desc every(self: FixedArray<float>, predicate: (value: float, index: number, array: FixedArray<float>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4100
     * @tc.name builtinsArrayEveryPrototypebTest4100
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 所有元素都大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [11, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4200
     * @tc.name builtinsArrayEveryPrototypebTest4200
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 部分元素大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4300
     * @tc.name builtinsArrayEveryPrototypebTest4300
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4400
     * @tc.name builtinsArrayEveryPrototypebTest4400
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4500
     * @tc.name builtinsArrayEveryPrototypebTest4500
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [20];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4600
     * @tc.name builtinsArrayEveryPrototypebTest4600
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4700
     * @tc.name builtinsArrayEveryPrototypebTest4700
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = new FixedArray<int>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i + 1;
        }
        const result = every(arr, (val) => val > 0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4800
     * @tc.name builtinsArrayEveryPrototypebTest4800
     * @tc.desc every(self: FixedArray<int>, predicate: (value: int, index: number, array: FixedArray<int>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest4900
     * @tc.name builtinsArrayEveryPrototypebTest4900
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 所有元素都大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [11, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5000
     * @tc.name builtinsArrayEveryPrototypebTest5000
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 部分元素大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5100
     * @tc.name builtinsArrayEveryPrototypebTest5100
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5200
     * @tc.name builtinsArrayEveryPrototypebTest5200
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5300
     * @tc.name builtinsArrayEveryPrototypebTest5300
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [20];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5400
     * @tc.name builtinsArrayEveryPrototypebTest5400
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5500
     * @tc.name builtinsArrayEveryPrototypebTest5500
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = new FixedArray<long>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i + 1;
        }
        const result = every(arr, (val) => val > 0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5600
     * @tc.name builtinsArrayEveryPrototypebTest5600
     * @tc.desc every(self: FixedArray<long>, predicate: (value: long, index: number, array: FixedArray<long>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5700
     * @tc.name builtinsArrayEveryPrototypebTest5700
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 所有元素都大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [11, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5800
     * @tc.name builtinsArrayEveryPrototypebTest5800
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 部分元素大于10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 20, 30];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest5900
     * @tc.name builtinsArrayEveryPrototypebTest5900
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 所有元素都不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest6000
     * @tc.name builtinsArrayEveryPrototypebTest6000
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest6100
     * @tc.name builtinsArrayEveryPrototypebTest6100
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 单元素满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [20];
        const result = every(arr, (val) => val > 10);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest6200
     * @tc.name builtinsArrayEveryPrototypebTest6200
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 单元素不满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5];
        const result = every(arr, (val) => val > 10);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest6300
     * @tc.name builtinsArrayEveryPrototypebTest6300
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 大数组所有元素都满足条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = new FixedArray<short>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = (i + 1).toShort();
        }
        const result = every(arr, (val) => val > 0);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEveryPrototypebTest6400
     * @tc.name builtinsArrayEveryPrototypebTest6400
     * @tc.desc every(self: FixedArray<short>, predicate: (value: short, index: number, array: FixedArray<short>) => boolean): boolean 检查索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEveryPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = every(arr, (val, idx) => idx < 3);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}