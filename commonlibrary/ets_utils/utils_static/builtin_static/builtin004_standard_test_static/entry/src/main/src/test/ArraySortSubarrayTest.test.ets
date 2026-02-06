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

export default function Array_Sort_Subarray_Test_static() {
  describe('Array_Sort_Subarray_Test_static', ():void => {
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0100
     * @tc.name Array_Sort_Subarray_Test_static_0100
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        sort_subarray(arr, (lhs, rhs) => !lhs && rhs);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0200
     * @tc.name Array_Sort_Subarray_Test_static_0200
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        sort_subarray(arr, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0300
     * @tc.name Array_Sort_Subarray_Test_static_0300
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        sort_subarray(arr, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [false];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0400
     * @tc.name Array_Sort_Subarray_Test_static_0400
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        sort_subarray(arr, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true, true, false];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0500
     * @tc.name Array_Sort_Subarray_Test_static_0500
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        sort_subarray(arr, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [false, true, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0600
     * @tc.name Array_Sort_Subarray_Test_static_0600
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        sort_subarray(arr, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [false, false, true, true];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0700
     * @tc.name Array_Sort_Subarray_Test_static_0700
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        sort_subarray(arr, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true, true, false, false];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0800
     * @tc.name Array_Sort_Subarray_Test_static_0800
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        sort_subarray(arr, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_0900
     * @tc.name Array_Sort_Subarray_Test_static_0900
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        sort_subarray(arr, 1, 4, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true, false, false, true, true];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1000
     * @tc.name Array_Sort_Subarray_Test_static_1000
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        sort_subarray(arr, 1, 4, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true, true, false, false, true];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1100
     * @tc.name Array_Sort_Subarray_Test_static_1100
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        sort_subarray(arr, 0, 5, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true, true, true, false, false];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1200
     * @tc.name Array_Sort_Subarray_Test_static_1200
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        sort_subarray(arr, 2, 3, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true, false, true, false, true];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1300
     * @tc.name Array_Sort_Subarray_Test_static_1300
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        sort_subarray(arr, 2, 2, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1400
     * @tc.name Array_Sort_Subarray_Test_static_1400
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        sort_subarray(arr, 2, 2, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1500
     * @tc.name Array_Sort_Subarray_Test_static_1500
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false];
        sort_subarray(arr, 2, 2, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [false, false];
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1600
     * @tc.name Array_Sort_Subarray_Test_static_1600
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, endIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [false, false];
          sort_subarray(arr, -1, 2, (lhs, rhs) => lhs && !rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1700
     * @tc.name Array_Sort_Subarray_Test_static_1700
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        sort_subarray(arr, 0, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [true, true, false, false];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1800
     * @tc.name Array_Sort_Subarray_Test_static_1800
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        sort_subarray(arr, 2, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [false, true, true, false];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_1900
     * @tc.name Array_Sort_Subarray_Test_static_1900
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        sort_subarray(arr, 3, (lhs, rhs) => lhs && !rhs);
        const expected: FixedArray<boolean> = [false, true, false, true];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2000
     * @tc.name Array_Sort_Subarray_Test_static_2000
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        sort_subarray(arr, 1, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2100
     * @tc.name Array_Sort_Subarray_Test_static_2100
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        sort_subarray(arr, 1, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [false, false, false];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2200
     * @tc.name Array_Sort_Subarray_Test_static_2200
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [true, false, true];
          sort_subarray(arr, -3, (lhs, rhs) => lhs && !rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2300
     * @tc.name Array_Sort_Subarray_Test_static_2300
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false];
        sort_subarray(arr, 2, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true, true, false, false, true];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2400
     * @tc.name Array_Sort_Subarray_Test_static_2400
     * @tc.desc test sort_subarray(arr: FixedArray<boolean>, startIndex: int, mustPrecede: ((lhs: boolean, rhs: boolean)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, false, false];
        sort_subarray(arr, 1, (lhs, rhs) => !lhs && rhs);
        const expected: FixedArray<boolean> = [true, false, false, true, true];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2500
     * @tc.name Array_Sort_Subarray_Test_static_2500
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 0, 6, 1, 8];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [0, 1, 2, 3, 6, 8];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2600
     * @tc.name Array_Sort_Subarray_Test_static_2600
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 3, 0, 6, 1, 8];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [8, 6, 3, 2, 1, 0];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2700
     * @tc.name Array_Sort_Subarray_Test_static_2700
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 3, 0, 0, 1];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [0, 0, 1, 3, 3];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2800
     * @tc.name Array_Sort_Subarray_Test_static_2800
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 3, 0, 0, 1];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [3, 3, 1, 0, 0];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_2900
     * @tc.name Array_Sort_Subarray_Test_static_2900
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 4, 4, 1, 5];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [5, 4, 4, 2, 1];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3000
     * @tc.name Array_Sort_Subarray_Test_static_3000
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 4, 4, 1, 5];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [1, 2, 4, 4, 5];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3100
     * @tc.name Array_Sort_Subarray_Test_static_3100
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [0, 0, 0, 0];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3200
     * @tc.name Array_Sort_Subarray_Test_static_3200
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0, 0];
        sort_subarray(arr, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [0, 0, 0, 0];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3300
     * @tc.name Array_Sort_Subarray_Test_static_3300
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 3, 9, 7];
        sort_subarray(arr, 1, 4, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [2, 3, 5, 9, 7];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3400
     * @tc.name Array_Sort_Subarray_Test_static_3400
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 3, 9, 7];
        sort_subarray(arr, 0, 5, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [9, 7, 5, 3, 2];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3500
     * @tc.name Array_Sort_Subarray_Test_static_3500
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 3, 9, 7];
        sort_subarray(arr, 2, 2, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [2, 5, 3, 9, 7];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3600
     * @tc.name Array_Sort_Subarray_Test_static_3600
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 5, 3, 9, 7];
        sort_subarray(arr, 2, 3, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [2, 5, 3, 9, 7];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3700
     * @tc.name Array_Sort_Subarray_Test_static_3700
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 4, 5, 1, 2, 3];
        sort_subarray(arr, 1, 5, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [3, 5, 4, 2, 1, 3];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3800
     * @tc.name Array_Sort_Subarray_Test_static_3800
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [3, 4, 5, 1, 2, 3];
        sort_subarray(arr, 0, 6, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [1, 2, 3, 3, 4, 5];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_3900
     * @tc.name Array_Sort_Subarray_Test_static_3900
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_3900';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [6, 7, 3, 6, 9, 8];
          sort_subarray(arr, 2, 10, (lhs: byte, rhs: byte): boolean => lhs > rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4000
     * @tc.name Array_Sort_Subarray_Test_static_4000
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, endIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [6, 7, 3, 6, 9, 8];
          sort_subarray(arr, -3, 3, (lhs: byte, rhs: byte): boolean => lhs > rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4100
     * @tc.name Array_Sort_Subarray_Test_static_4100
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 7, 3, 2, 7, 4];
        sort_subarray(arr, 1, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [5, 7, 7, 4, 3, 2];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4200
     * @tc.name Array_Sort_Subarray_Test_static_4200
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 7, 3, 2, 7, 4];
        sort_subarray(arr, 5, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [5, 7, 3, 2, 7, 4];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4300
     * @tc.name Array_Sort_Subarray_Test_static_4300
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 7, 3, 2, 7, 4];
        sort_subarray(arr, 0, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [2, 3, 4, 5, 7, 7];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4400
     * @tc.name Array_Sort_Subarray_Test_static_4400
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 2, 0];
        sort_subarray(arr, 2, (lhs: byte, rhs: byte): boolean => lhs < rhs);
        const expected: FixedArray<byte> = [0, 0, 0, 2];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4500
     * @tc.name Array_Sort_Subarray_Test_static_4500
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 2, 0];
        sort_subarray(arr, 1, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [0, 2, 0, 0];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4600
     * @tc.name Array_Sort_Subarray_Test_static_4600
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [6, 6, 5, 7, 2, 5, 6];
        sort_subarray(arr, 2, (lhs: byte, rhs: byte): boolean => lhs > rhs);
        const expected: FixedArray<byte> = [6, 6, 7, 6, 5, 5, 2];
        expect(arr.length).assertEqual(7);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        expect(arr[5]).assertEqual(expected[5]);
        expect(arr[6]).assertEqual(expected[6]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4700
     * @tc.name Array_Sort_Subarray_Test_static_4700
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [0, 2, 3, 4, 5];
          sort_subarray(arr, -10, (lhs: byte, rhs: byte): boolean => lhs > rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4800
     * @tc.name Array_Sort_Subarray_Test_static_4800
     * @tc.desc test sort_subarray(arr: FixedArray<byte>, startIndex: int, mustPrecede: ((lhs: byte, rhs: byte)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [0, 2, 3, 4, 5];
          sort_subarray(arr, 10, (lhs: byte, rhs: byte): boolean => lhs > rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_4900
     * @tc.name Array_Sort_Subarray_Test_static_4900
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x36.toChar(), 0x33.toChar(), 0x32.toChar(), 0x38.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x36.toChar(), 0x38.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5000
     * @tc.name Array_Sort_Subarray_Test_static_5000
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x36.toChar(), 0x33.toChar(), 0x32.toChar(), 0x38.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x38.toChar(), 0x36.toChar(), 0x33.toChar(), 0x32.toChar(), 0x31.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5100
     * @tc.name Array_Sort_Subarray_Test_static_5100
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x33.toChar(), 0x33.toChar(), 0x33.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x33.toChar(), 0x33.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5200
     * @tc.name Array_Sort_Subarray_Test_static_5200
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x33.toChar(), 0x33.toChar(), 0x33.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x33.toChar(), 0x33.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5300
     * @tc.name Array_Sort_Subarray_Test_static_5300
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4F.toChar(), 0x4D.toChar(), 0x41.toChar(), 0x58.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x58.toChar(), 0x4F.toChar(), 0x4D.toChar(), 0x41.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5400
     * @tc.name Array_Sort_Subarray_Test_static_5400
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4F.toChar(), 0x4D.toChar(), 0x41.toChar(), 0x58.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x41.toChar(), 0x4D.toChar(), 0x4F.toChar(), 0x58.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5500
     * @tc.name Array_Sort_Subarray_Test_static_5500
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar(), 0x61.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x41.toChar(), 0x41.toChar(), 0x61.toChar(), 0x61.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5600
     * @tc.name Array_Sort_Subarray_Test_static_5600
     * @tc.desc test sort_subarray(arr: FixedArray<char>, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x57.toChar(), 0x57.toChar(), 0x57.toChar(), 0x57.toChar()];
        sort_subarray(arr, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x57.toChar(), 0x57.toChar(), 0x57.toChar(), 0x57.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5700
     * @tc.name Array_Sort_Subarray_Test_static_5700
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x33.toChar(), 0x37.toChar(), 0x33.toChar()];
        sort_subarray(arr, 1, 3, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x36.toChar(), 0x33.toChar(), 0x37.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5800
     * @tc.name Array_Sort_Subarray_Test_static_5800
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x33.toChar(), 0x37.toChar(), 0x33.toChar()];
        sort_subarray(arr, 0, 4, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x37.toChar(), 0x36.toChar(), 0x33.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_5900
     * @tc.name Array_Sort_Subarray_Test_static_5900
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0X31.toChar(), 0x31.toChar(), 0x31.toChar()];
        sort_subarray(arr, 1, 3, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0X31.toChar(), 0x31.toChar(), 0x31.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6000
     * @tc.name Array_Sort_Subarray_Test_static_6000
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0X6F.toChar(), 0x4F.toChar(), 0x4F.toChar(), 0x6F.toChar(), 0x4F.toChar()];
        sort_subarray(arr, 1, 5, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x6F.toChar(), 0x6F.toChar(), 0x4F.toChar(), 0x4F.toChar(), 0x4F.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6100
     * @tc.name Array_Sort_Subarray_Test_static_6100
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x4F.toChar(), 0x4E.toChar(), 0x45.toChar(), 0x43.toChar()];
        sort_subarray(arr, 2, 2, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x4F.toChar(), 0x4E.toChar(), 0x45.toChar(), 0x43.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6200
     * @tc.name Array_Sort_Subarray_Test_static_6200
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x4F.toChar(), 0x4E.toChar(), 0x45.toChar(), 0x43.toChar()];
        sort_subarray(arr, 2, 3, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x4F.toChar(), 0x4E.toChar(), 0x45.toChar(), 0x43.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6300
     * @tc.name Array_Sort_Subarray_Test_static_6300
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x64.toChar(), 0x63.toChar(), 0x62.toChar(), 0x65.toChar()];
          sort_subarray(arr, -2, 2, (lhs: char, rhs: char): boolean => lhs < rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6400
     * @tc.name Array_Sort_Subarray_Test_static_6400
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, endIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x64.toChar(), 0x63.toChar(), 0x62.toChar(), 0x65.toChar()];
          sort_subarray(arr, 0, 6, (lhs: char, rhs: char): boolean => lhs < rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6500
     * @tc.name Array_Sort_Subarray_Test_static_6500
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x32.toChar(), 0x31.toChar()];
        sort_subarray(arr, 0, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x32.toChar(), 0x32.toChar(), 0x33.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6600
     * @tc.name Array_Sort_Subarray_Test_static_6600
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x32.toChar(), 0x31.toChar()];
        sort_subarray(arr, 0, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x33.toChar(), 0x32.toChar(), 0x32.toChar(), 0x31.toChar(), 0x31.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6700
     * @tc.name Array_Sort_Subarray_Test_static_6700
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x32.toChar(), 0x31.toChar()];
        sort_subarray(arr, 4, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar(), 0x32.toChar(), 0x31.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6800
     * @tc.name Array_Sort_Subarray_Test_static_6800
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x39.toChar(), 0x39.toChar(), 0x39.toChar()];
        sort_subarray(arr, 1, (lhs: char, rhs: char): boolean => lhs > rhs);
        const expected: FixedArray<char> = [0x39.toChar(), 0x39.toChar(), 0x39.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_6900
     * @tc.name Array_Sort_Subarray_Test_static_6900
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x39.toChar(), 0x39.toChar(), 0x39.toChar()];
        sort_subarray(arr, 1, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x39.toChar(), 0x39.toChar(), 0x39.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_7000
     * @tc.name Array_Sort_Subarray_Test_static_7000
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6F.toChar(), 0x6E.toChar(), 0x6D.toChar(), 0x6C.toChar(), 0x6B.toChar()];
        sort_subarray(arr, 1, (lhs: char, rhs: char): boolean => lhs < rhs);
        const expected: FixedArray<char> = [0x6F.toChar(), 0x6B.toChar(), 0x6C.toChar(), 0x6D.toChar(), 0x6E.toChar()];
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_7100
     * @tc.name Array_Sort_Subarray_Test_static_7100
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_7100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x5A.toChar(), 0x59.toChar(), 0x6A.toChar(), 0x6B.toChar()];
          sort_subarray(arr, 5, (lhs: char, rhs: char): boolean => lhs > rhs);
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
     * @tc.number ARRAY_SORT_SUBARRAY_TEST_7200
     * @tc.name Array_Sort_Subarray_Test_static_7200
     * @tc.desc test sort_subarray(arr: FixedArray<char>, startIndex: int, mustPrecede: ((lhs: char, rhs: char)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Subarray_Test_static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Subarray_Test_static_7200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [0x5A.toChar(), 0x59.toChar(), 0x6A.toChar(), 0x6B.toChar()];
          sort_subarray(arr, -1, (lhs: char, rhs: char): boolean => lhs > rhs);
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