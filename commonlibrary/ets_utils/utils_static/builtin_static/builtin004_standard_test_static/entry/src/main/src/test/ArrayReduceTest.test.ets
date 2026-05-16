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
export default function Array_Reduce_Test_static() {
  describe('Array_Reduce_Test_static', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach( async() => {
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
     * @tc.number ARRAY_REDUCE_TEST_0100
     * @tc.name Array_Reduce_Test_static_0100
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0200
     * @tc.name Array_Reduce_Test_static_0200
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0300
     * @tc.name Array_Reduce_Test_static_0300
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0400
     * @tc.name Array_Reduce_Test_static_0400
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0500
     * @tc.name Array_Reduce_Test_static_0500
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0600
     * @tc.name Array_Reduce_Test_static_0600
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0700
     * @tc.name Array_Reduce_Test_static_0700
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true];
        const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0800
     * @tc.name Array_Reduce_Test_static_0800
     * @tc.desc test reduce(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [];
          const result = reduce(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_0900
     * @tc.name Array_Reduce_Test_static_0900
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 22, 32];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (prev + curr.toByte()).toByte());
        expect(result).assertEqual(66);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1000
     * @tc.name Array_Reduce_Test_static_1000
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 12, 12];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (prev + curr.toByte()).toByte());
        expect(result).assertEqual(36);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1100
     * @tc.name Array_Reduce_Test_static_1100
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [16, -16, 18, -18];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (prev + curr.toByte()).toByte());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1200
     * @tc.name Array_Reduce_Test_static_1200
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [52, 50, 42];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (curr > prev) ? curr : prev.toByte());
        expect(result).assertEqual(52);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1300
     * @tc.name Array_Reduce_Test_static_1300
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [22, 20, 24];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (curr < prev) ? curr : prev.toByte());
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1400
     * @tc.name Array_Reduce_Test_static_1400
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [13, 13, 13];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (curr < prev) ? curr : prev.toByte());
        expect(result).assertEqual(13);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1500
     * @tc.name Array_Reduce_Test_static_1500
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [];
          const result = reduce(arr, (prev: byte, curr: byte): byte => (curr > prev) ? curr : prev.toByte());
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1600
     * @tc.name Array_Reduce_Test_static_1600
     * @tc.desc test reduce(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [];
          const result = reduce(arr, (prev: byte, curr: byte): byte => (curr + prev.toByte()).toByte());
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1700
     * @tc.name Array_Reduce_Test_static_1700
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x35.toChar(), 0x33.toChar()];
        const result = reduce(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x36.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1800
     * @tc.name Array_Reduce_Test_static_1800
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x35.toChar(), 0x33.toChar()];
        const result = reduce(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x36.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_1900
     * @tc.name Array_Reduce_Test_static_1900
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x36.toChar(), 0x36.toChar()];
        const result = reduce(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x36.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2000
     * @tc.name Array_Reduce_Test_static_2000
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x36.toChar(), 0x36.toChar(), 0x36.toChar()];
        const result = reduce(arr, (prev: char, curr: char): char => (curr < prev) ? curr : prev as char);
        expect(result).assertEqual(0x36.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2100
     * @tc.name Array_Reduce_Test_static_2100
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x61.toChar(), 0x41.toChar()];
        const result = reduce(arr, (prev: char, curr: char): char => (curr < prev) ? curr : prev as char);
        expect(result).assertEqual(0x41.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2200
     * @tc.name Array_Reduce_Test_static_2200
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x61.toChar(), 0x41.toChar()];
        const result = reduce(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x61.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2300
     * @tc.name Array_Reduce_Test_static_2300
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [];
          const result = reduce(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2400
     * @tc.name Array_Reduce_Test_static_2400
     * @tc.desc test reduce(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [];
          const result = reduce(arr, (prev: char, curr: char): char => (curr < prev) ? curr : prev as char);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2500
     * @tc.name Array_Reduce_Test_static_2500
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduce(arr, (prev: double, curr: double): double => prev + curr as double);
        expect(result).assertEqual(6.6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2600
     * @tc.name Array_Reduce_Test_static_2600
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, -2.2, -3.3];
        const result = reduce(arr, (prev: double, curr: double): double => prev + curr as double);
        expect(result).assertEqual(-6.6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2700
     * @tc.name Array_Reduce_Test_static_2700
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [10.0, 5.0, 2.0];
        const result = reduce(arr, (prev: double, curr: double): double => prev - curr as double);
        expect(result).assertEqual(3.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2800
     * @tc.name Array_Reduce_Test_static_2800
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.0, 5.0, 10.0];
        const result = reduce(arr, (prev: double, curr: double): double => prev - curr as double);
        expect(result).assertEqual(-13.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_2900
     * @tc.name Array_Reduce_Test_static_2900
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [22.2, 12.2, 32.2];
        const result = reduce(arr, (prev: double, curr: double): double => (curr > prev) ? curr : prev as double);
        expect(result).assertEqual(32.2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3000
     * @tc.name Array_Reduce_Test_static_3000
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [22.2, 12.2, 32.2];
        const result = reduce(arr, (prev: double, curr: double): double => (curr < prev) ? curr : prev as double);
        expect(result).assertEqual(12.2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3100
     * @tc.name Array_Reduce_Test_static_3100
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3100';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [];
          const result = reduceRight(arr, (prev: double, curr: double): double => (curr < prev) ? curr : prev as double);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3200
     * @tc.name Array_Reduce_Test_static_3200
     * @tc.desc test reduce(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [];
          const result = reduceRight(arr, (prev: double, curr: double): double => curr - prev as double);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3300
     * @tc.name Array_Reduce_Test_static_3300
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.2.toFloat(), 4.4.toFloat(), 6.6.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => (curr < prev) ? curr : prev.toFloat());
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3400
     * @tc.name Array_Reduce_Test_static_3400
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.2.toFloat(), 4.4.toFloat(), 6.6.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => (curr > prev) ? curr : prev.toFloat());
        expect(result).assertEqual(6.6.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3500
     * @tc.name Array_Reduce_Test_static_3500
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat(), 10.0.toFloat(), 10.0.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => (curr > prev) ? curr : prev.toFloat());
        expect(result).assertEqual(10.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3600
     * @tc.name Array_Reduce_Test_static_3600
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat(), 10.0.toFloat(), 10.0.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => curr + prev.toFloat());
        expect(result).assertEqual(30.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3700
     * @tc.name Array_Reduce_Test_static_3700
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat(), -10.0.toFloat(), 10.0.toFloat(), -10.0.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => curr + prev.toFloat());
        expect(result).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3800
     * @tc.name Array_Reduce_Test_static_3800
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.0.toFloat(), 2.0.toFloat(), 3.0.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => curr - prev.toFloat());
        expect(result).assertEqual(2.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_3900
     * @tc.name Array_Reduce_Test_static_3900
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.0.toFloat(), 2.0.toFloat(), 2.0.toFloat()];
        const result = reduce(arr, (prev: float, curr: float): float => curr - prev.toFloat());
        expect(result).assertEqual(2.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4000
     * @tc.name Array_Reduce_Test_static_4000
     * @tc.desc test reduce(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [];
          const result = reduce(arr, (prev: float, curr: float): float => curr - prev.toFloat());
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4100
     * @tc.name Array_Reduce_Test_static_4100
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [7, 8, 9];
        const result = reduce(arr, (prev: int, curr: int): int => curr + prev);
        expect(result).assertEqual(24);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4200
     * @tc.name Array_Reduce_Test_static_4200
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-7, 8, -9];
        const result = reduce(arr, (prev: int, curr: int): int => curr + prev);
        expect(result).assertEqual(-8);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4300
     * @tc.name Array_Reduce_Test_static_4300
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, -2, -3];
        const result = reduce(arr, (prev: int, curr: int): int => curr - prev);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4400
     * @tc.name Array_Reduce_Test_static_4400
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 2, -3];
        const result = reduce(arr, (prev: int, curr: int): int => curr - prev);
        expect(result).assertEqual(-6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4500
     * @tc.name Array_Reduce_Test_static_4500
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [9, 9, 9];
        const result = reduce(arr, (prev: int, curr: int): int => (curr > prev) ? curr : prev);
        expect(result).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4600
     * @tc.name Array_Reduce_Test_static_4600
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [9, -9, 9];
        const result = reduce(arr, (prev: int, curr: int): int => (curr < prev) ? curr : prev);
        expect(result).assertEqual(-9);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4700
     * @tc.name Array_Reduce_Test_static_4700
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [];
          const result = reduce(arr, (prev: int, curr: int): int => curr - prev);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_TEST_4800
     * @tc.name Array_Reduce_Test_static_4800
     * @tc.desc test reduce(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Test_static_4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [];
          const result = reduce(arr, (prev: int, curr: int): int => (curr > prev) ? curr : prev);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('Reduce of empty array with no initial value');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}