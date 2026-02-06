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

export default function Array_Sort_Subarray_Third_Test_static() {
  describe('Array_Sort_Subarray_Third_Test_static', ():void => {
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
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0100
     * @tc.name Array_Sort_Subarray_Third_Test_static_0100
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [100, 200, 300];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0200
     * @tc.name Array_Sort_Subarray_Third_Test_static_0200
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [300, 200, 100];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0300
     * @tc.name Array_Sort_Subarray_Third_Test_static_0300
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [500, 500, 500];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [500, 500, 500];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0400
     * @tc.name Array_Sort_Subarray_Third_Test_static_0400
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [500, 500, 500];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [500, 500, 500];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0500
     * @tc.name Array_Sort_Subarray_Third_Test_static_0500
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs < rhs);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0600
     * @tc.name Array_Sort_Subarray_Third_Test_static_0600
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [800, 700, 600, 500];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [500, 600, 700, 800];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0700
     * @tc.name Array_Sort_Subarray_Third_Test_static_0700
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [800, 700, 600, 500];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [800, 700, 600, 500];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0800
     * @tc.name Array_Sort_Subarray_Third_Test_static_0800
     * @tc.desc test sort_subarray(arr: FixedArray<long>, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        sort_subarray(arr, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [100];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_0900
     * @tc.name Array_Sort_Subarray_Third_Test_static_0900
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        sort_subarray(arr, 2, 4, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [100, 200, 300, 400, 500];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1000
     * @tc.name Array_Sort_Subarray_Third_Test_static_1000
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300, 400, 500];
        sort_subarray(arr, 1, 4, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [100, 400, 300, 200, 500];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1100
     * @tc.name Array_Sort_Subarray_Third_Test_static_1100
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        sort_subarray(arr, 0, 0, (lhs: long, rhs: long): boolean => lhs > rhs);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1200
     * @tc.name Array_Sort_Subarray_Third_Test_static_1200
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [300, 200, 500, 100, 800];
        sort_subarray(arr, 2, 3, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [300, 200, 500, 100, 800];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1300
     * @tc.name Array_Sort_Subarray_Third_Test_static_1300
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [300, 200, 500, 100, 800];
        sort_subarray(arr, 2, 2, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [300, 200, 500, 100, 800];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1400
     * @tc.name Array_Sort_Subarray_Third_Test_static_1400
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [300, 200, 500, 100, 800];
        sort_subarray(arr, 1, 3, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [300, 500, 200, 100, 800];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1500
     * @tc.name Array_Sort_Subarray_Third_Test_static_1500
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [200, 200, 200];
          sort_subarray(arr, -1, 1, (lhs: long, rhs: long): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1600
     * @tc.name Array_Sort_Subarray_Third_Test_static_1600
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, endIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [200, 200, 200];
          sort_subarray(arr, 1, 5, (lhs: long, rhs: long): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1700
     * @tc.name Array_Sort_Subarray_Third_Test_static_1700
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        sort_subarray(arr, 1, (lhs: long, rhs: long): boolean => lhs > rhs);
        const expected: FixedArray<long> = [100, 300, 200];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1800
     * @tc.name Array_Sort_Subarray_Third_Test_static_1800
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        sort_subarray(arr, 1, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [100, 200, 300];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_1900
     * @tc.name Array_Sort_Subarray_Third_Test_static_1900
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        sort_subarray(arr, 0, (lhs: long, rhs: long): boolean => lhs < rhs);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2000
     * @tc.name Array_Sort_Subarray_Third_Test_static_2000
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [600];
        sort_subarray(arr, 0, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [600];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2100
     * @tc.name Array_Sort_Subarray_Third_Test_static_2100
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [20, 70, 60, 40];
        sort_subarray(arr, 1, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [20, 40, 60, 70];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2200
     * @tc.name Array_Sort_Subarray_Third_Test_static_2200
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [20, 70, 60, 40];
        sort_subarray(arr, 2, (lhs: long, rhs: long): boolean => lhs < rhs);
        const expected: FixedArray<long> = [20, 70, 40, 60];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2300
     * @tc.name Array_Sort_Subarray_Third_Test_static_2300
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [50, 70, 60, 40];
          sort_subarray(arr, -4, (lhs: long, rhs: long): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2400
     * @tc.name Array_Sort_Subarray_Third_Test_static_2400
     * @tc.desc test sort_subarray(arr: FixedArray<long>, startIndex: int, mustPrecede: ((lhs: long, rhs: long)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [50, 70, 60, 40];
          sort_subarray(arr, 6, (lhs: long, rhs: long): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2500
     * @tc.name Array_Sort_Subarray_Third_Test_static_2500
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [5, 10, 15];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2600
     * @tc.name Array_Sort_Subarray_Third_Test_static_2600
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [15, 10, 5];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2700
     * @tc.name Array_Sort_Subarray_Third_Test_static_2700
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [20, 5, -5, 15, 10];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [-5, 5, 10, 15, 20];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2800
     * @tc.name Array_Sort_Subarray_Third_Test_static_2800
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [20, 5, -5, 15, 10];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [20, 15, 10, 5, -5];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_2900
     * @tc.name Array_Sort_Subarray_Third_Test_static_2900
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 5, 5];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [5, 5, 5];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3000
     * @tc.name Array_Sort_Subarray_Third_Test_static_3000
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 5, 5];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [5, 5, 5];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3100
     * @tc.name Array_Sort_Subarray_Third_Test_static_3100
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs > rhs);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3200
     * @tc.name Array_Sort_Subarray_Third_Test_static_3200
     * @tc.desc test sort_subarray(arr: FixedArray<short>, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10];
        sort_subarray(arr, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [10];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3300
     * @tc.name Array_Sort_Subarray_Third_Test_static_3300
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 5, 10, 15, 20, 25];
        sort_subarray(arr, 0, 6, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [25, 20, 15, 10, 5, 0];
        expect(arr.length).assertEqual(6);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        expect(arr[5]).assertEqual(expected[5]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3400
     * @tc.name Array_Sort_Subarray_Third_Test_static_3400
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 5, 10, 15, 20, 25];
        sort_subarray(arr, 2, 5, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [0, 5, 20, 15, 10, 25];
        expect(arr.length).assertEqual(6);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        expect(arr[5]).assertEqual(expected[5]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3500
     * @tc.name Array_Sort_Subarray_Third_Test_static_3500
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-5, 5, 0, -10, 10];
        sort_subarray(arr, 2, 2, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [-5, 5, 0, -10, 10];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3600
     * @tc.name Array_Sort_Subarray_Third_Test_static_3600
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-5, 5, 0, -10, 10];
        sort_subarray(arr, 2, 3, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [-5, 5, 0, -10, 10];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3700
     * @tc.name Array_Sort_Subarray_Third_Test_static_3700
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-5, 5, 0, -10, 10];
        sort_subarray(arr, 1, 4, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [-5, -10, 0, 5, 10];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3800
     * @tc.name Array_Sort_Subarray_Third_Test_static_3800
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, 50, 50, 50];
        sort_subarray(arr, 1, 3, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [50, 50, 50, 50];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_3900
     * @tc.name Array_Sort_Subarray_Third_Test_static_3900
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_3900';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [10, 5, 15, 10];
          sort_subarray(arr, -1, 1, (lhs: short, rhs: short): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4000
     * @tc.name Array_Sort_Subarray_Third_Test_static_4000
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [10, 5, 15, 10];
          sort_subarray(arr, 3, 10, (lhs: short, rhs: short): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4100
     * @tc.name Array_Sort_Subarray_Third_Test_static_4100
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, 40, 30, 20, 10];
        sort_subarray(arr, 2, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [50, 40, 10, 20, 30];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4200
     * @tc.name Array_Sort_Subarray_Third_Test_static_4200
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, 40, 30, 20, 10];
        sort_subarray(arr, 2, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [50, 40, 30, 20, 10];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4300
     * @tc.name Array_Sort_Subarray_Third_Test_static_4300
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 10, 10];
        sort_subarray(arr, 1, (lhs: short, rhs: short): boolean => lhs > rhs);
        const expected: FixedArray<short> = [10, 10, 10];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4400
     * @tc.name Array_Sort_Subarray_Third_Test_static_4400
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 10, 10];
        sort_subarray(arr, 1, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [10, 10, 10];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4500
     * @tc.name Array_Sort_Subarray_Third_Test_static_4500
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        sort_subarray(arr, 0, (lhs: short, rhs: short): boolean => lhs < rhs);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4600
     * @tc.name Array_Sort_Subarray_Third_Test_static_4600
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, -10, 10, -10];
        sort_subarray(arr, 1, (lhs: short, rhs: short): boolean => lhs < rhs);
        const expected: FixedArray<short> = [10, -10, -10, 10];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4700
     * @tc.name Array_Sort_Subarray_Third_Test_static_4700
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [5, 4, 10, 15];
          sort_subarray(arr, -4, (lhs: short, rhs: short): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_THIRD_TEST_4800
     * @tc.name Array_Sort_Subarray_Third_Test_static_4800
     * @tc.desc test sort_subarray(arr: FixedArray<short>, startIndex: int, endIndex: int, mustPrecede: ((lhs: short, rhs: short)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Third_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Third_Test_static_4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [5, 4, 10, 15];
          sort_subarray(arr, 8, (lhs: short, rhs: short): boolean => lhs < rhs);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('sort: bounds verification failed');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}