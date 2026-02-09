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

export default function Array_Reduce_Right_U_Test_static() {
  describe('Array_Reduce_Right_U_Test_static', ():void => {
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
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0100
     * @tc.name Array_Reduce_Right_U_Test_static_0100
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = reduceRight<number>(arr, (count: number, curr: boolean) => curr ? count + 1 : count, 0);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0200
     * @tc.name Array_Reduce_Right_U_Test_static_0200
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, true];
        const result = reduceRight<number>(arr, (count: number, curr: boolean) => curr ? count + 1 : count, 3);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0300
     * @tc.name Array_Reduce_Right_U_Test_static_0300
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = reduceRight<number>(arr, (count: number, curr: boolean) => curr ? count + 1 : count, 1);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0400
     * @tc.name Array_Reduce_Right_U_Test_static_0400
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = reduceRight<boolean>(arr, (allTrue: boolean, curr: boolean) => allTrue && curr, true);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0500
     * @tc.name Array_Reduce_Right_U_Test_static_0500
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = reduceRight<boolean>(arr, (allTrue: boolean, curr: boolean) => allTrue && curr, true);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0600
     * @tc.name Array_Reduce_Right_U_Test_static_0600
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
        const result = reduceRight<boolean>(arr, (allTrue: boolean, curr: boolean) => allTrue && curr, true);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0700
     * @tc.name Array_Reduce_Right_U_Test_static_0700
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, true];
        const result = reduceRight<boolean>(arr, (hasTrue: boolean, curr: boolean) => hasTrue || curr, false);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0800
     * @tc.name Array_Reduce_Right_U_Test_static_0800
     * @tc.desc test reduceRight<U>(self: FixedArray<boolean>, callbackfn: ((previousValue: U, currentValue: boolean, index: number, array: FixedArray<boolean>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = reduceRight<boolean>(arr, (hasTrue: boolean, curr: boolean) => hasTrue || curr, false);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_0900
     * @tc.name Array_Reduce_Right_U_Test_static_0900
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 0];
        const result = reduceRight<boolean>(arr, (hasNonZero: boolean, curr: byte) => hasNonZero || (curr !== 0), false);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1000
     * @tc.name Array_Reduce_Right_U_Test_static_1000
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 0, 1];
        const result = reduceRight<boolean>(arr, (hasNonZero: boolean, curr: byte) => hasNonZero || (curr !== 0), false);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1100
     * @tc.name Array_Reduce_Right_U_Test_static_1100
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = reduceRight<boolean>(arr, (hasNonZero: boolean, curr: byte) => hasNonZero || (curr !== 0), false);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1200
     * @tc.name Array_Reduce_Right_U_Test_static_1200
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = reduceRight<byte>(arr, (prev, curr) => (prev + curr.toByte()).toByte(), 0);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1300
     * @tc.name Array_Reduce_Right_U_Test_static_1300
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = reduceRight<byte>(arr, (prev, curr) => (prev + curr.toByte()).toByte(), 2);
        expect(result).assertEqual(8);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1400
     * @tc.name Array_Reduce_Right_U_Test_static_1400
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 4, 6];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '');
        expect(result).assertEqual('642');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1500
     * @tc.name Array_Reduce_Right_U_Test_static_1500
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 4, 6];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '0');
        expect(result).assertEqual('0642');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1600
     * @tc.name Array_Reduce_Right_U_Test_static_1600
     * @tc.desc test reduceRight<U>(self: FixedArray<byte>, callbackfn: ((previousValue: U, currentValue: byte, index: number, array: FixedArray<byte>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [2, 4, 6];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), ' ');
        expect(result).assertEqual(' 642');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1700
     * @tc.name Array_Reduce_Right_U_Test_static_1700
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), '');
        expect(result).assertEqual('321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1800
     * @tc.name Array_Reduce_Right_U_Test_static_1800
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), ' ');
        expect(result).assertEqual(' 321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_1900
     * @tc.name Array_Reduce_Right_U_Test_static_1900
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), '6');
        expect(result).assertEqual('6321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2000
     * @tc.name Array_Reduce_Right_U_Test_static_2000
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x41.toChar(), 0x61.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), '');
        expect(result).assertEqual('aA1');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2100
     * @tc.name Array_Reduce_Right_U_Test_static_2100
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x41.toChar(), 0x61.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), 'A');
        expect(result).assertEqual('AaA1');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2200
     * @tc.name Array_Reduce_Right_U_Test_static_2200
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), 'A');
        expect(result).assertEqual('A');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2300
     * @tc.name Array_Reduce_Right_U_Test_static_2300
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x41.toChar(), 0x41.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), '');
        expect(result).assertEqual('AAA');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2400
     * @tc.name Array_Reduce_Right_U_Test_static_2400
     * @tc.desc test reduceRight<U>(self: FixedArray<char>, callbackfn: ((previousValue: U, currentValue: char, index: number, array: FixedArray<char>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x31.toChar()];
        const result = reduceRight<string>(arr, (prev, curr) => prev + String.fromCharCode(curr.toDouble()), '');
        expect(result).assertEqual('111');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2500
     * @tc.name Array_Reduce_Right_U_Test_static_2500
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduceRight<double>(arr, (prev, curr) => prev + curr as double, 0);
        expect(result).assertEqual(6.6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2700
     * @tc.name Array_Reduce_Right_U_Test_static_2700
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = reduceRight<double>(arr, (prev, curr) => prev + curr as double, 9.9);
        expect(result).assertEqual(9.9);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2800
     * @tc.name Array_Reduce_Right_U_Test_static_2800
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '');
        expect(result).assertEqual('3.32.21.1');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_2900
     * @tc.name Array_Reduce_Right_U_Test_static_2900
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '4.4');
        expect(result).assertEqual('4.43.32.21.1');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3000
     * @tc.name Array_Reduce_Right_U_Test_static_3000
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '4.4');
        expect(result).assertEqual('4.4');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3100
     * @tc.name Array_Reduce_Right_U_Test_static_3100
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduceRight<boolean>(arr, (prev, curr) => prev || curr === 2.2, false);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3200
     * @tc.name Array_Reduce_Right_U_Test_static_3200
     * @tc.desc test reduceRight<U>(self: FixedArray<double>, callbackfn: ((previousValue: U, currentValue: double, index: number, array: FixedArray<double>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = reduceRight<boolean>(arr, (prev, curr) => prev || curr === 0.0, false);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3300
     * @tc.name Array_Reduce_Right_U_Test_static_3300
     * @tc.desc test reduceRight<U>(self: FixedArray<float>, callbackfn: ((previousValue: U, currentValue: float, index: number, array: FixedArray<float>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = reduceRight<float>(arr, (prev, curr) => prev + curr.toFloat(), 0.0.toFloat());
        expect(result).assertEqual(6.6.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3400
     * @tc.name Array_Reduce_Right_U_Test_static_3400
     * @tc.desc test reduceRight<U>(self: FixedArray<float>, callbackfn: ((previousValue: U, currentValue: float, index: number, array: FixedArray<float>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = reduceRight<float>(arr, (prev, curr) => prev + curr.toFloat(), 5.5.toFloat());
        expect(result).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3500
     * @tc.name Array_Reduce_Right_U_Test_static_3500
     * @tc.desc test reduceRight<U>(self: FixedArray<float>, callbackfn: ((previousValue: U, currentValue: float, index: number, array: FixedArray<float>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [3.3.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        const result = reduceRight<float>(arr, (prev, curr) => prev + curr.toFloat(), 2.2.toFloat());
        expect(result).assertEqual(8.8.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3600
     * @tc.name Array_Reduce_Right_U_Test_static_3600
     * @tc.desc test reduceRight<U>(self: FixedArray<float>, callbackfn: ((previousValue: U, currentValue: float, index: number, array: FixedArray<float>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        const result = reduceRight<float>(arr, (prev: float, curr: float) => prev + curr.toFloat(), 10.0.toFloat());
        expect(result).assertEqual(18.8.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3700
     * @tc.name Array_Reduce_Right_U_Test_static_3700
     * @tc.desc test reduceRight<U>(self: FixedArray<float>, callbackfn: ((previousValue: U, currentValue: float, index: number, array: FixedArray<float>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 2.2.toFloat(), 1.1.toFloat()];
        const result = reduceRight<float>(arr, (prev: float, curr: float) => prev + curr.toFloat(), 0.0.toFloat());
        expect(result).assertEqual(8.8.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_3800
     * @tc.name Array_Reduce_Right_U_Test_static_3800
     * @tc.desc test reduceRight<U>(self: FixedArray<float>, callbackfn: ((previousValue: U, currentValue: float, index: number, array: FixedArray<float>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = reduceRight<float>(arr, (prev: float, curr: float) => prev - curr.toFloat(), 5.5.toFloat());
        expect(result).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4100
     * @tc.name Array_Reduce_Right_U_Test_static_4100
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '');
        expect(result).assertEqual('321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4200
     * @tc.name Array_Reduce_Right_U_Test_static_4200
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '0');
        expect(result).assertEqual('0321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4300
     * @tc.name Array_Reduce_Right_U_Test_static_4300
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '5');
        expect(result).assertEqual('5');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4400
     * @tc.name Array_Reduce_Right_U_Test_static_4400
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight<int>(arr, (prev, curr) => prev + curr, 0);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4500
     * @tc.name Array_Reduce_Right_U_Test_static_4500
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight<int>(arr, (prev, curr) => prev + curr, 4);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4600
     * @tc.name Array_Reduce_Right_U_Test_static_4600
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = reduceRight<int>(arr, (prev, curr) => prev + curr, 5);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4700
     * @tc.name Array_Reduce_Right_U_Test_static_4700
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight<int>(arr, (prev, curr) => prev - curr, 10);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4800
     * @tc.name Array_Reduce_Right_U_Test_static_4800
     * @tc.desc test reduceRight<U>(self: FixedArray<int>, callbackfn: ((previousValue: U, currentValue: int, index: number, array: FixedArray<int>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = reduceRight<int>(arr, (prev, curr) => prev - curr, 0);
        expect(result).assertEqual(-6);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_4900
     * @tc.name Array_Reduce_Right_U_Test_static_4900
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '');
        expect(result).assertEqual('300200100');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5000
     * @tc.name Array_Reduce_Right_U_Test_static_5000
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '0');
        expect(result).assertEqual('0300200100');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5100
     * @tc.name Array_Reduce_Right_U_Test_static_5100
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '500');
        expect(result).assertEqual('500');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5200
     * @tc.name Array_Reduce_Right_U_Test_static_5200
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = reduceRight<long>(arr, (prev, curr) => prev + curr as long, 400);
        expect(result).assertEqual(1000 as long);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5300
     * @tc.name Array_Reduce_Right_U_Test_static_5300
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = reduceRight<long>(arr, (prev, curr) => prev + curr as long, 0);
        expect(result).assertEqual(600 as long);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5400
     * @tc.name Array_Reduce_Right_U_Test_static_5400
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = reduceRight<long>(arr, (prev, curr) => prev + curr as long, 500);
        expect(result).assertEqual(500 as long);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5500
     * @tc.name Array_Reduce_Right_U_Test_static_5500
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200];
        const result = reduceRight<long>(arr, (prev, curr) => prev - curr as long, 500);
        expect(result).assertEqual(200 as long);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5600
     * @tc.name Array_Reduce_Right_U_Test_static_5600
     * @tc.desc test reduceRight<U>(self: FixedArray<long>, callbackfn: ((previousValue: U, currentValue: long, index: number, array: FixedArray<long>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = reduceRight<long>(arr, (prev, curr) => prev - curr as long, 500);
        expect(result).assertEqual(-100 as long);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5700
     * @tc.name Array_Reduce_Right_U_Test_static_5700
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '');
        expect(result).assertEqual('302010');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5800
     * @tc.name Array_Reduce_Right_U_Test_static_5800
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [10, 20, 30];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '50');
        expect(result).assertEqual('50302010');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_5900
     * @tc.name Array_Reduce_Right_U_Test_static_5900
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = reduceRight<string>(arr, (prev, curr) => prev + curr.toString(), '50');
        expect(result).assertEqual('50');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_6000
     * @tc.name Array_Reduce_Right_U_Test_static_6000
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [11, 12, 13];
        const result = reduceRight<short>(arr, (prev, curr) => (prev - curr.toShort()).toShort(), 0);
        expect(result).assertEqual(-36);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_6100
     * @tc.name Array_Reduce_Right_U_Test_static_6100
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [11, 12, 13];
        const result = reduceRight<short>(arr, (prev, curr) => (prev - curr.toShort()).toShort(), 10);
        expect(result).assertEqual(-26);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_6200
     * @tc.name Array_Reduce_Right_U_Test_static_6200
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = reduceRight<short>(arr, (prev, curr) => (prev - curr.toShort()).toShort(), 15);
        expect(result).assertEqual(15);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_6300
     * @tc.name Array_Reduce_Right_U_Test_static_6300
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [15, 25, 35];
        const result = reduceRight<short>(arr, (prev, curr) => (prev - curr.toShort()).toShort(), 100);
        expect(result).assertEqual(25);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_REDUCE_RIGHT_U_TEST_6400
     * @tc.name Array_Reduce_Right_U_Test_static_6400
     * @tc.desc test reduceRight<U>(self: FixedArray<short>, callbackfn: ((previousValue: U, currentValue: short, index: number, array: FixedArray<short>)=> U), initialValue: U) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Reduce_Right_U_Test_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Reduce_Right_U_Test_static_6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [15, 25, 35];
        const result = reduceRight<short>(arr, (prev, curr) => (prev - curr.toShort()).toShort(), 50);
        expect(result).assertEqual(-25);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}