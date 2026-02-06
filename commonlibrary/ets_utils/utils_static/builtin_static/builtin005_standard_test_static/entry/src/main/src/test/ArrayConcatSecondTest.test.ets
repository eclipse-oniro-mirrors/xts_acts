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
export default function builtinsArrayConcatSecondPrototypebTest(){
  describe('builtinsArrayConcatSecondPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayConcatSecondPrototypebTest0100
     * @tc.name builtinsArrayConcatSecondPrototypebTest0100
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [1, 2];
        const arr2: FixedArray<long> = [3, 4];
        const result = concat(arr1, arr2);
        const target: FixedArray<long> = [1, 2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0200
     * @tc.name builtinsArrayConcatSecondPrototypebTest0200
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [];
        const arr2: FixedArray<long> = [5, 6];
        const result = concat(arr1, arr2);
        const target: FixedArray<long> = [5, 6];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0300
     * @tc.name builtinsArrayConcatSecondPrototypebTest0300
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [7];
        const arr2: FixedArray<long> = [8];
        const arr3: FixedArray<long> = [9];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<long> = [7, 8, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0400
     * @tc.name builtinsArrayConcatSecondPrototypebTest0400
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [10, 11];
        const result = concat(arr1, arr1);
        const target: FixedArray<long> = [10, 11, 10, 11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0500
     * @tc.name builtinsArrayConcatSecondPrototypebTest0500
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [];
        const arr2: FixedArray<long> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0600
     * @tc.name builtinsArrayConcatSecondPrototypebTest0600
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [12, 13];
        const result = concat(arr1);
        const target: FixedArray<long> = [12, 13];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0700
     * @tc.name builtinsArrayConcatSecondPrototypebTest0700
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [14];
        const arr2: FixedArray<long> = [15, 16, 17];
        const result = concat(arr1, arr2);
        const target: FixedArray<long> = [14, 15, 16, 17];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0800
     * @tc.name builtinsArrayConcatSecondPrototypebTest0800
     * @tc.desc concat(self: FixedArray<long>, ...items: FixedArray<ConcatArray<long>>): FixedArray<long> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const arr1: FixedArray<long> = [];
        const arr2: FixedArray<long> = [];
        const arr3: FixedArray<long> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest0900
     * @tc.name builtinsArrayConcatSecondPrototypebTest0900
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [1, 2];
        const arr2: FixedArray<long> = [3, 4];
        const result = concat(arr1, arr2);
        const target: FixedArray<long> = [1, 2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1000
     * @tc.name builtinsArrayConcatSecondPrototypebTest1000
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [];
        const arr2: FixedArray<long> = [5, 6];
        const result = concat(arr1, arr2);
        const target: FixedArray<long> = [5, 6];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1100
     * @tc.name builtinsArrayConcatSecondPrototypebTest1100
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [7];
        const arr2: FixedArray<long> = [8];
        const arr3: FixedArray<long> = [9];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<long> = [7, 8, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1200
     * @tc.name builtinsArrayConcatSecondPrototypebTest1200
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [10, 11];
        const result = concat(arr1, arr1);
        const target: FixedArray<long> = [10, 11, 10, 11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1300
     * @tc.name builtinsArrayConcatSecondPrototypebTest1300
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [];
        const arr2: FixedArray<long> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1400
     * @tc.name builtinsArrayConcatSecondPrototypebTest1400
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 只传两个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [12, 13];
        const arr2: FixedArray<long> = [14];
        const result = concat(arr1, arr2);
        const target: FixedArray<long> = [12, 13, 14];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1500
     * @tc.name builtinsArrayConcatSecondPrototypebTest1500
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [15];
        const arr2: FixedArray<long> = [16, 17, 18];
        const arr3: FixedArray<long> = [19];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<long> = [15, 16, 17, 18, 19];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1600
     * @tc.name builtinsArrayConcatSecondPrototypebTest1600
     * @tc.desc concat(self: FixedArray<long>, fst: FixedArray<long>, ...more: FixedArray<FixedArray<long>>): FixedArray<long> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<long> = [];
        const arr2: FixedArray<long> = [];
        const arr3: FixedArray<long> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1700
     * @tc.name builtinsArrayConcatSecondPrototypebTest1700
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [1, 2];
        const arr2: FixedArray<short> = [3, 4];
        const result = concat(arr1, arr2);
        const target: FixedArray<short> = [1, 2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1800
     * @tc.name builtinsArrayConcatSecondPrototypebTest1800
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [5, 6];
        const result = concat(arr1, arr2);
        const target: FixedArray<short> = [5, 6];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest1900
     * @tc.name builtinsArrayConcatSecondPrototypebTest1900
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [7];
        const arr2: FixedArray<short> = [8];
        const arr3: FixedArray<short> = [9];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<short> = [7, 8, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2000
     * @tc.name builtinsArrayConcatSecondPrototypebTest2000
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [10, 11];
        const result = concat(arr1, arr1);
        const target: FixedArray<short> = [10, 11, 10, 11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2100
     * @tc.name builtinsArrayConcatSecondPrototypebTest2100
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2200
     * @tc.name builtinsArrayConcatSecondPrototypebTest2200
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [12, 13];
        const result = concat(arr1);
        const target: FixedArray<short> = [12, 13];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2300
     * @tc.name builtinsArrayConcatSecondPrototypebTest2300
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [14];
        const arr2: FixedArray<short> = [15, 16, 17];
        const result = concat(arr1, arr2);
        const target: FixedArray<short> = [14, 15, 16, 17];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2400
     * @tc.name builtinsArrayConcatSecondPrototypebTest2400
     * @tc.desc concat(self: FixedArray<short>, ...items: FixedArray<ConcatArray<short>>): FixedArray<short> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [];
        const arr3: FixedArray<short> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2500
     * @tc.name builtinsArrayConcatSecondPrototypebTest2500
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [1, 2];
        const arr2: FixedArray<short> = [3, 4];
        const result = concat(arr1, arr2);
        const target: FixedArray<short> = [1, 2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2600
     * @tc.name builtinsArrayConcatSecondPrototypebTest2600
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [5, 6];
        const result = concat(arr1, arr2);
        const target: FixedArray<short> = [5, 6];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2700
     * @tc.name builtinsArrayConcatSecondPrototypebTest2700
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [7];
        const arr2: FixedArray<short> = [8];
        const arr3: FixedArray<short> = [9];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<short> = [7, 8, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2800
     * @tc.name builtinsArrayConcatSecondPrototypebTest2800
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [10, 11];
        const result = concat(arr1, arr1);
        const target: FixedArray<short> = [10, 11, 10, 11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest2900
     * @tc.name builtinsArrayConcatSecondPrototypebTest2900
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest3000
     * @tc.name builtinsArrayConcatSecondPrototypebTest3000
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 只传两个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [12, 13];
        const arr2: FixedArray<short> = [14];
        const result = concat(arr1, arr2);
        const target: FixedArray<short> = [12, 13, 14];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest3100
     * @tc.name builtinsArrayConcatSecondPrototypebTest3100
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [15];
        const arr2: FixedArray<short> = [16, 17, 18];
        const arr3: FixedArray<short> = [19];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<short> = [15, 16, 17, 18, 19];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatSecondPrototypebTest3200
     * @tc.name builtinsArrayConcatSecondPrototypebTest3200
     * @tc.desc concat(self: FixedArray<short>, fst: FixedArray<short>, ...more: FixedArray<FixedArray<short>>): FixedArray<short> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [];
        const arr3: FixedArray<short> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
