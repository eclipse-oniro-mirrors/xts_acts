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
export default function builtinsArrayFindLastIndexPrototypebTest(){
  describe('builtinsArrayFindLastIndexPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0100
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0100
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 找到最后一个true的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        const result = findLastIndex(arr, (v, k, array) => v === true);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0200
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0200
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 找到最后一个false的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = findLastIndex(arr, (v, k, array) => v === false);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0300
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0300
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = findLastIndex(arr, (v, k, array) => v === false);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0400
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0400
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = findLastIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0500
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0500
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = findLastIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0600
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0600
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 找到最后一个true的索引（全部为true）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = findLastIndex(arr, (v, k, array) => v === true);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0700
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0700
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 找到最后一个false的索引（全部为false）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = findLastIndex(arr, (v, k, array) => v === false);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0800
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0800
     * @tc.desc findLastIndex(self: FixedArray<boolean>, predicate) 复杂条件：找最后一个为true且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, true, false, true];
        const result = findLastIndex(arr, (v, k, array) => v === true && k % 2 === 0);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest0900
     * @tc.name builtinsArrayFindLastIndexPrototypebTest0900
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 找到最后一个大于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 4];
        const result = findLastIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1000
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1000
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 找到最后一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 1, 2, 1];
        const result = findLastIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1100
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1100
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = findLastIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1200
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1200
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = findLastIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1300
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1300
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 2];
        const result = findLastIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1400
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1400
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 3];
        const result = findLastIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1500
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1500
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 2, 1, 2];
        const result = findLastIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypebTest1600
     * @tc.name builtinsArrayFindLastIndexPrototypebTest1600
     * @tc.desc findLastIndex(self: FixedArray<byte>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 4, 2];
        const result = findLastIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest1700
     * @tc.name builtinsArrayFindLastIndexPrototypecTest1700
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 找到最后一个等于'b'的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'b'];
        const result = findLastIndex(arr, (v, k, array) => v == c'b');
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest1800
     * @tc.name builtinsArrayFindLastIndexPrototypecTest1800
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 找到最后一个索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = findLastIndex(arr, (v, k, array) => k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest1900
     * @tc.name builtinsArrayFindLastIndexPrototypecTest1900
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = findLastIndex(arr, (v, k, array) => v == c'z');
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest2000
     * @tc.name builtinsArrayFindLastIndexPrototypecTest2000
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = findLastIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest2100
     * @tc.name builtinsArrayFindLastIndexPrototypecTest2100
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 找到最后一个大于'b'的字符索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const result = findLastIndex(arr, (v, k, array) => v > c'b');
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest2200
     * @tc.name builtinsArrayFindLastIndexPrototypecTest2200
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y', c'z', c'w'];
        const result = findLastIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest2300
     * @tc.name builtinsArrayFindLastIndexPrototypecTest2300
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 找到最后一个等于首元素的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'a', c'c'];
        const result = findLastIndex(arr, (v, k, array) => v == arr[0]);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypecTest2400
     * @tc.name builtinsArrayFindLastIndexPrototypecTest2400
     * @tc.desc findLastIndex(self: FixedArray<char>, predicate) 复杂条件：找最后一个不是'a'且索引大于1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypecTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypecTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'a'];
        const result = findLastIndex(arr, (v, k, array) => v != c'a' && k > 1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest2500
     * @tc.name builtinsArrayFindLastIndexPrototypedTest2500
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 找到最后一个大于2.5的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void>=> {
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest2500';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
      const result = findLastIndex(arr, (v, k, array) => v > 2.5);
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest2600
     * @tc.name builtinsArrayFindLastIndexPrototypedTest2600
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 找到最后一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void>=> {
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest2600';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [3.3, 1.1, 2.2, 1.5];
      const result = findLastIndex(arr, (v, k, array) => v < 2);
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest2700
     * @tc.name builtinsArrayFindLastIndexPrototypedTest2700
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void>=> {
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest2700';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [1.1, 2.2, 3.3];
      const result = findLastIndex(arr, (v, k, array) => v > 10);
      expect(result).assertEqual(-1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest2800
     * @tc.name builtinsArrayFindLastIndexPrototypedTest2800
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void>=> {
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest2800';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [];
      const result = findLastIndex(arr, (v, k, array) => true);
      expect(result).assertEqual(-1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest2900
     * @tc.name builtinsArrayFindLastIndexPrototypedTest2900
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest2900';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2];
      const result = findLastIndex(arr, (v, k, array) => k === 1);
      expect(result).assertEqual(1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest3000
     * @tc.name builtinsArrayFindLastIndexPrototypedTest3000
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 找到最后一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void>=> {
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest3000';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [1.1, 2.2, 3.3, 3.3];
      const result = findLastIndex(arr, (v, k, array) => v === 3.3);
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest3100
     * @tc.name builtinsArrayFindLastIndexPrototypedTest3100
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 找到最后一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void>=> {
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest3100';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [3.3, 2.2, 1.1, 2.2];
      const result = findLastIndex(arr, (v, k, array) => v <= 2.2);
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypedTest3200
     * @tc.name builtinsArrayFindLastIndexPrototypedTest3200
     * @tc.desc findLastIndex(self: FixedArray<double>, predicate) 复杂条件：找最后一个大于1.5且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypedTest3200';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 2.2];
      const result = findLastIndex(arr, (v, k, array) => v > 1.5 && k % 2 === 0);
      expect(result).assertEqual(4);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3300
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3300
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 找到最后一个大于2.5的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3300';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => v > 2.5.toFloat());
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3400
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3400
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 找到最后一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3400';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [3.3.toFloat(), 1.1.toFloat(), 2.2.toFloat(), 1.5.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => v < 2.0.toFloat());
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3500
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3500
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3500';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => v > 10.0.toFloat());
      expect(result).assertEqual(-1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3600
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3600
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3600';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [];
      const result = findLastIndex(arr, (v, k, array) => true);
      expect(result).assertEqual(-1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3700
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3700
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3700';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 2.2.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => k === 1);
      expect(result).assertEqual(1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3800
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3800
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 找到最后一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3800';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 3.3.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => v === 3.3.toFloat());
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest3900
     * @tc.name builtinsArrayFindLastIndexPrototypefTest3900
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 找到最后一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest3900';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [3.3.toFloat(), 2.2.toFloat(), 1.1.toFloat(), 2.2.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => v <= 2.2.toFloat());
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypefTest4000
     * @tc.name builtinsArrayFindLastIndexPrototypefTest4000
     * @tc.desc findLastIndex(self: FixedArray<float>, predicate) 复杂条件：找最后一个大于1.5且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypefTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> =>{
      const caseName = 'builtinsArrayFindLastIndexPrototypefTest4000';
      console.info(`${caseName}, test start`);
      const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 2.2.toFloat()];
      const result = findLastIndex(arr, (v, k, array) => v > 1.5.toFloat() && k % 2 === 0);
      expect(result).assertEqual(4);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4100
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4100
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 找到最后一个大于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = findLastIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4200
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4200
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 找到最后一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 1, 2, 1];
        const result = findLastIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4300
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4300
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = findLastIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4400
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4400
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = findLastIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4500
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4500
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 2];
        const result = findLastIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4600
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4600
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 3];
        const result = findLastIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4700
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4700
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 2, 1, 2];
        const result = findLastIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypeiTest4800
     * @tc.name builtinsArrayFindLastIndexPrototypeiTest4800
     * @tc.desc findLastIndex(self: FixedArray<int>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypeiTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypeiTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 2];
        const result = findLastIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest4900
     * @tc.name builtinsArrayFindLastIndexPrototypelTest4900
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 找到最后一个大于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = findLastIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5000
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5000
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 找到最后一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 1, 2, 1];
        const result = findLastIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5100
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5100
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = findLastIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5200
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5200
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = findLastIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5300
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5300
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 2];
        const result = findLastIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5400
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5400
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 3];
        const result = findLastIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5500
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5500
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 2, 1, 2];
        const result = findLastIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypelTest5600
     * @tc.name builtinsArrayFindLastIndexPrototypelTest5600
     * @tc.desc findLastIndex(self: FixedArray<long>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypelTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypelTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4, 2];
        const result = findLastIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest5700
     * @tc.name builtinsArrayFindLastIndexPrototypesTest5700
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 找到最后一个大于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = findLastIndex(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest5800
     * @tc.name builtinsArrayFindLastIndexPrototypesTest5800
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 找到最后一个小于2的索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 1, 2, 1];
        const result = findLastIndex(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest5900
     * @tc.name builtinsArrayFindLastIndexPrototypesTest5900
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 找不到元素返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = findLastIndex(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest6000
     * @tc.name builtinsArrayFindLastIndexPrototypesTest6000
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 空数组返回-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = findLastIndex(arr, (v, k, array) => true);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest6100
     * @tc.name builtinsArrayFindLastIndexPrototypesTest6100
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 2];
        const result = findLastIndex(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest6200
     * @tc.name builtinsArrayFindLastIndexPrototypesTest6200
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 3];
        const result = findLastIndex(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest6300
     * @tc.name builtinsArrayFindLastIndexPrototypesTest6300
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 2, 1, 2];
        const result = findLastIndex(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastIndexPrototypesTest6400
     * @tc.name builtinsArrayFindLastIndexPrototypesTest6400
     * @tc.desc findLastIndex(self: FixedArray<short>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastIndexPrototypesTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastIndexPrototypesTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4, 2];
        const result = findLastIndex(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}