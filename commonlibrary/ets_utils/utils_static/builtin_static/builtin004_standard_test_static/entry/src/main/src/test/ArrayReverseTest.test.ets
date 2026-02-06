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

export default function Array_Reverse_Test_static() {
  describe('Array_Reverse_Test_static', ():void => {
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
     * @tc.number ARRAY_REVERSE_TEST_0100
     * @tc.name Array_Reverse_Test_static_0100
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        reverse(arr);
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
     * @tc.number ARRAY_REVERSE_TEST_0200
     * @tc.name Array_Reverse_Test_static_0200
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        reverse(arr);
        const expected: FixedArray<boolean> = [true];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_0300
     * @tc.name Array_Reverse_Test_static_0300
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        reverse(arr);
        const expected: FixedArray<boolean> = [false];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_0400
     * @tc.name Array_Reverse_Test_static_0400
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        reverse(arr);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_0500
     * @tc.name Array_Reverse_Test_static_0500
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        reverse(arr);
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
     * @tc.number ARRAY_REVERSE_TEST_0600
     * @tc.name Array_Reverse_Test_static_0600
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        reverse(arr);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_0700
     * @tc.name Array_Reverse_Test_static_0700
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, true, false, false];
        reverse(arr);
        const expected: FixedArray<boolean> = [false, false, true, true, false];
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
     * @tc.number ARRAY_REVERSE_TEST_0800
     * @tc.name Array_Reverse_Test_static_0800
     * @tc.desc test reverse(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_0900
     * @tc.name Array_Reverse_Test_static_0900
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 4, 6];
        reverse(arr);
        const expected: FixedArray<byte> = [6, 4, 2];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1000
     * @tc.name Array_Reverse_Test_static_1000
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [6, 4, 2];
        reverse(arr);
        const expected: FixedArray<byte> = [2, 4, 6];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1100
     * @tc.name Array_Reverse_Test_static_1100
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 12, 12];
        reverse(arr);
        const expected: FixedArray<byte> = [12, 12, 12];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1200
     * @tc.name Array_Reverse_Test_static_1200
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 127, -128];
        reverse(arr);
        const expected: FixedArray<byte> = [-128, 127, 0];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1300
     * @tc.name Array_Reverse_Test_static_1300
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [8, 2, 6, 10];
        reverse(arr);
        const expected: FixedArray<byte> = [10, 6, 2, 8];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1400
     * @tc.name Array_Reverse_Test_static_1400
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10];
        reverse(arr);
        const expected: FixedArray<byte> = [10];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1500
     * @tc.name Array_Reverse_Test_static_1500
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10];
        reverse(arr);
        const expected: FixedArray<byte> = [-10];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1600
     * @tc.name Array_Reverse_Test_static_1600
     * @tc.desc test reverse(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1700
     * @tc.name Array_Reverse_Test_static_1700
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x35.toChar(), 0x36.toChar(), 0x37.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x37.toChar(), 0x36.toChar(), 0x35.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1800
     * @tc.name Array_Reverse_Test_static_1800
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x37.toChar(), 0x36.toChar(), 0x35.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x35.toChar(), 0x36.toChar(), 0x37.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_1900
     * @tc.name Array_Reverse_Test_static_1900
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2000
     * @tc.name Array_Reverse_Test_static_2000
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar(), 0x61.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x61.toChar(), 0x41.toChar(), 0x61.toChar(), 0x41.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2100
     * @tc.name Array_Reverse_Test_static_2100
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x30.toChar()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2200
     * @tc.name Array_Reverse_Test_static_2200
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x6D.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x6D.toChar()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2300
     * @tc.name Array_Reverse_Test_static_2300
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x61.toChar(), 0x62.toChar(), 0x63.toChar(), 0x64.toChar()];
        reverse(arr);
        const expected: FixedArray<char> = [0x64.toChar(), 0x63.toChar(), 0x62.toChar(), 0x61.toChar()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2400
     * @tc.name Array_Reverse_Test_static_2400
     * @tc.desc test reverse(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2500
     * @tc.name Array_Reverse_Test_static_2500
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        reverse(arr);
        const expected: FixedArray<double> = [3.3, 2.2, 1.1];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2600
     * @tc.name Array_Reverse_Test_static_2600
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.3, 2.2, 1.1];
        reverse(arr);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2700
     * @tc.name Array_Reverse_Test_static_2700
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [6.6, 2.2, 9.9];
        reverse(arr);
        const expected: FixedArray<double> = [9.9, 2.2, 6.6];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2800
     * @tc.name Array_Reverse_Test_static_2800
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [3.1, 3.1, 3.1];
        reverse(arr);
        const expected: FixedArray<double> = [3.1, 3.1, 3.1];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_2900
     * @tc.name Array_Reverse_Test_static_2900
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.0, 4.0, 6.0, 8.0];
        reverse(arr);
        const expected: FixedArray<double> = [8.0, 6.0, 4.0, 2.0];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3000
     * @tc.name Array_Reverse_Test_static_3000
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1];
        reverse(arr);
        const expected: FixedArray<double> = [11.1];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3100
     * @tc.name Array_Reverse_Test_static_3100
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [11.1, -11.1];
        reverse(arr);
        const expected: FixedArray<double> = [-11.1, 11.1];
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3200
     * @tc.name Array_Reverse_Test_static_3200
     * @tc.desc test reverse(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3300
     * @tc.name Array_Reverse_Test_static_3300
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [3.3.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3400
     * @tc.name Array_Reverse_Test_static_3400
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3500
     * @tc.name Array_Reverse_Test_static_3500
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3600
     * @tc.name Array_Reverse_Test_static_3600
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat(), 2.2.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [2.2.toFloat(), 1.1.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3700
     * @tc.name Array_Reverse_Test_static_3700
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [2.5.toFloat(), 1.5.toFloat()];
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3800
     * @tc.name Array_Reverse_Test_static_3800
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.14.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [3.14.toFloat()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_3900
     * @tc.name Array_Reverse_Test_static_3900
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [-3.14.toFloat()];
        reverse(arr);
        const expected: FixedArray<float> = [-3.14.toFloat()];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4000
     * @tc.name Array_Reverse_Test_static_4000
     * @tc.desc test reverse(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4100
     * @tc.name Array_Reverse_Test_static_4100
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        reverse(arr);
        const expected: FixedArray<int> = [3, 2, 1];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4200
     * @tc.name Array_Reverse_Test_static_4200
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [3, 2, 1];
        reverse(arr);
        const expected: FixedArray<int> = [1, 2, 3];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4300
     * @tc.name Array_Reverse_Test_static_4300
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 2, 4, 0];
        reverse(arr);
        const expected: FixedArray<int> = [0, 4, 2, 6];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4400
     * @tc.name Array_Reverse_Test_static_4400
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 6, 6];
        reverse(arr);
        const expected: FixedArray<int> = [6, 6, 6];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4500
     * @tc.name Array_Reverse_Test_static_4500
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2];
        reverse(arr);
        const expected: FixedArray<int> = [2, 1];
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4600
     * @tc.name Array_Reverse_Test_static_4600
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0, -128, 127];
        reverse(arr);
        const expected: FixedArray<int> = [127, -128, 0];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4700
     * @tc.name Array_Reverse_Test_static_4700
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5];
        reverse(arr);
        const expected: FixedArray<int> = [5];
        expect(arr.length).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4800
     * @tc.name Array_Reverse_Test_static_4800
     * @tc.desc test reverse(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_4900
     * @tc.name Array_Reverse_Test_static_4900
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-9223372036854775808, 9223372036854775807, 0];
        reverse(arr);
        const expected: FixedArray<long> = [0, 9223372036854775807, -9223372036854775808];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5000
     * @tc.name Array_Reverse_Test_static_5000
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 400, 200];
        reverse(arr);
        const expected: FixedArray<long> = [200, 400, 100];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5100
     * @tc.name Array_Reverse_Test_static_5100
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 400];
        reverse(arr);
        const expected: FixedArray<long> = [400, 200, 100];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5200
     * @tc.name Array_Reverse_Test_static_5200
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [800, 600, 800];
        reverse(arr);
        const expected: FixedArray<long> = [800, 600, 800];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5300
     * @tc.name Array_Reverse_Test_static_5300
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [200, 0, 500, 300];
        reverse(arr);
        const expected: FixedArray<long> = [300, 500, 0, 200];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5400
     * @tc.name Array_Reverse_Test_static_5400
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [200, 200, 200];
        reverse(arr);
        const expected: FixedArray<long> = [200, 200, 200];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5500
     * @tc.name Array_Reverse_Test_static_5500
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        reverse(arr);
        const expected: FixedArray<long> = [100];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5600
     * @tc.name Array_Reverse_Test_static_5600
     * @tc.desc test reverse(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5700
     * @tc.name Array_Reverse_Test_static_5700
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [30, 70, 20];
        reverse(arr);
        const expected: FixedArray<short> = [20, 70, 30];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5800
     * @tc.name Array_Reverse_Test_static_5800
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [20, 30, 70];
        reverse(arr);
        const expected: FixedArray<short> = [70, 30, 20];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_5900
     * @tc.name Array_Reverse_Test_static_5900
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [70, 30, 20];
        reverse(arr);
        const expected: FixedArray<short> = [20, 30, 70];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_6000
     * @tc.name Array_Reverse_Test_static_6000
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 10, 10];
        reverse(arr);
        const expected: FixedArray<short> = [10, 10, 10];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_6100
     * @tc.name Array_Reverse_Test_static_6100
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, -10, -10];
        reverse(arr);
        const expected: FixedArray<short> = [-10, -10, 10];
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_6200
     * @tc.name Array_Reverse_Test_static_6200
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 40, 20, 80];
        reverse(arr);
        const expected: FixedArray<short> = [80, 20, 40, 10];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_6300
     * @tc.name Array_Reverse_Test_static_6300
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [30];
        reverse(arr);
        const expected: FixedArray<short> = [30];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REVERSE_TEST_6400
     * @tc.name Array_Reverse_Test_static_6400
     * @tc.desc test reverse(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reverse_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reverse_Test_static_6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        reverse(arr);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}