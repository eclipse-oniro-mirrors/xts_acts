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

export default function Array_Slice_Third_Test_static() {
  describe('Array_Slice_Third_Test_static', ():void => {
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
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0100
     * @tc.name Array_Slice_Third_Test_static_0100
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const start = 1;
        const end = 8;
        const result = slice(arr, start, end);
        const expected: FixedArray<long> = [20, 30, 40, 50];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0200
     * @tc.name Array_Slice_Third_Test_static_0200
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const start = 1;
        const end = 4;
        const result = slice(arr, start, end);
        const expected: FixedArray<long> = [20, 30, 40];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0300
     * @tc.name Array_Slice_Third_Test_static_0300
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [15, 25, 35, 45, 55];
        const start = -1;
        const end = 4;
        const result = slice(arr, start, end);
        const expected: FixedArray<long> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0400
     * @tc.name Array_Slice_Third_Test_static_0400
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const start = 1;
        const result = slice(arr, start);
        const expected: FixedArray<long> = [200, 300];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0500
     * @tc.name Array_Slice_Third_Test_static_0500
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = slice(arr);
        const expected: FixedArray<long> = [100, 200, 300];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0600
     * @tc.name Array_Slice_Third_Test_static_0600
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [90, 80, 70, 60];
        const start = 1;
        const result = slice(arr, start);
        const expected: FixedArray<long> = [80, 70, 60];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0700
     * @tc.name Array_Slice_Third_Test_static_0700
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [90, 80, 70, 60];
        const start = 1;
        const end = -1;
        const result = slice(arr, start, end);
        const expected: FixedArray<long> = [80, 70];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0800
     * @tc.name Array_Slice_Third_Test_static_0800
     * @tc.desc test slice(self: FixedArray<long>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [90, 80, 70, 60];
        const start = -3;
        const end = -1;
        const result = slice(arr, start, end);
        const expected: FixedArray<long> = [80, 70];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_0900
     * @tc.name Array_Slice_Third_Test_static_0900
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 14, 16, 18];
        const result = slice(arr, 2);
        const expected: FixedArray<short> = [16, 18];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1000
     * @tc.name Array_Slice_Third_Test_static_1000
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 14, 16, 18];
        const result = slice(arr, 0);
        const expected: FixedArray<short> = [12, 14, 16, 18];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1100
     * @tc.name Array_Slice_Third_Test_static_1100
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 14, 16, 18];
        const result = slice(arr, 4);
        const expected: FixedArray<short> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1200
     * @tc.name Array_Slice_Third_Test_static_1200
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 14, 16, 18];
        const result = slice(arr, -1);
        const expected: FixedArray<short> = [18];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1300
     * @tc.name Array_Slice_Third_Test_static_1300
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-20, -25, -30, -35, -40];
        const result = slice(arr, 1);
        const expected: FixedArray<short> = [-25, -30, -35, -40];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1400
     * @tc.name Array_Slice_Third_Test_static_1400
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-20, -25, -30, -35, -40];
        const result = slice(arr, 4);
        const expected: FixedArray<short> = [-40];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1500
     * @tc.name Array_Slice_Third_Test_static_1500
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-20, -25, -30, -35, -40];
        const result = slice(arr, 0);
        const expected: FixedArray<short> = [-20, -25, -30, -35, -40];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1600
     * @tc.name Array_Slice_Third_Test_static_1600
     * @tc.desc test slice(self: FixedArray<short>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-20, -25, -30, -35, -40];
        const result = slice(arr, 7);
        const expected: FixedArray<short> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1700
     * @tc.name Array_Slice_Third_Test_static_1700
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 15, 18, 21, 24, 27];
        const result = slice(arr, 1, 5);
        const expected: FixedArray<short> = [15, 18, 21, 24];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1800
     * @tc.name Array_Slice_Third_Test_static_1800
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 15, 18, 21, 24, 27];
        const result = slice(arr, 3, 8);
        const expected: FixedArray<short> = [21, 24, 27];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_1900
     * @tc.name Array_Slice_Third_Test_static_1900
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 15, 18, 21, 24, 27];
        const result = slice(arr, -3, 5);
        const expected: FixedArray<short> = [21, 24];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2000
     * @tc.name Array_Slice_Third_Test_static_2000
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 15, 18, 21, 24, 27];
        const result = slice(arr, -1, -2);
        const expected: FixedArray<short> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2100
     * @tc.name Array_Slice_Third_Test_static_2100
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 15, 18, 21, 24, 27];
        const result = slice(arr, -1, -1);
        const expected: FixedArray<short> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2200
     * @tc.name Array_Slice_Third_Test_static_2200
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [12, 15, 18, 21, 24, 27];
        const result = slice(arr, 0, 2);
        const expected: FixedArray<short> = [12, 15];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2300
     * @tc.name Array_Slice_Third_Test_static_2300
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 3, 0, 9, 0, 0];
        const result = slice(arr, 1, 2);
        const expected: FixedArray<short> = [3];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2400
     * @tc.name Array_Slice_Third_Test_static_2400
     * @tc.desc test slice(self: FixedArray<short>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, 3, 0, 9, 0, 0];
        const result = slice(arr, -1, 10);
        const expected: FixedArray<short> = [0];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2500
     * @tc.name Array_Slice_Third_Test_static_2500
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15, 20, 25];
        const start = 1;
        const end = 4;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [10, 15, 20];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2600
     * @tc.name Array_Slice_Third_Test_static_2600
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15, 20, 25];
        const start = 1;
        const end = 1;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2700
     * @tc.name Array_Slice_Third_Test_static_2700
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15, 20, 25];
        const start = 1;
        const end = 8;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [10, 15, 20, 25];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2800
     * @tc.name Array_Slice_Third_Test_static_2800
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15, 20, 25];
        const start = -3;
        const end = 4;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [15, 20];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_2900
     * @tc.name Array_Slice_Third_Test_static_2900
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15, 20, 25];
        const start = -1;
        const end = 10;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [25];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_3000
     * @tc.name Array_Slice_Third_Test_static_3000
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 10, 15, 20, 25];
        const start = -3;
        const end = -3;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_3100
     * @tc.name Array_Slice_Third_Test_static_3100
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, -20, -5, -10, -15];
        const start = 0;
        const end = 4;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [0, -20, -5, -10];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_THIRD_TEST_3200
     * @tc.name Array_Slice_Third_Test_static_3200
     * @tc.desc test slice(self: FixedArray<short>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Third_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Third_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0, -20, -5, -10, -15];
        const start = 2;
        const end = -1;
        const result = slice(arr, start, end);
        const expected: FixedArray<short> = [-5, -10];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}