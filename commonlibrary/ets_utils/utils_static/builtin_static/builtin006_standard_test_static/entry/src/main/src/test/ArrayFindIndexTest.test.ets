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
export default function builtinsArrayFindIndexPrototypebTest(){
  describe('builtinsArrayFindIndexPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayFindIndexPrototypebTest0100
     * @tc.name builtinsArrayFindIndexPrototypebTest0100
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 找到第一个true的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false];
        const result = findIndex(arr, (v, k, array) => v === true);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0200
     * @tc.name builtinsArrayFindIndexPrototypebTest0200
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 找到第一个false的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = findIndex(arr, (v, k, array) => v === false);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0300
     * @tc.name builtinsArrayFindIndexPrototypebTest0300
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = findIndex(arr, (v, k, array) => v === false);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0400
     * @tc.name builtinsArrayFindIndexPrototypebTest0400
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0500
     * @tc.name builtinsArrayFindIndexPrototypebTest0500
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0600
     * @tc.name builtinsArrayFindIndexPrototypebTest0600
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 找到第一个true的元素（全部为true）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = findIndex(arr, (v, k, array) => v === true);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0700
     * @tc.name builtinsArrayFindIndexPrototypebTest0700
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 找到第一个false的元素（全部为false）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = findIndex(arr, (v, k, array) => v === false);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0800
     * @tc.name builtinsArrayFindIndexPrototypebTest0800
     * @tc.desc findIndex(self: FixedArray<boolean>, predicate) 复杂条件：找第一个为true且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, true, false];
        const result = findIndex(arr, (v, k, array) => v === true && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest0900
     * @tc.name builtinsArrayFindIndexPrototypebTest0900
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 找到第一个大于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1000
     * @tc.name builtinsArrayFindIndexPrototypebTest1000
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 找到第一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 1, 2];
        const result = findIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1100
     * @tc.name builtinsArrayFindIndexPrototypebTest1100
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1200
     * @tc.name builtinsArrayFindIndexPrototypebTest1200
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1300
     * @tc.name builtinsArrayFindIndexPrototypebTest1300
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1400
     * @tc.name builtinsArrayFindIndexPrototypebTest1400
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1500
     * @tc.name builtinsArrayFindIndexPrototypebTest1500
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 2, 1];
        const result = findIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1600
     * @tc.name builtinsArrayFindIndexPrototypebTest1600
     * @tc.desc findIndex(self: FixedArray<byte>, predicate) 复杂条件：找第一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 4];
        const result = findIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1700
     * @tc.name builtinsArrayFindIndexPrototypebTest1700
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 找到第一个元音字母的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'a', c'e'];
        const result = findIndex(arr, (v, k, array) => v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u');
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1800
     * @tc.name builtinsArrayFindIndexPrototypebTest1800
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 找到第一个辅音字母的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'e', c'b', c'c'];
        const result = findIndex(arr, (v, k, array) => !(v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u'));
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest1900
     * @tc.name builtinsArrayFindIndexPrototypebTest1900
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'd'];
        const result = findIndex(arr, (v, k, array) => v === c'z');
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2000
     * @tc.name builtinsArrayFindIndexPrototypebTest2000
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2100
     * @tc.name builtinsArrayFindIndexPrototypebTest2100
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2200
     * @tc.name builtinsArrayFindIndexPrototypebTest2200
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 找到第一个等于'c'的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = findIndex(arr, (v, k, array) => v === c'c');
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2300
     * @tc.name builtinsArrayFindIndexPrototypebTest2300
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 找到第一个小于等于'b'的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'c', c'b', c'a'];
        const result = findIndex(arr, (v, k, array) => v <= c'b');
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2400
     * @tc.name builtinsArrayFindIndexPrototypebTest2400
     * @tc.desc findIndex(self: FixedArray<char>, predicate) 复杂条件：找第一个不是元音且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'e'];
        const result = findIndex(arr, (v, k, array) => !(v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u') && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2500
     * @tc.name builtinsArrayFindIndexPrototypebTest2500
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 找到第一个大于2.0的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = findIndex(arr, (v, k, array) => v > 2.0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2600
     * @tc.name builtinsArrayFindIndexPrototypebTest2600
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 找到第一个小于2.0的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 1.1.toDouble(), 2.2.toDouble()];
        const result = findIndex(arr, (v, k, array) => v < 2.0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2700
     * @tc.name builtinsArrayFindIndexPrototypebTest2700
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = findIndex(arr, (v, k, array) => v > 10.0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2800
     * @tc.name builtinsArrayFindIndexPrototypebTest2800
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest2900
     * @tc.name builtinsArrayFindIndexPrototypebTest2900
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3000
     * @tc.name builtinsArrayFindIndexPrototypebTest3000
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 找到第一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = findIndex(arr, (v, k, array) => v === 3.3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3100
     * @tc.name builtinsArrayFindIndexPrototypebTest3100
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 找到第一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 2.2.toDouble(), 1.1.toDouble()];
        const result = findIndex(arr, (v, k, array) => v <= 2.2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3200
     * @tc.name builtinsArrayFindIndexPrototypebTest3200
     * @tc.desc findIndex(self: FixedArray<double>, predicate) 复杂条件：找第一个大于1.1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const result = findIndex(arr, (v, k, array) => v > 1.1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3300
     * @tc.name builtinsArrayFindIndexPrototypebTest3300
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 找到第一个大于2.0的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 .toFloat(), 2.2 .toFloat(), 3.3 .toFloat()];
        const result = findIndex(arr, (v, k, array) => v > 2.0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3400
     * @tc.name builtinsArrayFindIndexPrototypebTest3400
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 找到第一个小于2.0的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3 .toFloat(), 1.1 .toFloat(), 2.2 .toFloat()];
        const result = findIndex(arr, (v, k, array) => v < 2.0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3500
     * @tc.name builtinsArrayFindIndexPrototypebTest3500
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 .toFloat(), 2.2 .toFloat(), 3.3 .toFloat()];
        const result = findIndex(arr, (v, k, array) => v > 10.0);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3600
     * @tc.name builtinsArrayFindIndexPrototypebTest3600
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3700
     * @tc.name builtinsArrayFindIndexPrototypebTest3700
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 .toFloat(), 2.2 .toFloat(), 3.3 .toFloat()];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3800
     * @tc.name builtinsArrayFindIndexPrototypebTest3800
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 找到第一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 .toFloat(), 2.2 .toFloat(), 3.3 .toFloat()];
        const result = findIndex(arr, (v, k, array) => v === 3.3 .toFloat());
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest3900
     * @tc.name builtinsArrayFindIndexPrototypebTest3900
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 找到第一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3 .toFloat(), 2.2 .toFloat(), 1.1 .toFloat()];
        const result = findIndex(arr, (v, k, array) => v <= 2.2 .toFloat());
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4000
     * @tc.name builtinsArrayFindIndexPrototypebTest4000
     * @tc.desc findIndex(self: FixedArray<float>, predicate) 复杂条件：找第一个大于1.1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1 .toFloat(), 2.2 .toFloat(), 3.3 .toFloat(), 4.4 .toFloat()];
        const result = findIndex(arr, (v, k, array) => v > 1.1 .toFloat() && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4100
     * @tc.name builtinsArrayFindIndexPrototypebTest4100
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 找到第一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4200
     * @tc.name builtinsArrayFindIndexPrototypebTest4200
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 找到第一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 1, 2];
        const result = findIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4300
     * @tc.name builtinsArrayFindIndexPrototypebTest4300
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4400
     * @tc.name builtinsArrayFindIndexPrototypebTest4400
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4500
     * @tc.name builtinsArrayFindIndexPrototypebTest4500
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4600
     * @tc.name builtinsArrayFindIndexPrototypebTest4600
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4700
     * @tc.name builtinsArrayFindIndexPrototypebTest4700
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 2, 1];
        const result = findIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4800
     * @tc.name builtinsArrayFindIndexPrototypebTest4800
     * @tc.desc findIndex(self: FixedArray<int>, predicate) 复杂条件：找第一个大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = findIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest4900
     * @tc.name builtinsArrayFindIndexPrototypebTest4900
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 找到第一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5000
     * @tc.name builtinsArrayFindIndexPrototypebTest5000
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 找到第一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 1, 2];
        const result = findIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5100
     * @tc.name builtinsArrayFindIndexPrototypebTest5100
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5200
     * @tc.name builtinsArrayFindIndexPrototypebTest5200
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5300
     * @tc.name builtinsArrayFindIndexPrototypebTest5300
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5400
     * @tc.name builtinsArrayFindIndexPrototypebTest5400
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5500
     * @tc.name builtinsArrayFindIndexPrototypebTest5500
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 2, 1];
        const result = findIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5600
     * @tc.name builtinsArrayFindIndexPrototypebTest5600
     * @tc.desc findIndex(self: FixedArray<long>, predicate) 复杂条件：找第一个大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = findIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5700
     * @tc.name builtinsArrayFindIndexPrototypebTest5700
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 找到第一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5800
     * @tc.name builtinsArrayFindIndexPrototypebTest5800
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 找到第一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 1, 2];
        const result = findIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest5900
     * @tc.name builtinsArrayFindIndexPrototypebTest5900
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest6000
     * @tc.name builtinsArrayFindIndexPrototypebTest6000
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = findIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest6100
     * @tc.name builtinsArrayFindIndexPrototypebTest6100
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 找到第一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest6200
     * @tc.name builtinsArrayFindIndexPrototypebTest6200
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 找到第一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = findIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest6300
     * @tc.name builtinsArrayFindIndexPrototypebTest6300
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 找到第一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 2, 1];
        const result = findIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindIndexPrototypebTest6400
     * @tc.name builtinsArrayFindIndexPrototypebTest6400
     * @tc.desc findIndex(self: FixedArray<short>, predicate) 复杂条件：找第一个大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindIndexPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindIndexPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = findIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}