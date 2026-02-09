/*
* Copyright (C) 2025-2026 HiHope Open Source Organization.
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

export default function Array_Sort_Third_Test_static() {
  describe('Array_Sort_Third_Test_static', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(():void => {
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
     * @tc.number ARRAY_SORT_THIRD_TEST_0100
     * @tc.name Array_Sort_Third_Test_static_0100
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        sort(arr, (a: int, b: int) => a - b);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0200
     * @tc.name Array_Sort_Third_Test_static_0200
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2];
        sort(arr, (a: int, b: int) => a - b);
        const expected: FixedArray<int> = [2]
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0300
     * @tc.name Array_Sort_Third_Test_static_0300
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 5, 8];
        sort(arr, (a: int, b: int) => a - b);
        const expected: FixedArray<int> = [3, 5, 8]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0400
     * @tc.name Array_Sort_Third_Test_static_0400
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 5, 8];
        sort(arr, (a: int, b: int) => b - a);
        const expected: FixedArray<int> = [8, 5, 3]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0500
     * @tc.name Array_Sort_Third_Test_static_0500
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 6, 6];
        sort(arr, (a: int, b: int) => b - a);
        const expected: FixedArray<int> = [6, 6, 6]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0600
     * @tc.name Array_Sort_Third_Test_static_0600
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [4, 9, 2, 6];
        sort(arr, (a: int, b: int) => a - b);
        const expected: FixedArray<int> = [2, 4, 6, 9]
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0700
     * @tc.name Array_Sort_Third_Test_static_0700
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [4, 9, 2, 6];
        sort(arr, (a: int, b: int) => b - a);
        const expected: FixedArray<int> = [9, 6, 4, 2]
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0800
     * @tc.name Array_Sort_Third_Test_static_0800
     * @tc.desc test sort(self: FixedArray<int>, comparator: ((a: int, b: int)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, -2, 0, -2];
        sort(arr, (a: int, b: int) => b - a);
        const expected: FixedArray<int> = [2, 0, -2, -2]
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_0900
     * @tc.name Array_Sort_Third_Test_static_0900
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1000
     * @tc.name Array_Sort_Third_Test_static_1000
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        sort(arr);
        const expected: FixedArray<long> = [100]
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1100
     * @tc.name Array_Sort_Third_Test_static_1100
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 110, 120];
        sort(arr);
        const expected: FixedArray<long> = [100, 110, 120]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1200
     * @tc.name Array_Sort_Third_Test_static_1200
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [120, 110, 100];
        sort(arr);
        const expected: FixedArray<long> = [100, 110, 120]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1300
     * @tc.name Array_Sort_Third_Test_static_1300
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [80, 70, 60, 80];
        sort(arr);
        const expected: FixedArray<long> = [60, 70, 80, 80]
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1400
     * @tc.name Array_Sort_Third_Test_static_1400
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [50, 50, 50];
        sort(arr);
        const expected: FixedArray<long> = [50, 50, 50]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1500
     * @tc.name Array_Sort_Third_Test_static_1500
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [18, 16, 12];
        sort(arr);
        const expected: FixedArray<long> = [12, 16, 18]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1600
     * @tc.name Array_Sort_Third_Test_static_1600
     * @tc.desc test sort(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [12, 16, 18];
        sort(arr);
        const expected: FixedArray<long> = [12, 16, 18]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1700
     * @tc.name Array_Sort_Third_Test_static_1700
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        sort(arr, (a: long, b: long) => (a - b).toInt());
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1800
     * @tc.name Array_Sort_Third_Test_static_1800
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        sort(arr, (a: long, b: long) => (b - a).toInt());
        const expected: FixedArray<long> = [100];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_1900
     * @tc.name Array_Sort_Third_Test_static_1900
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 300, 700];
        sort(arr, (a: long, b: long) => (a - b).toInt());
        const expected: FixedArray<long> = [100, 300, 700];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2000
     * @tc.name Array_Sort_Third_Test_static_2000
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 300, 700];
        sort(arr, (a: long, b: long) => (b - a).toInt());
        const expected: FixedArray<long> = [700, 300, 100];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2100
     * @tc.name Array_Sort_Third_Test_static_2100
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [90, 90, 90];
        sort(arr, (a: long, b: long) => (b - a).toInt());
        const expected: FixedArray<long> = [90, 90, 90];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2200
     * @tc.name Array_Sort_Third_Test_static_2200
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [90, 90, 90];
        sort(arr, (a: long, b: long) => (b - a).toInt());
        const expected: FixedArray<long> = [90, 90, 90];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2300
     * @tc.name Array_Sort_Third_Test_static_2300
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-20, 80, 20, -80];
        sort(arr, (a: long, b: long) => (a - b).toInt());
        const expected: FixedArray<long> = [-80, -20, 20, 80];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2400
     * @tc.name Array_Sort_Third_Test_static_2400
     * @tc.desc test sort(self: FixedArray<long>, comparator: ((a: long, b: long)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-20, 80, 20, -80];
        sort(arr, (a: long, b: long) => (b - a).toInt());
        const expected: FixedArray<long> = [80, 20, -20, -80];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2500
     * @tc.name Array_Sort_Third_Test_static_2500
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2600
     * @tc.name Array_Sort_Third_Test_static_2600
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50];
        sort(arr);
        const expected: FixedArray<short> = [50];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2700
     * @tc.name Array_Sort_Third_Test_static_2700
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, 200, 1000];
        sort(arr);
        const expected: FixedArray<short> = [50, 200, 1000];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2800
     * @tc.name Array_Sort_Third_Test_static_2800
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1000, 200, 50];
        sort(arr);
        const expected: FixedArray<short> = [50, 200, 1000];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_2900
     * @tc.name Array_Sort_Third_Test_static_2900
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 50, -100];
        sort(arr);
        const expected: FixedArray<short> = [-100, 0, 50];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3000
     * @tc.name Array_Sort_Third_Test_static_3000
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [32767, -32768, 0];
        sort(arr);
        const expected: FixedArray<short> = [-32768, 0, 32767];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3100
     * @tc.name Array_Sort_Third_Test_static_3100
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-10, 10, -10];
        sort(arr);
        const expected: FixedArray<short> = [-10, -10, 10];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3200
     * @tc.name Array_Sort_Third_Test_static_3200
     * @tc.desc test sort(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [32767, -32768, 0, -10000, 10000];
        sort(arr);
        const expected: FixedArray<short> = [-32768, -10000, 0, 10000, 32767];
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
     * @tc.number ARRAY_SORT_THIRD_TEST_3300
     * @tc.name Array_Sort_Third_Test_static_3300
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3400
     * @tc.name Array_Sort_Third_Test_static_3400
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10];
        sort(arr, (a: short, b: short) => b - a);
        const expected: FixedArray<long> = [10];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3500
     * @tc.name Array_Sort_Third_Test_static_3500
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, 80, 10];
        sort(arr, (a: short, b: short) => a - b);
        const expected: FixedArray<long> = [10, 50, 80];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3600
     * @tc.name Array_Sort_Third_Test_static_3600
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, 80, 10];
        sort(arr, (a: short, b: short) => b - a);
        const expected: FixedArray<long> = [80, 50, 10];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3700
     * @tc.name Array_Sort_Third_Test_static_3700
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, -50, -80, 80];
        sort(arr, (a: short, b: short) => a - b);
        const expected: FixedArray<long> = [-80, -50, 50, 80];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3800
     * @tc.name Array_Sort_Third_Test_static_3800
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [50, -50, -80, 80];
        sort(arr, (a: short, b: short) => b - a);
        const expected: FixedArray<long> = [80, 50, -50, -80];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_THIRD_TEST_3900
     * @tc.name Array_Sort_Third_Test_static_3900
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 32767, -32768, 10, -10];
        sort(arr, (a: short, b: short) => a - b);
        const expected: FixedArray<long> = [-32768, -10, 0, 10, 32767];
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
     * @tc.number ARRAY_SORT_THIRD_TEST_4000
     * @tc.name Array_Sort_Third_Test_static_4000
     * @tc.desc test sort(self: FixedArray<short>, comparator: ((a: short, b: short)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Third_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Third_Test_static_4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 32767, -32768, 10, -10];
        sort(arr, (a: short, b: short) => b - a);
        const expected: FixedArray<long> = [32767, 10, 0, -10, -32768];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}