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

export default function Array_Sort_Second_Test_static() {
  describe('Array_Sort_Second_Test_static', ():void => {
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
     * @tc.number ARRAY_SORT_SECOND_TEST_0100
     * @tc.name Array_Sort_Second_Test_static_0100
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
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
     * @tc.number ARRAY_SORT_SECOND_TEST_0200
     * @tc.name Array_Sort_Second_Test_static_0200
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_0300
     * @tc.name Array_Sort_Second_Test_static_0300
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        const expected: FixedArray<boolean> = [false, false, false];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_0400
     * @tc.name Array_Sort_Second_Test_static_0400
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        const expected: FixedArray<boolean> = [false];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_0500
     * @tc.name Array_Sort_Second_Test_static_0500
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        const expected: FixedArray<boolean> = [true];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_0600
     * @tc.name Array_Sort_Second_Test_static_0600
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_0700
     * @tc.name Array_Sort_Second_Test_static_0700
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false, false];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        const expected: FixedArray<boolean> = [false, false, false, true, true];
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
     * @tc.number ARRAY_SORT_SECOND_TEST_0800
     * @tc.name Array_Sort_Second_Test_static_0800
     * @tc.desc test sort(self: FixedArray<boolean>, comparator: ((a: boolean, b: boolean)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, true, true];
        sort(arr, (a: boolean, b: boolean) => a === b ? 0 : a ? 1 : -1);
        const expected: FixedArray<boolean> = [false, false, false, true, true];
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
     * @tc.number ARRAY_SORT_SECOND_TEST_0900
     * @tc.name Array_Sort_Second_Test_static_0900
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1000
     * @tc.name Array_Sort_Second_Test_static_1000
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10];
        sort(arr);
        const expected: FixedArray<byte> = [10];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1100
     * @tc.name Array_Sort_Second_Test_static_1100
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30];
        sort(arr);
        const expected: FixedArray<byte> = [10, 20, 30];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1200
     * @tc.name Array_Sort_Second_Test_static_1200
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [15, 10, 5];
        sort(arr);
        const expected: FixedArray<byte> = [5, 10, 15];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1300
     * @tc.name Array_Sort_Second_Test_static_1300
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 5, 15];
        sort(arr);
        const expected: FixedArray<byte> = [5, 10, 15];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1400
     * @tc.name Array_Sort_Second_Test_static_1400
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 5, 1, 2];
        sort(arr);
        const expected: FixedArray<byte> = [1, 2, 5, 5];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1500
     * @tc.name Array_Sort_Second_Test_static_1500
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, -5, 1, 2];
        sort(arr);
        const expected: FixedArray<byte> = [-5, 1, 2, 5];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1600
     * @tc.name Array_Sort_Second_Test_static_1600
     * @tc.desc test sort(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10];
        sort(arr);
        const expected: FixedArray<byte> = [-10];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1700
     * @tc.name Array_Sort_Second_Test_static_1700
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        sort(arr, (a: byte, b: byte) => a - b);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1800
     * @tc.name Array_Sort_Second_Test_static_1800
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5];
        sort(arr, (a: byte, b: byte) => a - b);
        const expected: FixedArray<byte> = [5];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_1900
     * @tc.name Array_Sort_Second_Test_static_1900
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5];
        sort(arr, (a: byte, b: byte) => b - a);
        const expected: FixedArray<byte> = [5];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2000
     * @tc.name Array_Sort_Second_Test_static_2000
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 10, 15];
        sort(arr, (a: byte, b: byte) => a - b);
        const expected: FixedArray<byte> = [5, 10, 15];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2100
     * @tc.name Array_Sort_Second_Test_static_2100
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 10, 15];
        sort(arr, (a: byte, b: byte) => b - a);
        const expected: FixedArray<byte> = [15, 10, 5];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2200
     * @tc.name Array_Sort_Second_Test_static_2200
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 12, 12];
        sort(arr, (a: byte, b: byte) => a - b);
        const expected: FixedArray<byte> = [12, 12, 12];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2300
     * @tc.name Array_Sort_Second_Test_static_2300
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 12, 15];
        sort(arr, (a: byte, b: byte) => a - b);
        const expected: FixedArray<byte> = [12, 12, 15];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2400
     * @tc.name Array_Sort_Second_Test_static_2400
     * @tc.desc test sort(self: FixedArray<byte>, comparator: ((a: byte, b: byte)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 12, 15];
        sort(arr, (a: byte, b: byte) => b - a);
        const expected: FixedArray<byte> = [15, 12, 12];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2500
     * @tc.name Array_Sort_Second_Test_static_2500
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2600
     * @tc.name Array_Sort_Second_Test_static_2600
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2700
     * @tc.name Array_Sort_Second_Test_static_2700
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x33.toChar(), 0x32.toChar(), 0x31.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2800
     * @tc.name Array_Sort_Second_Test_static_2800
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x33.toChar(), 0x31.toChar(), 0x32.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_2900
     * @tc.name Array_Sort_Second_Test_static_2900
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x45.toChar(), 0x65.toChar(), 0x45.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x45.toChar(), 0x45.toChar(), 0x65.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3000
     * @tc.name Array_Sort_Second_Test_static_3000
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x45.toChar(), 0x45.toChar(), 0x45.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x45.toChar(), 0x45.toChar(), 0x45.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3100
     * @tc.name Array_Sort_Second_Test_static_3100
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x41.toChar(), 0x61.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x31.toChar(), 0x41.toChar(), 0x61.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3200
     * @tc.name Array_Sort_Second_Test_static_3200
     * @tc.desc test sort(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x61.toChar(), 0x41.toChar(), 0x31.toChar()];
        sort(arr);
        const expected: FixedArray<char> = [0x31.toChar(), 0x41.toChar(), 0x61.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3300
     * @tc.name Array_Sort_Second_Test_static_3300
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        sort(arr, (a: char, b: char) => a.toInt() - b.toInt());
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3400
     * @tc.name Array_Sort_Second_Test_static_3400
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x35.toChar()];
        sort(arr, (a: char, b: char) => a.toInt() - b.toInt());
        const expected: FixedArray<char> = [0x35.toChar()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3500
     * @tc.name Array_Sort_Second_Test_static_3500
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x35.toChar()];
        sort(arr, (a: char, b: char) => b.toInt() - a.toInt());
        const expected: FixedArray<char> = [0x35.toChar()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3600
     * @tc.name Array_Sort_Second_Test_static_3600
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x36.toChar()];
        sort(arr, (a: char, b: char) => a.toInt() - b.toInt());
        const expected: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x36.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3700
     * @tc.name Array_Sort_Second_Test_static_3700
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x36.toChar()];
        sort(arr, (a: char, b: char) => b.toInt() - a.toInt());
        const expected: FixedArray<char> = [0x36.toChar(), 0x35.toChar(), 0x31.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3800
     * @tc.name Array_Sort_Second_Test_static_3800
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x41.toChar(), 0x41.toChar()];
        sort(arr, (a: char, b: char) => a.toInt() - b.toInt());
        const expected: FixedArray<char> = [0x41.toChar(), 0x41.toChar(), 0x41.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_3900
     * @tc.name Array_Sort_Second_Test_static_3900
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar()];
        sort(arr, (a: char, b: char) => a.toInt() - b.toInt());
        const expected: FixedArray<char> = [0x41.toChar(), 0x41.toChar(), 0x61.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4000
     * @tc.name Array_Sort_Second_Test_static_4000
     * @tc.desc test sort(self: FixedArray<char>, comparator: ((a: char, b: char)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar()];
        sort(arr, (a: char, b: char) => b.toInt() - a.toInt());
        const expected: FixedArray<char> = [0x61.toChar(), 0x41.toChar(), 0x41.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4100
     * @tc.name Array_Sort_Second_Test_static_4100
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4200
     * @tc.name Array_Sort_Second_Test_static_4200
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        sort(arr);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4300
     * @tc.name Array_Sort_Second_Test_static_4300
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3, 2.2, 1.1];
        sort(arr);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4400
     * @tc.name Array_Sort_Second_Test_static_4400
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9];
        sort(arr);
        const expected: FixedArray<double> = [9.9];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4500
     * @tc.name Array_Sort_Second_Test_static_4500
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 1.1, 1.1];
        sort(arr);
        const expected: FixedArray<double> = [1.1, 1.1, 1.1];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4600
     * @tc.name Array_Sort_Second_Test_static_4600
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, -1.1, 1.1];
        sort(arr);
        const expected: FixedArray<double> = [-1.1, 1.1, 1.1];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4700
     * @tc.name Array_Sort_Second_Test_static_4700
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2, 2.2, 3.3, 1.1];
        sort(arr);
        const expected: FixedArray<double> = [1.1, 2.2, 2.2, 3.3];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4800
     * @tc.name Array_Sort_Second_Test_static_4800
     * @tc.desc test sort(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-2.2, -2.2, 3.3, 1.1];
        sort(arr);
        const expected: FixedArray<double> = [-2.2, -2.2, 1.1, 3.3];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_4900
     * @tc.name Array_Sort_Second_Test_static_4900
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        sort(arr, (a: double, b: double) => (a - b).toInt());
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5000
     * @tc.name Array_Sort_Second_Test_static_5000
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        sort(arr, (a: double, b: double) => (b - a).toInt());
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5100
     * @tc.name Array_Sort_Second_Test_static_5100
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 3.3, 6.6];
        sort(arr, (a: double, b: double) => (a - b).toInt());
        const expected: FixedArray<double> = [1.1, 3.3, 6.6]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5200
     * @tc.name Array_Sort_Second_Test_static_5200
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 3.3, 6.6];
        sort(arr, (a: double, b: double) => (b - a).toInt());
        const expected: FixedArray<double> = [6.6, 3.3, 1.1]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5300
     * @tc.name Array_Sort_Second_Test_static_5300
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, -5.5, 0.0];
        sort(arr, (a: double, b: double) => (a - b).toInt());
        const expected: FixedArray<double> = [-5.5, 0.0, 5.5]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5400
     * @tc.name Array_Sort_Second_Test_static_5400
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, -5.5, 0.0];
        sort(arr, (a: double, b: double) => (b - a).toInt());
        const expected: FixedArray<double> = [5.5, 0.0, -5.5]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5500
     * @tc.name Array_Sort_Second_Test_static_5500
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9, 9.9, 9.9];
        sort(arr, (a: double, b: double) => (a - b).toInt());
        const expected: FixedArray<double> = [9.9, 9.9, 9.9]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5600
     * @tc.name Array_Sort_Second_Test_static_5600
     * @tc.desc test sort(self: FixedArray<double>, comparator: ((a: double, b: double)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9, -9.9, 9.9];
        sort(arr, (a: double, b: double) => (b - a).toInt());
        const expected: FixedArray<double> = [9.9, 9.9, -9.9]
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5700
     * @tc.name Array_Sort_Second_Test_static_5700
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5800
     * @tc.name Array_Sort_Second_Test_static_5800
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [8.8.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [8.8.toFloat()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_5900
     * @tc.name Array_Sort_Second_Test_static_5900
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 5.5.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 5.5.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6000
     * @tc.name Array_Sort_Second_Test_static_6000
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 5.5.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6100
     * @tc.name Array_Sort_Second_Test_static_6100
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [12.2.toFloat(), 12.2.toFloat(), 12.2.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [12.2.toFloat(), 12.2.toFloat(), 12.2.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6200
     * @tc.name Array_Sort_Second_Test_static_6200
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-12.2.toFloat(), 12.2.toFloat(), -12.2.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [-12.2.toFloat(), -12.2.toFloat(), 12.2.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6300
     * @tc.name Array_Sort_Second_Test_static_6300
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat(), 20.0.toFloat(), 30.0.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [10.0.toFloat(), 20.0.toFloat(), 30.0.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6400
     * @tc.name Array_Sort_Second_Test_static_6400
     * @tc.desc test sort(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [30.0.toFloat(), 20.0.toFloat(), 10.0.toFloat()];
        sort(arr);
        const expected: FixedArray<float> = [10.0.toFloat(), 20.0.toFloat(), 30.0.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6500
     * @tc.name Array_Sort_Second_Test_static_6500
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        sort(arr, (a: float, b: float) => (a - b).toInt());
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6600
     * @tc.name Array_Sort_Second_Test_static_6600
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [80.0.toFloat()];
        sort(arr, (a: float, b: float) => (b - a).toInt());
        const expected: FixedArray<float> = [80.0.toFloat()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6700
     * @tc.name Array_Sort_Second_Test_static_6700
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 15.5.toFloat(), 25.5.toFloat()];
        sort(arr, (a: float, b: float) => (a - b).toInt());
        const expected: FixedArray<float> = [5.5.toFloat(), 15.5.toFloat(), 25.5.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6800
     * @tc.name Array_Sort_Second_Test_static_6800
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 15.5.toFloat(), 25.5.toFloat()];
        sort(arr, (a: float, b: float) => (b - a).toInt());
        const expected: FixedArray<float> = [25.5.toFloat(), 15.5.toFloat(), 5.5.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_6900
     * @tc.name Array_Sort_Second_Test_static_6900
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [20.0.toFloat(), -20.0.toFloat(), 20.0.toFloat()];
        sort(arr, (a: float, b: float) => (a - b).toInt());
        const expected: FixedArray<float> = [-20.0.toFloat(), 20.0.toFloat(), 20.0.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7000
     * @tc.name Array_Sort_Second_Test_static_7000
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [20.0.toFloat(), -20.0.toFloat(), 20.0.toFloat()];
        sort(arr, (a: float, b: float) => (b - a).toInt());
        const expected: FixedArray<float> = [20.0.toFloat(), 20.0.toFloat(), -20.0.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7100
     * @tc.name Array_Sort_Second_Test_static_7100
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 1.1.toFloat(), 4.4.toFloat(), 1.1.toFloat(), 5.5.toFloat()];
        sort(arr, (a: float, b: float) => (a - b).toInt());
        const expected: FixedArray<float> = [1.1.toFloat(), 1.1.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 5.5.toFloat()];
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
     * @tc.number ARRAY_SORT_SECOND_TEST_7200
     * @tc.name Array_Sort_Second_Test_static_7200
     * @tc.desc test sort(self: FixedArray<float>, comparator: ((a: float, b: float)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 1.1.toFloat(), 4.4.toFloat(), 1.1.toFloat(), 5.5.toFloat()];
        sort(arr, (a: float, b: float) => (b - a).toInt());
        const expected: FixedArray<float> = [5.5.toFloat(), 4.4.toFloat(), 3.3.toFloat(), 1.1.toFloat(), 1.1.toFloat()];
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
     * @tc.number ARRAY_SORT_SECOND_TEST_7300
     * @tc.name Array_Sort_Second_Test_static_7300
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        sort(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7400
     * @tc.name Array_Sort_Second_Test_static_7400
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1];
        sort(arr);
        const expected: FixedArray<int> = [1];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7500
     * @tc.name Array_Sort_Second_Test_static_7500
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 4, 6];
        sort(arr);
        const expected: FixedArray<int> = [2, 4, 6];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7600
     * @tc.name Array_Sort_Second_Test_static_7600
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 4, 2];
        sort(arr);
        const expected: FixedArray<int> = [2, 4, 6];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7700
     * @tc.name Array_Sort_Second_Test_static_7700
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 3, 3];
        sort(arr);
        const expected: FixedArray<int> = [3, 3, 3];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7800
     * @tc.name Array_Sort_Second_Test_static_7800
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, -6, 6];
        sort(arr);
        const expected: FixedArray<int> = [-6, 6, 6];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_7900
     * @tc.name Array_Sort_Second_Test_static_7900
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_7900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5, 2, 2, 3];
        sort(arr);
        const expected: FixedArray<int> = [2, 2, 3, 5];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_SECOND_TEST_8000
     * @tc.name Array_Sort_Second_Test_static_8000
     * @tc.desc test sort(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Second_Test_static_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Second_Test_static_8000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5, 2, -2, 3];
        sort(arr);
        const expected: FixedArray<int> = [-2, 2, 3, 5];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}