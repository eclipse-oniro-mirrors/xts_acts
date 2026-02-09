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
export default function builtinsArrayFindPrototypebTest(){
  describe('builtinsArrayFindPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayFindPrototypebTest0100
     * @tc.name builtinsArrayFindPrototypebTest0100
     * @tc.desc find(self: FixedArray<boolean>, predicate) 找到第一个true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = find(arr, (v, k, array) => v === true);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0200
     * @tc.name builtinsArrayFindPrototypebTest0200
     * @tc.desc find(self: FixedArray<boolean>, predicate) 找到第一个false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = find(arr, (v, k, array) => v === false);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0300
     * @tc.name builtinsArrayFindPrototypebTest0300
     * @tc.desc find(self: FixedArray<boolean>, predicate) 全部为false，找不到true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = find(arr, (v, k, array) => v === true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0400
     * @tc.name builtinsArrayFindPrototypebTest0400
     * @tc.desc find(self: FixedArray<boolean>, predicate) 全部为true，找第一个true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = find(arr, (v, k, array) => v === true);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0500
     * @tc.name builtinsArrayFindPrototypebTest0500
     * @tc.desc find(self: FixedArray<boolean>, predicate) 根据索引找第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0600
     * @tc.name builtinsArrayFindPrototypebTest0600
     * @tc.desc find(self: FixedArray<boolean>, predicate) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0700
     * @tc.name builtinsArrayFindPrototypebTest0700
     * @tc.desc find(self: FixedArray<boolean>, predicate) 恒为false的predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = find(arr, (v, k, array) => false);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0800
     * @tc.name builtinsArrayFindPrototypebTest0800
     * @tc.desc find(self: FixedArray<boolean>, predicate) 复杂条件：找第一个true且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, true, false, true];
        const result = find(arr, (v, k, array) => v && k % 2 === 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest0900
     * @tc.name builtinsArrayFindPrototypebTest0900
     * @tc.desc find(self: FixedArray<byte>, fn) 找到第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v === 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1000
     * @tc.name builtinsArrayFindPrototypebTest1000
     * @tc.desc find(self: FixedArray<byte>, fn) 找到第一个偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 3, 4, 6];
        const result = find(arr, (v, k, array) => v % 2 === 0);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1100
     * @tc.name builtinsArrayFindPrototypebTest1100
     * @tc.desc find(self: FixedArray<byte>, fn) 找到第一个大于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 5, 3];
        const result = find(arr, (v, k, array) => v > 3);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1200
     * @tc.name builtinsArrayFindPrototypebTest1200
     * @tc.desc find(self: FixedArray<byte>, fn) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v === 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1300
     * @tc.name builtinsArrayFindPrototypebTest1300
     * @tc.desc find(self: FixedArray<byte>, fn) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1400
     * @tc.name builtinsArrayFindPrototypebTest1400
     * @tc.desc find(self: FixedArray<byte>, fn) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [7, 8, 9];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(8);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1500
     * @tc.name builtinsArrayFindPrototypebTest1500
     * @tc.desc find(self: FixedArray<byte>, fn) 找到第一个大于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v >= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1600
     * @tc.name builtinsArrayFindPrototypebTest1600
     * @tc.desc find(self: FixedArray<byte>, fn) 找到第一个小于0的元素（全为正数，返回undefined）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v < 0);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1700
     * @tc.name builtinsArrayFindPrototypebTest1700
     * @tc.desc find(self: FixedArray<char>, predicate) 找到第一个元音字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'a', c'e'];
        const result = find(arr, (v, k, array) => v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u');
        expect(result).assertEqual(c'a');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1800
     * @tc.name builtinsArrayFindPrototypebTest1800
     * @tc.desc find(self: FixedArray<char>, predicate) 找到第一个辅音字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'e', c'b', c'c'];
        const result = find(arr, (v, k, array) => !(v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u'));
        expect(result).assertEqual(c'b');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest1900
     * @tc.name builtinsArrayFindPrototypebTest1900
     * @tc.desc find(self: FixedArray<char>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'd'];
        const result = find(arr, (v, k, array) => v === c'z');
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2000
     * @tc.name builtinsArrayFindPrototypebTest2000
     * @tc.desc find(self: FixedArray<char>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2100
     * @tc.name builtinsArrayFindPrototypebTest2100
     * @tc.desc find(self: FixedArray<char>, predicate) 找到第一个索引为2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = find(arr, (v, k, array) => k === 2);
        expect(result).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2200
     * @tc.name builtinsArrayFindPrototypebTest2200
     * @tc.desc find(self: FixedArray<char>, predicate) 找到第一个大于c'b'的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = find(arr, (v, k, array) => v > c'b');
        expect(result).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2300
     * @tc.name builtinsArrayFindPrototypebTest2300
     * @tc.desc find(self: FixedArray<char>, predicate) 找到第一个小于c'd'的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'e', c'd', c'c', c'b'];
        const result = find(arr, (v, k, array) => v < c'd');
        expect(result).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2400
     * @tc.name builtinsArrayFindPrototypebTest2400
     * @tc.desc find(self: FixedArray<char>, predicate) 复杂条件：找第一个元音且索引为奇数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'a', c'c', c'e', c'i'];
        const result = find(arr, (v, k, array) => (v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u') && k % 2 === 1);
        expect(result).assertEqual(c'a');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2500
     * @tc.name builtinsArrayFindPrototypebTest2500
     * @tc.desc find(self: FixedArray<double>, predicate) 找到第一个大于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = find(arr, (v, k, array) => v > 2.0);
        expect(result).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2600
     * @tc.name builtinsArrayFindPrototypebTest2600
     * @tc.desc find(self: FixedArray<double>, predicate) 找到第一个小于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 1.1.toDouble(), 2.2.toDouble()];
        const result = find(arr, (v, k, array) => v < 2.0);
        expect(result).assertEqual(1.1.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2700
     * @tc.name builtinsArrayFindPrototypebTest2700
     * @tc.desc find(self: FixedArray<double>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = find(arr, (v, k, array) => v > 10.0);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2800
     * @tc.name builtinsArrayFindPrototypebTest2800
     * @tc.desc find(self: FixedArray<double>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest2900
     * @tc.name builtinsArrayFindPrototypebTest2900
     * @tc.desc find(self: FixedArray<double>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3000
     * @tc.name builtinsArrayFindPrototypebTest3000
     * @tc.desc find(self: FixedArray<double>, predicate) 找到第一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = find(arr, (v, k, array) => v === 3.3);
        expect(result).assertEqual(3.3.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3100
     * @tc.name builtinsArrayFindPrototypebTest3100
     * @tc.desc find(self: FixedArray<double>, predicate) 找到第一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 2.2.toDouble(), 1.1.toDouble()];
        const result = find(arr, (v, k, array) => v <= 2.2);
        expect(result).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3200
     * @tc.name builtinsArrayFindPrototypebTest3200
     * @tc.desc find(self: FixedArray<double>, predicate) 复杂条件：找第一个大于1.0且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const result = find(arr, (v, k, array) => v > 1.0 && k % 2 === 0);
        expect(result).assertEqual(1.1.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3300
     * @tc.name builtinsArrayFindPrototypebTest3300
     * @tc.desc find(self: FixedArray<float>, predicate) 找到第一个大于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = find(arr, (v, k, array) => v > 2.0);
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3400
     * @tc.name builtinsArrayFindPrototypebTest3400
     * @tc.desc find(self: FixedArray<float>, predicate) 找到第一个小于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 1.1.toFloat(), 2.2.toFloat()];
        const result = find(arr, (v, k, array) => v < 2.0);
        expect(result).assertEqual(1.1.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3500
     * @tc.name builtinsArrayFindPrototypebTest3500
     * @tc.desc find(self: FixedArray<float>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = find(arr, (v, k, array) => v > 10.0);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3600
     * @tc.name builtinsArrayFindPrototypebTest3600
     * @tc.desc find(self: FixedArray<float>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3700
     * @tc.name builtinsArrayFindPrototypebTest3700
     * @tc.desc find(self: FixedArray<float>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3800
     * @tc.name builtinsArrayFindPrototypebTest3800
     * @tc.desc find(self: FixedArray<float>, predicate) 找到第一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = find(arr, (v, k, array) => v === 3.3.toFloat());
        expect(result).assertEqual(3.3.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest3900
     * @tc.name builtinsArrayFindPrototypebTest3900
     * @tc.desc find(self: FixedArray<float>, predicate) 找到第一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        const result = find(arr, (v, k, array) => v <= 2.2.toFloat());
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4000
     * @tc.name builtinsArrayFindPrototypebTest4000
     * @tc.desc find(self: FixedArray<float>, predicate) 复杂条件：找第一个大于1.0且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = find(arr, (v, k, array) => v > 1.0 && k % 2 === 0);
        expect(result).assertEqual(1.1.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4100
     * @tc.name builtinsArrayFindPrototypebTest4100
     * @tc.desc find(self: FixedArray<int>, predicate) 找到第一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4200
     * @tc.name builtinsArrayFindPrototypebTest4200
     * @tc.desc find(self: FixedArray<int>, predicate) 找到第一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 1, 2];
        const result = find(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4300
     * @tc.name builtinsArrayFindPrototypebTest4300
     * @tc.desc find(self: FixedArray<int>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4400
     * @tc.name builtinsArrayFindPrototypebTest4400
     * @tc.desc find(self: FixedArray<int>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4500
     * @tc.name builtinsArrayFindPrototypebTest4500
     * @tc.desc find(self: FixedArray<int>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4600
     * @tc.name builtinsArrayFindPrototypebTest4600
     * @tc.desc find(self: FixedArray<int>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4700
     * @tc.name builtinsArrayFindPrototypebTest4700
     * @tc.desc find(self: FixedArray<int>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 2, 1];
        const result = find(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4800
     * @tc.name builtinsArrayFindPrototypebTest4800
     * @tc.desc find(self: FixedArray<int>, predicate) 复杂条件：找第一个大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = find(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest4900
     * @tc.name builtinsArrayFindPrototypebTest4900
     * @tc.desc find(self: FixedArray<long>, predicate) 找到第一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5000
     * @tc.name builtinsArrayFindPrototypebTest5000
     * @tc.desc find(self: FixedArray<long>, predicate) 找到第一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 1, 2];
        const result = find(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5100
     * @tc.name builtinsArrayFindPrototypebTest5100
     * @tc.desc find(self: FixedArray<long>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5200
     * @tc.name builtinsArrayFindPrototypebTest5200
     * @tc.desc find(self: FixedArray<long>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5300
     * @tc.name builtinsArrayFindPrototypebTest5300
     * @tc.desc find(self: FixedArray<long>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5400
     * @tc.name builtinsArrayFindPrototypebTest5400
     * @tc.desc find(self: FixedArray<long>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5500
     * @tc.name builtinsArrayFindPrototypebTest5500
     * @tc.desc find(self: FixedArray<long>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 2, 1];
        const result = find(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5600
     * @tc.name builtinsArrayFindPrototypebTest5600
     * @tc.desc find(self: FixedArray<long>, predicate) 复杂条件：找第一个大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = find(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5701
     * @tc.name builtinsArrayFindPrototypebTest5701
     * @tc.desc find(self: FixedArray<short>, predicate) 找到第一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5701';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5800
     * @tc.name builtinsArrayFindPrototypebTest5800
     * @tc.desc find(self: FixedArray<short>, predicate) 找到第一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 1, 2];
        const result = find(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5900
     * @tc.name builtinsArrayFindPrototypebTest5900
     * @tc.desc find(self: FixedArray<short>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest6000
     * @tc.name builtinsArrayFindPrototypebTest6000
     * @tc.desc find(self: FixedArray<short>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = find(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest6100
     * @tc.name builtinsArrayFindPrototypebTest6100
     * @tc.desc find(self: FixedArray<short>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = find(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest6200
     * @tc.name builtinsArrayFindPrototypebTest6200
     * @tc.desc find(self: FixedArray<short>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = find(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest6300
     * @tc.name builtinsArrayFindPrototypebTest6300
     * @tc.desc find(self: FixedArray<short>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 2, 1];
        const result = find(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest6400
     * @tc.name builtinsArrayFindPrototypebTest6400
     * @tc.desc find(self: FixedArray<short>, predicate) 复杂条件：找第一个大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = find(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}