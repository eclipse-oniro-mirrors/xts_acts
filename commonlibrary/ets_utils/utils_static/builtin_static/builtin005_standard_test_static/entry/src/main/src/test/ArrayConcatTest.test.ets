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
export default function builtinsArrayConcatPrototypebTest(){
  describe('builtinsArrayConcatPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayConcatPrototypebTest0100
     * @tc.name builtinsArrayConcatPrototypebTest0100
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true, false];
        const arr2: FixedArray<boolean> = [false, true];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([true, false, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0200
     * @tc.name builtinsArrayConcatPrototypebTest0200
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [];
        const arr2: FixedArray<boolean> = [true, false];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0300
     * @tc.name builtinsArrayConcatPrototypebTest0300
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true];
        const arr2: FixedArray<boolean> = [false];
        const arr3: FixedArray<boolean> = [true];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0400
     * @tc.name builtinsArrayConcatPrototypebTest0400
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true, false];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([true, false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0500
     * @tc.name builtinsArrayConcatPrototypebTest0500
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [];
        const arr2: FixedArray<boolean> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0600
     * @tc.name builtinsArrayConcatPrototypebTest0600
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true, false];
        const result = concat(arr1);
        expect([...result]).assertDeepEquals([true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0700
     * @tc.name builtinsArrayConcatPrototypebTest0700
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true];
        const arr2: FixedArray<boolean> = [false, true, false];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([true, false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest0800
     * @tc.name builtinsArrayConcatPrototypebTest0800
     * @tc.desc concat(self: FixedArray<boolean>, ...items: FixedArray<ConcatArray<boolean>>): FixedArray<boolean> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [];
        const arr2: FixedArray<boolean> = [];
        const arr3: FixedArray<boolean> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest0900
     * @tc.name builtinsArrayConcatPrototypebTest0900
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true, false];
        const arr2: FixedArray<boolean> = [false, true];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([true, false, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1000
     * @tc.name builtinsArrayConcatPrototypebTest1000
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [];
        const arr2: FixedArray<boolean> = [true, false];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1100
     * @tc.name builtinsArrayConcatPrototypebTest1100
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true];
        const arr2: FixedArray<boolean> = [false];
        const arr3: FixedArray<boolean> = [true];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1200
     * @tc.name builtinsArrayConcatPrototypebTest1200
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true, false];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([true, false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1300
     * @tc.name builtinsArrayConcatPrototypebTest1300
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [];
        const arr2: FixedArray<boolean> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1400
     * @tc.name builtinsArrayConcatPrototypebTest1400
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 只传两个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true, false];
        const arr2: FixedArray<boolean> = [true];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1500
     * @tc.name builtinsArrayConcatPrototypebTest1500
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [true];
        const arr2: FixedArray<boolean> = [false, true, false];
        const arr3: FixedArray<boolean> = [true];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([true, false, true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1600
     * @tc.name builtinsArrayConcatPrototypebTest1600
     * @tc.desc concat(self: FixedArray<boolean>, fst: FixedArray<boolean>, ...more: FixedArray<FixedArray<boolean>>): FixedArray<boolean> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<boolean> = [];
        const arr2: FixedArray<boolean> = [];
        const arr3: FixedArray<boolean> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest1700
     * @tc.name builtinsArrayConcatPrototypebTest1700
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [1, 2];
        const arr2: FixedArray<byte> = [3, 4];
        const result = concat(arr1, arr2);
        const target: FixedArray<byte> = [1, 2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1800
     * @tc.name builtinsArrayConcatPrototypebTest1800
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [];
        const arr2: FixedArray<byte> = [5, 6];
        const result = concat(arr1, arr2);
        const target: FixedArray<byte> = [5, 6];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest1900
     * @tc.name builtinsArrayConcatPrototypebTest1900
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [7];
        const arr2: FixedArray<byte> = [8];
        const arr3: FixedArray<byte> = [9];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<byte> = [7, 8, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2000
     * @tc.name builtinsArrayConcatPrototypebTest2000
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [10, 11];
        const result = concat(arr1, arr1);
        const target: FixedArray<byte> = [10, 11, 10, 11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2100
     * @tc.name builtinsArrayConcatPrototypebTest2100
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [];
        const arr2: FixedArray<byte> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2200
     * @tc.name builtinsArrayConcatPrototypebTest2200
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [12, 13];
        const result = concat(arr1);
        const target: FixedArray<byte> = [12, 13];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2300
     * @tc.name builtinsArrayConcatPrototypebTest2300
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [14];
        const arr2: FixedArray<byte> = [15, 16, 17];
        const result = concat(arr1, arr2);
        const target: FixedArray<byte> = [14, 15, 16, 17];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2400
     * @tc.name builtinsArrayConcatPrototypebTest2400
     * @tc.desc concat(self: FixedArray<byte>, ...items: FixedArray<ConcatArray<byte>>): FixedArray<byte> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [];
        const arr2: FixedArray<byte> = [];
        const arr3: FixedArray<byte> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2500
     * @tc.name builtinsArrayConcatPrototypebTest2500
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [1, 2];
        const arr2: FixedArray<byte> = [3, 4];
        const result = concat(arr1, arr2);
        const target: FixedArray<byte> = [1, 2, 3, 4];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2600
     * @tc.name builtinsArrayConcatPrototypebTest2600
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [];
        const arr2: FixedArray<byte> = [5, 6];
        const result = concat(arr1, arr2);
        const target: FixedArray<byte> = [5, 6];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2700
     * @tc.name builtinsArrayConcatPrototypebTest2700
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [7];
        const arr2: FixedArray<byte> = [8];
        const arr3: FixedArray<byte> = [9];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<byte> = [7, 8, 9];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2800
     * @tc.name builtinsArrayConcatPrototypebTest2800
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [10, 11];
        const result = concat(arr1, arr1);
        const target: FixedArray<byte> = [10, 11, 10, 11];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest2900
     * @tc.name builtinsArrayConcatPrototypebTest2900
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [];
        const arr2: FixedArray<byte> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3000
     * @tc.name builtinsArrayConcatPrototypebTest3000
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 只传两个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [12, 13];
        const arr2: FixedArray<byte> = [14];
        const result = concat(arr1, arr2);
        const target: FixedArray<byte> = [12, 13, 14];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3100
     * @tc.name builtinsArrayConcatPrototypebTest3100
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [15];
        const arr2: FixedArray<byte> = [16, 17, 18];
        const arr3: FixedArray<byte> = [19];
        const result = concat(arr1, arr2, arr3);
        const target: FixedArray<byte> = [15, 16, 17, 18, 19];
        expect([...result]).assertDeepEquals([...target]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3200
     * @tc.name builtinsArrayConcatPrototypebTest3200
     * @tc.desc concat(self: FixedArray<byte>, fst: FixedArray<byte>, ...more: FixedArray<FixedArray<byte>>): FixedArray<byte> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<byte> = [];
        const arr2: FixedArray<byte> = [];
        const arr3: FixedArray<byte> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest3300
     * @tc.name builtinsArrayConcatPrototypebTest3300
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'a'),new Char(c'b') ];
        const arr2: FixedArray<char> = [new Char(c'c'),new Char(c'd') ];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([new Char(c'a'), new Char(c'b'), new Char(c'c'), new Char(c'd')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3400
     * @tc.name builtinsArrayConcatPrototypebTest3400
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [];
        const arr2: FixedArray<char> = [new Char(c'e'), new Char(c'f')];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([new Char(c'e'), new Char(c'f')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3500
     * @tc.name builtinsArrayConcatPrototypebTest3500
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'g')];
        const arr2: FixedArray<char> = [new Char(c'h')];
        const arr3: FixedArray<char> = [new Char(c'i')];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([new Char(c'g'), new Char(c'h'), new Char(c'i')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3600
     * @tc.name builtinsArrayConcatPrototypebTest3600
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'j'), new Char(c'k')];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([new Char(c'j'), new Char(c'k'), new Char(c'j'), new Char(c'k')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3700
     * @tc.name builtinsArrayConcatPrototypebTest3700
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [];
        const arr2: FixedArray<char> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3800
     * @tc.name builtinsArrayConcatPrototypebTest3800
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'l'), new Char(c'm')];
        const result = concat(arr1);
        expect([...result]).assertDeepEquals([new Char(c'l'), new Char(c'm')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest3900
     * @tc.name builtinsArrayConcatPrototypebTest3900
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'n')];
        const arr2: FixedArray<char> = [new Char(c'o'), new Char(c'p'), new Char(c'q')];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([new Char(c'n'), new Char(c'o'), new Char(c'p'), new Char(c'q')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4000
     * @tc.name builtinsArrayConcatPrototypebTest4000
     * @tc.desc concat(self: FixedArray<char>, ...items: FixedArray<ConcatArray<char>>): FixedArray<char> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [];
        const arr2: FixedArray<char> = [];
        const arr3: FixedArray<char> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4100
     * @tc.name builtinsArrayConcatPrototypebTest4100
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'a'), new Char(c'b')];
        const arr2: FixedArray<char> = [new Char(c'c'), new Char(c'd')];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([new Char(c'a'), new Char(c'b'), new Char(c'c'), new Char(c'd')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4200
     * @tc.name builtinsArrayConcatPrototypebTest4200
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [];
        const arr2: FixedArray<char> = [new Char(c'e'), new Char(c'f')];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([new Char(c'e'), new Char(c'f')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4300
     * @tc.name builtinsArrayConcatPrototypebTest4300
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'g')];
        const arr2: FixedArray<char> = [new Char(c'h')];
        const arr3: FixedArray<char> = [new Char(c'i')];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([new Char(c'g'), new Char(c'h'), new Char(c'i')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4400
     * @tc.name builtinsArrayConcatPrototypebTest4400
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'j'), new Char(c'k')];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([new Char(c'j'), new Char(c'k'), new Char(c'j'), new Char(c'k')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4500
     * @tc.name builtinsArrayConcatPrototypebTest4500
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [];
        const arr2: FixedArray<char> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4600
     * @tc.name builtinsArrayConcatPrototypebTest4600
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 只传两个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'l'), new Char(c'm')];
        const arr2: FixedArray<char> = [new Char(c'n')];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([new Char(c'l'), new Char(c'm'), new Char(c'n')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4700
     * @tc.name builtinsArrayConcatPrototypebTest4700
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [new Char(c'o')];
        const arr2: FixedArray<char> = [new Char(c'p'), new Char(c'q'), new Char(c'r')];
        const arr3: FixedArray<char> = [new Char(c's')];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([new Char(c'o'), new Char(c'p'), new Char(c'q'), new Char(c'r'), new Char(c's')]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4800
     * @tc.name builtinsArrayConcatPrototypebTest4800
     * @tc.desc concat(self: FixedArray<char>, fst: FixedArray<char>, ...more: FixedArray<FixedArray<char>>): FixedArray<char> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<char> = [];
        const arr2: FixedArray<char> = [];
        const arr3: FixedArray<char> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest4900
     * @tc.name builtinsArrayConcatPrototypebTest4900
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [1.1, 2.2];
        const arr2: FixedArray<double> = [3.3, 4.4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5000
     * @tc.name builtinsArrayConcatPrototypebTest5000
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [5.5, 6.6];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([5.5, 6.6]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5100
     * @tc.name builtinsArrayConcatPrototypebTest5100
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [7.7];
        const arr2: FixedArray<double> = [8.8];
        const arr3: FixedArray<double> = [9.9];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([7.7, 8.8, 9.9]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5200
     * @tc.name builtinsArrayConcatPrototypebTest5200
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [10.1, 11.2];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([10.1, 11.2, 10.1, 11.2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5300
     * @tc.name builtinsArrayConcatPrototypebTest5300
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5400
     * @tc.name builtinsArrayConcatPrototypebTest5400
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [12.3, 13.4];
        const result = concat(arr1);
        expect([...result]).assertDeepEquals([12.3, 13.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5500
     * @tc.name builtinsArrayConcatPrototypebTest5500
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [14.5];
        const arr2: FixedArray<double> = [15.6, 16.7, 17.8];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([14.5, 15.6, 16.7, 17.8]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5600
     * @tc.name builtinsArrayConcatPrototypebTest5600
     * @tc.desc concat(self: FixedArray<double>, ...items: FixedArray<ConcatArray<double>>): FixedArray<double> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [];
        const arr3: FixedArray<double> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest5700
     * @tc.name builtinsArrayConcatPrototypebTest5700
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 连接两个非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat()];
        const arr2: FixedArray<float> = [3.3.toFloat(), 4.4.toFloat()];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest5800
     * @tc.name builtinsArrayConcatPrototypebTest5800
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 连接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [];
        const arr2: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat()];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest5900
     * @tc.name builtinsArrayConcatPrototypebTest5900
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 连接多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [7.7.toFloat()];
        const arr2: FixedArray<float> = [8.8.toFloat()];
        const arr3: FixedArray<float> = [9.9.toFloat()];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6000
     * @tc.name builtinsArrayConcatPrototypebTest6000
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 连接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [10.1.toFloat(), 11.2.toFloat()];
        const result = concat(arr1, arr1);
        expect(result.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6100
     * @tc.name builtinsArrayConcatPrototypebTest6100
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [];
        const arr2: FixedArray<float> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6200
     * @tc.name builtinsArrayConcatPrototypebTest6200
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [12.3.toFloat(), 13.4.toFloat()];
        const result = concat(arr1);
        expect(result.length).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6300
     * @tc.name builtinsArrayConcatPrototypebTest6300
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 连接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [14.5.toFloat()];
        const arr2: FixedArray<float> = [15.6.toFloat(), 16.7.toFloat(), 17.8.toFloat()];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6400
     * @tc.name builtinsArrayConcatPrototypebTest6400
     * @tc.desc concat(self: FixedArray<float>, ...items: FixedArray<ConcatArray<float>>): FixedArray<float> 多次连接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [];
        const arr2: FixedArray<float> = [];
        const arr3: FixedArray<float> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6500
     * @tc.name builtinsArrayConcatPrototypebTest6500
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 基本拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [1.1, 2.2];
        const arr2: FixedArray<double> = [3.3, 4.4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6600
     * @tc.name builtinsArrayConcatPrototypebTest6600
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 拼接空数组和非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [5.5, 6.6];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([5.5, 6.6]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6700
     * @tc.name builtinsArrayConcatPrototypebTest6700
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 多数组拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [1.1];
        const arr2: FixedArray<double> = [2.2];
        const arr3: FixedArray<double> = [3.3];
        const arr4: FixedArray<double> = [4.4];
        const result = concat(arr1, arr2, arr3, arr4);
        expect([...result]).assertDeepEquals([1.1, 2.2, 3.3, 4.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6800
     * @tc.name builtinsArrayConcatPrototypebTest6800
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 全空数组拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [];
        const arr3: FixedArray<double> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest6900
     * @tc.name builtinsArrayConcatPrototypebTest6900
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 拼接自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [10.1, 11.2];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([10.1, 11.2, 10.1, 11.2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7000
     * @tc.name builtinsArrayConcatPrototypebTest7000
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 只传一个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [12.3, 13.4];
        const result = concat(arr1);
        expect([...result]).assertDeepEquals([12.3, 13.4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7100
     * @tc.name builtinsArrayConcatPrototypebTest7100
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 拼接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [14.5];
        const arr2: FixedArray<double> = [15.6, 16.7, 17.8];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([14.5, 15.6, 16.7, 17.8]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7200
     * @tc.name builtinsArrayConcatPrototypebTest7200
     * @tc.desc concat(self: FixedArray<double>, fst: FixedArray<double>, ...more: FixedArray<FixedArray<double>>): FixedArray<double> 多次拼接空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [];
        const arr3: FixedArray<double> = [];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7300
     * @tc.name builtinsArrayConcatPrototypebTest7300
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 基本拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat()];
        const arr2: FixedArray<float> = [3.3.toFloat(), 4.4.toFloat()];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7400
     * @tc.name builtinsArrayConcatPrototypebTest7400
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接非空数组与空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat()];
        const arr2: FixedArray<float> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7500
     * @tc.name builtinsArrayConcatPrototypebTest7500
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接空数组与非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [];
        const arr2: FixedArray<float> = [3.3.toFloat(), 4.4.toFloat()];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7600
     * @tc.name builtinsArrayConcatPrototypebTest7600
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接两个空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [];
        const arr2: FixedArray<float> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7700
     * @tc.name builtinsArrayConcatPrototypebTest7700
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接三个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat()];
        const arr2: FixedArray<float> = [2.2.toFloat()];
        const arr3: FixedArray<float> = [3.3.toFloat()];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7800
     * @tc.name builtinsArrayConcatPrototypebTest7800
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接多个数组（部分为空）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat()];
        const arr2: FixedArray<float> = [];
        const arr3: FixedArray<float> = [3.3.toFloat()];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest7900
     * @tc.name builtinsArrayConcatPrototypebTest7900
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接一个数组自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest7900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat()];
        const result = concat(arr1, arr1);
        expect(result.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8000
     * @tc.name builtinsArrayConcatPrototypebTest8000
     * @tc.desc concat(self: FixedArray<float>, fst: FixedArray<float>, ...more: FixedArray<FixedArray<float>>): FixedArray<float> 拼接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<float> = [1.1.toFloat()];
        const arr2: FixedArray<float> = [2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8100
     * @tc.name builtinsArrayConcatPrototypebTest8100
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 基本拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1, 2];
        const arr2: FixedArray<int> = [3, 4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1, 2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8200
     * @tc.name builtinsArrayConcatPrototypebTest8200
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接非空数组与空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1, 2];
        const arr2: FixedArray<int> = [];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1, 2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8300
     * @tc.name builtinsArrayConcatPrototypebTest8300
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接空数组与非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [];
        const arr2: FixedArray<int> = [3, 4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8400
     * @tc.name builtinsArrayConcatPrototypebTest8400
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接两个空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [];
        const arr2: FixedArray<int> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8500
     * @tc.name builtinsArrayConcatPrototypebTest8500
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接三个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1];
        const arr2: FixedArray<int> = [2];
        const arr3: FixedArray<int> = [3];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8600
     * @tc.name builtinsArrayConcatPrototypebTest8600
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接多个数组（部分为空）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1];
        const arr2: FixedArray<int> = [];
        const arr3: FixedArray<int> = [3];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([1, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest8700
     * @tc.name builtinsArrayConcatPrototypebTest8700
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接一个数组自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1, 2];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([1, 2, 1, 2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest8800
     * @tc.name builtinsArrayConcatPrototypebTest8800
     * @tc.desc concat(self: FixedArray<int>, ...items: FixedArray<ConcatArray<int>>): FixedArray<int> 拼接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1];
        const arr2: FixedArray<int> = [2, 3, 4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1, 2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayConcatPrototypebTest8900
     * @tc.name builtinsArrayConcatPrototypebTest8900
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 基本拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1, 2];
        const arr2: FixedArray<int> = [3, 4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1, 2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9000
     * @tc.name builtinsArrayConcatPrototypebTest9000
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接非空数组与空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1, 2];
        const arr2: FixedArray<int> = [];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1, 2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9100
     * @tc.name builtinsArrayConcatPrototypebTest9100
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接空数组与非空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [];
        const arr2: FixedArray<int> = [3, 4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9200
     * @tc.name builtinsArrayConcatPrototypebTest9200
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接两个空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [];
        const arr2: FixedArray<int> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9300
     * @tc.name builtinsArrayConcatPrototypebTest9300
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接三个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1];
        const arr2: FixedArray<int> = [2];
        const arr3: FixedArray<int> = [3];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([1, 2, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9400
     * @tc.name builtinsArrayConcatPrototypebTest9400
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接多个数组（部分为空）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1];
        const arr2: FixedArray<int> = [];
        const arr3: FixedArray<int> = [3];
        const result = concat(arr1, arr2, arr3);
        expect([...result]).assertDeepEquals([1, 3]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9500
     * @tc.name builtinsArrayConcatPrototypebTest9500
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接一个数组自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1, 2];
        const result = concat(arr1, arr1);
        expect([...result]).assertDeepEquals([1, 2, 1, 2]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayConcatPrototypebTest9600
     * @tc.name builtinsArrayConcatPrototypebTest9600
     * @tc.desc concat(self: FixedArray<int>, fst: FixedArray<int>, ...more: FixedArray<FixedArray<int>>): FixedArray<int> 拼接不同长度的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayConcatPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayConcatPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const arr1: FixedArray<int> = [1];
        const arr2: FixedArray<int> = [2, 3, 4];
        const result = concat(arr1, arr2);
        expect([...result]).assertDeepEquals([1, 2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
