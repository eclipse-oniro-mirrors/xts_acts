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

export default function Array_Slice_Test_static() {
  describe('Array_Slice_Test_static', ():void => {
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
     * @tc.number SUB_ARRAY_SLICE_TEST_0100
     * @tc.name Array_Slice_Test_static_0100
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = slice(arr, 2);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0200
     * @tc.name Array_Slice_Test_static_0200
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = slice(arr, 0);
        const expected: FixedArray<boolean> = [true, false, true, false, true];
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
     * @tc.number SUB_ARRAY_SLICE_TEST_0300
     * @tc.name Array_Slice_Test_static_0300
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = slice(arr, 0);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0400
     * @tc.name Array_Slice_Test_static_0400
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = slice(arr, 0);
        const expected: FixedArray<boolean> = [false];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0500
     * @tc.name Array_Slice_Test_static_0500
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = slice(arr, 2);
        const expected: FixedArray<boolean> = [true];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0600
     * @tc.name Array_Slice_Test_static_0600
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        const result = slice(arr, 2);
        const expected: FixedArray<boolean> = [false, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0700
     * @tc.name Array_Slice_Test_static_0700
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        const result = slice(arr, 0);
        const expected: FixedArray<boolean> = [true, true, false, false];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0800
     * @tc.name Array_Slice_Test_static_0800
     * @tc.desc test slice(self: FixedArray<boolean>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        const result = slice(arr, 3);
        const expected: FixedArray<boolean> = [false];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_0900
     * @tc.name Array_Slice_Test_static_0900
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 1, 3);
        const expected: FixedArray<boolean> = [false, true];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1000
     * @tc.name Array_Slice_Test_static_1000
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 1, 4);
        const expected: FixedArray<boolean> = [false, true, false];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1100
     * @tc.name Array_Slice_Test_static_1100
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 0, 4);
        const expected: FixedArray<boolean> = [true, false, true, false];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1200
     * @tc.name Array_Slice_Test_static_1200
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 1, -1);
        const expected: FixedArray<boolean> = [false, true];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1300
     * @tc.name Array_Slice_Test_static_1300
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 4, 6);
        const expected: FixedArray<boolean> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1400
     * @tc.name Array_Slice_Test_static_1400
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 2, 2);
        const expected: FixedArray<boolean> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1500
     * @tc.name Array_Slice_Test_static_1500
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 2, 10);
        const expected: FixedArray<boolean> = [true, false];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1600
     * @tc.name Array_Slice_Test_static_1600
     * @tc.desc test slice(self: FixedArray<boolean>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = slice(arr, 2, 1);
        const expected: FixedArray<boolean> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1700
     * @tc.name Array_Slice_Test_static_1700
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const start = 1;
        const end = 3;
        const result = slice(arr, start, end);
        const expected: FixedArray<boolean> = [false, true];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1800
     * @tc.name Array_Slice_Test_static_1800
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const start = 1;
        const end = 1;
        const result = slice(arr, start, end);
        const expected: FixedArray<boolean> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_1900
     * @tc.name Array_Slice_Test_static_1900
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const start = 1;
        const result = slice(arr, start);
        const expected: FixedArray<boolean> = [false, true];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2000
     * @tc.name Array_Slice_Test_static_2000
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const start = 3;
        const result = slice(arr, start);
        const expected: FixedArray<boolean> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2100
     * @tc.name Array_Slice_Test_static_2100
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const start = 6;
        const result = slice(arr, start);
        const expected: FixedArray<boolean> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2200
     * @tc.name Array_Slice_Test_static_2200
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const start = -2;
        const result = slice(arr, start);
        const expected: FixedArray<boolean> = [false, true];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2300
     * @tc.name Array_Slice_Test_static_2300
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const start = 0;
        const result = slice(arr, start);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2400
     * @tc.name Array_Slice_Test_static_2400
     * @tc.desc test slice(self: FixedArray<boolean>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const end = 3;
        const result = slice(arr, undefined, end);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2500
     * @tc.name Array_Slice_Test_static_2500
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 28, 42, 68, 80];
        const result = slice(arr, 2);
        const expected: FixedArray<byte> = [42, 68, 80];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2600
     * @tc.name Array_Slice_Test_static_2600
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 28, 42, 68, 80];
        const result = slice(arr, 0);
        const expected: FixedArray<byte> = [0, 28, 42, 68, 80];
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
     * @tc.number SUB_ARRAY_SLICE_TEST_2700
     * @tc.name Array_Slice_Test_static_2700
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 28, 42, 68, 80];
        const result = slice(arr, 6);
        const expected: FixedArray<byte> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2800
     * @tc.name Array_Slice_Test_static_2800
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 28, 42, 68, 80];
        const result = slice(arr, -3);
        const expected: FixedArray<byte> = [42, 68, 80];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_2900
     * @tc.name Array_Slice_Test_static_2900
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [42, 42, 42, 42];
        const result = slice(arr, 1);
        const expected: FixedArray<byte> = [42, 42, 42];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3000
     * @tc.name Array_Slice_Test_static_3000
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 127, -128, 127];
        const result = slice(arr, -2);
        const expected: FixedArray<byte> = [-128, 127];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3100
     * @tc.name Array_Slice_Test_static_3100
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [56];
        const result = slice(arr, 0);
        const expected: FixedArray<byte> = [56];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3200
     * @tc.name Array_Slice_Test_static_3200
     * @tc.desc test slice(self: FixedArray<byte>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [56];
        const result = slice(arr, 1);
        const expected: FixedArray<byte> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3300
     * @tc.name Array_Slice_Test_static_3300
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 13, 14, 15, 16, 17];
        const result = slice(arr, 1, 4);
        const expected: FixedArray<byte> = [13, 14, 15];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3400
     * @tc.name Array_Slice_Test_static_3400
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 13, 14, 15, 16, 17];
        const result = slice(arr, 0, 6);
        const expected: FixedArray<byte> = [12, 13, 14, 15, 16, 17];
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3500
     * @tc.name Array_Slice_Test_static_3500
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [40, 41, 42, 43, 44];
        const result = slice(arr, 4, 4);
        const expected: FixedArray<byte> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3600
     * @tc.name Array_Slice_Test_static_3600
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [40, 41, 42, 43, 44];
        const result = slice(arr, 3, 7);
        const expected: FixedArray<byte> = [43, 44];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3700
     * @tc.name Array_Slice_Test_static_3700
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [40, 41, 42, 43, 44];
        const result = slice(arr, 2, -2);
        const expected: FixedArray<byte> = [42];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3800
     * @tc.name Array_Slice_Test_static_3800
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [40, 41, 42, 43, 44];
        const result = slice(arr, 2, -2);
        const expected: FixedArray<byte> = [42];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_3900
     * @tc.name Array_Slice_Test_static_3900
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 52, 54, 65];
        const result = slice(arr, 1, 7);
        const expected: FixedArray<byte> = [52, 54, 65];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4000
     * @tc.name Array_Slice_Test_static_4000
     * @tc.desc test slice(self: FixedArray<byte>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 52, 54, 65];
        const result = slice(arr, 0, 2);
        const expected: FixedArray<byte> = [50, 52];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4100
     * @tc.name Array_Slice_Test_static_4100
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const start = 0;
        const end = 3;
        const result = slice(arr, start, end);
        const expected: FixedArray<byte> = [50, 60, 70];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4200
     * @tc.name Array_Slice_Test_static_4200
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const start = 0;
        const result = slice(arr, start);
        const expected: FixedArray<byte> = [50, 60, 70, 80, 90];
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
     * @tc.number SUB_ARRAY_SLICE_TEST_4300
     * @tc.name Array_Slice_Test_static_4300
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const start = 4;
        const result = slice(arr, start);
        const expected: FixedArray<byte> = [90];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4400
     * @tc.name Array_Slice_Test_static_4400
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const start = 5;
        const result = slice(arr, start);
        const expected: FixedArray<byte> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4500
     * @tc.name Array_Slice_Test_static_4500
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const start = 1;
        const end = -2;
        const result = slice(arr, start, end);
        const expected: FixedArray<byte> = [60, 70];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4600
     * @tc.name Array_Slice_Test_static_4600
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const result = slice(arr);
        const expected: FixedArray<byte> = [50, 60, 70, 80, 90];
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
     * @tc.number SUB_ARRAY_SLICE_TEST_4700
     * @tc.name Array_Slice_Test_static_4700
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [50, 60, 70, 80, 90];
        const start = 3;
        const end = 3;
        const result = slice(arr, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4800
     * @tc.name Array_Slice_Test_static_4800
     * @tc.desc test slice(self: FixedArray<byte>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 127, -128, 127];
        const start = -1;
        const result = slice(arr, start);
        const expected: FixedArray<byte> = [127];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_4900
     * @tc.name Array_Slice_Test_static_4900
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x38.toChar(), 0x35.toChar(), 0x49.toChar()];
        const result = slice(arr, 2);
        const expected: FixedArray<char> = [0x35.toChar(), 0x49.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5000
     * @tc.name Array_Slice_Test_static_5000
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x38.toChar(), 0x35.toChar(), 0x49.toChar()];
        const result = slice(arr, 0);
        const expected: FixedArray<char> = [0x30.toChar(), 0x38.toChar(), 0x35.toChar(), 0x49.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5100
     * @tc.name Array_Slice_Test_static_5100
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x38.toChar(), 0x35.toChar(), 0x49.toChar()];
        const result = slice(arr, 3);
        const expected: FixedArray<char> = [0x49.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5200
     * @tc.name Array_Slice_Test_static_5200
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x4D.toChar(), 0x4D.toChar(), 0x4D.toChar()];
        const result = slice(arr, 1);
        const expected: FixedArray<char> = [0x4D.toChar(), 0x4D.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5300
     * @tc.name Array_Slice_Test_static_5300
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6F.toChar(), 0x4F.toChar(), 0x6F.toChar(), 0x4F.toChar()];
        const result = slice(arr, -3);
        const expected: FixedArray<char> = [0x4F.toChar(), 0x6F.toChar(), 0x4F.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5400
     * @tc.name Array_Slice_Test_static_5400
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6F.toChar(), 0x4F.toChar(), 0x6F.toChar(), 0x4F.toChar()];
        const result = slice(arr, 10);
        const expected: FixedArray<char> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5500
     * @tc.name Array_Slice_Test_static_5500
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6B.toChar(), 0x6C.toChar(), 0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar()];
        const result = slice(arr, 0);
        const expected: FixedArray<char> = [0x6B.toChar(), 0x6C.toChar(), 0x6D.toChar(), 0x6E.toChar(), 0x6F.toChar()];
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
     * @tc.number SUB_ARRAY_SLICE_TEST_5600
     * @tc.name Array_Slice_Test_static_5600
     * @tc.desc test slice(self: FixedArray<char>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x7A.toChar(), 0x5A.toChar(), 0x30.toChar(), 0x5A.toChar(), 0x7A.toChar()];
        const result = slice(arr, 3);
        const expected: FixedArray<char> = [0x30.toChar(), 0x5A.toChar(), 0x7A.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5700
     * @tc.name Array_Slice_Test_static_5700
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x38.toChar(), 0x36.toChar(), 0x33.toChar(), 0x35.toChar(), 0x31.toChar()];
        const result = slice(arr, 0, 6);
        const expected: FixedArray<char> = [0x32.toChar(), 0x38.toChar(), 0x36.toChar(), 0x33.toChar(), 0x35.toChar(), 0x31.toChar()];
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        expect(result[5]).assertEqual(expected[5]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5800
     * @tc.name Array_Slice_Test_static_5800
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x38.toChar(), 0x36.toChar(), 0x33.toChar(), 0x35.toChar(), 0x31.toChar()];
        const result = slice(arr, 1, 4);
        const expected: FixedArray<char> = [0x38.toChar(), 0x36.toChar(), 0x33.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_5900
     * @tc.name Array_Slice_Test_static_5900
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x38.toChar(), 0x36.toChar(), 0x33.toChar(), 0x35.toChar(), 0x31.toChar()];
        const result = slice(arr, 3, 7);
        const expected: FixedArray<char> = [0x33.toChar(), 0x35.toChar(), 0x31.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6000
     * @tc.name Array_Slice_Test_static_6000
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x38.toChar(), 0x36.toChar(), 0x33.toChar(), 0x35.toChar(), 0x31.toChar()];
        const result = slice(arr, -2, 5);
        const expected: FixedArray<char> = [0x35.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6100
     * @tc.name Array_Slice_Test_static_6100
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x43.toChar(), 0x43.toChar(), 0x43.toChar(), 0x43.toChar()];
        const result = slice(arr, 2, 4);
        const expected: FixedArray<char> = [0x43.toChar(), 0x43.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6200
     * @tc.name Array_Slice_Test_static_6200
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x43.toChar(), 0x43.toChar(), 0x43.toChar(), 0x43.toChar()];
        const result = slice(arr, 2, 2);
        const expected: FixedArray<char> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6300
     * @tc.name Array_Slice_Test_static_6300
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6C.toChar(), 0x6A.toChar(), 0x69.toChar(), 0x6B.toChar()];
        const result = slice(arr, 4, 8);
        const expected: FixedArray<char> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6400
     * @tc.name Array_Slice_Test_static_6400
     * @tc.desc test slice(self: FixedArray<char>, start: int, end: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar(), 0x73.toChar()];
        const result = slice(arr, 2, 5);
        const expected: FixedArray<char> = [0x52.toChar(), 0x74.toChar(), 0x57.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6500
     * @tc.name Array_Slice_Test_static_6500
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar(), 0x73.toChar()];
        const start = 1;
        const end = 5;
        const result = slice(arr, start, end);
        const expected: FixedArray<char> = [0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6600
     * @tc.name Array_Slice_Test_static_6600
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar(), 0x73.toChar()];
        const end = 3;
        const result = slice(arr, undefined, end);
        const expected: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar()];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6700
     * @tc.name Array_Slice_Test_static_6700
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar(), 0x73.toChar()];
        const start = 5;
        const result = slice(arr, start);
        const expected: FixedArray<char> = [0x73.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6800
     * @tc.name Array_Slice_Test_static_6800
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar(), 0x73.toChar()];
        const start = 6;
        const result = slice(arr, start);
        const expected: FixedArray<char> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_6900
     * @tc.name Array_Slice_Test_static_6900
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x75.toChar(), 0x71.toChar(), 0x52.toChar(), 0x74.toChar(), 0x57.toChar(), 0x73.toChar()];
        const start = -2;
        const result = slice(arr, start);
        const expected: FixedArray<char> = [0x57.toChar(), 0x73.toChar()];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7000
     * @tc.name Array_Slice_Test_static_7000
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x32.toChar(), 0x36.toChar(), 0x32.toChar()];
        const start = 2;
        const end = -2;
        const result = slice(arr, start, end);
        const expected: FixedArray<char> = [0x32.toChar()];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7100
     * @tc.name Array_Slice_Test_static_7100
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x32.toChar(), 0x36.toChar(), 0x32.toChar()];
        const start = 1;
        const end = 10;
        const result = slice(arr, start, end);
        const expected: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x36.toChar(), 0x32.toChar()];
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7200
     * @tc.name Array_Slice_Test_static_7200
     * @tc.desc test slice(self: FixedArray<char>, start?: Number, end?: Number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x32.toChar(), 0x36.toChar(), 0x32.toChar()];
        const start = 10;
        const end = 10;
        const result = slice(arr, start, end);
        const expected: FixedArray<char> = [];
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7300
     * @tc.name Array_Slice_Test_static_7300
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = slice(arr, 2);
        const expected: FixedArray<double> = [3.3, 4.4, 5.5];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7400
     * @tc.name Array_Slice_Test_static_7400
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = slice(arr, 0);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
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
     * @tc.number SUB_ARRAY_SLICE_TEST_7500
     * @tc.name Array_Slice_Test_static_7500
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4];
        const result = slice(arr, 3);
        const expected: FixedArray<double> = [-4.4];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7600
     * @tc.name Array_Slice_Test_static_7600
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3, -4.4];
        const result = slice(arr, 1);
        const expected: FixedArray<double> = [-2.2, -3.3, -4.4];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7700
     * @tc.name Array_Slice_Test_static_7700
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [10.1, 10.1, 10.1, 10.1];
        const result = slice(arr, 1);
        const expected: FixedArray<double> = [10.1, 10.1, 10.1];
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7800
     * @tc.name Array_Slice_Test_static_7800
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 100.0, 100.0, 0.0, 0.0];
        const result = slice(arr, 3);
        const expected: FixedArray<double> = [0.0, 0.0];
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_7900
     * @tc.name Array_Slice_Test_static_7900
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_7900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 100.0, 100.0, 0.0, 0.0];
        const result = slice(arr, -1);
        const expected: FixedArray<double> = [0.0];
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_ARRAY_SLICE_TEST_8000
     * @tc.name Array_Slice_Test_static_8000
     * @tc.desc test slice(self: FixedArray<double>, start: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Slice_Test_static_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Slice_Test_static_8000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0, 100.0, 100.0, 0.0, 0.0];
        const result = slice(arr, -5);
        const expected: FixedArray<double> = [0.0, 100.0, 100.0, 0.0, 0.0];
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}