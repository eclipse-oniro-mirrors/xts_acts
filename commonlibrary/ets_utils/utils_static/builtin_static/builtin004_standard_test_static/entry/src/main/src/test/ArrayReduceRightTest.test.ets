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

export default function Array_Reduce_Right_Test_static() {
  describe('Array_Reduce_Right_Test_static', ():void => {
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0100
     * @tc.name Array_Reduce_Right_Test_static_0100
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0200
     * @tc.name Array_Reduce_Right_Test_static_0200
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0300
     * @tc.name Array_Reduce_Right_Test_static_0300
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0400
     * @tc.name Array_Reduce_Right_Test_static_0400
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0500
     * @tc.name Array_Reduce_Right_Test_static_0500
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0600
     * @tc.name Array_Reduce_Right_Test_static_0600
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0700
     * @tc.name Array_Reduce_Right_Test_static_0700
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, false];
        const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev || curr);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0800
     * @tc.name Array_Reduce_Right_Test_static_0800
     * @tc.desc test reduceRight(self: FixedArray<boolean>, callbackfn: ((previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>)=> boolean)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<boolean> = [];
          const result = reduceRight(arr, (prev: boolean, curr: boolean): boolean => prev && curr);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_0900
     * @tc.name Array_Reduce_Right_Test_static_0900
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 12, 14];
        const result = reduce(arr, (prev: byte, curr: byte): byte => (prev + curr.toByte()).toByte());
        expect(result).assertEqual(36);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1000
     * @tc.name Array_Reduce_Right_Test_static_1000
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [16];
        const result = reduceRight(arr, (prev: byte, curr: byte): byte =>(prev + curr.toByte()).toByte());
        expect(result).assertEqual(16);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1100
     * @tc.name Array_Reduce_Right_Test_static_1100
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, -12, -22, 22];
        const result = reduceRight(arr, (prev: byte, curr: byte): byte => (prev + curr).toByte());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1200
     * @tc.name Array_Reduce_Right_Test_static_1200
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 12, 12];
        const result = reduceRight(arr, (prev: byte, curr: byte): byte => (prev + curr).toByte());
        expect(result.toString()).assertEqual('36');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1300
     * @tc.name Array_Reduce_Right_Test_static_1300
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [12, 14, 16];
        const result = reduceRight(arr, (prev: byte, curr: byte): byte => (curr > prev) ? curr : prev.toByte());
        expect(result.toString()).assertEqual('16');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1400
     * @tc.name Array_Reduce_Right_Test_static_1400
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [18];
        const result = reduceRight(arr, (prev: byte, curr: byte): byte => (curr > prev) ? curr : prev.toByte());
        expect(result).assertEqual(18);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1500
     * @tc.name Array_Reduce_Right_Test_static_1500
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [];
          const result = reduceRight(arr, (prev: byte, curr: byte): byte => (curr > prev) ? curr : prev.toByte());
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1600
     * @tc.name Array_Reduce_Right_Test_static_1600
     * @tc.desc test reduceRight(self: FixedArray<byte>, callbackfn: ((previousValue: byte, currentValue: byte, index: number, array: FixedArray<byte>)=> byte)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<byte> = [];
          const result = reduceRight(arr, (prev: byte, curr: byte): byte => (prev + curr).toByte());
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1700
     * @tc.name Array_Reduce_Right_Test_static_1700
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x30.toChar(), 0x31.toChar(), 0x32.toChar()];
        const result = reduceRight(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x32.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1800
     * @tc.name Array_Reduce_Right_Test_static_1800
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x30.toChar(), 0x31.toChar()];
        const result = reduceRight(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x32.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_1900
     * @tc.name Array_Reduce_Right_Test_static_1900
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x32.toChar(), 0x30.toChar(), 0x31.toChar()];
        const result = reduceRight(arr, (prev: char, curr: char): char => (curr < prev) ? curr : prev as char);
        expect(result).assertEqual(0x30.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2000
     * @tc.name Array_Reduce_Right_Test_static_2000
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar()];
        const result = reduceRight(arr, (prev: char, curr: char): char => (curr < prev) ? curr : prev as char);
        expect(result).assertEqual(0x41.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2100
     * @tc.name Array_Reduce_Right_Test_static_2100
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x61.toChar(), 0x41.toChar(), 0x61.toChar()];
        const result = reduceRight(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x61.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2200
     * @tc.name Array_Reduce_Right_Test_static_2200
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x38.toChar(), 0x38.toChar(), 0x38.toChar()];
        const result = reduceRight(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
        expect(result).assertEqual(0x38.toChar());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2300
     * @tc.name Array_Reduce_Right_Test_static_2300
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [];
          const result = reduceRight(arr, (prev: char, curr: char): char => (curr > prev) ? curr : prev as char);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2400
     * @tc.name Array_Reduce_Right_Test_static_2400
     * @tc.desc test reduceRight(self: FixedArray<char>, callbackfn: ((previousValue: char, currentValue: char, index: number, array: FixedArray<char>)=> char)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<char> = [];
          const result = reduceRight(arr, (prev: char, curr: char): char => (curr < prev) ? curr : prev as char);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2500
     * @tc.name Array_Reduce_Right_Test_static_2500
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduceRight(arr, (prev: double, curr: double): double => curr + prev);
        expect(result).assertEqual(6.6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2600
     * @tc.name Array_Reduce_Right_Test_static_2600
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1];
        const result = reduceRight(arr, (prev: double, curr: double): double => curr + prev);
        expect(result).assertEqual(1.1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2700
     * @tc.name Array_Reduce_Right_Test_static_2700
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1.1, 1.1];
        const result = reduceRight(arr, (prev: double, curr: double): double => curr + prev);
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2800
     * @tc.name Array_Reduce_Right_Test_static_2800
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [2.2];
        const result = reduceRight(arr, (prev: double, curr: double): double => (curr > prev) ? curr : prev as double);
        expect(result).assertEqual(2.2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_2900
     * @tc.name Array_Reduce_Right_Test_static_2900
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, 1.1, 3.3];
        const result = reduceRight(arr, (prev: double, curr: double): double => (curr < prev) ? curr : prev as double);
        expect(result).assertEqual(1.1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3000
     * @tc.name Array_Reduce_Right_Test_static_3000
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [20.0, 10.0, 5.0];
        const result = reduceRight(arr, (prev: double, curr: double): double => (curr < prev) ? curr : prev as double);
        expect(result).assertEqual(5.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3100
     * @tc.name Array_Reduce_Right_Test_static_3100
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3100';
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3200
     * @tc.name Array_Reduce_Right_Test_static_3200
     * @tc.desc test reduceRight(self: FixedArray<double>, callbackfn: ((previousValue: double, currentValue: double, index: number, array: FixedArray<double>)=> double)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3200';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<double> = [];
          const result = reduceRight(arr, (prev: double, curr: double): double => curr + prev);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3300
     * @tc.name Array_Reduce_Right_Test_static_3300
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = reduceRight(arr, (prev: float, curr: float): float => curr + prev.toFloat());
        expect(result).assertEqual(6.6.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3400
     * @tc.name Array_Reduce_Right_Test_static_3400
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.2.toFloat()];
        const result = reduceRight(arr, (prev: float, curr: float): float => curr + prev.toFloat());
        expect(result).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3500
     * @tc.name Array_Reduce_Right_Test_static_3500
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [2.2.toFloat(), -2.2.toFloat()];
        const result = reduceRight(arr, (prev: float, curr: float): float => curr + prev.toFloat());
        expect(result).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3600
     * @tc.name Array_Reduce_Right_Test_static_3600
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat(), 20.0.toFloat(), 30.0.toFloat()];
        const result = reduceRight(arr, (prev: float, curr: float): float => (curr > prev) ? curr : prev.toFloat());
        expect(result).assertEqual(30.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3700
     * @tc.name Array_Reduce_Right_Test_static_3700
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat()];
        const result = reduceRight(arr, (prev: float, curr: float): float => (curr > prev) ? curr : prev.toFloat());
        expect(result).assertEqual(10.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3800
     * @tc.name Array_Reduce_Right_Test_static_3800
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [10.0.toFloat(), 10.0.toFloat(), 10.0.toFloat()];
        const result = reduceRight(arr, (prev: float, curr: float): float => (curr > prev) ? curr : prev.toFloat());
        expect(result).assertEqual(10.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_3900
     * @tc.name Array_Reduce_Right_Test_static_3900
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_3900';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [];
          const result = reduceRight(arr, (prev: float, curr: float): float => (curr > prev) ? curr : prev.toFloat());
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4000
     * @tc.name Array_Reduce_Right_Test_static_4000
     * @tc.desc test reduceRight(self: FixedArray<float>, callbackfn: ((previousValue: float, currentValue: float, index: number, array: FixedArray<float>)=> float)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4000';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<float> = [];
          const result = reduceRight(arr, (prev: float, curr: float): float => curr + prev);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4100
     * @tc.name Array_Reduce_Right_Test_static_4100
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight(arr, (prev: int, curr: int): int => curr + prev);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4200
     * @tc.name Array_Reduce_Right_Test_static_4200
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5];
        const result = reduceRight(arr, (prev: int, curr: int): int => curr + prev);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4300
     * @tc.name Array_Reduce_Right_Test_static_4300
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-5, 5, 3, -2];
        const result = reduceRight(arr, (prev: int, curr: int): int => curr + prev);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4400
     * @tc.name Array_Reduce_Right_Test_static_4400
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [2, 3];
        const result = reduceRight(arr, (prev: int, curr: int): int => curr * prev);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4500
     * @tc.name Array_Reduce_Right_Test_static_4500
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99];
        const result = reduceRight(arr, (prev: int, curr: int): int => curr * prev);
        expect(result).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4600
     * @tc.name Array_Reduce_Right_Test_static_4600
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99, -99];
        const result = reduceRight(arr, (prev: int, curr: int): int => curr + prev);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4700
     * @tc.name Array_Reduce_Right_Test_static_4700
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4700';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [];
          const result = reduceRight(arr, (prev: int, curr: int): int => curr + prev);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4800
     * @tc.name Array_Reduce_Right_Test_static_4800
     * @tc.desc test reduceRight(self: FixedArray<int>, callbackfn: ((previousValue: int, currentValue: int, index: number, array: FixedArray<int>)=> int)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4800';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<int> = [];
          const result = reduceRight(arr, (prev: int, curr: int): int => curr * prev);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_4900
     * @tc.name Array_Reduce_Right_Test_static_4900
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = reduceRight(arr, (prev: long, curr: long): long => curr + prev);
        expect(result).assertEqual(600);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5000
     * @tc.name Array_Reduce_Right_Test_static_5000
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100];
        const result = reduceRight(arr, (prev: long, curr: long): long => curr + prev);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5100
     * @tc.name Array_Reduce_Right_Test_static_5100
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [200, -300, 400];
        const result = reduceRight(arr, (prev: long, curr: long): long => curr + prev);
        expect(result).assertEqual(300);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5200
     * @tc.name Array_Reduce_Right_Test_static_5200
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [200, -200];
        const result = reduceRight(arr, (prev: long, curr: long): long => curr * prev);
        expect(result).assertEqual(-40000);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5300
     * @tc.name Array_Reduce_Right_Test_static_5300
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [130, 120, 160, 110];
        const result = reduceRight(arr, (prev: long, curr: long): long => (curr > prev) ? curr : prev);
        expect(result).assertEqual(160);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5400
     * @tc.name Array_Reduce_Right_Test_static_5400
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [160, 160, 160, 110];
        const result = reduceRight(arr, (prev: long, curr: long): long => (curr > prev) ? curr : prev);
        expect(result).assertEqual(160);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5500
     * @tc.name Array_Reduce_Right_Test_static_5500
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5500';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [];
          const result = reduceRight(arr, (prev: long, curr: long): long => (curr > prev) ? curr : prev);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5600
     * @tc.name Array_Reduce_Right_Test_static_5600
     * @tc.desc test reduceRight(self: FixedArray<long>, callbackfn: ((previousValue: long, currentValue: long, index: number, array: FixedArray<long>)=> long)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5600';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<long> = [];
          const result = reduceRight(arr, (prev: long, curr: long): long => curr + prev);
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5700
     * @tc.name Array_Reduce_Right_Test_static_5700
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [40, 20, 60];
        const result = reduceRight(arr, (prev: short, curr: short): short => (curr > prev) ? curr : prev);
        expect(result).assertEqual(60);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5800
     * @tc.name Array_Reduce_Right_Test_static_5800
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [40, 20, 60];
        const result = reduceRight(arr, (prev: short, curr: short): short => (curr < prev) ? curr : prev);
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_5900
     * @tc.name Array_Reduce_Right_Test_static_5900
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10];
        const result = reduceRight(arr, (prev: short, curr: short): short => (curr < prev) ? curr : prev);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_6000
     * @tc.name Array_Reduce_Right_Test_static_6000
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [20, -30, 40, -50];
        const result = reduceRight(arr, (prev: short, curr: short): short => (curr + prev.toShort()).toShort());
        expect(result).assertEqual(-20);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_6100
     * @tc.name Array_Reduce_Right_Test_static_6100
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [-20, 20, -20, 20];
        const result = reduceRight(arr, (prev: short, curr: short): short => (curr + prev.toShort()).toShort());
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_6200
     * @tc.name Array_Reduce_Right_Test_static_6200
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 10, 10];
        const result = reduceRight(arr, (prev: short, curr: short): short => (curr + prev.toShort()).toShort());
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_6300
     * @tc.name Array_Reduce_Right_Test_static_6300
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_6300';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [];
          const result = reduceRight(arr, (prev: short, curr: short): short => (curr + prev.toShort()).toShort());
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
     * @tc.number ARRAY_REDUCE_RIGHT_TEST_6400
     * @tc.name Array_Reduce_Right_Test_static_6400
     * @tc.desc test reduceRight(self: FixedArray<short>, callbackfn: ((previousValue: short, currentValue: short, index: number, array: FixedArray<short>)=> short)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_Test_static_6400';
        console.info(`${caseName}, test start`);
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          const arr: FixedArray<short> = [];
          const result = reduceRight(arr, (prev: short, curr: short): short => (curr + prev.toShort()).toShort());
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