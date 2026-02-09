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
export default function builtinsArrayFindLastPrototypebTest(){
  describe('builtinsArrayFindLastPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayFindLastPrototypebTest0100
     * @tc.name builtinsArrayFindLastPrototypebTest0100
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 找到最后一个true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        const result = findLast(arr, (v, k, array) => v === true);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0200
     * @tc.name builtinsArrayFindLastPrototypebTest0200
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 找到最后一个false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = findLast(arr, (v, k, array) => v === false);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0300
     * @tc.name builtinsArrayFindLastPrototypebTest0300
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = findLast(arr, (v, k, array) => v === false);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0400
     * @tc.name builtinsArrayFindLastPrototypebTest0400
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0500
     * @tc.name builtinsArrayFindLastPrototypebTest0500
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0600
     * @tc.name builtinsArrayFindLastPrototypebTest0600
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 找到最后一个true（全部为true）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = findLast(arr, (v, k, array) => v === true);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0700
     * @tc.name builtinsArrayFindLastPrototypebTest0700
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 找到最后一个false（全部为false）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = findLast(arr, (v, k, array) => v === false);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0800
     * @tc.name builtinsArrayFindLastPrototypebTest0800
     * @tc.desc findLast(self: FixedArray<boolean>, predicate) 复杂条件：找最后一个为true且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, true, false, true];
        const result = findLast(arr, (v, k, array) => v === true && k % 2 === 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest0900
     * @tc.name builtinsArrayFindLastPrototypebTest0900
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 找到最后一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 4];
        const result = findLast(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1000
     * @tc.name builtinsArrayFindLastPrototypebTest1000
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 找到最后一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 1, 2, 1];
        const result = findLast(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1100
     * @tc.name builtinsArrayFindLastPrototypebTest1100
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = findLast(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1200
     * @tc.name builtinsArrayFindLastPrototypebTest1200
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1300
     * @tc.name builtinsArrayFindLastPrototypebTest1300
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 2];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1400
     * @tc.name builtinsArrayFindLastPrototypebTest1400
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 3];
        const result = findLast(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1500
     * @tc.name builtinsArrayFindLastPrototypebTest1500
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 2, 1, 2];
        const result = findLast(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1600
     * @tc.name builtinsArrayFindLastPrototypebTest1600
     * @tc.desc findLast(self: FixedArray<byte>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3, 4, 2];
        const result = findLast(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1700
     * @tc.name builtinsArrayFindLastPrototypebTest1700
     * @tc.desc findLast(self: FixedArray<char>, predicate) 找到最后一个元音字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'a', c'e', c'i'];
        const result = findLast(arr, (v, k, array) => v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u');
        expect(result).assertEqual(c'i');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1800
     * @tc.name builtinsArrayFindLastPrototypebTest1800
     * @tc.desc findLast(self: FixedArray<char>, predicate) 找到最后一个辅音字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'e', c'b', c'c', c'd'];
        const result = findLast(arr, (v, k, array) => !(v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u'));
        expect(result).assertEqual(c'd');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest1900
     * @tc.name builtinsArrayFindLastPrototypebTest1900
     * @tc.desc findLast(self: FixedArray<char>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'b', c'c', c'd'];
        const result = findLast(arr, (v, k, array) => v === c'z');
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2000
     * @tc.name builtinsArrayFindLastPrototypebTest2000
     * @tc.desc findLast(self: FixedArray<char>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2100
     * @tc.name builtinsArrayFindLastPrototypebTest2100
     * @tc.desc findLast(self: FixedArray<char>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'b'];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(c'b');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2200
     * @tc.name builtinsArrayFindLastPrototypebTest2200
     * @tc.desc findLast(self: FixedArray<char>, predicate) 找到最后一个等于'c'的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'c'];
        const result = findLast(arr, (v, k, array) => v === c'c');
        expect(result).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2300
     * @tc.name builtinsArrayFindLastPrototypebTest2300
     * @tc.desc findLast(self: FixedArray<char>, predicate) 找到最后一个小于等于'b'的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'c', c'b', c'a', c'b'];
        const result = findLast(arr, (v, k, array) => v <= c'b');
        expect(result).assertEqual(c'b');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2400
     * @tc.name builtinsArrayFindLastPrototypebTest2400
     * @tc.desc findLast(self: FixedArray<char>, predicate) 复杂条件：找最后一个不是元音且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'e', c'd'];
        const result = findLast(arr, (v, k, array) => !(v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u') && k % 2 === 0);
        expect(result).assertEqual(c'd');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2500
     * @tc.name builtinsArrayFindLastPrototypebTest2500
     * @tc.desc findLast(self: FixedArray<double>, predicate) 找到最后一个大于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const result = findLast(arr, (v, k, array) => v > 2.0);
        expect(result).assertEqual(4.4.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2600
     * @tc.name builtinsArrayFindLastPrototypebTest2600
     * @tc.desc findLast(self: FixedArray<double>, predicate) 找到最后一个小于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 1.1.toDouble(), 2.2.toDouble(), 1.1.toDouble()];
        const result = findLast(arr, (v, k, array) => v < 2.0);
        expect(result).assertEqual(1.1.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2700
     * @tc.name builtinsArrayFindLastPrototypebTest2700
     * @tc.desc findLast(self: FixedArray<double>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = findLast(arr, (v, k, array) => v > 10.0);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2800
     * @tc.name builtinsArrayFindLastPrototypebTest2800
     * @tc.desc findLast(self: FixedArray<double>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest2900
     * @tc.name builtinsArrayFindLastPrototypebTest2900
     * @tc.desc findLast(self: FixedArray<double>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 2.2.toDouble()];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3000
     * @tc.name builtinsArrayFindLastPrototypebTest3000
     * @tc.desc findLast(self: FixedArray<double>, predicate) 找到最后一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 3.3.toDouble()];
        const result = findLast(arr, (v, k, array) => v === 3.3);
        expect(result).assertEqual(3.3.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3100
     * @tc.name builtinsArrayFindLastPrototypebTest3100
     * @tc.desc findLast(self: FixedArray<double>, predicate) 找到最后一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3.toDouble(), 2.2.toDouble(), 1.1.toDouble(), 2.2.toDouble()];
        const result = findLast(arr, (v, k, array) => v <= 2.2);
        expect(result).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3200
     * @tc.name builtinsArrayFindLastPrototypebTest3200
     * @tc.desc findLast(self: FixedArray<double>, predicate) 复杂条件：找最后一个大于1.1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble(), 2.2.toDouble()];
        const result = findLast(arr, (v, k, array) => v > 1.1 && k % 2 === 0);
        expect(result).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3300
     * @tc.name builtinsArrayFindLastPrototypebTest3300
     * @tc.desc findLast(self: FixedArray<float>, predicate) 找到最后一个大于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = findLast(arr, (v, k, array) => v > 2.0.toFloat());
        expect(result).assertEqual(4.4.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3400
     * @tc.name builtinsArrayFindLastPrototypebTest3400
     * @tc.desc findLast(self: FixedArray<float>, predicate) 找到最后一个小于2.0的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        const result = findLast(arr, (v, k, array) => v < 2.0.toFloat());
        expect(result).assertEqual(1.1.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3500
     * @tc.name builtinsArrayFindLastPrototypebTest3500
     * @tc.desc findLast(self: FixedArray<float>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = findLast(arr, (v, k, array) => v > 10.0.toFloat());
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3600
     * @tc.name builtinsArrayFindLastPrototypebTest3600
     * @tc.desc findLast(self: FixedArray<float>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3700
     * @tc.name builtinsArrayFindLastPrototypebTest3700
     * @tc.desc findLast(self: FixedArray<float>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 2.2.toFloat()];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3800
     * @tc.name builtinsArrayFindLastPrototypebTest3800
     * @tc.desc findLast(self: FixedArray<float>, predicate) 找到最后一个等于3.3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 3.3.toFloat()];
        const result = findLast(arr, (v, k, array) => v === 3.3.toFloat());
        expect(result).assertEqual(3.3.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest3900
     * @tc.name builtinsArrayFindLastPrototypebTest3900
     * @tc.desc findLast(self: FixedArray<float>, predicate) 找到最后一个小于等于2.2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 2.2.toFloat(), 1.1.toFloat(), 2.2.toFloat()];
        const result = findLast(arr, (v, k, array) => v <= 2.2.toFloat());
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4000
     * @tc.name builtinsArrayFindLastPrototypebTest4000
     * @tc.desc findLast(self: FixedArray<float>, predicate) 复杂条件：找最后一个大于1.1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 2.2.toFloat()];
        const result = findLast(arr, (v, k, array) => v > 1.1.toFloat() && k % 2 === 0);
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4100
     * @tc.name builtinsArrayFindLastPrototypebTest4100
     * @tc.desc findLast(self: FixedArray<int>, predicate) 找到最后一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4];
        const result = findLast(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4200
     * @tc.name builtinsArrayFindLastPrototypebTest4200
     * @tc.desc findLast(self: FixedArray<int>, predicate) 找到最后一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 1, 2, 1];
        const result = findLast(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4300
     * @tc.name builtinsArrayFindLastPrototypebTest4300
     * @tc.desc findLast(self: FixedArray<int>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = findLast(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4400
     * @tc.name builtinsArrayFindLastPrototypebTest4400
     * @tc.desc findLast(self: FixedArray<int>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4500
     * @tc.name builtinsArrayFindLastPrototypebTest4500
     * @tc.desc findLast(self: FixedArray<int>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 2];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4600
     * @tc.name builtinsArrayFindLastPrototypebTest4600
     * @tc.desc findLast(self: FixedArray<int>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 3];
        const result = findLast(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4700
     * @tc.name builtinsArrayFindLastPrototypebTest4700
     * @tc.desc findLast(self: FixedArray<int>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 2, 1, 2];
        const result = findLast(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4800
     * @tc.name builtinsArrayFindLastPrototypebTest4800
     * @tc.desc findLast(self: FixedArray<int>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 2];
        const result = findLast(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest4900
     * @tc.name builtinsArrayFindLastPrototypebTest4900
     * @tc.desc findLast(self: FixedArray<long>, predicate) 找到最后一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = findLast(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5000
     * @tc.name builtinsArrayFindLastPrototypebTest5000
     * @tc.desc findLast(self: FixedArray<long>, predicate) 找到最后一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 1, 2, 1];
        const result = findLast(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5100
     * @tc.name builtinsArrayFindLastPrototypebTest5100
     * @tc.desc findLast(self: FixedArray<long>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = findLast(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5200
     * @tc.name builtinsArrayFindLastPrototypebTest5200
     * @tc.desc findLast(self: FixedArray<long>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5300
     * @tc.name builtinsArrayFindLastPrototypebTest5300
     * @tc.desc findLast(self: FixedArray<long>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 2];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5400
     * @tc.name builtinsArrayFindLastPrototypebTest5400
     * @tc.desc findLast(self: FixedArray<long>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 3];
        const result = findLast(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5500
     * @tc.name builtinsArrayFindLastPrototypebTest5500
     * @tc.desc findLast(self: FixedArray<long>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [3, 2, 1, 2];
        const result = findLast(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5600
     * @tc.name builtinsArrayFindLastPrototypebTest5600
     * @tc.desc findLast(self: FixedArray<long>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3, 4, 2];
        const result = findLast(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindPrototypebTest5700
     * @tc.name builtinsArrayFindLastPrototypebTest5700
     * @tc.desc findLast(self: FixedArray<short>, predicate) 找到最后一个大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4];
        const result = findLast(arr, (v, k, array) => v > 2);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5800
     * @tc.name builtinsArrayFindLastPrototypebTest5800
     * @tc.desc findLast(self: FixedArray<short>, predicate) 找到最后一个小于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 1, 2, 1];
        const result = findLast(arr, (v, k, array) => v < 2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest5900
     * @tc.name builtinsArrayFindLastPrototypebTest5900
     * @tc.desc findLast(self: FixedArray<short>, predicate) 找不到元素返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = findLast(arr, (v, k, array) => v > 10);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest6000
     * @tc.name builtinsArrayFindLastPrototypebTest6000
     * @tc.desc findLast(self: FixedArray<short>, predicate) 空数组返回undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = findLast(arr, (v, k, array) => true);
        expect(result).assertEqual(undefined);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest6100
     * @tc.name builtinsArrayFindLastPrototypebTest6100
     * @tc.desc findLast(self: FixedArray<short>, predicate) 找到最后一个索引为1的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 2];
        const result = findLast(arr, (v, k, array) => k === 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest6200
     * @tc.name builtinsArrayFindLastPrototypebTest6200
     * @tc.desc findLast(self: FixedArray<short>, predicate) 找到最后一个等于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 3];
        const result = findLast(arr, (v, k, array) => v === 3);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest6300
     * @tc.name builtinsArrayFindLastPrototypebTest6300
     * @tc.desc findLast(self: FixedArray<short>, predicate) 找到最后一个小于等于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [3, 2, 1, 2];
        const result = findLast(arr, (v, k, array) => v <= 2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFindLastPrototypebTest6400
     * @tc.name builtinsArrayFindLastPrototypebTest6400
     * @tc.desc findLast(self: FixedArray<short>, predicate) 复杂条件：找最后一个大于1且索引为偶数的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFindLastPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFindLastPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3, 4, 2];
        const result = findLast(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}