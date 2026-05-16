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

export default function Array_Some_Test_static() {
  describe('Array_Some_Test_static', ():void => {
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
     * @tc.number ARRAY_SOME_TEST_0100
     * @tc.name Array_Some_Test_static_0100
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [false, false, true, false];
        const result = some(array, (value) => value === true);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0200
     * @tc.name Array_Some_Test_static_0200
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [false, false, false];
        const result = some(array, (value) => value === true);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0300
     * @tc.name Array_Some_Test_static_0300
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [];
        const result = some(array, () => true);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0400
     * @tc.name Array_Some_Test_static_0400
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [];
        const result = some(array, () => false);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0500
     * @tc.name Array_Some_Test_static_0500
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0500';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [false, true, true, true];
        const result = some(array, (value, index) => value === false && index > 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0600
     * @tc.name Array_Some_Test_static_0600
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0600';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [false, true, false, true];
        const result = some(array, (value, index) => value === false && index > 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0700
     * @tc.name Array_Some_Test_static_0700
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0700';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [false, true, false, true];
        const result = some(array, (value, index) => value === true && index < 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0800
     * @tc.name Array_Some_Test_static_0800
     * @tc.desc test some(self: FixedArray<boolean>, predicate: ((value: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0800';
        console.info(`${caseName}, test start`);
        const array: FixedArray<boolean> = [false, true, false, true];
        const result = some(array, (value, index) => value === true && index > 8);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_0900
     * @tc.name Array_Some_Test_static_0900
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_0900';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [];
        const result = some(array, (value) => value > 2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1000
     * @tc.name Array_Some_Test_static_1000
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1000';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [10, 20, 25];
        const result = some(array, (value) => value > 15);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1100
     * @tc.name Array_Some_Test_static_1100
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [10, 20, 25];
        const result = some(array, (value) => value === 15);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1200
     * @tc.name Array_Some_Test_static_1200
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [10, 20, 25];
        const result = some(array, (value, index) => value === 25 && index > 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1300
     * @tc.name Array_Some_Test_static_1300
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [42, 42, 42];
        const result = some(array, (value) => value === 42);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1400
     * @tc.name Array_Some_Test_static_1400
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [1, 2, 3];
        const result = some(array, (value) => value < 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1500
     * @tc.name Array_Some_Test_static_1500
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1500';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [1, 2, 3];
        const result = some(array, (value, index) => value > 1 && index < 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1600
     * @tc.name Array_Some_Test_static_1600
     * @tc.desc test some(self: FixedArray<byte>, predicate: ((value: byte, index: number, array: FixedArray<byte>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1600';
        console.info(`${caseName}, test start`);
        const array: FixedArray<byte> = [1, 2, 3];
        const result = some(array, (value, index) => value > 1 && index > 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1700
     * @tc.name Array_Some_Test_static_1700
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1700';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = some(array, (value) => value > 0x30);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1800
     * @tc.name Array_Some_Test_static_1800
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1800';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = some(array, (value) => value > 0x30);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_1900
     * @tc.name Array_Some_Test_static_1900
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_1900';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = some(array, (value) => value < 0x34);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2000
     * @tc.name Array_Some_Test_static_2000
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2000';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x31.toChar(), 0x35.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = some(array, (value) => value > 0x36);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2100
     * @tc.name Array_Some_Test_static_2100
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [];
        const result = some(array, (value) => value > 0x35);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2200
     * @tc.name Array_Some_Test_static_2200
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = some(array, (value) => value === 0x4C);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2300
     * @tc.name Array_Some_Test_static_2300
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = some(array, (value) => value > 0x53);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2400
     * @tc.name Array_Some_Test_static_2400
     * @tc.desc test some(self: FixedArray<char>, predicate: ((value: char, index: number, array: FixedArray<char>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<char> = [0x48.toChar(), 0x45.toChar(), 0x4C.toChar(), 0x4C.toChar(), 0x4F.toChar()];
        const result = some(array, (value, index) => value < 0x4B && index > 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2500
     * @tc.name Array_Some_Test_static_2500
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2500';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [1.1, 5.5, 3.3, 2.2, 6.6];
        const result = some(array, (value) => value === 4.4);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2600
     * @tc.name Array_Some_Test_static_2600
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2600';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [1.1, 5.5, 3.3, 2.2, 6.6];
        const result = some(array, (value) => value > 2.5);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2700
     * @tc.name Array_Some_Test_static_2700
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2700';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [];
        const result = some(array, (value) => value > 3.3);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2800
     * @tc.name Array_Some_Test_static_2800
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2800';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [0.0, 0.0, 2.2, 0.0, 2.2];
        const result = some(array, (value) => value > 2.2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_2900
     * @tc.name Array_Some_Test_static_2900
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_2900';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [0.0, 0.0, 2.2, 0.0, 2.2];
        const result = some(array, (value, index) => value > 0.0 && index < 2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3000
     * @tc.name Array_Some_Test_static_3000
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3000';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [0.0, 0.0, 2.2, 0.0, 2.2];
        const result = some(array, (value, index) => value > 0.0 && index < 3);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3100
     * @tc.name Array_Some_Test_static_3100
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6];
        const result = some(array, (value, index) => value > 0.0 && index > 10);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3200
     * @tc.name Array_Some_Test_static_3200
     * @tc.desc test some(self: FixedArray<double>, predicate: ((value: double, index: number, array: FixedArray<double>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6];
        const result = some(array, (value, index) => value > 1.1 && index < 0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3300
     * @tc.name Array_Some_Test_static_3300
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = some(array, (value) => value > 1.1.toFloat());
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3400
     * @tc.name Array_Some_Test_static_3400
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = some(array, (value) => value > 3.3.toFloat());
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3500
     * @tc.name Array_Some_Test_static_3500
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3500';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = some(array, (value, index) => value > 1.1.toFloat() && index < 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3600
     * @tc.name Array_Some_Test_static_3600
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3600';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = some(array, (value, index) => value > 1.1.toFloat() && index < 0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3700
     * @tc.name Array_Some_Test_static_3700
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3700';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = some(array, (value, index) => value > 1.1.toFloat() && index > 5);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3800
     * @tc.name Array_Some_Test_static_3800
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3800';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [];
        const result = some(array, (value) => value === 0.0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_3900
     * @tc.name Array_Some_Test_static_3900
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_3900';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [0.0.toFloat(), 1.1.toFloat(), -1.1.toFloat(), 0.0.toFloat()];
        const result = some(array, (value) => value === 0.0.toFloat());
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4000
     * @tc.name Array_Some_Test_static_4000
     * @tc.desc test some(self: FixedArray<float>, predicate: ((value: float, index: number, array: FixedArray<float>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4000';
        console.info(`${caseName}, test start`);
        const array: FixedArray<float> = [0.0.toFloat(), 1.1.toFloat(), -1.1.toFloat(), 0.0.toFloat()];
        const result = some(array, (value, index) => value < 0.0.toFloat() && index > 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4100
     * @tc.name Array_Some_Test_static_4100
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [1, 2, 3];
        const result = some(array, (value) => value > 2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4200
     * @tc.name Array_Some_Test_static_4200
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [1, 2, 3];
        const result = some(array, (value, index) => value > 2 && index < 2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4300
     * @tc.name Array_Some_Test_static_4300
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [1, 2, 3];
        const result = some(array, (value) => value < 0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4400
     * @tc.name Array_Some_Test_static_4400
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [];
        const result = some(array, (value) => value > 0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4500
     * @tc.name Array_Some_Test_static_4500
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4500';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [-1, 1, 0, 0, -1, -2];
        const result = some(array, (value) => value === 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4600
     * @tc.name Array_Some_Test_static_4600
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4600';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [-1, 1, 0, 0, -1, -2];
        const result = some(array, (value, index) => value === -1 && index < 4);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4700
     * @tc.name Array_Some_Test_static_4700
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4700';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [-1, 1, 0, 0, -1, -2];
        const result = some(array, (value, index) => value === -2 && index < 4);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4800
     * @tc.name Array_Some_Test_static_4800
     * @tc.desc test some(self: FixedArray<int>, predicate: ((value: int, index: number, array: FixedArray<int>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4800';
        console.info(`${caseName}, test start`);
        const array: FixedArray<int> = [-1, 1, 0, 0, -1, -2];
        const result = some(array, (value) => value < -2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_4900
     * @tc.name Array_Some_Test_static_4900
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_4900';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [100, 300, 400, 200];
        const result = some(array, (value) => value === 0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5000
     * @tc.name Array_Some_Test_static_5000
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5000';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [100, 300, 400, 200];
        const result = some(array, (value) => value === 200);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5100
     * @tc.name Array_Some_Test_static_5100
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [];
        const result = some(array, (value) => value > 100);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5200
     * @tc.name Array_Some_Test_static_5200
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [];
        const result = some(array, (value, index) => value > 100 && index > 2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5300
     * @tc.name Array_Some_Test_static_5300
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [100, 100, 100, 100];
        const result = some(array, (value) => value < 100);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5400
     * @tc.name Array_Some_Test_static_5400
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [500, 300, 100, -100];
        const result = some(array, (value, index) => value < 100 && index === 2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5500
     * @tc.name Array_Some_Test_static_5500
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5500';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [500, 300, 100, -100];
        const result = some(array, (value, index) => value < 100 && index > 2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5600
     * @tc.name Array_Some_Test_static_5600
     * @tc.desc test some(self: FixedArray<long>, predicate: ((value: long, index: number, array: FixedArray<long>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5600';
        console.info(`${caseName}, test start`);
        const array: FixedArray<long> = [500, 300, 100, -100];
        const result = some(array, (value, index) => value < 100 && index > 7);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5700
     * @tc.name Array_Some_Test_static_5700
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5700';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, 20, 30, 40, 50];
        const result = some(array, (value) => value < 60);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5800
     * @tc.name Array_Some_Test_static_5800
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5800';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, 20, 30, 40, 50];
        const result = some(array, (value) => value < 10);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_5900
     * @tc.name Array_Some_Test_static_5900
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_5900';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, 20, 30, 40, 50];
        const result = some(array, (value, index) => value < 30 && index > 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_6000
     * @tc.name Array_Some_Test_static_6000
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_6000';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, 20, 30, 40, 50];
        const result = some(array, (value, index) => value < 40 && index > 1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_6100
     * @tc.name Array_Some_Test_static_6100
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_6100';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [];
        const result = some(array, (value) => value > 0);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_6200
     * @tc.name Array_Some_Test_static_6200
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_6200';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, -10, 0, 20, -20];
        const result = some(array, (value) => value < -20);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_6300
     * @tc.name Array_Some_Test_static_6300
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_6300';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, -10, 0, 20, -20];
        const result = some(array, (value, index) => value > -10 && index === 8);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SOME_TEST_6400
     * @tc.name Array_Some_Test_static_6400
     * @tc.desc test some(self: FixedArray<short>, predicate: ((value: short, index: number, array: FixedArray<short>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Some_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Some_Test_static_6400';
        console.info(`${caseName}, test start`);
        const array: FixedArray<short> = [10, -10, 0, 20, -20];
        const result = some(array, (value, index) => value > -10 && index === -2);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}